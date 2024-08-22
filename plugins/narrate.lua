PLUGIN.name = "Narrate"
PLUGIN.description = "An IC PM of sorts for telling individual characters things."
PLUGIN.author = "Scrat Knapp"



ix.chat.Register("narrate", {
	format = "%s:",
	color = Color(0, 255, 255, 255),
	deadCanChat = true,

	OnChatAdd = function(self, speaker, text, bAnonymous, data)
		chat.AddText(self.color, data.message)
	end
})


ix.command.Add("Narrate", {
    adminOnly = true,
    description = "Narrate to a player.",
    arguments = {ix.type.player, ix.type.text},
    OnRun = function(self, client, target, message)
        
        ix.chat.Send(client, "narrate", message, true,  {client, target}, {
          target = target,
          message = message
        })

           

      
    end
})

