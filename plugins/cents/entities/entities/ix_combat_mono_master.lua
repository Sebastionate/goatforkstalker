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

        self:SetCombatHealth(175)
        self:SetCombatHealthMax(175)
        self:SetWeaponSkill(35)
        self:SetDodge(20)
    
        if string.find(self:GetModel(), "stingray") or string.find(self:GetModel(), "bulat") then
            -- Stingray-9 and Sphere-12
            self:SetHeadBR(40)
            self:SetHeadBullet(27)
            self:SetHeadImpact(35)
            self:SetHeadRupture(5)
        
            self:SetTorsoBR(40)
            self:SetTorsoBullet(28)
            self:SetTorsoImpact(28)
            self:SetTorsoRupture(23)
        end

        if string.find(self:GetModel(), "exo") then
            -- Monolith Exoskeleton and Exohelm
            self:SetHeadBR(50)
            self:SetHeadBullet(31)
            self:SetHeadImpact(40)
            self:SetHeadRupture(4)
        
            self:SetTorsoBR(65)
            self:SetTorsoBullet(36)
            self:SetTorsoImpact(41)
            self:SetTorsoRupture(39)
        end

        local lastname = table.Random(PLUGIN.realnameslast)

        self:SetDescription("Master")

        local rank = table.Random(ranks)
        self:SetCEntName(rank .. " " .. lastname)

        
        local chosenweapon = table.Random(riflegrip)
        self:SetCEntWeaponModel(chosenweapon)
    
    end
end



