local PLUGIN = PLUGIN

ENT.Type = "nextbot"
ENT.Base = "ix_combat_base"
ENT.PrintName = "Mercenary Professional"
ENT.Category = "Helix - Combat Entities - Mercenary"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Merc."
ENT.description = "OK, drop that retard!"

ENT.models = {
    "models/silver/stalker/male_sunrise_merc.mdl",
    "models/player/stalker_merc/merc_sunrise/merc_sunrise.mdl",
    "models/player/stalker_merc/merc_gp5/merc_gp5.mdl",
    "models/player/stalker_merc/merc_old/merc_old.mdl"
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
    "models/tnb/weapons/w_hk416.mdl",
    "models/tnb/weapons/w_p90.mdl",
    "models/tnb/weapons/w_famas.mdl"
}



if (SERVER) then
    function ENT:CustomInitialize()

        self:SetCombatHealth(135)
        self:SetCombatHealthMax(135)
        self:SetWeaponSkill(20)
        self:SetDodge(11)

        -- Wolven and PMK
        self:EquipSuit("merc_wolven")
        self:EquipHelmet("pmk3gasmask")

        local randomAccessory1 = math.random(1, 4)
        if randomAccessory1 == 1 then self:EquipAccessory("belt_kevlar") end

        local randomAccessory2 = math.random(1, 4)
        if randomAccessory2 == 1 then self:EquipAccessory("medusa") end

        local randomAccessory3 = math.random(1, 4)
        if randomAccessory3 == 1 then self:EquipAccessory("belt_pseudodoghide") end

        local firstname = table.Random(PLUGIN.mercnamesfirst)

        local lastname = table.Random(PLUGIN.mercnameslast)

        if string.find(self:GetModel(), "female") then firstname = table.Random(PLUGIN.femalenamesfirst) lastname = table.Random(PLUGIN.femalenameslast) end 

        self:SetDescription("Professional")

       

        self:SetCEntName(firstname .. " " .. lastname)

        self:SetCEntSkin(self.skin)

        
        local chosenweapon = table.Random(riflegrip)
        self:SetCEntWeaponModel(chosenweapon)
    end
end



