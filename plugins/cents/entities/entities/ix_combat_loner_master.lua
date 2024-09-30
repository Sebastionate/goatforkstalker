local PLUGIN = PLUGIN

ENT.Type = "nextbot"
ENT.Base = "ix_combat_base"
ENT.PrintName = "Loner Master"
ENT.Category = "Helix - Combat Entities - Loner"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "A Loner."
ENT.description = "Lonely Lonely!"



ENT.models = {
    "models/nasca/stalker/male_psz12d_lone.mdl",
    "models/nasca/stalker/male_exo_lone.mdl",
    "models/nasca/stalker/male_jupiter_eco.mdl",
    "models/nasca/stalker/male_cs3b.mdl"
}


ENT.skin = 0 
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
    "models/tnb/weapons/w_pkm.mdl",
    "models/tnb/weapons/w_m249.mdl",
    "models/tnb/weapons/w_m240.mdl",
    "models/tnb/weapons/w_ks23.mdl",
    "models/tnb/weapons/w_svu.mdl",
    "models/tnb/weapons/w_aa12.mdl",
    "models/tnb/weapons/w_f2000.mdl",
    "models/tnb/weapons/w_vss.mdl",
    "models/tnb/weapons/w_g3.mdl",
}


if (SERVER) then
    function ENT:CustomInitialize()

        self:SetCombatHealth(180)
        self:SetCombatHealthMax(180)
        self:SetWeaponSkill(30)
        self:SetDodge(20)
    
        
        if string.find(self:GetModel(), "psz12") then
            -- PSZ-12d and Sphere-12
            self:EquipSuit("psz12d_duty")
            self:EquipHelmet("sphere12")
        end

        if string.find(self:GetModel(), "exo") then
            -- TB-3 Exoskeleton and Exohelm
            self:EquipSuit("exoskeleton")
            self:EquipHelmet("exohelmet")
        end

        if string.find(self:GetModel(), "jupiter") then
            -- Jupiter and Screen Helm
            self:EquipSuit("jupiter")
            self:EquipHelmet("screenhelm")
        end

        if string.find(self:GetModel(), "cs3b") then
            -- CS-3B and Sphere-12
            self:EquipSuit("cs3b")
            self:EquipHelmet("sphere12")
        end

        local randomAccessory1 = math.random(1, 4)
        if randomAccessory1 == 1 then self:EquipAccessory("belt_steelplateimproved") end
        if randomAccessory1 == 2 then self:EquipAccessory("belt_steelplate") end
        if randomAccessory1 == 3 then self:EquipAccessory("belt_chimerahide") end

        local randomAccessory2 = math.random(1, 4)
        if randomAccessory2 == 1 then self:EquipAccessory("gravi") end
        if randomAccessory2 == 2 then self:EquipAccessory("goldfish") end
        if randomAccessory2 == 3 then self:EquipAccessory("fullempty") end

        local firstname = table.Random(PLUGIN.firstnamesnormal)
        local lastname = table.Random(PLUGIN.lastnamesnormal)

        if string.find(self:GetModel(), "female") then firstname = table.Random(PLUGIN.femalenamesfirst) lastname = table.Random(PLUGIN.femalenameslast) end 

        self:SetDescription("Master")

        self:SetCEntName(firstname .. " " .. lastname)

        
        local chosenweapon = table.Random(riflegrip)
        self:SetCEntWeaponModel(chosenweapon)
    

        self:SetCEntSkin(self.skin)
    end
end



