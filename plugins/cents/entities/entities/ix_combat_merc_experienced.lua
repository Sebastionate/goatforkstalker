local PLUGIN = PLUGIN

ENT.Type = "nextbot"
ENT.Base = "ix_combat_base"
ENT.PrintName = "Mercenary Experienced"
ENT.Category = "Helix - Combat Entities - Mercenary"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Merc."
ENT.description = "OK, drop that retard!"

ENT.models = {
    "models/nasca/stalker/male_hawk_merc.mdl",
    "models/player/stalker_merc/merc_gear/merc_gear.mdl",
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
    "models/tnb/weapons/w_mp5.mdl",
    "models/tnb/weapons/w_ump.mdl"
}



if (SERVER) then
    function ENT:CustomInitialize()

        self:SetCombatHealth(105)
        self:SetCombatHealthMax(105)
        self:SetWeaponSkill(15)
        self:SetDodge(8)

        -- Hawk and M40 Mask
    
        self:SetHeadBR(10)
        self:SetHeadBullet(3)
        self:SetHeadImpact(8)
        self:SetHeadRupture(4)
    
        self:SetTorsoBR(23)
        self:SetTorsoBullet(9)
        self:SetTorsoImpact(8)
        self:SetTorsoRupture(11)

        local firstname = table.Random(PLUGIN.mercnamesfirst)

        local lastname = table.Random(PLUGIN.mercnameslast)

        if string.find(self:GetModel(), "female") then firstname = table.Random(PLUGIN.femalenamesfirst) lastname = table.Random(PLUGIN.femalenameslast) end 

        self:SetDescription("Experienced")

       

        self:SetCEntName(firstname .. " " .. lastname)

        self:SetCEntSkin(self.skin)

        
        local chosenweapon = table.Random(riflegrip)
        self:SetCEntWeaponModel(chosenweapon)
    end
end



