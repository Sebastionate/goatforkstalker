local PLUGIN = PLUGIN

ENT.Type = "nextbot"
ENT.Base = "ix_combat_base"
ENT.PrintName = "Ecologist Expert"
ENT.Category = "Helix - Combat Entities - Ecologist"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Merc."
ENT.description = "OK, drop that retard!"

ENT.models = {
    "models/nasca/stalker/male_exo_eco.mdl",
    "models/nasca/stalker/male_jupiter_eco.mdl",
    "models/player/stalker_ecologist/ecologist_noexo/ecologist_noexo.mdl"
}


ENT.skin = 1

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
    "models/tnb/weapons/w_aa12.mdl",
    "models/tnb/weapons/w_l85.mdl",
    "models/tnb/weapons/w_aek.mdl",
    "models/tnb/weapons/w_fal.mdl",
    "models/tnb/weapons/w_cz.mdl",
    "models/tnb/weapons/w_aa12.mdl",
    "models/tnb/weapons/w_m249.mdl",
    "models/tnb/weapons/w_f2000.mdl"
}



if (SERVER) then
    function ENT:CustomInitialize()

        self:SetCombatHealth(150)
        self:SetCombatHealthMax(150)
        self:SetWeaponSkill(20)
        self:SetDodge(17)
    
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

        local firstname = table.Random(PLUGIN.firstnamesnormal)

        local lastname = table.Random(PLUGIN.econameslast)

        if string.find(self:GetModel(), "female") then firstname = table.Random(PLUGIN.femalenamesfirst) lastname = table.Random(PLUGIN.femalenameslast) end 

        self:SetDescription("Expert")

       

        self:SetCEntName(firstname .. " " .. lastname)

        self:SetCEntSkin(self.skin)

        if string.find(self:GetModel(), "exo") then self:SetCEntBodyGroups("1") end 

        
        local chosenweapon = table.Random(riflegrip)
        self:SetCEntWeaponModel(chosenweapon)
    end
end



