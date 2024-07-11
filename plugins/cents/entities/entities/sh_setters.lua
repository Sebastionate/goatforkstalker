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

function ENT:SetAP(value)
    return self:SetNetVar("ap", value)
end

function ENT:SetAttackBoost(value)
    return self:SetNetVar("attack", value)
end

function ENT:SetDodgeBoost(value)
    return self:SetNetVar("dodge", value)
end

function ENT:SetDT(value)
    return self:SetNetVar("dt", value)
end

function ENT:SetET(value)
    return self:SetNetVar("et", value)
end

function ENT:SetDR(value)
    return self:SetNetVar("dr", value)
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

