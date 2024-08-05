local PLUGIN = PLUGIN

ENT.Type = "nextbot"
ENT.Base = "ix_combat_base"
ENT.PrintName = "Zombie"
ENT.Category = "Helix - Combat Entities - Mutants"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Zombie"

ENT.models = {
    "models/monsters/zombie.mdl",
    "models/monsters/zombie2.mdl",
    "models/monsters/zombie3.mdl",
    "models/monsters/zombie4.mdl",
}



ENT.WalkAnim = "stand_walk_fwd_1"
ENT.RunAnim = "stand_run_0"
ENT.IdleAnim = "stand_idle_1"
ENT.AttackAnim = "stand_attack_1"
ENT.CrouchAnim = "fake_death_0_1"
ENT.StandAnim = "fake_death_3_2"

function ENT:OnTakeDamage(dmgInfo)
    return 0
end


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

        self:SetCEntSkin(self.skin)
    end
end



