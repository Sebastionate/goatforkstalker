local PLUGIN = PLUGIN

ENT.Type = "nextbot"
ENT.Base = "ix_combat_base"
ENT.PrintName = "Mercenary Master"
ENT.Category = "Helix - Combat Entities - Mercenary"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Merc."
ENT.description = "OK, drop that retard!"

ENT.models = {
    "models/nasca/stalker/male_exo_merc.mdl",
    "models/player/stalker_merc/merc_exo/merc_exo.mdl"
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
    "models/tnb/weapons/w_scar.mdl",
    "models/tnb/weapons/w_f2000.mdl",
    "models/tnb/weapons/w_m24.mdl",
    "models/tnb/weapons/w_m240.mdl",
    "models/tnb/weapons/w_aa12.mdl"
}



if (SERVER) then
    function ENT:CustomInitialize()

        self:SetCombatHealth(175)
        self:SetCombatHealthMax(175)
        self:SetWeaponSkill(30)
        self:SetDodge(20)
    
       -- Terminator Exosuit and Exohelm
       self:SetHeadBR(50)
       self:SetHeadBullet(31)
       self:SetHeadImpact(40)
       self:SetHeadRupture(4)
   
       self:SetTorsoBR(59)
       self:SetTorsoBullet(36)
       self:SetTorsoImpact(35)
       self:SetTorsoRupture(35)

        local firstname = table.Random(PLUGIN.mercnamesfirst)

        local lastname = table.Random(PLUGIN.mercnameslast)

        if string.find(self:GetModel(), "female") then firstname = table.Random(PLUGIN.femalenamesfirst) lastname = table.Random(PLUGIN.femalenameslast) end 

        self:SetDescription("Master")


        self:SetCEntName(firstname .. " " .. lastname)

        self:SetCEntSkin(self.skin)

        
        local chosenweapon = table.Random(riflegrip)
        self:SetCEntWeaponModel(chosenweapon)
    end
end



