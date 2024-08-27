local PLUGIN = PLUGIN

ENT.Spawnable = false

function ENT:Name()
    return self:GetNetVar("name", self.name)
end

function ENT:GetName()
    return self:GetNetVar("name", self.name)
end

function ENT:GetDescription()
    return self:GetNetVar("desc", self.description or "")
end

function ENT:IsAdmin()
  	return false
end

function ENT:ID()
    return 0
end


function ENT:Description()
    return self:GetNetVar("desc", self.description or "")
end

function ENT:GetCombatHealth()
    return self:GetNetVar("hp", self.HP or 50)
end

function ENT:GetCombatHealthMax()
    return self:GetNetVar("maxhp", self.maxHP or 50)
end

function ENT:GetHeadBR()
    return self:GetNetVar("headbr", 0 )
end

function ENT:GetHeadBullet()
    return self:GetNetVar("headbullet", 0 )
end

function ENT:GetHeadImpact()
    return self:GetNetVar("headimpact", 0)
end

function ENT:GetHeadRupture()
    return self:GetNetVar("headrupture", 0)
end

function ENT:GetTorsoBR()
    return self:GetNetVar("torsobr", 0)
end

function ENT:GetTorsoBullet()
    return self:GetNetVar("torsobullet", 0)
end

function ENT:GetTorsoImpact()
    return self:GetNetVar("torsoimpact", 0)
end

function ENT:GetTorsoRupture()
    return self:GetNetVar("torsorupture", 0)
end

function ENT:GetWeaponSkill()
    return self:GetNetVar("weaponskill", 0)
end

function ENT:GetDodge()
    return self:GetNetVar("dodge", 0)
end

function ENT:GetWeaponModel()
    return self:GetNetVar("weaponModel", false)
end

function ENT:InCombat()
    return self:GetNetVar("inFNFFCombat", false)
end

function ENT:IsTurn()
    return self:GetNetVar("isTurn", false)
end


function ENT:IsTurn()
    return self:GetNetVar("isTurn", false)
end

function ENT:GetChatter()
    return self:GetNetVar("chatter")
end 

function ENT:PlayChatter()
    return self:EmitSound(table.Random(self.chatter))
end







-- We have to sterilize the table, since functions can't be set through networking.
local function formatAction(tbl)
    local action = {
        name = tbl.name,
        uid = tbl.uid,
        commandUID = tbl.commandUID,
        category = tbl.category,
        useWeapon = tbl.useWeapon,
        useTarget = tbl.useTarget,
        num = tbl.num,   
    }

    return action
end

function ENT:GetActions()
    local actions = {}

    if self.actions then
        for k, v in pairs(self.actions) do
            if istable(v) then
                print(table.ToString(v))
            end

            local action = PLUGIN:FindAction(v)

            if action then
                actions[action.uid] = formatAction(action)
            end
        end
    end

    for k, actionData in pairs(PLUGIN.actions) do
        if actionData.hidden then continue end

        if actionData.category:find("Default") then
            local action = PLUGIN:FindAction(k)

            if action then
                actions[action.uid] = formatAction(action)
            end
        end
    end

    return actions
end

-- Player function overwrites
function ENT:GetCharacter()
    return self
end

function ENT:IsPlayer()
    return true
end

function ENT:GetSP(part)
    return self:GetNetVar("sp", self.SP or {})[part]
end

function ENT:GetSPTable()
    return self:GetNetVar("sp", self.SP or {})
end

function ENT:GetAttributes()
    return self:GetNetVar("attributes", self.attributes or {})
end

function ENT:GetAttribute(key, default)
    local attributes = self:GetAttributes()
    return attributes[key] or default
end

function ENT:GetSkills()
    return self:GetNetVar("skills", self.skills or {})
end

function ENT:GetSkill(key, default)
    local skills = self:GetSkills()
    return skills[key] or default
end

function ENT:GetCalculatedSkill(key)
    local FNFF_S = PLUGIN.skillPlugin
    local skillsTable = FNFF_S:GetSkillsList()[key]

    local attributeBonus = self:GetAttribute(skillsTable.baseAttribute, 0)
    local skill = self:GetSkill(key, 0)
    local sum = skill + attributeBonus

    local numberTbl = {skill, attributeBonus}

    return sum, numberTbl 
end

function ENT:GetActiveWeapon()
    local weapon = {}
    weapon.ixItem = ix.item.list[self:GetNetVar("weapon", self.weapon)]

    return weapon
end

function ENT:GetWeapon()
    local weapon = {}
    weapon.ixItem = ix.item.list[self:GetNetVar("weapon", self.weapon)]

    return weapon
end

function ENT:GetShootPos()
    return self:EyePos()
end

function ENT:Notify(string)
    PrintMessage(HUD_PRINTTALK, string)

    return
end