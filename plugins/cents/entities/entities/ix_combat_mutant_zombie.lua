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

        self:SetCombatHealth(170)
        self:SetCombatHealthMax(170)
        self:SetWeaponSkill(5)
        self:SetDodge(0)
    
        self:SetHeadBR(0)
        self:SetHeadBullet(10)
        self:SetHeadImpact(10)
        self:SetHeadRupture(10)
    
        self:SetTorsoBR(0)
        self:SetTorsoBullet(40)
        self:SetTorsoImpact(40)
        self:SetTorsoRupture(40)

        self:SetCEntSkin(self.skin)
    end
end



