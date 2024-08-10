local PLUGIN = PLUGIN

ENT.Type = "nextbot"
ENT.Base = "ix_combat_base"
ENT.PrintName = "Bandit Veteran"
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
    "models/player/stalker_bandit/bandit_berill/bandit_berill.mdl",
    "models/player/stalker_bandit/bandit_seva/bandit_seva.mdl"
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
    "models/tnb/weapons/w_deserteagle.mdl",
    "models/tnb/weapons/w_magnum.mdl",
}

local riflegrip = {
    "models/tnb/weapons/w_m14.mdl",
    "models/tnb/weapons/w_ump.mdl",
    "models/tnb/weapons/w_m16.mdl",
    "models/tnb/weapons/w_akm.mdl",
    "models/tnb/weapons/w_ak74.mdl",
    "models/tnb/weapons/w_sks.mdl",
    "models/tnb/weapons/w_ithaca.mdl",
    "models/tnb/weapons/w_mossberg.mdl",
    "models/tnb/weapons/w_mosin.mdl",
    "models/tnb/weapons/w_ak107.mdl",
    
}


if (SERVER) then
    function ENT:CustomInitialize()

        self:SetCombatHealth(140)
        self:SetCombatHealthMax(140)
        self:SetWeaponSkill(15)
        self:SetDodge(14)
    
        if string.find(self:GetModel(), "gp5") or string.find(self:GetModel(), "lone_old") then
            -- Vulture and GP-5

            self:SetHeadBR(10)
            self:SetHeadBullet(1)
            self:SetHeadImpact(6)
            self:SetHeadRupture(2)
        
            self:SetTorsoBR(36)
            self:SetTorsoBullet(14)
            self:SetTorsoImpact(6)
            self:SetTorsoRupture(16)
        end

        if string.find(self:GetModel(), "berill") then
            -- Beril-5m and Sphere-08
            self:SetHeadBR(31)
            self:SetHeadBullet(24)
            self:SetHeadImpact(30)
            self:SetHeadRupture(3)
        
            self:SetTorsoBR(39)
            self:SetTorsoBullet(21)
            self:SetTorsoImpact(15)
            self:SetTorsoRupture(40)
        end

        if string.find(self:GetModel(), "eagle") then
            -- Nighthunter and Sphere-08
            self:SetHeadBR(31)
            self:SetHeadBullet(24)
            self:SetHeadImpact(30)
            self:SetHeadRupture(3)
        
            self:SetTorsoBR(38)
            self:SetTorsoBullet(24)
            self:SetTorsoImpact(18)
            self:SetTorsoRupture(18)
        end

        if string.find(self:GetModel(), "seva") then
            -- Shakedown SEVA and Screen Helm
            self:SetHeadBR(16)
            self:SetHeadBullet(13)
            self:SetHeadImpact(15)
            self:SetHeadRupture(3)
        
            self:SetTorsoBR(36)
            self:SetTorsoBullet(19)
            self:SetTorsoImpact(11)
            self:SetTorsoRupture(15)
        end


        local firstname = table.Random(PLUGIN.firstnamesnormal)
        local lastname = table.Random(PLUGIN.banditnameslast)

        if string.find(self:GetModel(), "female") then firstname = table.Random(PLUGIN.femalenamesfirst) lastname = table.Random(PLUGIN.femalenameslast) end 

        self:SetDescription("Veteran")

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



