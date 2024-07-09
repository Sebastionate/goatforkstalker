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


    -- Bleed Handling --
    char:Bleed()
    local bleedreduce = 0
    for k, v in pairs (inventory:GetItems()) do
      if(!v:GetData("equip", false)) then continue end --ignores unequipped items
      if v.bleedReduce then bleedreduce = bleedreduce + v.bleedReduce end
    end
    char:RemoveBleedStacks(bleedreduce)


    -- Rad Handling --

    local rads = 0
    local hasGeiger = inventory:HasItem("geigercounter")

    for k, v in pairs (inventory:GetItems()) do
      if(!v:GetData("equip", false)) then continue end --ignores unequipped items
      if v.rads then rads = rads + v.rads end
    end

    local radstogive = rads * 10
    client:Notify(radstogive)

    client:addRadiation(radstogive)

    if radstogive < 0 and hasGeiger and client:GetRads() > 0 then client:Notify("Your Geiger Counter ticks gradually softer, indicating your equipment is eating up excess radiation.") end  
    if radstogive > 0 and hasGeiger then client:Notify("Your Geiger Counter ticks loudly, indicating your equipment is giving off excess radiation.") end 


    





 



   

  end
})


if (SERVER) then
  ix.log.AddType("turnTick", function(client)
      return string.format("%s ends their turn.", client:GetCharacter():GetName())
  end)

end




