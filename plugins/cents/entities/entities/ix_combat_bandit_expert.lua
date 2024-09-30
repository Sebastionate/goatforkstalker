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

        self:SetCombatHealth(165)
        self:SetCombatHealthMax(165)
        self:SetWeaponSkill(25)
        self:SetDodge(17)
    
        if string.find(self:GetModel(), "seva") then
            -- Shakedown SEVA and Screen Helm
            self:EquipSuit("seva_bandit")
            self:EquipHelmet("screenhelm")
        end

        
        if string.find(self:GetModel(), "metro") then
            -- Tomb Raider and Assault Helmet
            self:EquipSuit("bandit_heavy")
            self:EquipHelmet("assaulthelmet")
        end

        if string.find(self:GetModel(), "exo") then
            -- Warlord Exosuit and Exohelm
            self:EquipSuit("bandit_radsuit")
            self:EquipHelmet("exohelmet")
        end

        local firstname = table.Random(PLUGIN.firstnamesnormal)
        local lastname = table.Random(PLUGIN.banditnameslast)

        if string.find(self:GetModel(), "female") then firstname = table.Random(PLUGIN.femalenamesfirst) lastname = table.Random(PLUGIN.femalenameslast) end 

        self:SetDescription("Expert")

        self:SetCEntName(firstname .. " " .. lastname)

        local chosenweapon = table.Random(riflegrip)
        self:SetCEntWeaponModel(chosenweapon)

        local randomAccessory1 = math.random(1, 4)
        if randomAccessory1 == 1 then self:EquipAccessory("belt_pseudodoghide") end
        if randomAccessory1 == 2 then self:EquipAccessory("belt_fleshhide") end 
        if randomAccessory1 == 3 then self:EquipAccessory("belt_steelplate") end 
 
        local randomAccessory2 = math.random(1, 4)
        if randomAccessory2 == 1 then self:EquipAccessory("gravi") end



        self:SetCEntSkin(self.skin)
        if string.find(self:GetModel(), "exo") then self:SetCEntBodyGroups("1") end 
   
    end
end



