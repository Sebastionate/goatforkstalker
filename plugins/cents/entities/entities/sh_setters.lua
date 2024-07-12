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

