local PLUGIN = PLUGIN

ENT.Type = "nextbot"
ENT.Base = "ix_combat_base"
ENT.PrintName = "Tark"
ENT.Category = "Helix - Combat Entities - Mutants"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Tark"

ENT.models = {
    "models/monsters/tark.mdl",
}

ENT.skin = table.Random({0, 1, 2, 3, 4}) 


ENT.WalkAnim = "stand_walk_0"
ENT.RunAnim = "stand_run_0"
ENT.IdleAnim = "stand_idle_0"
ENT.AttackAnim = "stand_attack_0"
ENT.CrouchAnim = "lie_idle_0"
ENT.StandAnim = "stand_idle_0"

function ENT:OnTakeDamage(dmgInfo)
    return 0
end


if (SERVER) then
    function ENT:CustomInitialize()

        self:SetCombatHealth(135)
        self:SetCombatHealthMax(135)
        self:SetWeaponSkill(0)
        self:SetDodge(18)
    
        self:SetHeadBR(0)
        self:SetHeadBullet(20)
        self:SetHeadImpact(20)
        self:SetHeadRupture(20)
    
        self:SetTorsoBR(0)
        self:SetTorsoBullet(40)
        self:SetTorsoImpact(40)
        self:SetTorsoRupture(40)

        self:SetCEntSkin(self.skin)
    end
end



