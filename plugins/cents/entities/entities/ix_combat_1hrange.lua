local PLUGIN = PLUGIN

ENT.Type = "nextbot"
ENT.Base = "ix_combat_base"
ENT.PrintName = "One Handed Ranged / Unarmed"
ENT.Category = "Helix - Combat Entities"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "One Handed Template"
ENT.description = "For use with pistols or SMGs, or Unarmed (just dont use the Attack pose)"

ENT.models = {
    "models/Humans/Group01/Male_01.mdl"
}
ENT.WalkAnim = "walk_all"
ENT.RunAnim = "run_all"
ENT.IdleAnim = "idle_subtle"
ENT.AttackAnim = "shootp1"
ENT.CrouchAnim = "crouch_idled"
ENT.StandAnim = "crouchtostand"


function ENT:OnTakeDamage(dmgInfo)
    return 0
end

if (SERVER) then
    function ENT:CustomInitialize()
        
    end
end