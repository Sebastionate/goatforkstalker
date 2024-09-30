local PLUGIN = PLUGIN

ENT.Type = "nextbot"
ENT.Base = "ix_combat_base"
ENT.PrintName = "Monolith Master"
ENT.Category = "Helix - Combat Entities - Monolith"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Monolith"
ENT.description = "Vraks!"

ENT.models = {
    "models/nasca/stalker/male_exo_mono.mdl",
    "models/nasca/stalker/male_stingray9_mono.mdl",
    "models/player/stalker_monolith/monolith_bulat/monolith_bulat.mdl",
    "models/player/stalker_monolith/monolith_exo/monolith_exo.mdl",
}


ENT.WalkAnim = "walk_passive"
ENT.RunAnim = "run_passive"
ENT.IdleAnim = "idle_passive"
ENT.AttackAnim = "idle_ar2"
ENT.CrouchAnim = "cidle_all"
ENT.StandAnim = "crouchtostand"

function ENT:OnTakeDamage(dmgInfo)
    return 0
end

local ranks = {
    "Master",
}


local riflegrip = {
    "models/tnb/weapons/w_scar.mdl",
    "models/tnb/weapons/w_m240.mdl",
    "models/tnb/weapons/w_f2000.mdl",
    "models/tnb/weapons/w_awm.mdl",
    "models/tnb/weapons/w_m24.mdl",
    "models/tnb/weapons/w_pkm.mdl",
    "models/tnb/weapons/w_groza.mdl",
    "models/tnb/weapons/w_vss.mdl",
    "models/tnb/weapons/w_ks23.mdl",
    "models/tnb/weapons/w_aa12.mdl"
}


if (SERVER) then
    function ENT:CustomInitialize()

        self:SetCombatHealth(180)
        self:SetCombatHealthMax(180)
        self:SetWeaponSkill(35)
        self:SetDodge(20)
    
        if string.find(self:GetModel(), "stingray") or string.find(self:GetModel(), "bulat") then
            -- Stingray-9 and Sphere-12
            self:EquipSuit("skat9")
            self:EquipHelmet("sphere12")
        end

        if string.find(self:GetModel(), "exo") then
            -- Monolith Exoskeleton and Exohelm
            self:EquipSuit("exoskeleton_mono")
            self:EquipHelmet("exohelmet")
        end

        local randomAccessory1 = math.random(1, 4)
        if randomAccessory1 == 1 then self:EquipAccessory("belt_steelplateimproved") end
        if randomAccessory1 == 1 then self:EquipAccessory("belt_steelplateimproved") end

        local randomAccessory2 = math.random(1, 4)
        if randomAccessory2 == 1 then self:EquipAccessory("fullempty") end
        if randomAccessory2 == 1 then self:EquipAccessory("fullempty") end
        

        local randomAccessory3 = math.random(1, 4)
        if randomAccessory3 == 1 then self:EquipAccessory("belt_pseudogianthide") end
        if randomAccessory3 == 1 then self:EquipAccessory("belt_pseudogianthide") end

        local lastname = table.Random(PLUGIN.realnameslast)

        self:SetDescription("Master")

        local rank = table.Random(ranks)
        self:SetCEntName(rank .. " " .. lastname)

        
        local chosenweapon = table.Random(riflegrip)
        self:SetCEntWeaponModel(chosenweapon)
    
    end
end



