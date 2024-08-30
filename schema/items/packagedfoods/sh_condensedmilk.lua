ITEM.name = "Dehydrated Milk"
ITEM.model = "models/illusion/eftcontainers/condensedmilk.mdl"
ITEM.hunger = 15
ITEM.description = "A small can of fluffy white powder."
ITEM.longdesc = "A tin can of powdered milk. Preserves extremely well, and replicates the dairy product very well when mixed with water. Utilized in various recipes across the Zone, replacing the general need for actual milk. Consuming the powder alone is not very pleasant."
ITEM.quantity = 1
ITEM.price = 300
ITEM.width = 1
ITEM.height = 1
ITEM.cookable = false
ITEM.flag = "5"
ITEM.sound = "stalkersound/inv_eat_can_open.mp3"
ITEM:Hook("use", function(item)
	item.player:EmitSound(item.sound or "items/battery_pickup.wav")
	ix.chat.Send(item.player, "iteminternal", "eats a bit of their "..item.name..".", false)
end)
ITEM.weight = 0.1
ITEM.heal = 3
ITEM.healot = 2
ITEM:DecideFunction()