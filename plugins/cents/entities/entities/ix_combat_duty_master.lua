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

        self:SetCombatHealth(170)
        self:SetCombatHealthMax(170)
        self:SetWeaponSkill(30)
        self:SetDodge(20)
    
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
            -- TB-3d Exoskeleton and Exohelm
            self:SetHeadBR(50)
            self:SetHeadBullet(31)
            self:SetHeadImpact(40)
            self:SetHeadRupture(4)
        
            self:SetTorsoBR(59)
            self:SetTorsoBullet(34)
            self:SetTorsoImpact(37)
            self:SetTorsoRupture(38)
        end

        if string.find(self:GetModel(), "jupiter") then
            -- Jupiter and Screen Helm
            self:SetHeadBR(16)
            self:SetHeadBullet(13)
            self:SetHeadImpact(15)
            self:SetHeadRupture(3)
        
            self:SetTorsoBR(40)
            self:SetTorsoBullet(25)
            self:SetTorsoImpact(25)
            self:SetTorsoRupture(33)
        end

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



