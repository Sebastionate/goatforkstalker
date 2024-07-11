
util.AddNetworkString("CEnt_ChangeStats")

net.Receive("CEnt_ChangeStats", function(len, client)
    local entity = net.ReadEntity()
    local attributes = net.ReadTable()
    local skills = net.ReadTable()

    if IsValid(entity) then
        entity:SetAttributes(attributes)
        entity:SetSkills(skills)

        ix.log.AddRaw(Format("%s changed the stats of (CEnt) %s.", client:Name(), entity:Name()))
    end
end)