local PLUGIN = PLUGIN

ENT.Type = "nextbot"
ENT.Base = "ix_combat_base"
ENT.PrintName = "Lost"
ENT.Category = "Helix - Combat Entities - Mutants"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Lost"

ENT.models = {
    "models/monsters/bibliotecar.mdl",
}

ENT.WalkAnim = "stand_walk_fwd_0"
ENT.RunAnim = "stand_run2_0"
ENT.IdleAnim = "stand_idle_1"
ENT.AttackAnim = "stand_attack_0"
ENT.CrouchAnim = "stand_idle_1"
ENT.StandAnim =  "stand_idle_1"

function ENT:OnTakeDamage(dmgInfo)
    return 0
end


if (SERVER) then
    function ENT:CustomInitialize()

        self:SetCombatHealth(200)
        self:SetCombatHealthMax(200)
        self:SetWeaponSkill(15)
        self:SetDodge(5)
    
        self:SetHeadBR(25)
        self:SetHeadBullet(30)
        self:SetHeadImpact(30)
        self:SetHeadRupture(30)
    
        self:SetTorsoBR(30)
        self:SetTorsoBullet(35)
        self:SetTorsoImpact(35)
        self:SetTorsoRupture(35)

    end
end



