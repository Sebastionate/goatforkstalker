local PLUGIN = PLUGIN

ENT.Type = "nextbot"
ENT.Base = "ix_combat_base"
ENT.PrintName = "Freedom Master"
ENT.Category = "Helix - Combat Entities - Freedom"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Freedom."
ENT.description = "Dude. WEED. LMAO."

ENT.models = {
    "models/nasca/stalker/male_exo_free.mdl",
    "models/player/stalker_freedom/freedom_exo/freedom_exo.mdl"
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
    "models/tnb/weapons/w_scar.mdl",
    "models/tnb/weapons/w_m240.mdl",
    "models/tnb/weapons/w_usas12.mdl"   
}

local ranks = {
    "Kahuna"
}


if (SERVER) then
    function ENT:CustomInitialize()

        self:SetCombatHealth(170)
        self:SetCombatHealthMax(170)
        self:SetWeaponSkill(25)
        self:SetDodge(23)
    
        if string.find(self:GetModel(), "exo") then
            -- Champion of Freedom Exoskeleton and Exohelm
            self:SetHeadBR(50)
            self:SetHeadBullet(31)
            self:SetHeadImpact(40)
            self:SetHeadRupture(4)
        
            self:SetTorsoBR(59)
            self:SetTorsoBullet(34)
            self:SetTorsoImpact(28)
            self:SetTorsoRupture(35)
        end

        local firstname = ""

        local lastname = table.Random(PLUGIN.lastnamesnormal)

        if string.find(self:GetModel(), "female") then firstname = table.Random(PLUGIN.femalenamesfirst) lastname = table.Random(PLUGIN.femalenameslast) end 

        self:SetDescription("Master")

        local rank = table.Random(ranks)

        self:SetCEntName(rank .. " " .. lastname)


        
        local chosenweapon = table.Random(riflegrip)
        self:SetCEntWeaponModel(chosenweapon)
    end
end



