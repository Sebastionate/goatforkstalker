local PLUGIN = PLUGIN

ENT.Type = "nextbot"
ENT.Base = "ix_combat_base"
ENT.PrintName = "Freedom Master"
ENT.Category = "Helix - Combat Entities - Freedom"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Freedom."
ENT.description = "Dude. WEED. LMAO."

ENT.models = {
    "models/nasca/stalker/male_exo_free.mdl",
    "models/player/stalker_freedom/freedom_exo/freedom_exo.mdl"
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
    "models/tnb/weapons/w_scar.mdl",
    "models/tnb/weapons/w_m240.mdl",
    "models/tnb/weapons/w_usas12.mdl"   
}

local ranks = {
    "Kahuna"
}


if (SERVER) then
    function ENT:CustomInitialize()

        self:SetCombatHealth(180)
        self:SetCombatHealthMax(180)
        self:SetWeaponSkill(30)
        self:SetDodge(23)
    
        if string.find(self:GetModel(), "exo") then
            -- Champion of Freedom Exoskeleton and Exohelm
            self:EquipSuit("exoskeleton_free")
            self:EquipHelmet("exohelmet")
        end

        local randomAccessory1 = math.random(1, 4)
        if randomAccessory1 == 1 then self:EquipAccessory("goldfish") end
        if randomAccessory1 == 2 then self:EquipAccessory("fullempty") end 
        if randomAccessory1 == 3 then self:EquipAccessory("empty") end 
        if randomAccessory1 == 4 then self:EquipAccessory("belt_steelplateimproved") end 

        local firstname = ""

        local lastname = table.Random(PLUGIN.lastnamesnormal)

        if string.find(self:GetModel(), "female") then firstname = table.Random(PLUGIN.femalenamesfirst) lastname = table.Random(PLUGIN.femalenameslast) end 

        self:SetDescription("Master")

        local rank = table.Random(ranks)

        self:SetCEntName(rank .. " " .. lastname)


        
        local chosenweapon = table.Random(riflegrip)
        self:SetCEntWeaponModel(chosenweapon)
    end
end



