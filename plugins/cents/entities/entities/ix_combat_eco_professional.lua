local PLUGIN = PLUGIN

ENT.Type = "nextbot"
ENT.Base = "ix_combat_base"
ENT.PrintName = "Ecologist Professional"
ENT.Category = "Helix - Combat Entities - Ecologist"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Merc."
ENT.description = "OK, drop that retard!"

ENT.models = {
    "models/silver/stalker/female_dusk_eco.mdl",
    "models/nasca/stalker/female_psz9d_eco.mdl",
    "models/nasca/stalker/male_dusk_eco.mdl",
    "models/nasca/stalker/male_psz9d_eco.mdl",
    "models/player/stalker_ecologist/ecologist_gp5/ecologist_gp5.mdl",
    "models/player/stalker_ecologist/ecologist_guard/ecologist_guard.mdl",
    "models/player/stalker_ecologist/ecologist_old/ecologist_old.mdl"
}


ENT.skin = 0

ENT.voicevariant = table.Random({1, 2, 3})

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
    "models/tnb/weapons/w_l85.mdl",
    "models/tnb/weapons/w_ak74.mdl",
    "models/tnb/weapons/w_ak107.mdl"
}



if (SERVER) then
    function ENT:CustomInitialize()

        self:SetCombatHealth(135)
        self:SetCombatHealthMax(135)
        self:SetWeaponSkill(15)
        self:SetDodge(11)


        -- PSZ-9 and PBF Mask
        self:EquipSuit("psz9")
        self:EquipHelmet("pbfgasmask")

        local randomAccessory1 = math.random(1, 4)
        if randomAccessory1 == 1 then self:EquipAccessory("gravi") end
        if randomAccessory1 == 2 then self:EquipAccessory("empty") end 
        if randomAccessory1 == 3 then self:EquipAccessory("medusa") end 
        if randomAccessory1 == 4 then self:EquipAccessory("belt_kevlarimproved") end 

        local firstname = table.Random(PLUGIN.firstnamesnormal)

        local lastname = table.Random(PLUGIN.econameslast)

        if string.find(self:GetModel(), "female") then firstname = table.Random(PLUGIN.femalenamesfirst) lastname = table.Random(PLUGIN.femalenameslast) end 

        self:SetDescription("Professional")

       

        self:SetCEntName(firstname .. " " .. lastname)

        self:SetCEntSkin(self.skin)

        
        local chosenweapon = table.Random(riflegrip)
        self:SetCEntWeaponModel(chosenweapon)
    end
end



