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



