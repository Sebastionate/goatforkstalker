local PLUGIN = PLUGIN

ENT.Type = "nextbot"
ENT.Base = "ix_combat_base"
ENT.PrintName = "Army Veteran"
ENT.Category = "Helix - Combat Entities - UKM"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Soldier."
ENT.description = "YooUUUU"

ENT.models = {
    "models/nasca/stalker/male_berill5m_mili.mdl",
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
}

local ranks = {
    "Senior Sergeant",
    "Master Sergeant",
}


if (SERVER) then
    function ENT:CustomInitialize()

        self:SetCombatHealth(140)
        self:SetCombatHealthMax(140)
        self:SetWeaponSkill(15)
        self:SetDodge(17)

       -- Beril-5m and Sphere-08
       self:SetHeadBR(31)
       self:SetHeadBullet(24)
       self:SetHeadImpact(30)
       self:SetHeadRupture(3)
   
       self:SetTorsoBR(39)
       self:SetTorsoBullet(21)
       self:SetTorsoImpact(15)
       self:SetTorsoRupture(40)

        local firstname = ""

        local lastname = table.Random(PLUGIN.realnameslast)

        if string.find(self:GetModel(), "female") then firstname = table.Random(PLUGIN.femalenamesfirst) lastname = table.Random(PLUGIN.femalenameslast) end 

        self:SetDescription("Veteran")

        local rank = table.Random(ranks)

        self:SetCEntName(rank .. " " .. lastname)

        
        local chosenweapon = table.Random(riflegrip)
        self:SetCEntWeaponModel(chosenweapon)
    end
end



