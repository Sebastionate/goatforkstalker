local PLUGIN = PLUGIN

ENT.Type = "nextbot"
ENT.Base = "ix_combat_base"
ENT.PrintName = "Army Professional"
ENT.Category = "Helix - Combat Entities - UKM"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Soldier."
ENT.description = "YooUUUU"

ENT.models = {
    "models/player/stalker_soldier/soldier_bandana_2/soldier_bandana_2.mdl",
    "models/nasca/stalker/male_berill1.mdl",
}


ENT.skin = 1

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
    "models/tnb/weapons/w_ithaca.mdl",
    "models/tnb/weapons/w_ak107.mdl",
}

local ranks = {
    "Junior Sergeant",
    "Sergeant",
}


if (SERVER) then
    function ENT:CustomInitialize()

        self:SetCombatHealth(135)
        self:SetCombatHealthMax(135)
        self:SetWeaponSkill(15)
        self:SetDodge(11)

        -- Beril-3M, Sphere-04
    
        self:EquipSuit("berill3m")
        self:EquipHelmet("sphere04")

        local randomAccessory1 = math.random(1, 4)
        if randomAccessory1 == 1 then self:EquipAccessory("belt_kevlar") end
        if randomAccessory1 == 2 then self:EquipAccessory("belt_kevlar") end 


        local firstname = ""

        local lastname = table.Random(PLUGIN.realnameslast)

        if string.find(self:GetModel(), "female") then firstname = table.Random(PLUGIN.femalenamesfirst) lastname = table.Random(PLUGIN.femalenameslast) end 

        self:SetDescription("Professional")

        local rank = table.Random(ranks)

        self:SetCEntName(rank .. " " .. lastname)

        
        local chosenweapon = table.Random(riflegrip)
        self:SetCEntWeaponModel(chosenweapon)
    end
end



