local PLUGIN = PLUGIN

ENT.Type = "nextbot"
ENT.Base = "ix_combat_base"
ENT.PrintName = "Loner Expert"
ENT.Category = "Helix - Combat Entities - Loner"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "A Loner."
ENT.description = "Lonely Lonely!"



ENT.models = {
    "models/nasca/stalker/male_seva_lone.mdl",
    "models/nasca/stalker/male_psz12d_lone.mdl",
    "models/nasca/stalker/male_exo_lone.mdl",
    "models/nasca/stalker/male_berill5m_lone.mdl",
    "models/silver/stalker/female_seva_lone.mdl",
    "models/nasca/stalker/male_cs3a.mdl",
    "models/silver/stalker/female_cs3a_lone.mdl",
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
    "models/tnb/weapons/w_hk416.mdl",
    "models/tnb/weapons/w_m249.mdl",
    "models/tnb/weapons/w_fal.mdl",
    "models/tnb/weapons/w_svd.mdl",
    "models/tnb/weapons/w_vss.mdl",
    "models/tnb/weapons/w_spas12.mdl",
    "models/tnb/weapons/w_aek.mdl",
    "models/tnb/weapons/w_groza.mdl",
    "models/tnb/weapons/w_saiga12.mdl",
    "models/tnb/weapons/w_p90.mdl",
    "models/tnb/weapons/w_dp27.mdl",
}


if (SERVER) then
    function ENT:CustomInitialize()

        self:SetCombatHealth(145)
        self:SetCombatHealthMax(145)
        self:SetWeaponSkill(20)
        self:SetDodge(17)

        if string.find(self:GetModel(), "berill") then
            -- Beril-5m and Sphere-08
            self:SetHeadBR(31)
            self:SetHeadBullet(24)
            self:SetHeadImpact(30)
            self:SetHeadRupture(3)
        
            self:SetTorsoBR(39)
            self:SetTorsoBullet(21)
            self:SetTorsoImpact(15)
            self:SetTorsoRupture(40)
        end

        if string.find(self:GetModel(), "seva") then
            -- SEVA and Screen Helm
            self:SetHeadBR(16)
            self:SetHeadBullet(13)
            self:SetHeadImpact(15)
            self:SetHeadRupture(3)
        
            self:SetTorsoBR(36)
            self:SetTorsoBullet(14)
            self:SetTorsoImpact(11)
            self:SetTorsoRupture(17)
        end

        if string.find(self:GetModel(), "cs3a") then
            -- CS-3A and Sphere-08
            self:SetHeadBR(31)
            self:SetHeadBullet(24)
            self:SetHeadImpact(30)
            self:SetHeadRupture(3)
        
            self:SetTorsoBR(39)
            self:SetTorsoBullet(17)
            self:SetTorsoImpact(16)
            self:SetTorsoRupture(16)
        end

        if string.find(self:GetModel(), "psz12") then
            -- PSZ-12d and Sphere-12
            self:SetHeadBR(40)
            self:SetHeadBullet(27)
            self:SetHeadImpact(35)
            self:SetHeadRupture(5)
        
            self:SetTorsoBR(45)
            self:SetTorsoBullet(30)
            self:SetTorsoImpact(28)
            self:SetTorsoRupture(26)
        end

        if string.find(self:GetModel(), "exo") then
            -- TB-3 Exosuit and Exohelm
            self:SetHeadBR(50)
            self:SetHeadBullet(31)
            self:SetHeadImpact(40)
            self:SetHeadRupture(4)
        
            self:SetTorsoBR(50)
            self:SetTorsoBullet(31)
            self:SetTorsoImpact(28)
            self:SetTorsoRupture(30)
        end



        local firstname = table.Random(PLUGIN.firstnamesnormal)
        local lastname = table.Random(PLUGIN.lastnamesnormal)

        if string.find(self:GetModel(), "female") then firstname = table.Random(PLUGIN.femalenamesfirst) lastname = table.Random(PLUGIN.femalenameslast) end 

        self:SetDescription("Expert")

        self:SetCEntName(firstname .. " " .. lastname)

        
        local chosenweapon = table.Random(riflegrip)
        self:SetCEntWeaponModel(chosenweapon)

        if string.find(self:GetModel(), "exo") then self:SetCEntBodyGroups("1") end 
    

        self:SetCEntSkin(self.skin)
    end
end



