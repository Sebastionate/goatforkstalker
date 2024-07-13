local PLUGIN = PLUGIN

ENT.Type = "nextbot"
ENT.Base = "ix_combat_base"
ENT.PrintName = "Bandit Experienced"
ENT.Category = "Helix - Combat Entities - Bandit"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "A Bandit."
ENT.description = "Cheeki Breeki, Stalker!"

ENT.models = {
    "models/silver/stalker/male_nbc_bandit.mdl",
    "models/nasca/stalker/male_hawk_bandit.mdl",
    "models/silver/stalker/male_sunrise_bandit.mdl",
    "models/silver/stalker/female_sunrise_bandit.mdl",
    "models/silver/stalker/female_hawk_bandit.mdl",
    "models/silver/stalker/female_nbc_bandit.mdl"
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
    "models/tnb/weapons/w_makarov.mdl",
    "models/tnb/weapons/w_tokarev.mdl",
    "models/tnb/weapons/w_aps.mdl",
    "models/tnb/weapons/w_38.mdl",
    "models/tnb/weapons/w_grach.mdl",
    "models/tnb/weapons/w_mac10.mdl",
    "models/tnb/weapons/w_1911.mdl",
    "models/tnb/weapons/w_ots.mdl",
    "models/tnb/weapons/w_skorpion.mdl",
    "models/tnb/weapons/w_grach.mdl",
    "models/tnb/weapons/w_fort.mdl",
    "models/tnb/weapons/w_p99.mdl",
    "models/tnb/weapons/w_tec9.mdl",
    "models/tnb/weapons/w_ppk.mdl"

}

local riflegrip = {
    "models/tnb/weapons/w_sawnoff.mdl",
    "models/tnb/weapons/w_bizon.mdl",
    "models/tnb/weapons/w_ppsh.mdl",
    "models/tnb/weapons/w_pp2000.mdl",
    "models/tnb/weapons/w_m1a1.mdl",
    "models/tnb/weapons/w_mosin.mdl",
    "models/tnb/weapons/w_ithaca.mdl",
    "models/tnb/weapons/w_sks.mdl",
    "models/weapons/w_shot_mossberg5.mdl",
}


if (SERVER) then
    function ENT:CustomInitialize()

        self:SetCombatHealth(50)
        self:SetCombatHealthMax(50)
        self:SetWeaponSkill(0)
        self:SetDodge(0)
    
        self:SetHeadBR(0)
        self:SetHeadBullet(0)
        self:SetHeadImpact(0)
        self:SetHeadRupture(0)
    
        self:SetTorsoBR(0)
        self:SetTorsoBullet(0)
        self:SetTorsoImpact(0)
        self:SetTorsoRupture(0)

        local firstname = table.Random(PLUGIN.firstnamesnormal)
        local lastname = table.Random(PLUGIN.banditnameslast)

        if string.find(self:GetModel(), "female") then firstname = table.Random(PLUGIN.femalenamesfirst) lastname = table.Random(PLUGIN.femalenameslast) end 

        self:SetDescription("Experienced")

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



