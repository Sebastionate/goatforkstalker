local PLUGIN = PLUGIN

ENT.Type = "nextbot"
ENT.Base = "ix_combat_base"
ENT.PrintName = "Mercenary Veteran"
ENT.Category = "Helix - Combat Entities - Mercenary"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Merc."
ENT.description = "OK, drop that retard!"

ENT.models = {
    "models/nasca/stalker/male_seva_merc.mdl",
    "models/nasca/stalker/male_eagle_merc.mdl",
    "models/player/stalker_merc/merc_seva/merc_seva.mdl",
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
    "models/tnb/weapons/w_mossberg.mdl",
    "models/tnb/weapons/w_hk416.mdl",
    "models/tnb/weapons/w_fal.mdl",
    "models/tnb/weapons/w_famas.mdl",
    "models/tnb/weapons/w_spas12.mdl",
    "models/tnb/weapons/w_m24.mdl"
}



if (SERVER) then
    function ENT:CustomInitialize()

        self:SetCombatHealth(150)
        self:SetCombatHealthMax(150)
        self:SetWeaponSkill(25)
        self:SetDodge(14)
    
        if string.find(self:GetModel(), "eagle") then
            -- Nighthunter and Sphere-08
            self:EquipSuit("merc_nighthunter")
            self:EquipHelmet("sphere08")
        end

        if string.find(self:GetModel(), "seva") then
            -- STS-Seva and Screen Helm
            self:EquipSuit("merc_seva")
            self:EquipHelmet("screenhelm")
        end

        local randomAccessory1 = math.random(1, 4)
        if randomAccessory1 == 1 then self:EquipAccessory("belt_kevlarimproved") end

        local randomAccessory2 = math.random(1, 4)
        if randomAccessory2 == 1 then self:EquipAccessory("gravi") end

        local randomAccessory3 = math.random(1, 4)
        if randomAccessory3 == 1 then self:EquipAccessory("belt_controllerhide") end

        local firstname = table.Random(PLUGIN.mercnamesfirst)

        local lastname = table.Random(PLUGIN.mercnameslast)

        if string.find(self:GetModel(), "female") then firstname = table.Random(PLUGIN.femalenamesfirst) lastname = table.Random(PLUGIN.femalenameslast) end 

        self:SetDescription("Veteran")

       

        self:SetCEntName(firstname .. " " .. lastname)

        self:SetCEntSkin(self.skin)

        
        local chosenweapon = table.Random(riflegrip)
        self:SetCEntWeaponModel(chosenweapon)
    end
end



