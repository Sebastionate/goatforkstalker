local PLUGIN = PLUGIN

ENT.Type = "nextbot"
ENT.Base = "ix_combat_base"
ENT.PrintName = "Bloodsucker"
ENT.Category = "Helix - Combat Entities - Mutants"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Bloodsucker"

ENT.models = {
    "models/monsters/krovosos.mdl",
    "models/monsters/krovosos2.mdl"
}

ENT.skin = table.Random({0, 1, 2, 3, 4}) 


ENT.WalkAnim = "stand_walk_fwd_0"
ENT.RunAnim = "stand_run_0"
ENT.IdleAnim = "stand_idle_0"
ENT.AttackAnim = "stand_attack_1"
ENT.CrouchAnim = "sit_idle_0"
ENT.StandAnim = "stand_idle_0"

function ENT:OnTakeDamage(dmgInfo)
    return 0
end


if (SERVER) then
    function ENT:CustomInitialize()

        self:SetCombatHealth(250)
        self:SetCombatHealthMax(250)
        self:SetWeaponSkill(5)
        self:SetDodge(15)
    
        self:SetHeadBR(0)
        self:SetHeadBullet(15)
        self:SetHeadImpact(15)
        self:SetHeadRupture(15)
    
        self:SetTorsoBR(0)
        self:SetTorsoBullet(35)
        self:SetTorsoImpact(35)
        self:SetTorsoRupture(35)

        self:SetCEntSkin(self.skin)
    end
end



