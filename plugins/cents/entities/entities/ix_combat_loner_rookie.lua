local PLUGIN = PLUGIN

ENT.Type = "nextbot"
ENT.Base = "ix_combat_base"
ENT.PrintName = "Loner Rookie"
ENT.Category = "Helix - Combat Entities - Loner"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "A Loner."
ENT.description = "Lonely Lonely!"

ENT.models = {
    "models/nasca/stalker/male_anorak.mdl",
    "models/player/stalker_lone/lone_novice/lone_novice.mdl",
    "models/player/stalker_lone/lone_jacket/lone_jacket.mdl",
    "models/nasca/stalker/female_anorak.mdl"
}


ENT.skin = table.Random({0, 2, 3, 4, 5, 6}) 
ENT.head = table.Random({"0"})
ENT.hood = table.Random({"0", "1"})
ENT.vest = table.Random({"0", "1"})

ENT.WalkAnim = "walk_passive"
ENT.RunAnim = "run_passive"
ENT.IdleAnim = "idle_passive"
ENT.AttackAnim = "idle_ar2"
ENT.CrouchAnim = "cidle_all"
ENT.StandAnim = "crouchtostand"



function ENT:OnTakeDamage(dmgInfo)
    return 0
end

local weapontypes = {
    "smallarms",
    "riflegrip"
}

local smallarms = {
    "models/tnb/weapons/w_makarov.mdl",
    "models/tnb/weapons/w_tokarev.mdl",
    "models/tnb/weapons/w_aps.mdl",
    "models/tnb/weapons/w_38.mdl",
    "models/tnb/weapons/w_grach.mdl",
    "models/tnb/weapons/w_glock.mdl",
    "models/tnb/weapons/w_m9.mdl",
    "models/tnb/weapons/w_mac10.mdl",
    "models/tnb/weapons/w_1911.mdl",
    "models/tnb/weapons/w_ots.mdl",
    "models/tnb/weapons/w_skorpion.mdl"
}

local riflegrip = {
    "models/tnb/weapons/w_sawnoff.mdl",
    "models/tnb/weapons/w_bizon.mdl",
    "models/tnb/weapons/w_ppsh.mdl",
}


if (SERVER) then
    function ENT:CustomInitialize()

        local firstname = table.Random(PLUGIN.firstnamesnormal)
        local lastname = table.Random(PLUGIN.lastnamesnormal)

        if string.find(self:GetModel(), "female") then firstname = table.Random(PLUGIN.femalenamesfirst) lastname = table.Random(PLUGIN.femalenameslast) end 

        self:SetDescription("Rookie")

        self:SetCEntName(firstname .. " " .. lastname)

        local weapontype = table.Random(weapontypes)
        if string.find(weapontype, "smallarms") then

            self.IdleAnim = "idle_all_0" .. math.random(1,2)
            self.AttackAnim = "idle_revolver"
            self.RunAnim = "run_all_0" .. math.random(1, 2)
            self.WalkAnim = "walk_all"

            local chosenweapon = table.Random(smallarms)
            self:SetCEntWeaponModel(chosenweapon)
        end

        if string.find(weapontype, "riflegrip") then
            local chosenweapon = table.Random(riflegrip)
            self:SetCEntWeaponModel(chosenweapon)
        end

        self:SetCEntSkin(self.skin)
        self:SetCEntBodyGroups(self.head .. self.hood .. self.vest)
   
    end
end



