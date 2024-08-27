local PLUGIN = PLUGIN

ENT.Type = "nextbot"
ENT.Base = "ix_combat_base"
ENT.PrintName = "Duty Veteran"
ENT.Category = "Helix - Combat Entities - Duty"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Duty Soldier"
ENT.description = "YA SOLDAT"

ENT.models = {
    "models/silver/stalker/female_sunset_duty.mdl",
    "models/nasca/stalker/male_sunset_duty.mdl",
    "models/nasca/stalker/male_seva_duty.mdl",
    "models/silver/stalker/female_seva_duty.mdl",
    "models/nasca/stalker/male_berill5m_duty.mdl",
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
    "Senior Sergeant",
    "Master Sergeant",
}


local riflegrip = {
    "models/tnb/weapons/w_aek.mdl",
    "models/tnb/weapons/w_saiga12.mdl",
    "models/tnb/weapons/w_ak107.mdl",
    "models/tnb/weapons/w_akm.mdl",
    "models/tnb/weapons/w_svd.mdl",

}


if (SERVER) then
    function ENT:CustomInitialize()

        self:SetCombatHealth(140)
        self:SetCombatHealthMax(140)
        self:SetWeaponSkill(20)
        self:SetDodge(14)
    
        if string.find(self:GetModel(), "sunset") then
            -- Sunset and Sphere-08
            self:SetHeadBR(31)
            self:SetHeadBullet(24)
            self:SetHeadImpact(30)
            self:SetHeadRupture(3)
        
            self:SetTorsoBR(36)
            self:SetTorsoBullet(21)
            self:SetTorsoImpact(10)
            self:SetTorsoRupture(32)
        end

        if string.find(self:GetModel(), "berill") then
            -- Beril-5md and Sphere-08
            self:SetHeadBR(31)
            self:SetHeadBullet(24)
            self:SetHeadImpact(30)
            self:SetHeadRupture(3)
        
            self:SetTorsoBR(39)
            self:SetTorsoBullet(24)
            self:SetTorsoImpact(19)
            self:SetTorsoRupture(45)
        end

        if string.find(self:GetModel(), "seva") then
            -- PSZ-9md Universal Protection and Screen Helmet
            self:SetHeadBR(16)
            self:SetHeadBullet(13)
            self:SetHeadImpact(15)
            self:SetHeadRupture(3)
        
            self:SetTorsoBR(36)
            self:SetTorsoBullet(12)
            self:SetTorsoImpact(17)
            self:SetTorsoRupture(17)
        end

        
        local firstname = ""
        local lastname = table.Random(PLUGIN.realnameslast)

        if string.find(self:GetModel(), "female") then firstname = table.Random(PLUGIN.femalenamesfirst) lastname = table.Random(PLUGIN.femalenameslast) end 

        self:SetDescription("Veteran")

        local rank = table.Random(ranks)

        self:SetCEntName(rank .. " " .. lastname)

        
        local chosenweapon = table.Random(riflegrip)
        self:SetCEntWeaponModel(chosenweapon)
    

        self:SetCEntSkin(self.skin)
    end
end



