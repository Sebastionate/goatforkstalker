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

        self:SetCombatHealth(145)
        self:SetCombatHealthMax(145)
        self:SetWeaponSkill(20)
        self:SetDodge(14)
    
        if string.find(self:GetModel(), "eagle") then
            -- Nighthunter and Sphere-08
            self:SetHeadBR(31)
            self:SetHeadBullet(24)
            self:SetHeadImpact(30)
            self:SetHeadRupture(3)
        
            self:SetTorsoBR(38)
            self:SetTorsoBullet(24)
            self:SetTorsoImpact(18)
            self:SetTorsoRupture(18)
        end

        if string.find(self:GetModel(), "seva") then
            -- STS-Seva and Screen Helm
            self:SetHeadBR(16)
            self:SetHeadBullet(13)
            self:SetHeadImpact(15)
            self:SetHeadRupture(3)
        
            self:SetTorsoBR(38)
            self:SetTorsoBullet(15)
            self:SetTorsoImpact(16)
            self:SetTorsoRupture(16)
        end

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



