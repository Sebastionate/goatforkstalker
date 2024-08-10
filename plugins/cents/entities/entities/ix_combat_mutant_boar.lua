local PLUGIN = PLUGIN

ENT.Type = "nextbot"
ENT.Base = "ix_combat_base"
ENT.PrintName = "Boar"
ENT.Category = "Helix - Combat Entities - Mutants"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Boar"

ENT.models = {
    "models/monsters/boar.mdl",
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

        self:SetCombatHealth(75)
        self:SetCombatHealthMax(75)
        self:SetWeaponSkill(0)
        self:SetDodge(5)
    
        self:SetHeadBR(0)
        self:SetHeadBullet(45)
        self:SetHeadImpact(45)
        self:SetHeadRupture(45)
    
        self:SetTorsoBR(0)
        self:SetTorsoBullet(20)
        self:SetTorsoImpact(20)
        self:SetTorsoRupture(20)

        self:SetCEntSkin(self.skin)
    end
end



