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

        self:SetCombatHealth(50)
        self:SetCombatHealthMax(50)
        self:SetWeaponSkill(0)
        self:SetDodge(0)
    
        self:SetHeadBR(0)
        self:SetHeadBullet(0)
        self:SetHeadImpact(0)
        self:SetHeadRupture(0)
    
        self:SetTorsoBR(0)
        self:SetTorsoBullet(0)
        self:SetTorsoImpact(0)
        self:SetTorsoRupture(0)

        
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



