local PLUGIN = PLUGIN

ENT.Type = "nextbot"
ENT.Base = "ix_combat_base"
ENT.PrintName = "Controller"
ENT.Category = "Helix - Combat Entities - Mutants"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Controller"

ENT.models = {
    "models/monsters/controler.mdl",
    "models/monsters/controler_plach.mdl"
}

ENT.skin = table.Random({0, 1, 2, 3, 4}) 


ENT.WalkAnim = "stand_walk_fwd_0"
ENT.RunAnim = "stand_run_fwd_0"
ENT.IdleAnim = "stand_idle_2"
ENT.AttackAnim = "psy_attack_0"
ENT.CrouchAnim = "sit_idle_0"
ENT.StandAnim = "stand_idle_0"

function ENT:OnTakeDamage(dmgInfo)
    return 0
end


if (SERVER) then
    function ENT:CustomInitialize()

        self:SetCombatHealth(95)
        self:SetCombatHealthMax(95)
        self:SetWeaponSkill(0)
        self:SetDodge(5)
    
        self:SetHeadBR(0)
        self:SetHeadBullet(5)
        self:SetHeadImpact(5)
        self:SetHeadRupture(5)
    
        self:SetTorsoBR(0)
        self:SetTorsoBullet(15)
        self:SetTorsoImpact(15)
        self:SetTorsoRupture(15)

        self:SetCEntSkin(self.skin)
    end
end



