ITEM.name = "Alenka Chocolate"
ITEM.model = "models/alenka.mdl"
ITEM.hunger = 10
ITEM.description = "A small packet of Milk-Chocolate."
ITEM.longdesc = "An alluminium-wrapped bar of Russian-imported chocolate. Not quite as common as other Chocolate bars around the Zone, but certainly higher in quality. Popular among most Stalkers, especially those with a sweet-tooth."
ITEM.quantity = 3
ITEM.price = 300
ITEM.width = 1
ITEM.height = 1
ITEM.cookable = false
ITEM.flag = "5"
ITEM.sound = "stalkersound/inv_eat_paperwrap.mp3"
ITEM:Hook("use", function(item)
	item.player:EmitSound(item.sound or "items/battery_pickup.wav")
	ix.chat.Send(item.player, "iteminternal", "eats a bit of their "..item.name..".", false)
end)
ITEM.weight = 0.1
ITEM.heal = 3
ITEM.healot = 2
ITEM:DecideFunction()