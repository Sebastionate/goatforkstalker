local PLUGIN = PLUGIN

ENT.Type = "nextbot"
ENT.Base = "ix_combat_base"
ENT.PrintName = "Freedom Experienced"
ENT.Category = "Helix - Combat Entities - Freedom"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Freedom."
ENT.description = "Dude. WEED. LMAO."

ENT.models = {
    "models/nasca/stalker/female_expedition.mdl",
    "models/nasca/stalker/female_wind_free.mdl",
    "models/nasca/stalker/male_expedition.mdl",
    "models/nasca/stalker/male_wind_free.mdl",
    "models/player/stalker_freedom/freedom_guard/freedom_guard.mdl"

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
    "models/tnb/weapons/w_mossberg.mdl",
    "models/tnb/weapons/w_mp5.mdl",
    "models/tnb/weapons/w_ump.mdl"

}

local ranks = {
    "Seedy"
}


if (SERVER) then
    function ENT:CustomInitialize()

        self:SetCombatHealth(100)
        self:SetCombatHealthMax(100)
        self:SetWeaponSkill(5)
        self:SetDodge(11)
    
        if string.find(self:GetModel(), "expedition") then
            -- Berkut and Altyn
            self:SetHeadBR(28)
            self:SetHeadBullet(20)
            self:SetHeadImpact(25)
            self:SetHeadRupture(3)
        
            self:SetTorsoBR(25)
            self:SetTorsoBullet(12)
            self:SetTorsoImpact(20)
            self:SetTorsoRupture(35)
        end

        if string.find(self:GetModel(), "wind") or string.find(self:GetModel(), "guard") then
            -- Wind of Freedom and PBF
            self:SetHeadBR(10)
            self:SetHeadBullet(1)
            self:SetHeadImpact(6)
            self:SetHeadRupture(2)
        
            self:SetTorsoBR(22)
            self:SetTorsoBullet(8)
            self:SetTorsoImpact(10)
            self:SetTorsoRupture(17)
        end

        local firstname = ""

        local lastname = table.Random(PLUGIN.lastnamesnormal)

        if string.find(self:GetModel(), "female") then firstname = table.Random(PLUGIN.femalenamesfirst) lastname = table.Random(PLUGIN.femalenameslast) end 

        self:SetDescription("Experienced")

        local rank = table.Random(ranks)

        self:SetCEntName(rank .. " " .. lastname)

        self:SetCEntSkin(self.skin)

        
        local chosenweapon = table.Random(riflegrip)
        self:SetCEntWeaponModel(chosenweapon)
    end
end



