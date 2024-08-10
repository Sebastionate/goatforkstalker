local PLUGIN = PLUGIN

ENT.Type = "nextbot"
ENT.Base = "ix_combat_base"
ENT.PrintName = "Snork"
ENT.Category = "Helix - Combat Entities - Mutants"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Snork"

ENT.models = {
    "models/monsters/snork.mdl",
    "models/monsters/snork2.mdl"
}

ENT.skin = table.Random({0, 1, 2, 3, 4}) 


ENT.WalkAnim = "stand_walk_fwd"
ENT.RunAnim = "stand_run_0"
ENT.IdleAnim = "stand_idle_0"
ENT.AttackAnim = "stand_attack_1"
ENT.CrouchAnim = "sleep_1"
ENT.StandAnim = "stand_idle_0"

function ENT:OnTakeDamage(dmgInfo)
    return 0
end


if (SERVER) then
    function ENT:CustomInitialize()

        self:SetCombatHealth(60)
        self:SetCombatHealthMax(60)
        self:SetWeaponSkill(0)
        self:SetDodge(10)
    
        self:SetHeadBR(0)
        self:SetHeadBullet(15)
        self:SetHeadImpact(15)
        self:SetHeadRupture(15)
    
        self:SetTorsoBR(0)
        self:SetTorsoBullet(25)
        self:SetTorsoImpact(25)
        self:SetTorsoRupture(25)

        self:SetCEntSkin(self.skin)
    end
end



