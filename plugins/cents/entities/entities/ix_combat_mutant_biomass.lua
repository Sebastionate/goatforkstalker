local PLUGIN = PLUGIN

ENT.Type = "nextbot"
ENT.Base = "ix_combat_base"
ENT.PrintName = "Biomass"
ENT.Category = "Helix - Combat Entities - Mutants"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Biomass"

ENT.models = {
    "models/monsters/biomassa.mdl",
}

ENT.WalkAnim = "walk"
ENT.RunAnim = "run"
ENT.IdleAnim = "idle_0"
ENT.AttackAnim = "psy_attack"
ENT.CrouchAnim = "idle_0"
ENT.StandAnim =  "idle_0"

function ENT:OnTakeDamage(dmgInfo)
    return 0
end


if (SERVER) then
    function ENT:CustomInitialize()

        self:SetCombatHealth(100)
        self:SetCombatHealthMax(100)
        self:SetWeaponSkill(10)
        self:SetDodge(15)
    
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



