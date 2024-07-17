local PLUGIN = PLUGIN

ENT.Type = "nextbot"
ENT.Base = "ix_combat_base"
ENT.PrintName = "Duty Professional"
ENT.Category = "Helix - Combat Entities - Duty"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Duty Soldier"
ENT.description = "YA SOLDAT"

ENT.models = {
    "models/nasca/stalker/female_psz9d_duty.mdl",
    "models/silver/stalker/female_dusk_duty.mdl",
    "models/nasca/stalker/male_psz9d_duty.mdl",
    "models/nasca/stalker/male_dusk_duty.mdl",
    "models/player/stalker_dolg/dolg_old/dolg_old.mdl",
    "models/player/stalker_dolg/dolg_gp5/dolg_gp5.mdl",
    "models/player/stalker_dolg/dolg_cloak/dolg_cloak.mdl"
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
    "Junior Sergeant",
    "Sergeant",
}


local riflegrip = {
    "models/tnb/weapons/w_ak74.mdl",
    "models/tnb/weapons/w_ithaca.mdl",
    "models/tnb/weapons/w_ak107.mdl",
    "models/tnb/weapons/w_akm.mdl"
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

        self:SetDescription("Professional")

        local rank = table.Random(ranks)

        self:SetCEntName(rank .. " " .. lastname)

        
        local chosenweapon = table.Random(riflegrip)
        self:SetCEntWeaponModel(chosenweapon)
    

        self:SetCEntSkin(self.skin)
    end
end



