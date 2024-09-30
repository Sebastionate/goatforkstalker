local PLUGIN = PLUGIN

ENT.Type = "nextbot"
ENT.Base = "ix_combat_base"
ENT.PrintName = "Duty Master"
ENT.Category = "Helix - Combat Entities - Duty"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Duty Soldier"
ENT.description = "YA SOLDAT"

ENT.models = {
    "models/nasca/stalker/male_psz12d_duty.mdl",
    "models/nasca/stalker/male_exo_duty.mdl",
    "models/nasca/stalker/male_jupiter_duty.mdl"
}


ENT.skin = table.Random({1, 2, 3})

ENT.voicevariant = table.Random({1, 2, 3})

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
    "Captain",
}


local riflegrip = {
    "models/tnb/weapons/w_pkm.mdl",
    "models/tnb/weapons/w_saiga12.mdl",
    "models/tnb/weapons/w_ks23.mdl",
    "models/tnb/weapons/w_vss.mdl",
    "models/tnb/weapons/w_svu.mdl",

}


if (SERVER) then
    function ENT:CustomInitialize()

        self:SetCombatHealth(180)
        self:SetCombatHealthMax(180)
        self:SetWeaponSkill(30)
        self:SetDodge(20)
    
        if string.find(self:GetModel(), "psz12") then
            -- PSZ-12d and Sphere-12
            self:EquipSuit("psz12d_duty")
            self:EquipHelmet("sphere12")
        end

        if string.find(self:GetModel(), "exo") then
            -- TB-3d Exoskeleton and Exohelm
            self:EquipSuit("exoskeleton_duty")
            self:EquipHelmet("exohelmet")
        end

        if string.find(self:GetModel(), "jupiter") then
            -- Jupiter and Screen Helm
            self:EquipSuit("jupiter")
            self:EquipHelmet("screenhelm")
        end

        local randomAccessory1 = math.random(1, 4)
        if randomAccessory1 == 1 then self:EquipAccessory("belt_steelplateimproved") end
        if randomAccessory1 == 2 then self:EquipAccessory("belt_chimerahide") end 
        if randomAccessory1 == 3 then self:EquipAccessory("belt_pseudogianthide") end 
        if randomAccessory1 == 4 then self:EquipAccessory("belt_burerhide") end 

        local firstname = ""

        local lastname = table.Random(PLUGIN.realnameslast)

        if string.find(self:GetModel(), "female") then firstname = table.Random(PLUGIN.femalenamesfirst) lastname = table.Random(PLUGIN.femalenameslast) end 

        self:SetDescription("Captain")

        local rank = table.Random(ranks)

        self:SetCEntName(rank .. " " .. lastname)

        
        local chosenweapon = table.Random(riflegrip)
        self:SetCEntWeaponModel(chosenweapon)    

        self:SetCEntSkin(self.skin)
    end
end



