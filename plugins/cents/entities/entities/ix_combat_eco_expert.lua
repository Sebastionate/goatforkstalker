local PLUGIN = PLUGIN

ENT.Type = "nextbot"
ENT.Base = "ix_combat_base"
ENT.PrintName = "Ecologist Expert"
ENT.Category = "Helix - Combat Entities - Ecologist"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Merc."
ENT.description = "OK, drop that retard!"

ENT.models = {
    "models/nasca/stalker/male_exo_eco.mdl",
    "models/nasca/stalker/male_jupiter_eco.mdl",
    "models/player/stalker_ecologist/ecologist_noexo/ecologist_noexo.mdl"
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


local riflegrip = {
    "models/tnb/weapons/w_aa12.mdl",
    "models/tnb/weapons/w_l85.mdl",
    "models/tnb/weapons/w_aek.mdl",
    "models/tnb/weapons/w_fal.mdl",
    "models/tnb/weapons/w_cz.mdl",
    "models/tnb/weapons/w_aa12.mdl",
    "models/tnb/weapons/w_m249.mdl",
    "models/tnb/weapons/w_f2000.mdl"
}



if (SERVER) then
    function ENT:CustomInitialize()

        self:SetCombatHealth(165)
        self:SetCombatHealthMax(165)
        self:SetWeaponSkill(25)
        self:SetDodge(17)
    
        if string.find(self:GetModel(), "exo") then
            -- TB-3 Exosuit and Exohelm
            self:EquipSuit("radsuit")
            self:EquipHelmet("exohelmet")
        end

        if string.find(self:GetModel(), "jupiter") then
            -- Jupiter and Screen Helm
            self:EquipSuit("jupiter")
            self:EquipHelmet("screenhelmet")
        end

        local randomAccessory1 = math.random(1, 4)
        if randomAccessory1 == 1 then self:EquipAccessory("goldfish") end
        if randomAccessory1 == 2 then self:EquipAccessory("fullempty") end 
        if randomAccessory1 == 3 then self:EquipAccessory("empty") end 
        if randomAccessory1 == 4 then self:EquipAccessory("belt_steelplate") end 

        local firstname = table.Random(PLUGIN.firstnamesnormal)

        local lastname = table.Random(PLUGIN.econameslast)

        if string.find(self:GetModel(), "female") then firstname = table.Random(PLUGIN.femalenamesfirst) lastname = table.Random(PLUGIN.femalenameslast) end 

        self:SetDescription("Expert")

       

        self:SetCEntName(firstname .. " " .. lastname)

        self:SetCEntSkin(self.skin)

        if string.find(self:GetModel(), "exo") then self:SetCEntBodyGroups("1") end 

        
        local chosenweapon = table.Random(riflegrip)
        self:SetCEntWeaponModel(chosenweapon)
    end
end



