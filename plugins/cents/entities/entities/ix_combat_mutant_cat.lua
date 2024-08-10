local PLUGIN = PLUGIN

ENT.Type = "nextbot"
ENT.Base = "ix_combat_base"
ENT.PrintName = "Cat"
ENT.Category = "Helix - Combat Entities - Mutants"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Cat"

ENT.models = {
    "models/monsters/cat.mdl",
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

        self:SetCombatHealth(30)
        self:SetCombatHealthMax(30)
        self:SetWeaponSkill(0)
        self:SetDodge(10)
    
        self:SetHeadBR(0)
        self:SetHeadBullet(0)
        self:SetHeadImpact(0)
        self:SetHeadRupture(0)
    
        self:SetTorsoBR(0)
        self:SetTorsoBullet(5)
        self:SetTorsoImpact(5)
        self:SetTorsoRupture(5)

        self:SetCEntSkin(self.skin)
    end
end



