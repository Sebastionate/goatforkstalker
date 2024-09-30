local PLUGIN = PLUGIN

ENT.Type = "nextbot"
ENT.Base = "ix_combat_base"
ENT.PrintName = "Blind Dog"
ENT.Category = "Helix - Combat Entities - Mutants"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Blind Dog"

ENT.models = {
    "models/wick/dog/wick_blind_dog.mdl"
}

ENT.skin = table.Random({0, 1, 2, 3, 4}) 


ENT.WalkAnim = "stand_walk"
ENT.RunAnim = "stand_run_0"
ENT.IdleAnim = "stand_idle_0"
ENT.AttackAnim = "stand_attack_0"
ENT.CrouchAnim = "stand_idle_0"
ENT.StandAnim = "stand_idle_0"

function ENT:OnTakeDamage(dmgInfo)
    return 0
end


if (SERVER) then
    function ENT:CustomInitialize()

        self:SetCombatHealth(70)
        self:SetCombatHealthMax(70)
        self:SetWeaponSkill(5)
        self:SetDodge(5)
    
        self:SetHeadBR(0)
        self:SetHeadBullet(5)
        self:SetHeadImpact(5)
        self:SetHeadRupture(5)
    
        self:SetTorsoBR(0)
        self:SetTorsoBullet(10)
        self:SetTorsoImpact(10)
        self:SetTorsoRupture(10)

        self:SetCEntSkin(self.skin)
    end
end



