local PLUGIN = PLUGIN

ENT.Type = "nextbot"
ENT.Base = "ix_combat_base"
ENT.PrintName = "PsyDog"
ENT.Category = "Helix - Combat Entities - Mutants"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "PsyDog"

ENT.models = {
    "models/monsters/psydog2.mdl"
}

ENT.skin = table.Random({0, 1, 2, 3, 4}) 


ENT.WalkAnim = "walk"
ENT.RunAnim = "stand_run_0"
ENT.IdleAnim = "stand_idle_0"
ENT.AttackAnim = "stand_attack_0"
ENT.CrouchAnim = "sit_idle_1"
ENT.StandAnim = "sit_stand_up_0"

function ENT:OnTakeDamage(dmgInfo)
    return 0
end


if (SERVER) then
    function ENT:CustomInitialize()

        self:SetCombatHealth(85)
        self:SetCombatHealthMax(85)
        self:SetWeaponSkill(0)
        self:SetDodge(8)
    
        self:SetHeadBR(0)
        self:SetHeadBullet(35)
        self:SetHeadImpact(35)
        self:SetHeadRupture(35)
    
        self:SetTorsoBR(0)
        self:SetTorsoBullet(30)
        self:SetTorsoImpact(30)
        self:SetTorsoRupture(30)

        self:SetCEntSkin(self.skin)
    end
end



