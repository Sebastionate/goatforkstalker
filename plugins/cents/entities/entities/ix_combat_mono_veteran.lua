local PLUGIN = PLUGIN

ENT.Type = "nextbot"
ENT.Base = "ix_combat_base"
ENT.PrintName = "Monolith Veteran"
ENT.Category = "Helix - Combat Entities - Monolith"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Monolith"
ENT.description = "Vraks!"

ENT.models = {
    "models/nasca/stalker/male_seva_mono.mdl",
    "models/silver/stalker/female_seva_mono.mdl",
    "models/player/stalker_monolith/monolith_seva/monolith_seva.mdl",
    "models/player/stalker_monolith/monolith_metro/monolith_metro.mdl"
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
    "Senior Operative",
    "Disciple",
    "Preacher",
}


local riflegrip = {
    "models/tnb/weapons/w_fal.mdl",
    "models/tnb/weapons/w_aek.mdl",
    "models/tnb/weapons/w_spas12.mdl",
    "models/tnb/weapons/w_f2000.mdl",
    "models/tnb/weapons/w_svd.mdl",
    "models/tnb/weapons/w_m24.mdl",
    "models/tnb/weapons/w_m249.mdl",
    "models/tnb/weapons/w_groza.mdl",
    "models/tnb/weapons/w_vss.mdl"
}


if (SERVER) then
    function ENT:CustomInitialize()

        self:SetCombatHealth(150)
        self:SetCombatHealthMax(150)
        self:SetWeaponSkill(25)
        self:SetDodge(14)
    
        if string.find(self:GetModel(), "seva") then
            -- Monolith Scientific and Screen Helm
            self:EquipSuit("seva_mono")
            self:EquipHelmet("screenhelm")
        end

        if string.find(self:GetModel(), "metro") then
            -- Reinforced Monolith Suit and Assault Helmet
            self:EquipSuit("mono_heavy")
            self:EquipHelmet("assaulthelmet")
        end

        local randomAccessory1 = math.random(1, 4)
        if randomAccessory1 == 1 then self:EquipAccessory("belt_kevlarimproved") end
        if randomAccessory1 == 2 then self:EquipAccessory("belt_kevlarimproved") end

        local randomAccessory2 = math.random(1, 4)
        if randomAccessory2 == 1 then self:EquipAccessory("gravi") end
        if randomAccessory2 == 2 then self:EquipAccessory("gravi") end

        local randomAccessory3 = math.random(1, 4)
        if randomAccessory3 == 1 then self:EquipAccessory("belt_controllerhide") end
        if randomAccessory3 == 2 then self:EquipAccessory("belt_controllerhide") end

        local lastname = table.Random(PLUGIN.realnameslast)

        self:SetDescription("Veteran")

        local rank = table.Random(ranks)
        self:SetCEntName(rank .. " " .. lastname)

        
        local chosenweapon = table.Random(riflegrip)
        self:SetCEntWeaponModel(chosenweapon)
    
    end
end



