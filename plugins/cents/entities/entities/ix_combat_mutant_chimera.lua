local PLUGIN = PLUGIN

ENT.Type = "nextbot"
ENT.Base = "ix_combat_base"
ENT.PrintName = "Chimera"
ENT.Category = "Helix - Combat Entities - Mutants"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Chimera"

ENT.models = {
    "models/monsters/chimera.mdl",
}

ENT.skin = table.Random({0, 1, 2, 3, 4}) 


ENT.WalkAnim = "stand_walk_fwd_0"
ENT.RunAnim = "stand_run_attack_0"
ENT.IdleAnim = "stand_idle_2"
ENT.AttackAnim = "stand_attack_0"
ENT.CrouchAnim = "sit_idle_2"
ENT.StandAnim = "stand_idle_0"

function ENT:OnTakeDamage(dmgInfo)
    return 0
end


if (SERVER) then
    function ENT:CustomInitialize()

        self:SetCombatHealth(200)
        self:SetCombatHealthMax(200)
        self:SetWeaponSkill(0)
        self:SetDodge(15)
    
        self:SetHeadBR(20)
        self:SetHeadBullet(50)
        self:SetHeadImpact(50)
        self:SetHeadRupture(50)
    
        self:SetTorsoBR(60)
        self:SetTorsoBullet(60)
        self:SetTorsoImpact(60)
        self:SetTorsoRupture(60)

        self:SetCEntSkin(self.skin)
    end
end



