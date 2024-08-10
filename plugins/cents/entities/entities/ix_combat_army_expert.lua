local PLUGIN = PLUGIN

ENT.Type = "nextbot"
ENT.Base = "ix_combat_base"
ENT.PrintName = "Army Expert"
ENT.Category = "Helix - Combat Entities - UKM"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Soldier."
ENT.description = "YooUUUU"

ENT.models = {
    "models/nasca/stalker/male_stingray9_mili.mdl",
}


ENT.skin = 0

ENT.voicevariant = table.Random({1, 2})

ENT.WalkAnim = "walk_passive"
ENT.RunAnim = "run_passive"
ENT.IdleAnim = "idle_passive"
ENT.AttackAnim = "idle_ar2"
ENT.CrouchAnim = "cidle_all"
ENT.StandAnim = "crouchtostand"

function ENT:OnTakeDamage(dmgInfo)
    return 0
end


local riflegrip = {
    "models/tnb/weapons/w_saiga12.mdl",
    "models/tnb/weapons/w_aek.mdl",
    "models/tnb/weapons/w_vss.mdl",
    "models/tnb/weapons/w_groza.mdl"

}

local ranks = {
    "Lieutenant",
    "Senior Lieutenant",
}


if (SERVER) then
    function ENT:CustomInitialize()

        self:SetCombatHealth(150)
        self:SetCombatHealthMax(150)
        self:SetWeaponSkill(20)
        self:SetDodge(17)
    
        -- Stingray-9 and Sphere-12
        self:SetHeadBR(40)
        self:SetHeadBullet(27)
        self:SetHeadImpact(35)
        self:SetHeadRupture(5)
    
        self:SetTorsoBR(40)
        self:SetTorsoBullet(28)
        self:SetTorsoImpact(28)
        self:SetTorsoRupture(23)

        local firstname = ""

        local lastname = table.Random(PLUGIN.realnameslast)

        if string.find(self:GetModel(), "female") then firstname = table.Random(PLUGIN.femalenamesfirst) lastname = table.Random(PLUGIN.femalenameslast) end 

        self:SetDescription("Expert")

        local rank = table.Random(ranks)

        self:SetCEntName(rank .. " " .. lastname)

        
        local chosenweapon = table.Random(riflegrip)
        self:SetCEntWeaponModel(chosenweapon)
    end
end



