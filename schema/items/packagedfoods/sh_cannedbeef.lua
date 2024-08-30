ITEM.name = "Canned Beef"
ITEM.model = "models/banka.mdl"
ITEM.hunger = 15
ITEM.description = "A can with something edible inside."
ITEM.longdesc = "A tin can full of preserved beef-chunks stored in a watery, brown gravy. Not the most appetizing meal on its own, but certainly not one any Stalker would turn down."
ITEM.quantity = 3
ITEM.price = 325
ITEM.width = 1
ITEM.height = 1
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