local PLUGIN = PLUGIN

ENT.Type = "nextbot"
ENT.Base = "ix_combat_base"
ENT.PrintName = "Freedom Expert"
ENT.Category = "Helix - Combat Entities - Freedom"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Freedom."
ENT.description = "Dude. WEED. LMAO."

ENT.models = {
    "models/nasca/stalker/male_stingray9_free.mdl",
    "models/nasca/stalker/male_exo_free.mdl",
    "models/player/stalker_freedom/freedom_noexo/freedom_noexo.mdl"
}


ENT.skin = 2

ENT.voicevariant = table.Random({1, 2})

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
    "models/tnb/weapons/w_m249.mdl",
    "models/tnb/weapons/w_g3.mdl",
    "models/tnb/weapons/w_galil.mdl",
    "models/tnb/weapons/w_usas12.mdl"   
}

local ranks = {
    "Ace"
}


if (SERVER) then
    function ENT:CustomInitialize()

        self:SetCombatHealth(150)
        self:SetCombatHealthMax(150)
        self:SetWeaponSkill(25)
        self:SetDodge(20)
    
        if string.find(self:GetModel(), "stingray") then
            -- Stingray-9 and Sphere-12
            self:SetHeadBR(40)
            self:SetHeadBullet(27)
            self:SetHeadImpact(35)
            self:SetHeadRupture(5)
        
            self:SetTorsoBR(40)
            self:SetTorsoBullet(28)
            self:SetTorsoImpact(28)
            self:SetTorsoRupture(23)
        end

        if string.find(self:GetModel(), "exo") then
            -- Champion of Freedom Exosuit and Exohelm
            self:SetHeadBR(50)
            self:SetHeadBullet(31)
            self:SetHeadImpact(40)
            self:SetHeadRupture(4)
        
            self:SetTorsoBR(54)
            self:SetTorsoBullet(34)
            self:SetTorsoImpact(28)
            self:SetTorsoRupture(24)
        end

        local firstname = ""

        local lastname = table.Random(PLUGIN.lastnamesnormal)

        if string.find(self:GetModel(), "female") then firstname = table.Random(PLUGIN.femalenamesfirst) lastname = table.Random(PLUGIN.femalenameslast) end 

        self:SetDescription("Expert")

        local rank = table.Random(ranks)

        self:SetCEntName(rank .. " " .. lastname)

        if string.find(self:GetModel(), "exo") then self:SetCEntBodyGroups("1") end 

        
        local chosenweapon = table.Random(riflegrip)
        self:SetCEntWeaponModel(chosenweapon)
    end
end



