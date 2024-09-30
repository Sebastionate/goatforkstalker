local PLUGIN = PLUGIN

ENT.Type = "nextbot"
ENT.Base = "ix_combat_base"
ENT.PrintName = "Freedom Professional"
ENT.Category = "Helix - Combat Entities - Freedom"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Freedom."
ENT.description = "Dude. WEED. LMAO."

ENT.models = {
    "models/nasca/stalker/female_psz9d_free.mdl",
    "models/nasca/stalker/male_psz9d_free.mdl",
    "models/nasca/stalker/male_dusk_free.mdl",
    "models/silver/stalker/female_dusk_free.mdl",
    "models/player/stalker_freedom/freedom_gp5/freedom_gp5.mdl",
    "models/player/stalker_freedom/freedom_cloak/freedom_cloak.mdl"

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
    "models/tnb/weapons/w_spas12.mdl",
    "models/tnb/weapons/w_m4.mdl",
    "models/tnb/weapons/w_g36c.mdl",
    "models/tnb/weapons/w_m16.mdl",
    "models/tnb/weapons/w_sig.mdl",
    "models/tnb/weapons/w_m24.mdl"
}

local ranks = {
    "Rambler"
}


if (SERVER) then
    function ENT:CustomInitialize()

        self:SetCombatHealth(135)
        self:SetCombatHealthMax(135)
        self:SetWeaponSkill(15)
        self:SetDodge(14)

        -- Sentinel of Freedom and PBF
    
        self:EquipSuit("psz9_free")
        self:EquipHelmet("pbfgasmask")

        local randomAccessory1 = math.random(1, 4)
        if randomAccessory1 == 1 then self:EquipAccessory("gravi") end
        if randomAccessory1 == 2 then self:EquipAccessory("empty") end 
        if randomAccessory1 == 3 then self:EquipAccessory("medusa") end 
        if randomAccessory1 == 4 then self:EquipAccessory("belt_kevlarimproved") end 

        local firstname = ""

        local lastname = table.Random(PLUGIN.lastnamesnormal)

        if string.find(self:GetModel(), "female") then firstname = table.Random(PLUGIN.femalenamesfirst) lastname = table.Random(PLUGIN.femalenameslast) end 

        self:SetDescription("Professional")

        local rank = table.Random(ranks)

        self:SetCEntName(rank .. " " .. lastname)

        
        local chosenweapon = table.Random(riflegrip)
        self:SetCEntWeaponModel(chosenweapon)
    end
end



