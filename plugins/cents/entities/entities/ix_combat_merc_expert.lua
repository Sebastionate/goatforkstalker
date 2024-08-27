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

        self:SetCombatHealth(155)
        self:SetCombatHealthMax(155)
        self:SetWeaponSkill(30)
        self:SetDodge(17)
    
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

        if string.find(self:GetModel(), "metro") then
            -- Paladin and Assault Helmet
            self:SetHeadBR(35)
            self:SetHeadBullet(25)
            self:SetHeadImpact(30)
            self:SetHeadRupture(4)
        
            self:SetTorsoBR(42)
            self:SetTorsoBullet(25)
            self:SetTorsoImpact(15)
            self:SetTorsoRupture(23)
        end

        if string.find(self:GetModel(), "exo") then
            -- Terminator Exosuit and Exohelm
            self:SetHeadBR(50)
            self:SetHeadBullet(31)
            self:SetHeadImpact(40)
            self:SetHeadRupture(4)
        
            self:SetTorsoBR(54)
            self:SetTorsoBullet(35)
            self:SetTorsoImpact(35)
            self:SetTorsoRupture(34)
        end

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



