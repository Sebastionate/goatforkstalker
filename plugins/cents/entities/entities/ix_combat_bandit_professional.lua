local PLUGIN = PLUGIN

ENT.Type = "nextbot"
ENT.Base = "ix_combat_base"
ENT.PrintName = "Bandit Professional"
ENT.Category = "Helix - Combat Entities - Bandit"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "A Bandit."
ENT.description = "Cheeki Breeki, Stalker!"

ENT.models = {
    "models/player/stalker_bandit/bandit_gp5/bandit_gp5.mdl",
    "models/nasca/stalker/male_eagle_bandit.mdl",
    "models/silver/stalker/female_eagle_bandit.mdl",
    "models/player/stalker_bandit/bandit_old/bandit_old.mdl",
    "models/player/stalker_bandit/bandit_berill/bandit_berill.mdl"
}


ENT.skin = 1
ENT.head = table.Random({"0"})
ENT.hood = table.Random({"0", "1"})
ENT.vest = table.Random({"0", "1"})

ENT.WalkAnim = "walk_passive"
ENT.RunAnim = "run_passive"
ENT.IdleAnim = "idle_passive"
ENT.AttackAnim = "idle_ar2"
ENT.CrouchAnim = "cidle_all"
ENT.StandAnim = "crouchtostand"

ENT.voicevariant = table.Random({1, 2, 3})


function ENT:OnTakeDamage(dmgInfo)
    return 0
end

local weapontypes = {
    "smallarms",
    "riflegrip"
}

local smallarms = {
    "models/tnb/weapons/w_mac10.mdl",
    "models/tnb/weapons/w_1911.mdl",
    "models/tnb/weapons/w_p99.mdl",
    "models/tnb/weapons/w_ppk.mdl"

}

local riflegrip = {
    "models/tnb/weapons/w_m14.mdl",
    "models/tnb/weapons/w_mac10.mdl",
    "models/tnb/weapons/w_ak74u.mdl",
    "models/tnb/weapons/w_akm.mdl",
    "models/tnb/weapons/w_ak74.mdl",
    "models/tnb/weapons/w_sks.mdl",
    "models/tnb/weapons/w_ithaca.mdl",
    "models/tnb/weapons/w_shorty.mdl",
    "models/tnb/weapons/w_mp5.mdl",
}


if (SERVER) then
    function ENT:CustomInitialize()

        self:SetCombatHealth(135)
        self:SetCombatHealthMax(135)
        self:SetWeaponSkill(15)
        self:SetDodge(11)
    
        if string.find(self:GetModel(), "gp5") or string.find(self:GetModel(), "bandit_old") then
            -- Vulture and GP-5
            self:EquipSuit("psz9_bandit")
            self:EquipHelmet("gp5gasmask")
        end

        if string.find(self:GetModel(), "berill") then
            -- Beril-5m and Sphere-08
            self:EquipSuit("berill5m")
            self:EquipHelmet("sphere08")
        end

        if string.find(self:GetModel(), "eagle") then
            -- Nighthunter and Sphere-08
            self:EquipSuit("merc_nighthunter")
            self:EquipHelmet("sphere08")
        end

        local randomAccessory1 = math.random(1, 4)
        if randomAccessory1 == 1 then self:EquipAccessory("belt_pseudodoghide") end
        if randomAccessory1 == 2 then self:EquipAccessory("belt_fleshhide") end 
        if randomAccessory1 == 3 then self:EquipAccessory("belt_kevlar") end 

     

        local firstname = table.Random(PLUGIN.firstnamesnormal)
        local lastname = table.Random(PLUGIN.banditnameslast)

        if string.find(self:GetModel(), "female") then firstname = table.Random(PLUGIN.femalenamesfirst) lastname = table.Random(PLUGIN.femalenameslast) end 

        self:SetDescription("Professional")

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



