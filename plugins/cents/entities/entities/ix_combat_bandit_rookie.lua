local PLUGIN = PLUGIN

ENT.Type = "nextbot"
ENT.Base = "ix_combat_base"
ENT.PrintName = "Bandit Rookie"
ENT.Category = "Helix - Combat Entities - Bandit"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "A Bandit."
ENT.description = "Cheeki Breeki, Stalker!"

ENT.models = {
    "models/nasca/stalker/male_anorak.mdl",
    "models/nasca/stalker/male_trenchcoat.mdl",
    "models/nasca/stalker/female_anorak.mdl",
    "models/player/stalker_bandit/bandit_novice/bandit_novice.mdl"
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
    "models/tnb/weapons/w_pp2000.mdl"
}


if (SERVER) then
    function ENT:CustomInitialize()

        self:SetCombatHealth(80)
        self:SetCombatHealthMax(80)
        self:SetWeaponSkill(0)
        self:SetDodge(5)
    
        if string.find(self:GetModel(), "anorak") or string.find(self:GetModel(), "novice") then
            -- Armored Jacket, No Helmet
            self:SetHeadBR(0)
            self:SetHeadBullet(0)
            self:SetHeadImpact(0)
            self:SetHeadRupture(0)
        
            self:SetTorsoBR(8)
            self:SetTorsoBullet(7)
            self:SetTorsoImpact(1)
            self:SetTorsoRupture(15)
        end

        if string.find(self:GetModel(), "trenchcoat") then
            -- Trenchcoat, No Helmet
            self:SetHeadBR(0)
            self:SetHeadBullet(0)
            self:SetHeadImpact(0)
            self:SetHeadRupture(0)
        
            self:SetTorsoBR(12)
            self:SetTorsoBullet(1)
            self:SetTorsoImpact(1)
            self:SetTorsoRupture(11)
        end

        local firstname = table.Random(PLUGIN.firstnamesnormal)
        local lastname = table.Random(PLUGIN.banditnameslast)

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



