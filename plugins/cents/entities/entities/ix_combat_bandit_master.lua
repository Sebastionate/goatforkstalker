local PLUGIN = PLUGIN

ENT.Type = "nextbot"
ENT.Base = "ix_combat_base"
ENT.PrintName = "Bandit Master"
ENT.Category = "Helix - Combat Entities - Bandit"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "A Bandit."
ENT.description = "Cheeki Breeki, Stalker!"

ENT.models = {
    "models/nasca/stalker/male_exo_bandit.mdl"
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
    "models/tnb/weapons/w_g3.mdl",
    "models/tnb/weapons/w_pkm.mdl",
    "models/tnb/weapons/w_m249.mdl",
    "models/tnb/weapons/w_bren.mdl",
    "models/tnb/weapons/w_dp27.mdl",
    "models/tnb/weapons/w_saiga12.mdl",
    "models/tnb/weapons/w_svd.mdl",
    "models/tnb/weapons/w_vss.mdl",
    
}


if (SERVER) then
    function ENT:CustomInitialize()

        self:SetCombatHealth(180)
        self:SetCombatHealthMax(180)
        self:SetWeaponSkill(30)
        self:SetDodge(20)
    
        if string.find(self:GetModel(), "exo") then
            -- Warlord Exoskeleton and Exohelm
            self:EquipSuit("exoskeleton_bandit")
            self:EquipHelmet("exohelmet")
        end

        local randomAccessory1 = math.random(1, 4)
        if randomAccessory1 == 1 then self:EquipAccessory("belt_pseudodoghide") end
        if randomAccessory1 == 2 then self:EquipAccessory("belt_steelplate") end 
        if randomAccessory1 == 3 then self:EquipAccessory("belt_steelplateimproved") end 

        local randomAccessory2 = math.random(1, 4)
        if randomAccessory2 == 1 then self:EquipAccessory("empty") end

        local firstname = table.Random(PLUGIN.firstnamesnormal)
        local lastname = table.Random(PLUGIN.banditnameslast)

        if string.find(self:GetModel(), "female") then firstname = table.Random(PLUGIN.femalenamesfirst) lastname = table.Random(PLUGIN.femalenameslast) end 

        self:SetDescription("Master")

        self:SetCEntName(firstname .. " " .. lastname)

        local chosenweapon = table.Random(riflegrip)
        self:SetCEntWeaponModel(chosenweapon)



        self:SetCEntSkin(self.skin)

   
    end
end



