PLUGIN.name = "Turn Ticker"
PLUGIN.description = "A very haphazard turn system for counting down drug effects."
PLUGIN.author = "Scrat Knapp"






ix.command.Add("Turn", {
  description = "Finish your turn, reducing any timers or turn-based effects.",
  OnRun = function(self, client)

    local char = client:GetCharacter()
    local inventory = char:GetInventory()
      
    if not client:GetData("inCombat", false) then return "You need to be In Combat to use turns." end

    
    client:Notify("You end your turn.")
    ix.log.Add(client, "turnTick") 

    client:SetData("shotsfired", 0)


    -- Heal Handling ---

    local passiveheal = 0

    for k, v in pairs (inventory:GetItems()) do
      if(!v:GetData("equip", false)) then continue end --ignores unequipped items
      if v.passiveHeal then passiveheal = passiveheal + v.passiveHeal end
    end

    if passiveheal > 0 and char:GetCurrenthp() < client:GetTotalHp() then client:Notify("Your passive healing equipment heals you for " .. passiveheal .. " health!") end 

    char:AdjustHealth("heal", passiveheal)


    -- Bleed Handling --
    char:Bleed()
    local bleedreduce = 0

    -- Reduce bleed from equipped items, usually artifacts
    for k, v in pairs (inventory:GetItems()) do
      if(!v:GetData("equip", false)) then continue end --ignores unequipped items
      if v.bleedReduce then bleedreduce = bleedreduce + v.bleedReduce end
    end


    -- Reduce bleed if you're using a Vinca
    if char:GetData("usingVinca", false) then bleedreduce = bleedreduce + 1 end 


    char:RemoveBleedStacks(bleedreduce)


    -- Rad Handling --

    local rads = 0
    local hasGeiger = inventory:HasItem("geigercounter")

    for k, v in pairs (inventory:GetItems()) do
      if(!v:GetData("equip", false)) then continue end --ignores unequipped items
      if v.rads then rads = rads + v.rads end
    end

    local radstogive = rads * 10
   
    client:addRadiation(radstogive)

    if radstogive < 0 and hasGeiger and client:GetRads() > 0 then client:Notify("Your Geiger Counter ticks gradually softer, indicating your equipment is eating up excess radiation.") end  
    if radstogive > 0 and hasGeiger then client:Notify("Your Geiger Counter ticks loudly, indicating your equipment is giving off excess radiation.") end 




    --- Drug Handling ---

    local turntable = client:GetCharacter():GetData("timertable", {})
    
    for i, v in pairs(turntable) do
        timer.Toggle(v)
        local currenttime = timer.TimeLeft(v)
        timer.Adjust(v, currenttime - 1 )
        local newtime = timer.TimeLeft(v)

        if newtime >= 1 then
          timer.Toggle(v)
          client:Notify(v..  " now has " ..math.floor(newtime) .. " turns of effect left.")
          ix.log.Add(client, "drugTick", v, client:GetCharacter(), math.floor(newtime))

        else
          client:Notify(v .. " has expired.")
          turntable[i] = nil
          client:GetCharacter():SetData("timertable", turntable)
          ix.log.Add(client, "drugExpire", v, client)
        end 
    end

    





 



   

  end
})


if (SERVER) then
  ix.log.AddType("turnTick", function(client)
      return string.format("%s ends their turn.", client:GetCharacter():GetName())
  end)

  ix.log.AddType("drugExpire", function(client, drug)
    return string.format("The %s of %s has expired.", drug, client:Name())
  end)

  ix.log.AddType("drugTick", function(client, drug, target, turns)
    return string.format("The %s of %s has %s turns of effect left.", drug, target:GetName(), turns)
  end)

end




