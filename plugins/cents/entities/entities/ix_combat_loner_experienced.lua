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

        self:SetCombatHealth(120)
        self:SetCombatHealthMax(120)
        self:SetWeaponSkill(10)
        self:SetDodge(5)

        if string.find(self:GetModel(), "sunrise") or string.find(self:GetModel(), "lone_old") then
            -- Sunrise and PBF Mask
            self:EquipSuit("sunrise")
            self:EquipHelmet("pbfgasmask")
        end

        if string.find(self:GetModel(), "hawk") then
            -- SAS-H Hawk and M40
            self:EquipSuit("merc_hawk")
            self:EquipHelmet("m40gasmask")
        end

        if string.find(self:GetModel(), "expedition") then
            -- Berkut and Altyn
            self:EquipSuit("berkut")
            self:EquipHelmet("altyn")
        end

        if string.find(self:GetModel(), "nbc") then
            -- NBC and GP5
            self:EquipSuit("nbc")
            self:EquipHelmet("gp5gasmask")
        end

        local randomAccessory = math.random(1, 4)
        if randomAccessory == 1 then self:EquipAccessory("belt_fleshhide") end
        if randomAccessory == 2 then self:EquipAccessory("belt_pseudodoghide") end
        if randomAccessory == 3 then self:EquipAccessory("gravi") end





    
       
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



