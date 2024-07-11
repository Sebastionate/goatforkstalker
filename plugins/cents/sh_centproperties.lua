local props = props or {}

props["Set Name"] = {
    index = 1,

    OnRunClient = function(self, property, ent)
        Derma_StringRequest("Set Name", "", ent:Name(), function(text)
            net.WriteEntity(ent)
            net.WriteString(text)
            property:MsgEnd()
        end, function() property:MsgEnd() end)
    end,

    OnRun = function(self, property, client)
        local entity = net.ReadEntity()
        local name = net.ReadString()

        if IsValid(entity) then
            entity:SetCEntName(name)
        end
    end
}

props["Set Description"] = {
    index = 2,

    OnRunClient = function(self, property, ent)
        Derma_StringRequest("Set Description", "", ent:GetDescription(), function(text)
            net.WriteEntity(ent)
            net.WriteString(text)
            property:MsgEnd()
        end, function() property:MsgEnd() end)
    end,

    OnRun = function(self, property, client)
        local entity = net.ReadEntity()
        local desc = net.ReadString()

        if IsValid(entity) then
            entity:SetDescription(desc)
        end
    end
}

props["Set Model"] = {
    index = 3,

    OnRunClient = function(self, property, ent)
        Derma_StringRequest("Set Model", "", ent:GetModel(), function(text)
            net.WriteEntity(ent)
            net.WriteString(text)
            property:MsgEnd()
        end, function() property:MsgEnd() end)
    end,

    OnRun = function(self, property, client)
        local entity = net.ReadEntity()
        local model = net.ReadString()

        if IsValid(entity) then
            entity:SetModel(model)
            timer.Simple(0.25, function()
                entity:SetAnim()
            end)
        end
    end,

    addSpacer = true
}

props["Set Weapon Model"] = {
    index = 6,

    OnRunClient = function(self, property, ent)
        Derma_StringRequest("Set Weapon", "Weapon Modelpath", ent:GetWeaponModel(), function(text)
            net.WriteEntity(ent)
            net.WriteString(text)
            property:MsgEnd()
        end, function() property:MsgEnd() end)
    end,

    OnRun = function(self, property, client)
        local entity = net.ReadEntity()
        local wepModel = net.ReadString()

        if IsValid(entity) then
            entity:SetCEntWeaponModel(wepModel)
        end
    end
}

properties.Add("edit_cent", {
    MenuLabel = "Edit Combat Entity",
    MenuIcon = "icon16/wrench.png",
    Order = 5,

    Filter = function(self, ent, ply)
        if not ( IsValid(ent) and ent.combatEntity) then return false end

        return CAMI.PlayerHasAccess(ply, "Helix - Manage CEnts", nil)
    end,

    Action = function(self, ent)
    end,

    DoShit = function(self, ent, propertyName)
        local property = props[propertyName]
        if property.OnRunClient then
            self:MsgStart()
                net.WriteString(propertyName)
                property:OnRunClient(self, ent)
        end
    end,

    MenuOpen = function(self, option, ent, trace)
        local subMenu = option:AddSubMenu()

        for k, v in SortedPairsByMemberValue(props, "index") do
            subMenu:AddOption(k, function()
                self:DoShit(ent, k)
            end)

            if v.addSpacer then
                subMenu:AddSpacer()
            end
        end
    end,

    Receive = function(self, len, ply)
        local propertyName = net.ReadString()
        local property = props[propertyName]

        property:OnRun(self, ply)
    end
})