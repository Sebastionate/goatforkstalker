local PLUGIN = PLUGIN

ENT.Type = "nextbot"
ENT.Base = "ix_combat_base"
ENT.PrintName = "Amoeba"
ENT.Category = "Helix - Combat Entities - Mutants"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Amoeba"

ENT.models = {
    "models/monsters/ameba.mdl",
}

ENT.WalkAnim = "stand_walk_fwd_0"
ENT.RunAnim = "stand_walk_fwd_0"
ENT.IdleAnim = "stand_idle_2"
ENT.AttackAnim = "stand_attack_2"
ENT.CrouchAnim = "stand_idle_2"
ENT.StandAnim =  "stand_idle_2"

function ENT:OnTakeDamage(dmgInfo)
    return 0
end


if (SERVER) then
    function ENT:CustomInitialize()

        self:SetCombatHealth(125)
        self:SetCombatHealthMax(125)
        self:SetWeaponSkill(10)
        self:SetDodge(10)
    
        self:SetHeadBR(15)
        self:SetHeadBullet(15)
        self:SetHeadImpact(15)
        self:SetHeadRupture(15)
    
        self:SetTorsoBR(15)
        self:SetTorsoBullet(15)
        self:SetTorsoImpact(15)
        self:SetTorsoRupture(15)

    end
end



