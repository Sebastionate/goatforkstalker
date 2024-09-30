local PLUGIN = PLUGIN

ENT.Spawnable = false

function ENT:SetCEntName(value)
    return self:SetNetVar("name", value)
end

function ENT:SetDescription(value)
    return self:SetNetVar("desc", value)
end

function ENT:SetCombatHealth(value)
    return self:SetNetVar("hp", value)
end

function ENT:SetCombatHealthMax(value)
    return self:SetNetVar("maxhp", value)
end

function ENT:SetHeadBR(value)
    return self:SetNetVar("headbr", value)
end

function ENT:SetHeadBullet(value)
    return self:SetNetVar("headbullet", value)
end

function ENT:SetHeadImpact(value)
    return self:SetNetVar("headimpact", value)
end

function ENT:SetHeadRupture(value)
    return self:SetNetVar("headrupture", value)
end

function ENT:SetTorsoBR(value)
    return self:SetNetVar("torsobr", value)
end

function ENT:SetTorsoBullet(value)
    return self:SetNetVar("torsobullet", value)
end

function ENT:SetTorsoImpact(value)
    return self:SetNetVar("torsoimpact", value)
end

function ENT:SetTorsoRupture(value)
    return self:SetNetVar("torsorupture", value)
end

function ENT:SetWeaponSkill(value)
    return self:SetNetVar("weaponskill", value)
end

function ENT:SetDodge(value)
    return self:SetNetVar("dodge", value)
end

function ENT:SetWeapon(value)
    return self:EquipWeapon(value, self:GetNetVar("weaponModel", "models/Items/AR2_Grenade.mdl"))
end

function ENT:SetCEntWeaponModel(value)
    return self:EquipWeapon(self:GetNetVar("weapon", false), value)
end

function ENT:SetCEntSkin(value)
    return self:SetSkin(value)
end

function ENT:SetCEntBodyGroups(bodygroups)
    return self:SetBodyGroups(bodygroups)
end

function ENT:SetChatter(chatter)
    return self:SetNetVar("chatter", chatter)
end 

function ENT:EquipSuit(suit, changemodel)
    
    local suitData = ix.item.Get(suit)
	if not suitData or not suitData.isBodyArmor then return nil end 

    self:SetTorsoBR(suitData.ballisticRating)
    self:SetTorsoBullet(suitData.res["Bullet"] * 100)
    self:SetTorsoImpact(suitData.res["Impact"] * 100)
    self:SetTorsoRupture(suitData.res["Rupture"] * 100)


    if changemodel then self:SetModel(suitData.replacements) end 

    self:SetAnim()
end

function ENT:EquipHelmet(helmet)
    local helmetData = ix.item.Get(helmet)
	if not helmetData or not helmetData.isHelmet then return nil end 
    self:SetHeadBR(helmetData.ballisticRating)
    self:SetHeadBullet(helmetData.res["Bullet"] * 100)
    self:SetHeadImpact(helmetData.res["Impact"] * 100)
    self:SetHeadRupture(helmetData.res["Rupture"] * 100)
end

function ENT:EquipAccessory(accessory)
    local accessoryData = ix.item.Get(accessory)
	if not accessoryData or not accessoryData.isArtefact then return nil end 
  
    if accessoryData.ballisticRating then
        if not accessoryData.notAnomalous then self:SetHeadBR(self:GetHeadBR() + accessoryData.ballisticRating) end 
        self:SetTorsoBR(self:GetTorsoBR() + accessoryData.ballisticRating)
    end

    if accessoryData.res["Bullet"] then
        if not accessoryData.notAnomalous then self:SetHeadBullet(self:GetHeadBullet() + (accessoryData.res["Bullet"] * 100)) end 
        self:SetTorsoBullet(self:GetTorsoBullet() + (accessoryData.res["Bullet"] * 100))
    end

    if accessoryData.res["Impact"] then
        if not accessoryData.notAnomalous then self:SetHeadImpact(self:GetHeadImpact() + (accessoryData.res["Impact"] * 100)) end 
        self:SetTorsoImpact(self:GetTorsoImpact() + (accessoryData.res["Impact"] * 100))
    end

    if accessoryData.res["Rupture"] then
        if not accessoryData.notAnomalous then self:SetHeadRupture(self:GetHeadRupture() + (accessoryData.res["Rupture"] * 100)) end 
        self:SetTorsoRupture(self:GetTorsoRupture() + (accessoryData.res["Rupture"] * 100))
    end




end

