local PLUGIN = PLUGIN

ENT.Type = "nextbot"
ENT.Base = "ix_combat_base"
ENT.PrintName = "Duty Expert"
ENT.Category = "Helix - Combat Entities - Duty"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Duty Soldier"
ENT.description = "YA SOLDAT"

ENT.models = {
    "models/nasca/stalker/male_psz12d_duty.mdl",
    "models/nasca/stalker/male_exo_duty.mdl",
    "models/nasca/stalker/male_seva_duty.mdl",
    "models/silver/stalker/female_seva_duty.mdl",
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
    "Lieutenant",
}


local riflegrip = {
    "models/tnb/weapons/w_aek.mdl",
    "models/tnb/weapons/w_saiga12.mdl",
    "models/tnb/weapons/w_ks23.mdl",
    "models/tnb/weapons/w_vss.mdl",
    "models/tnb/weapons/w_svu.mdl",

}


if (SERVER) then
    function ENT:CustomInitialize()

        self:SetCombatHealth(150)
        self:SetCombatHealthMax(150)
        self:SetWeaponSkill(20)
        self:SetDodge(17)
    
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

        if string.find(self:GetModel(), "psz12") then
            -- PSZ-12d and Sphere-12
            self:SetHeadBR(40)
            self:SetHeadBullet(27)
            self:SetHeadImpact(35)
            self:SetHeadRupture(5)
        
            self:SetTorsoBR(45)
            self:SetTorsoBullet(30)
            self:SetTorsoImpact(28)
            self:SetTorsoRupture(26)
        end

        if string.find(self:GetModel(), "exo") then
            -- TB-3d Exosuit and Exohelm
            self:SetHeadBR(50)
            self:SetHeadBullet(31)
            self:SetHeadImpact(40)
            self:SetHeadRupture(4)
        
            self:SetTorsoBR(50)
            self:SetTorsoBullet(34)
            self:SetTorsoImpact(32)
            self:SetTorsoRupture(33)
        end

        
        local firstname = ""

        local lastname = table.Random(PLUGIN.realnameslast)

        if string.find(self:GetModel(), "female") then firstname = table.Random(PLUGIN.femalenamesfirst) lastname = table.Random(PLUGIN.femalenameslast) end 

        self:SetDescription("Expert")

        local rank = table.Random(ranks)

        self:SetCEntName(rank .. " " .. lastname)

        
        local chosenweapon = table.Random(riflegrip)
        self:SetCEntWeaponModel(chosenweapon)

        if string.find(self:GetModel(), "exo") then self:SetCEntBodyGroups("1") end 
    

        self:SetCEntSkin(self.skin)
    end
end



