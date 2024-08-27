local PLUGIN = PLUGIN

ENT.Type = "nextbot"
ENT.Base = "ix_combat_base"
ENT.PrintName = "Duty Experienced"
ENT.Category = "Helix - Combat Entities - Duty"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Duty Soldier"
ENT.description = "YA SOLDAT"

ENT.models = {
    "models/nasca/stalker/male_hawk_duty.mdl",
    "models/silver/stalker/female_hawk_duty.mdl",
    "models/nasca/stalker/male_expedition.mdl",
    "models/nasca/stalker/female_expedition.mdl",
    "models/nasca/stalker/male_nbc_duty.mdl",
    "models/silver/stalker/female_nbc_duty.mdl",
}


ENT.skin = 1

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

local ranks = {
    "Private",
    "Senior Private",
}


local riflegrip = {
    "models/tnb/weapons/w_ak74u.mdl",
    "models/tnb/weapons/w_ithaca.mdl",
    "models/tnb/weapons/w_pm63.mdl",
    "models/tnb/weapons/w_mosin.mdl",
}


if (SERVER) then
    function ENT:CustomInitialize()

        self:SetCombatHealth(100)
        self:SetCombatHealthMax(100)
        self:SetWeaponSkill(10)
        self:SetDodge(8)
    
        if string.find(self:GetModel(), "hawk") then
            -- PS5-R and M40
            self:SetHeadBR(10)
            self:SetHeadBullet(3)
            self:SetHeadImpact(8)
            self:SetHeadRupture(4)
        
            self:SetTorsoBR(25)
            self:SetTorsoBullet(11)
            self:SetTorsoImpact(15)
            self:SetTorsoRupture(18)
        end

        if string.find(self:GetModel(), "expedition") then
            -- Berkut and Altyn
            self:SetHeadBR(28)
            self:SetHeadBullet(20)
            self:SetHeadImpact(25)
            self:SetHeadRupture(3)
        
            self:SetTorsoBR(25)
            self:SetTorsoBullet(12)
            self:SetTorsoImpact(20)
            self:SetTorsoRupture(35)
        end

        if string.find(self:GetModel(), "nbc") then
            -- NBC and GP5
            self:SetHeadBR(10)
            self:SetHeadBullet(1)
            self:SetHeadImpact(6)
            self:SetHeadRupture(2)
        
            self:SetTorsoBR(18)
            self:SetTorsoBullet(8)
            self:SetTorsoImpact(10)
            self:SetTorsoRupture(13)
        end

        
        local firstname = ""

        local lastname = table.Random(PLUGIN.realnameslast)

        if string.find(self:GetModel(), "female") then firstname = table.Random(PLUGIN.femalenamesfirst) lastname = table.Random(PLUGIN.femalenameslast) end 

        self:SetDescription("Experienced")

        local rank = table.Random(ranks)

        self:SetCEntName(rank .. " " .. lastname)

        
        local chosenweapon = table.Random(riflegrip)
        self:SetCEntWeaponModel(chosenweapon)
    

        self:SetCEntSkin(self.skin)
    end
end



