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

        self:SetDescription("Veteran")

        local rank = table.Random(ranks)
        self:SetCEntName(rank .. " " .. lastname)

        
        local chosenweapon = table.Random(riflegrip)
        self:SetCEntWeaponModel(chosenweapon)
    
    end
end



