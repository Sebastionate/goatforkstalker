local PLUGIN = PLUGIN

ENT.Type = "nextbot"
ENT.Base = "ix_combat_base"
ENT.PrintName = "Ecologist Veteran"
ENT.Category = "Helix - Combat Entities - Ecologist"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Merc."
ENT.description = "OK, drop that retard!"

ENT.models = {
    "models/nasca/stalker/male_seva_eco.mdl",
    "models/silver/stalker/female_seva_eco.mdl",
    "models/nasca/stalker/male_sunset_eco.mdl",
    "models/silver/stalker/female_sunset_eco.mdl",
    "models/player/stalker_ecologist/ecologist_seva/ecologist_seva.mdl"
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
    "models/tnb/weapons/w_saiga12.mdl",
    "models/tnb/weapons/w_l85.mdl",
    "models/tnb/weapons/w_aek.mdl",
    "models/tnb/weapons/w_fal.mdl",
    "models/tnb/weapons/w_cz.mdl",
}



if (SERVER) then
    function ENT:CustomInitialize()

        self:SetCombatHealth(140)
        self:SetCombatHealthMax(140)
        self:SetWeaponSkill(20)
        self:SetDodge(17)
    
        if string.find(self:GetModel(), "sunset") then
            -- Sunset and Sphere-08
            self:SetHeadBR(31)
            self:SetHeadBullet(24)
            self:SetHeadImpact(30)
            self:SetHeadRupture(3)
        
            self:SetTorsoBR(36)
            self:SetTorsoBullet(21)
            self:SetTorsoImpact(10)
            self:SetTorsoRupture(32)
        end

        if string.find(self:GetModel(), "seva") then
            -- SEVA and Screen helm
            self:SetHeadBR(16)
            self:SetHeadBullet(13)
            self:SetHeadImpact(15)
            self:SetHeadRupture(3)
        
            self:SetTorsoBR(36)
            self:SetTorsoBullet(14)
            self:SetTorsoImpact(11)
            self:SetTorsoRupture(17)
        end

        local firstname = table.Random(PLUGIN.firstnamesnormal)

        local lastname = table.Random(PLUGIN.econameslast)

        if string.find(self:GetModel(), "female") then firstname = table.Random(PLUGIN.femalenamesfirst) lastname = table.Random(PLUGIN.femalenameslast) end 

        self:SetDescription("Veteran")

       

        self:SetCEntName(firstname .. " " .. lastname)

        self:SetCEntSkin(self.skin)

        
        local chosenweapon = table.Random(riflegrip)
        self:SetCEntWeaponModel(chosenweapon)
    end
end



