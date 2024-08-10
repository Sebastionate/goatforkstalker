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

        self:SetCombatHealth(165)
        self:SetCombatHealthMax(165)
        self:SetWeaponSkill(25)
        self:SetDodge(20)
    
        
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
            -- TB-3 Exoskeleton and Exohelm
            self:SetHeadBR(50)
            self:SetHeadBullet(31)
            self:SetHeadImpact(40)
            self:SetHeadRupture(4)
        
            self:SetTorsoBR(59)
            self:SetTorsoBullet(33)
            self:SetTorsoImpact(28)
            self:SetTorsoRupture(34)
        end

        if string.find(self:GetModel(), "jupiter") then
            -- Jupiter and Screen Helm
            self:SetHeadBR(16)
            self:SetHeadBullet(13)
            self:SetHeadImpact(15)
            self:SetHeadRupture(3)
        
            self:SetTorsoBR(40)
            self:SetTorsoBullet(25)
            self:SetTorsoImpact(25)
            self:SetTorsoRupture(33)
        end

        if string.find(self:GetModel(), "cs3b") then
            -- CS-3B and Sphere-12
            self:SetHeadBR(40)
            self:SetHeadBullet(27)
            self:SetHeadImpact(35)
            self:SetHeadRupture(5)
        
            self:SetTorsoBR(45)
            self:SetTorsoBullet(24)
            self:SetTorsoImpact(24)
            self:SetTorsoRupture(23)
        end

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



