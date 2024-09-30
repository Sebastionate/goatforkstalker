local PLUGIN = PLUGIN

ENT.Type = "nextbot"
ENT.Base = "ix_combat_base"
ENT.PrintName = "Freedom Experienced"
ENT.Category = "Helix - Combat Entities - Freedom"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Freedom."
ENT.description = "Dude. WEED. LMAO."

ENT.models = {
    "models/nasca/stalker/female_expedition.mdl",
    "models/nasca/stalker/female_wind_free.mdl",
    "models/nasca/stalker/male_expedition.mdl",
    "models/nasca/stalker/male_wind_free.mdl",
    "models/player/stalker_freedom/freedom_guard/freedom_guard.mdl"

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
    "models/tnb/weapons/w_mossberg.mdl",
    "models/tnb/weapons/w_mp5.mdl",
    "models/tnb/weapons/w_ump.mdl"

}

local ranks = {
    "Seedy"
}


if (SERVER) then
    function ENT:CustomInitialize()

        self:SetCombatHealth(120)
        self:SetCombatHealthMax(120)
        self:SetWeaponSkill(10)
        self:SetDodge(11)
    
        if string.find(self:GetModel(), "expedition") then
            -- Berkut and Altyn
            self:EquipSuit("berkut")
            self:EquipHelmet("altyn")
        end

        if string.find(self:GetModel(), "wind") or string.find(self:GetModel(), "guard") then
            -- Wind of Freedom and PBF
            self:EquipSuit("wind_free")
            self:EquipHelmet("pbfgasmask")
        end

        local randomAccessory1 = math.random(1, 4)
        if randomAccessory1 == 1 then self:EquipAccessory("nightstar") end
        if randomAccessory1 == 2 then self:EquipAccessory("medusa") end 
        if randomAccessory1 == 3 then self:EquipAccessory("belt_kevlar") end 

        local firstname = ""

        local lastname = table.Random(PLUGIN.lastnamesnormal)

        if string.find(self:GetModel(), "female") then firstname = table.Random(PLUGIN.femalenamesfirst) lastname = table.Random(PLUGIN.femalenameslast) end 

        self:SetDescription("Experienced")

        local rank = table.Random(ranks)

        self:SetCEntName(rank .. " " .. lastname)

        self:SetCEntSkin(self.skin)

        
        local chosenweapon = table.Random(riflegrip)
        self:SetCEntWeaponModel(chosenweapon)
    end
end



