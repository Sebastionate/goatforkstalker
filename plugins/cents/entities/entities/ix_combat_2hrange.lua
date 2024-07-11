local PLUGIN = PLUGIN

ENT.Type = "nextbot"
ENT.Base = "ix_combat_base"
ENT.PrintName = "Two Handed Ranged"
ENT.Category = "Helix - Combat Entities"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Two Handed Template"
ENT.description = "For use with rifles, SMGs."

ENT.models = {
    "models/Humans/Group01/Male_01.mdl"
}
ENT.WalkAnim = "walkalerthold_ar2_all1"
ENT.RunAnim = "run_holding_ar2_all"
ENT.IdleAnim = "idle_alert_smg1_"..math.random(1, 9)
ENT.AttackAnim = "idle_smg1_aim_alert"
ENT.CrouchAnim = "crouch_idled"
ENT.StandAnim = "crouchtostand"


function ENT:OnTakeDamage(dmgInfo)
    return 0
end

if (SERVER) then
    function ENT:CustomInitialize()
        
    end
end