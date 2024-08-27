local PLUGIN = PLUGIN

ENT.Type = "nextbot"
ENT.Base = "ix_combat_base"
ENT.PrintName = "Pseudogiant"
ENT.Category = "Helix - Combat Entities - Mutants"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Pseudogiant"

ENT.models = {
    "models/monsters/gigant.mdl",
    "models/monsters/gigant3.mdl",
}

ENT.skin = table.Random({0, 1, 2, 3, 4}) 


ENT.WalkAnim = "stand_walk_fwd_0"
ENT.RunAnim = "stand_run_fwd_0"
ENT.IdleAnim = "stand_idle_0"
ENT.AttackAnim = "stand_attack_0"
ENT.CrouchAnim = "lie_sleep_0"
ENT.StandAnim = "stand_idle_0"

function ENT:OnTakeDamage(dmgInfo)
    return 0
end


if (SERVER) then
    function ENT:CustomInitialize()

        self:SetCombatHealth(265)
        self:SetCombatHealthMax(265)
        self:SetWeaponSkill(5)
        self:SetDodge(0)
    
        self:SetHeadBR(35)
        self:SetHeadBullet(80)
        self:SetHeadImpact(80)
        self:SetHeadRupture(65)
    
        self:SetTorsoBR(35)
        self:SetTorsoBullet(80)
        self:SetTorsoImpact(80)
        self:SetTorsoRupture(65)

        self:SetCEntSkin(self.skin)
    end
end



