ITEM.name = "MRE (Civilian)"
ITEM.model = "models/irp.mdl"
ITEM.hunger = 20
ITEM.description = "A relief pack of rations."
ITEM.longdesc = "This Meal-Ready-to-Eat was designed in various Urban centers across Ukraine, designated solely for distribution among civilian populaces in times of Crisis. However, as many of these packs often collect dust on the shelves of Reserve Warehouses, some tend to find their way into places they most likely shouldn't be."
ITEM.quantity = 4
ITEM.price = 500
ITEM.width = 1
ITEM.height = 1
ITEM.flag = "5"
ITEM.sound = "stalkersound/inv_eat_ration1.mp3"
ITEM:Hook("use", function(item)
	item.player:EmitSound(item.sound or "items/battery_pickup.wav")
	ix.chat.Send(item.player, "iteminternal", "eats a bit of their "..item.name..".", false)
end)
ITEM.weight = 0.1
ITEM.heal = 5
ITEM.healot = 3
ITEM:DecideFunction()