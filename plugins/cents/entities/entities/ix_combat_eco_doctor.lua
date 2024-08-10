local PLUGIN = PLUGIN

ENT.Type = "nextbot"
ENT.Base = "ix_combat_base"
ENT.PrintName = "Ecologist Doctor"
ENT.Category = "Helix - Combat Entities - Ecologist"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Merc."
ENT.description = "OK, drop that retard!"

ENT.models = {
    "models/nasca/stalker/male_ssp_eco.mdl",
    "models/silver/stalker/female_ssp_eco.mdl",
    "models/player/stalker_ecologist/ecologist_suit/ecologist_suit.mdl"
}



ENT.voicevariant = table.Random({1, 2, 3})


ENT.IdleAnim = "idle_all_0" .. math.random(1,2)
ENT.AttackAnim = "idle_revolver"
ENT.RunAnim = "run_all_0" .. math.random(1, 2)
ENT.WalkAnim = "walk_all"
ENT.CrouchAnim = "cidle_all"
ENT.StandAnim = "crouchtostand"

function ENT:OnTakeDamage(dmgInfo)
    return 0
end





if (SERVER) then
    function ENT:CustomInitialize()

        self:SetCombatHealth(100)
        self:SetCombatHealthMax(100)
        self:SetWeaponSkill(5)
        self:SetDodge(8)


        -- SSP-99, Screen helmet
        self:SetHeadBR(16)
        self:SetHeadBullet(13)
        self:SetHeadImpact(15)
        self:SetHeadRupture(3)
    
        self:SetTorsoBR(8)
        self:SetTorsoBullet(1)
        self:SetTorsoImpact(6)
        self:SetTorsoRupture(7)

        local firstname = "Professor"

        local lastname = table.Random(PLUGIN.realnameslast)


        self:SetDescription("Expert")

       

        self:SetCEntName(firstname .. " " .. lastname)

        self:SetCEntSkin(self.skin)

        
        self:SetCEntWeaponModel(chosenweapon)
    end
end



