local PLUGIN = PLUGIN

ENT.Type = "nextbot"
ENT.Base = "ix_combat_base"
ENT.PrintName = "Monolith Veteran"
ENT.Category = "Helix - Combat Entities - Monolith"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Monolith"
ENT.description = "Vraks!"

ENT.models = {
    "models/nasca/stalker/male_seva_mono.mdl",
    "models/silver/stalker/female_seva_mono.mdl",
    "models/player/stalker_monolith/monolith_seva/monolith_seva.mdl",
    "models/player/stalker_monolith/monolith_metro/monolith_metro.mdl"
}


ENT.WalkAnim = "walk_passive"
ENT.RunAnim = "run_passive"
ENT.IdleAnim = "idle_passive"
ENT.AttackAnim = "idle_ar2"
ENT.CrouchAnim = "cidle_all"
ENT.StandAnim = "crouchtostand"

function ENT:OnTakeDamage(dmgInfo)
    return 0
end

local ranks = {
    "Senior Operative",
    "Disciple",
    "Preacher",
}


local riflegrip = {
    "models/tnb/weapons/w_fal.mdl",
    "models/tnb/weapons/w_aek.mdl",
    "models/tnb/weapons/w_spas12.mdl",
    "models/tnb/weapons/w_f2000.mdl",
    "models/tnb/weapons/w_svd.mdl",
    "models/tnb/weapons/w_m24.mdl",
    "models/tnb/weapons/w_m249.mdl",
    "models/tnb/weapons/w_groza.mdl",
    "models/tnb/weapons/w_vss.mdl"
}


if (SERVER) then
    function ENT:CustomInitialize()

        self:SetCombatHealth(145)
        self:SetCombatHealthMax(145)
        self:SetWeaponSkill(25)
        self:SetDodge(14)
    
        if string.find(self:GetModel(), "seva") then
            -- Monolith Scientific and Screen Helm
            self:SetHeadBR(16)
            self:SetHeadBullet(13)
            self:SetHeadImpact(15)
            self:SetHeadRupture(3)
        
            self:SetTorsoBR(36)
            self:SetTorsoBullet(11)
            self:SetTorsoImpact(10)
            self:SetTorsoRupture(17)
        end

        if string.find(self:GetModel(), "metro") then
            -- Reinforced Monolith Suit and Assault Helmet
            self:SetHeadBR(35)
            self:SetHeadBullet(25)
            self:SetHeadImpact(30)
            self:SetHeadRupture(4)
        
            self:SetTorsoBR(40)
            self:SetTorsoBullet(28)
            self:SetTorsoImpact(18)
            self:SetTorsoRupture(23)
        end

        local lastname = table.Random(PLUGIN.realnameslast)

        self:SetDescription("Veteran")

        local rank = table.Random(ranks)
        self:SetCEntName(rank .. " " .. lastname)

        
        local chosenweapon = table.Random(riflegrip)
        self:SetCEntWeaponModel(chosenweapon)
    
    end
end



