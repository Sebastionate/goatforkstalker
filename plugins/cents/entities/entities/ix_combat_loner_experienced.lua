local PLUGIN = PLUGIN

ENT.Type = "nextbot"
ENT.Base = "ix_combat_base"
ENT.PrintName = "Loner Experienced"
ENT.Category = "Helix - Combat Entities - Loner"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "A Loner."
ENT.description = "Lonely Lonely!"

ENT.models = {
    "models/nasca/stalker/male_sunrise_lone.mdl",
    "models/nasca/stalker/male_hawk_lone.mdl",
    "models/nasca/stalker/male_nbc_lone.mdl",
    "models/nasca/stalker/female_sunrise_lone.mdl",
    "models/silver/stalker/female_nbc_lone.mdl",
    "models/silver/stalker/female_hawk_lone.mdl",
    "models/player/stalker_lone/lone_old/lone_old.mdl",
    "models/nasca/stalker/male_expedition.mdl",
    "models/nasca/stalker/female_expedition.mdl",

}


ENT.skin = table.Random({0, 1, 2, 3, 4}) 

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
    "models/tnb/weapons/w_m1a1.mdl",
    "models/tnb/weapons/w_mosin.mdl",
    "models/tnb/weapons/w_ithaca.mdl",
    "models/tnb/weapons/w_ak74u.mdl",
    "models/tnb/weapons/w_sks.mdl",
    "models/weapons/w_shot_mossberg5.mdl",
    "models/tnb/weapons/w_thompson.mdl",
    "models/tnb/weapons/w_ump.mdl",
    "models/tnb/weapons/w_mp5.mdl"
}


if (SERVER) then
    function ENT:CustomInitialize()

        self:SetCombatHealth(95)
        self:SetCombatHealthMax(95)
        self:SetWeaponSkill(10)
        self:SetDodge(5)

        if string.find(self:GetModel(), "sunrise") or string.find(self:GetModel(), "lone_old") then
            -- Sunrise and PBF Mask
            self:SetHeadBR(10)
            self:SetHeadBullet(1)
            self:SetHeadImpact(6)
            self:SetHeadRupture(2)
        
            self:SetTorsoBR(20)
            self:SetTorsoBullet(9)
            self:SetTorsoImpact(13)
            self:SetTorsoRupture(16)
        end

        if string.find(self:GetModel(), "hawk") then
            -- SAS-H Hawk and M40
            self:SetHeadBR(10)
            self:SetHeadBullet(3)
            self:SetHeadImpact(8)
            self:SetHeadRupture(4)
        
            self:SetTorsoBR(23)
            self:SetTorsoBullet(9)
            self:SetTorsoImpact(8)
            self:SetTorsoRupture(11)
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



    
       
        local firstname = table.Random(PLUGIN.firstnamesnormal)
        local lastname = table.Random(PLUGIN.lastnamesnormal)

        if string.find(self:GetModel(), "female") then firstname = table.Random(PLUGIN.femalenamesfirst) lastname = table.Random(PLUGIN.femalenameslast) end 

        self:SetDescription("Experienced")

        self:SetCEntName(firstname .. " " .. lastname)

        
        local chosenweapon = table.Random(riflegrip)
        self:SetCEntWeaponModel(chosenweapon)
    

        self:SetCEntSkin(self.skin)
    end
end



