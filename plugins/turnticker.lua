PLUGIN.name = "Turn Ticker"
PLUGIN.description = "A very haphazard turn system for counting down drug effects."
PLUGIN.author = "Scrat Knapp"






ix.command.Add("Turn", {
  description = "Finish your turn, reducing any timers or turn-based effects.",
  OnRun = function(self, client)
      
    if not client:GetData("inCombat", false) then return "You need to be In Combat to use turns." end

    client:SetData("shotsfired", 0)

    client:Notify("You end your turn.")
    ix.log.Add(client, "turnTick") 
   

  end
})


if (SERVER) then
  ix.log.AddType("turnTick", function(client)
      return string.format("%s ends their turn.", client:GetCharacter():GetName())
  end)

end




