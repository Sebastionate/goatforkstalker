local PLUGIN = PLUGIN

ENT.Type = "nextbot"
ENT.Base = "ix_combat_base"
ENT.PrintName = "Freedom Expert"
ENT.Category = "Helix - Combat Entities - Freedom"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Freedom."
ENT.description = "Dude. WEED. LMAO."

ENT.models = {
    "models/nasca/stalker/male_stingray9_free.mdl",
    "models/nasca/stalker/male_exo_free.mdl",
    "models/player/stalker_freedom/freedom_noexo/freedom_noexo.mdl"
}


ENT.skin = 2

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
    "models/tnb/weapons/w_m249.mdl",
    "models/tnb/weapons/w_g3.mdl",
    "models/tnb/weapons/w_galil.mdl",
    "models/tnb/weapons/w_usas12.mdl"   
}

local ranks = {
    "Ace"
}


if (SERVER) then
    function ENT:CustomInitialize()

        self:SetCombatHealth(165)
        self:SetCombatHealthMax(165)
        self:SetWeaponSkill(25)
        self:SetDodge(20)
    
        if string.find(self:GetModel(), "stingray") then
            -- Stingray-9 and Sphere-12
            self:EquipSuit("skat9")
            self:EquipHelmet("sphere12")
        end

        if string.find(self:GetModel(), "exo") then
            -- Champion of Freedom Exosuit and Exohelm
            self:EquipSuit("radsuit_free")
            self:EquipHelmet("exohelmet")
        end

        local randomAccessory1 = math.random(1, 4)
        if randomAccessory1 == 1 then self:EquipAccessory("goldfish") end
        if randomAccessory1 == 2 then self:EquipAccessory("fullempty") end 
        if randomAccessory1 == 3 then self:EquipAccessory("empty") end 
        if randomAccessory1 == 4 then self:EquipAccessory("belt_steelplate") end 

        local firstname = ""

        local lastname = table.Random(PLUGIN.lastnamesnormal)

        if string.find(self:GetModel(), "female") then firstname = table.Random(PLUGIN.femalenamesfirst) lastname = table.Random(PLUGIN.femalenameslast) end 

        self:SetDescription("Expert")

        local rank = table.Random(ranks)

        self:SetCEntName(rank .. " " .. lastname)

        if string.find(self:GetModel(), "exo") then self:SetCEntBodyGroups("1") end 

        
        local chosenweapon = table.Random(riflegrip)
        self:SetCEntWeaponModel(chosenweapon)
    end
end



