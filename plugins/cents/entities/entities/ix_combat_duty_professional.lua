local PLUGIN = PLUGIN

ENT.Type = "nextbot"
ENT.Base = "ix_combat_base"
ENT.PrintName = "Duty Professional"
ENT.Category = "Helix - Combat Entities - Duty"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Duty Soldier"
ENT.description = "YA SOLDAT"

ENT.models = {
    "models/nasca/stalker/female_psz9d_duty.mdl",
    "models/silver/stalker/female_dusk_duty.mdl",
    "models/nasca/stalker/male_psz9d_duty.mdl",
    "models/nasca/stalker/male_dusk_duty.mdl",
    "models/player/stalker_dolg/dolg_old/dolg_old.mdl",
    "models/player/stalker_dolg/dolg_gp5/dolg_gp5.mdl",
    "models/player/stalker_dolg/dolg_cloak/dolg_cloak.mdl"
}


ENT.skin = table.Random({1, 2, 3})

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
    "Junior Sergeant",
    "Sergeant",
}


local riflegrip = {
    "models/tnb/weapons/w_ak74.mdl",
    "models/tnb/weapons/w_ithaca.mdl",
    "models/tnb/weapons/w_ak107.mdl",
    "models/tnb/weapons/w_akm.mdl"
}


if (SERVER) then
    function ENT:CustomInitialize()



        self:SetCombatHealth(135)
        self:SetCombatHealthMax(135)
        self:SetWeaponSkill(15)
        self:SetDodge(8)
    


        -- PSZ-9d and PBF Mask
        self:EquipSuit("psz9_duty")
        self:EquipHelmet("pbfgasmask")

        local randomAccessory1 = math.random(1, 4)
        if randomAccessory1 == 1 then self:EquipAccessory("belt_kevlar") end
        if randomAccessory1 == 2 then self:EquipAccessory("belt_fleshhide") end 
        if randomAccessory1 == 3 then self:EquipAccessory("belt_pseudodoghide") end 
        if randomAccessory1 == 4 then self:EquipAccessory("belt_psydoghide") end 
        
        
        local firstname = ""

        local lastname = table.Random(PLUGIN.realnameslast)

        if string.find(self:GetModel(), "female") then firstname = table.Random(PLUGIN.femalenamesfirst) lastname = table.Random(PLUGIN.femalenameslast) end 

        self:SetDescription("Professional")

        local rank = table.Random(ranks)

        self:SetCEntName(rank .. " " .. lastname)

        
        local chosenweapon = table.Random(riflegrip)
        self:SetCEntWeaponModel(chosenweapon)
    

        self:SetCEntSkin(self.skin)
    end
end



