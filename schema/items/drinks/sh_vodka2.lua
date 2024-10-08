ITEM.name = "Zone-Produced Vodka"
ITEM.model = "models/kek1ch/drink_vodka.mdl"
ITEM.thirst = 35
ITEM.description = "A hip flask with a clear substance inside."
ITEM.longdesc = "This hip flask contains zone-produced vodka produced from relatively good ingredients."
ITEM.quantity = 3
ITEM.price = 900
ITEM.width = 1
ITEM.height = 2
ITEM.cookable = false
ITEM.sound = "stalkersound/inv_flask.mp3"
ITEM.flag = "5"
ITEM:Hook("use", function(item)
	item.player:EmitSound(item.sound or "items/battery_pickup.wav")
	ix.chat.Send(item.player, "iteminternal", "takes a swig of their "..item.name..".", false)
	item.player:addRadiation(-20)
end)
ITEM.weight = 0.1
ITEM.heal = 2
ITEM.healot = 1
ITEM:DecideFunction()