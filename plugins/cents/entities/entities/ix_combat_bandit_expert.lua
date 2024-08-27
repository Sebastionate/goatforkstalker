local PLUGIN = PLUGIN

ENT.Type = "nextbot"
ENT.Base = "ix_combat_base"
ENT.PrintName = "Bandit Expert"
ENT.Category = "Helix - Combat Entities - Bandit"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "A Bandit."
ENT.description = "Cheeki Breeki, Stalker!"

ENT.models = {
    "models/nasca/stalker/male_exo_bandit.mdl",
    "models/player/stalker_bandit/bandit_seva/bandit_seva.mdl",
    "models/player/stalker_bandit/bandit_metro/bandit_metro.mdl",
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

local riflegrip = {
    "models/tnb/weapons/w_fal.mdl",
    "models/tnb/weapons/w_famas.mdl",
    "models/tnb/weapons/w_akm.mdl",
    "models/tnb/weapons/w_ak74.mdl",
    "models/tnb/weapons/w_galil.mdl",
    "models/tnb/weapons/w_dp27.mdl",
    "models/tnb/weapons/w_saiga12.mdl",
    "models/tnb/weapons/w_svd.mdl",
    "models/tnb/weapons/w_vss.mdl",
    
}


if (SERVER) then
    function ENT:CustomInitialize()

        self:SetCombatHealth(150)
        self:SetCombatHealthMax(150)
        self:SetWeaponSkill(25)
        self:SetDodge(17)
    
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

        
        if string.find(self:GetModel(), "metro") then
            -- Tomb Raider and Assault Helmet
            self:SetHeadBR(35)
            self:SetHeadBullet(25)
            self:SetHeadImpact(30)
            self:SetHeadRupture(4)
        
            self:SetTorsoBR(40)
            self:SetTorsoBullet(21)
            self:SetTorsoImpact(11)
            self:SetTorsoRupture(23)
        end

        if string.find(self:GetModel(), "exo") then
            -- Warlord Exosuit and Exohelm
            self:SetHeadBR(50)
            self:SetHeadBullet(31)
            self:SetHeadImpact(40)
            self:SetHeadRupture(4)
        
            self:SetTorsoBR(59)
            self:SetTorsoBullet(31)
            self:SetTorsoImpact(28)
            self:SetTorsoRupture(29)
        end

        local firstname = table.Random(PLUGIN.firstnamesnormal)
        local lastname = table.Random(PLUGIN.banditnameslast)

        if string.find(self:GetModel(), "female") then firstname = table.Random(PLUGIN.femalenamesfirst) lastname = table.Random(PLUGIN.femalenameslast) end 

        self:SetDescription("Expert")

        self:SetCEntName(firstname .. " " .. lastname)

        local chosenweapon = table.Random(riflegrip)
        self:SetCEntWeaponModel(chosenweapon)



        self:SetCEntSkin(self.skin)
        if string.find(self:GetModel(), "exo") then self:SetCEntBodyGroups("1") end 
   
    end
end



