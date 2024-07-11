local PLUGIN = PLUGIN

ENT.Type = "nextbot"
ENT.Base = "ix_combat_base"
ENT.PrintName = "Loner Professional"
ENT.Category = "Helix - Combat Entities - Loner"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "A Loner."
ENT.description = "Lonely Lonely!"

ENT.models = {
    "models/nasca/stalker/male_seva_lone.mdl",
    "models/nasca/stalker/male_sunset_lone.mdl",
    "models/nasca/stalker/male_dusk_lone.mdl",
    "models/nasca/stalker/male_dusk_lone2.mdl",
    "models/nasca/stalker/male_berill5m_lone.mdl",
    "models/silver/stalker/female_seva_lone.mdl",
    "models/nasca/stalker/male_sunset_lone.mdl",
    "models/silver/stalker/female_sunset_lone.mdl",
    "models/silver/stalker/female_dusk_lone.mdl",
    "models/silver/stalker/female_dusk_lone2.mdl"

}


ENT.skin = table.Random({0, 1, 2, 3, 4}) 

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
    "models/tnb/weapons/w_sig.mdl",
    "models/tnb/weapons/w_xm.mdl",
    "models/tnb/weapons/w_m24.mdl",
    "models/tnb/weapons/w_m4.mdl",
    "models/tnb/weapons/w_akm.mdl",
    "models/tnb/weapons/w_sig.mdl",
    "models/tnb/weapons/w_ak107.mdl",
    "models/tnb/weapons/w_cz.mdl",
    "models/tnb/weapons/w_mp7.mdl",
    "models/tnb/weapons/w_m14.mdl"
}


if (SERVER) then
    function ENT:CustomInitialize()

        local firstname = table.Random(PLUGIN.firstnamesnormal)
        local lastname = table.Random(PLUGIN.lastnamesnormal)

        if string.find(self:GetModel(), "female") then firstname = table.Random(PLUGIN.femalenamesfirst) lastname = table.Random(PLUGIN.femalenameslast) end 

        self:SetDescription("Professional")

        self:SetCEntName(firstname .. " " .. lastname)

        
        local chosenweapon = table.Random(riflegrip)
        self:SetCEntWeaponModel(chosenweapon)
    

        self:SetCEntSkin(self.skin)
    end
end



