local PLUGIN = PLUGIN

ENT.Type = "nextbot"
ENT.Base = "ix_combat_base"
ENT.PrintName = "Monolith Professional"
ENT.Category = "Helix - Combat Entities - Monolith"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Monolith"
ENT.description = "Vraks!"

ENT.models = {
    "models/nasca/stalker/female_sunrise_mono.mdl",
    "models/nasca/stalker/male_sunrise_mono.mdl",
    "models/nasca/stalker/male_nbc_mono.mdl",
    "models/silver/stalker/female_nbc_mono.mdl",
    "models/silver/stalker/female_dusk_mono.mdl",
    "models/nasca/stalker/male_dusk_mono.mdl",
    "models/player/stalker_monolith/monolith_gp5/monolith_gp5.mdl",
    "models/player/stalker_monolith/monolith_old/monolith_old.mdl",
    "models/player/stalker_monolith/monolith_cloak/monolith_cloak.mdl",


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
    "Brother",
    "Operative",
    "Initiate",
}


local riflegrip = {
    "models/tnb/weapons/w_hk416.mdl",
    "models/tnb/weapons/w_ak107.mdl",
    "models/tnb/weapons/w_mossberg.mdl",
    "models/tnb/weapons/w_p90.mdl",
    "models/tnb/weapons/w_svd.mdl",
    "models/tnb/weapons/w_m24.mdl",
    "models/tnb/weapons/w_akm.mdl",
    "models/tnb/weapons/w_g36c.mdl"
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

        local lastname = table.Random(PLUGIN.realnameslast)

        self:SetDescription("Professional")

        local rank = table.Random(ranks)
        if string.find(self:GetModel(), "female") then rank = "Sister" end 

        self:SetCEntName(rank .. " " .. lastname)

        
        local chosenweapon = table.Random(riflegrip)
        self:SetCEntWeaponModel(chosenweapon)
    
    end
end



