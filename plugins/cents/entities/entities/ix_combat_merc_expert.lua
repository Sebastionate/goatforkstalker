local PLUGIN = PLUGIN

ENT.Type = "nextbot"
ENT.Base = "ix_combat_base"
ENT.PrintName = "Mercenary Expert"
ENT.Category = "Helix - Combat Entities - Mercenary"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Merc."
ENT.description = "OK, drop that retard!"

ENT.models = {
    "models/nasca/stalker/male_seva_merc.mdl",
    "models/nasca/stalker/male_exo_merc.mdl",
    "models/player/stalker_merc/merc_noexo/merc_noexo.mdl",
    "models/player/stalker_merc/merc_seva/merc_seva.mdl",
    "models/player/stalker_merc/merc_metro/merc_metro.mdl",
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
    "models/tnb/weapons/w_hk416.mdl",
    "models/tnb/weapons/w_g3.mdl",
    "models/tnb/weapons/w_f2000.mdl",
    "models/tnb/weapons/w_spas12.mdl",
    "models/tnb/weapons/w_m24.mdl",
    "models/tnb/weapons/w_m249.mdl"
}



if (SERVER) then
    function ENT:CustomInitialize()

        self:SetCombatHealth(50)
        self:SetCombatHealthMax(50)
        self:SetWeaponSkill(0)
        self:SetDodge(0)
    
        self:SetHeadBR(0)
        self:SetHeadBullet(0)
        self:SetHeadImpact(0)
        self:SetHeadRupture(0)
    
        self:SetTorsoBR(0)
        self:SetTorsoBullet(0)
        self:SetTorsoImpact(0)
        self:SetTorsoRupture(0)

        local firstname = table.Random(PLUGIN.mercnamesfirst)

        local lastname = table.Random(PLUGIN.mercnameslast)

        if string.find(self:GetModel(), "female") then firstname = table.Random(PLUGIN.femalenamesfirst) lastname = table.Random(PLUGIN.femalenameslast) end 

        self:SetDescription("Expert")

        if string.find(self:GetModel(), "exo") then self:SetCEntBodyGroups("1") end 

        self:SetCEntName(firstname .. " " .. lastname)

        self:SetCEntSkin(self.skin)

        
        local chosenweapon = table.Random(riflegrip)
        self:SetCEntWeaponModel(chosenweapon)
    end
end



