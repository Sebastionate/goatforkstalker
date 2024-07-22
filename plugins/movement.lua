PLUGIN.name = 'Movement'
PLUGIN.author = 'Scrat Knapp'
PLUGIN.description = 'Adds a command to help players tell how much theyve moved for their turn.'


ix.command.Add( "Movement", {
    description = "Begin or Finish counting movement.",
    OnRun = function( self, client )
        char = client:GetCharacter()
        if char:GetVar("isMoving") then
            local startPos = char:GetVar("isMoving")
            local endPos = client:GetPos()
            local distance = endPos:Distance(startPos)

            distance =  distance - (distance % 1)
            distance = (distance / 39.3701) 
            distance =  distance - (distance % 1)

       
            client:Notify("You've moved " .. distance .. " Meters.")
            char:SetVar("isMoving", nil)
            ix.log.Add(client, "moveEnd", distance)


        else 
            client:Notify("You're moving. Use again to calculate distance travelled.")

            local distance = char:GetMoveDistance()

            client:Notify("Max Move Distance: " .. distance .. "m Sprint Distance: " .. distance*2 .. "m")
            local startPos = client:GetPos()
            char:SetVar("isMoving", startPos)
            ix.log.Add(client, "moveStart", distance, distance*2)
        end 
    end
} )

ix.command.Add( "rangefinder", {
    description = "Get range of the place you're looking. ",
    OnRun = function( self, client )
        local char = client:GetCharacter()
    
        local startPos = client:GetPos()
        local endPos = client:GetEyeTrace().HitPos
        local target = client:GetEyeTrace().Entity
        local distance = endPos:Distance(startPos)

        distance =  distance - (distance % 1)
        distance = (distance / 39.3701) 
        distance =  distance - (distance % 1)

        local str = ""

        if IsValid(target) and target.combatEntity then 
            str = "Target: " .. target:Name() .. "\n"
        end 

        str = str .. "Distance to point: " .. distance .. "m"
        local range
        
        if distance < 15 then range = "Short"
        elseif distance > 15 and distance < 44 then range = "Medium"
        elseif distance > 44 and distance < 74 then range = "Long"
        elseif distance > 74 and distance < 125 then range = "Very Long"
        elseif distance > 125 then range = "Extreme"
        end 

        str = str .. "\nRange: " .. range

        
        return str
          

    end
} )



if (SERVER) then
    ix.log.AddType("moveStart", function(client, walk, sprint)
        return string.format("%s has begun moving. Max Walk: %s, Max Sprint: %s", client:Name(), walk, sprint)
    end)

    ix.log.AddType("moveEnd", function(client, distance)
        return string.format("%s has finished moving. Distance: %sm.", client:Name(), distance)
    end)
end




local charMeta = ix.meta.character

function charMeta:GetMoveDistance()
    local movedistance = 20 + self:GetAttribute("reflex", 0) * 2

    local inventory = self:GetInventory()

    for k, v in pairs (inventory:GetItems()) do
        if(!v:GetData("equip", false)) then continue end --ignores unequipped items
        local bonusMove = v.bonusMove
        if bonusMove then
          movedistance = movedistance + bonusMove
        end
    end 


    if self:HasTrait("injury_leg1") then movedistance = movedistance - 5 end
    if self:HasTrait("injury_leg2") then movedistance = movedistance - 5 end 
    if self:HasTrait("injury_leg3") and movedistance > 10 then movedistance = 10 end 


    return movedistance
end 

if SERVER then

   --[[  function PLUGIN:PlayerTick(ply)

        local char = ply:GetCharacter()
        if char:GetVar("isMoving") == nil then return end

        if char:GetData("movementTick", 0) >= CurTime() then return end 


        local startpos = char:GetVar("isMoving")
        local currentpos = ply:GetPos()
        local distance = currentpos:Distance(startpos)
        local movedistance = 15
        local sprintdistance = movedistance * 2

        distance =  distance - (distance % 1)
        distance = (distance / 39.3701) 
        distance =  distance - (distance % 1)

        --char:SetData("movementTick", CurTime() + 1)

        if distance >= movedistance and char:GetData("movementWarning") == false then 
            ply:Notify("Distance Moved: " .. distance .. "m")
            ply:Notify("You've moved your max amount of movement for ordinary walking.")
            char:SetData("movementWarning", true )
        end 


    end ]]

end 