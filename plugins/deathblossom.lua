PLUGIN.name = "Death Blossom"
PLUGIN.description = "Extra scripts for the Death Blossom."
PLUGIN.author = "Scrat Knapp"

function PLUGIN:CanPlayerDropItem(client, item)
  local item = ix.item.instances[item]

	if item.name == "Death Blossom" and client:GetCharacter():HasTrait("cursed") then
      client:Notify("You find yourself mentally unable to part with the Death Blossom.")
    return false 
  end 
end

function PLUGIN:CanTransferItem(item, currentInv, oldInv)
  local client = item:GetOwner()

	if item:GetName()  == "Death Blossom" and SERVER then

    if not client then return true end

    if client:GetCharacter():HasTrait("cursed") then
        client:Notify("You find yourself mentally unable to part with the Death Blossom.")
          return false 
    end 
  end 

end 

ix.chat.Register("narrateevil", {
	format = "%s:",
	color = Color(139, 0, 0, 255),
	deadCanChat = true,
  font = "stalkermainmenufont",

	OnChatAdd = function(self, speaker, text, bAnonymous, data)
		chat.AddText(self.color, data.message)

    local sounds = {
			"npc/corpus/org_moan_1.ogg",
			"npc/corpus/org_moan_2.ogg",
			"npc/corpus/org_moan_3.ogg",
			"npc/corpus/org_moan_4.ogg",
			"npc/corpus/org_moan_5.ogg",
			"npc/corpus/org_moan_6.ogg",
      "black/death_3.ogg",
      "black2/death2.ogg",
      "black2/idle1.ogg",
      "black2/idle3.ogg"
		}

    surface.PlaySound(table.Random(sounds))
	end
})

ix.command.Add("blossom", {
  adminOnly = true,
  description = "Narrate to a cursed player...",
  arguments = {ix.type.player, ix.type.text},
  OnRun = function(self, client, target, message)
      ix.chat.Send(client, "narrateevil", message, true,  {client, target}, {
        target = target,
        message = message
      })
  end
})

