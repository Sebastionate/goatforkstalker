local PLUGIN = PLUGIN

ENT.Type = "nextbot"
ENT.Base = "ix_combat_base"
ENT.PrintName = "Izlom"
ENT.Category = "Helix - Combat Entities - Mutants"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Izlom"

ENT.models = {
    "models/monsters/izlom.mdl",
}



ENT.WalkAnim = "stand_walk_fwd_0"
ENT.RunAnim = "stand_run_0"
ENT.IdleAnim = "stand_idle_0"
ENT.AttackAnim = "stand_attack_0"
ENT.CrouchAnim = "sit_idle_0"
ENT.StandAnim = "stand_idle_0"

function ENT:OnTakeDamage(dmgInfo)
    return 0
end


if (SERVER) then
    function ENT:CustomInitialize()

        self:SetCombatHealth(100)
        self:SetCombatHealthMax(100)
        self:SetWeaponSkill(5)
        self:SetDodge(5)
    
        self:SetHeadBR(0)
        self:SetHeadBullet(20)
        self:SetHeadImpact(20)
        self:SetHeadRupture(20)
    
        self:SetTorsoBR(0)
        self:SetTorsoBullet(50)
        self:SetTorsoImpact(50)
        self:SetTorsoRupture(50)

        self:SetCEntSkin(self.skin)
    end
end



