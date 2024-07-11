-- "gamemodes\\halorp\\plugins\\combat\\libs\\sh_centsave.lua"

-- Retrieved by https://github.com/c4fe/glua-steal

local PLUGIN = PLUGIN



if SERVER then

    function PLUGIN:saveCents()

        PLUGIN.savedEnts = {}

        for k, v in pairs(ents.GetAll()) do
            if !IsValid(v) then continue end
            if !v.combatEntity or !(v.save or v.saveKey) then continue end
            if v.noSave then continue end

            local saved = {
                pos = v:GetPos(),
                ang = v:GetAngles(),
                class = v:GetClass(),
                saveData = v.getSaveData and v:getSaveData()

            }

            local key = v.saveKey or (#PLUGIN.savedEnts + 1)
            v.saveKey = key
            PLUGIN.savedEnts[key] = saved
        end

        timer.Simple(1, function()
            self:SetData(PLUGIN.savedEnts)
        end)

    end



    function PLUGIN:loadCents()

        PLUGIN.savedEnts = self:GetData() or {}

        for saveKey, info in pairs(PLUGIN.savedEnts) do
            local entity = ents.Create(info.class)

            if IsValid(entity) then

                entity:SetPos(info.pos)
                entity:SetAngles(info.ang)
                entity.saveKey = saveKey --or (#PLUGIN.savedEnts + 1)

                for k, v in pairs(info.saveData) do

                    if k == "model" then
                        entity.savedModel = v

                        continue
                    end

                    if k == "gunmodel" then
                        entity.curbonegun = v

                        continue
                    end

                    --[[if k == "attribs" then

                        entity.attribs = v

                        continue

                    end]]

                    --[[if k == "res" then

                        entity.res = v

                        continue

                    end]]

                    if k == "amp" then
                        entity.amp = v

                        continue
                    end

                    --[[if k == "dmg" then

                        entity.dmg = v

                        continue

                    end]]

                    if k == "actions" then
                        entity.actions = v

                        continue
                    end

                    if k == "mat" then
                        entity.savedMat = v

                        continue
                    end

                    if k == "anim" then
                        entity.savedAnim = v

                        continue
                    end

                    if k == "color" then
                        entity.savedColor = v

                        continue
                    end

                    if k == "skin" then
                        entity.savedskin = v

                        continue
                    end

                    if k == "bodygroups" then
                        entity.savedbodygroups = v

                        continue
                    end

                    entity:SetNetVar(k, v)
                end

                entity:Spawn()

                timer.Simple(0.01, function()
                    if entity.curbonegun then
                        local ent = ents.Create("prop_physics")
                        ent:SetPos(entity:GetPos() + Vector(0,0,60))
                        ent:SetModel(entity.curbonegun)
                        ent:Spawn()
                        ent:Activate()

                        --local ent = self:GetSelectedEntity()
                        timer.Simple(0.01, function()
                            local newEntity = rb655_ApplyBonemerge( ent, entity )

                            undo.Create( "bonemerge" )
                                undo.AddEntity( newEntity )
                                undo.SetPlayer( client )
                            undo.Finish()
                        end)
                    end
                end)

            else

                if saveKey then
                    PLUGIN.savedEnts[saveKey] = nil
                end

            end

        end

    end

    --hacky solution to errors yeeting all data, just put it in a timer and it'll only screw itself over
    function PLUGIN:InitPostEntity()
        timer.Simple(30, function()
            PLUGIN:loadCents()
        end)
    end

end



ix.command.Add("centsave", {
    adminOnly = true,
    OnRun = function(self, client, arguments)
        local entity = client:GetEyeTrace().Entity --entity that we're looking at

        --makes sure it's a CEnt (Combat Entity)
        if IsValid(entity) and entity.combatEntity then
            entity.save = true
            client:Notify(entity:Name() .. " successfully saved.")
        end

        client:Notify("Cent save data updated.")
        PLUGIN:saveCents()
    end

})



ix.command.Add("centsaveall", {
    adminOnly = true,
    OnRun = function(self, client, arguments)
        --local entity = client:GetEyeTrace().Entity --entity that we're looking at
        local count = 0
        for k, v in pairs(ents.GetAll()) do
            if IsValid(v) and v.combatEntity then
                v.save = true
                count = count + 1
            end
        end
        
        client:Notify(count .. " cents successfully saved.")
        PLUGIN:saveCents()
    end

})