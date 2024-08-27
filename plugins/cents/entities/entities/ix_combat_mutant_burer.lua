local PLUGIN = PLUGIN

ENT.Type = "nextbot"
ENT.Base = "ix_combat_base"
ENT.PrintName = "Burer"
ENT.Category = "Helix - Combat Entities - Mutants"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Burer"

ENT.models = {
    "models/monsters/burer.mdl",
}

ENT.skin = table.Random({0, 1, 2, 3, 4}) 


ENT.WalkAnim = "stand_walk_fwd_0"
ENT.RunAnim = "stand_run_fwd_0"
ENT.IdleAnim = "stand_idle_0"
ENT.AttackAnim = "stand_gravi_0"
ENT.CrouchAnim = "sit_idle_1"
ENT.StandAnim = "stand_idle_0"

function ENT:OnTakeDamage(dmgInfo)
    return 0
end


if (SERVER) then
    function ENT:CustomInitialize()

        self:SetCombatHealth(130)
        self:SetCombatHealthMax(130)
        self:SetWeaponSkill(5)
        self:SetDodge(8)
    
        self:SetHeadBR(0)
        self:SetHeadBullet(30)
        self:SetHeadImpact(30)
        self:SetHeadRupture(30)
    
        self:SetTorsoBR(0)
        self:SetTorsoBullet(35)
        self:SetTorsoImpact(35)
        self:SetTorsoRupture(35)

        self:SetCEntSkin(self.skin)
    end
end



