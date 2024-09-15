ITEM.name = "Cooked Carp Fillet"
ITEM.model = "models/mosi/fnv/props/food/geckosteak.mdl"
ITEM.hunger = 25
ITEM.description = "A slab of oily scales and cooked fish."
ITEM.longdesc = "A filleted and cooked Carp. Not the best as it's probably been baking in radiation for a while, but still filled with protein. Yummy."
ITEM.quantity = 2
ITEM.price = 125
ITEM.width = 1
ITEM.height = 1
ITEM.flag = "5"
ITEM.sound = "stalkersound/inv_eat_mutant_food.mp3"
ITEM:Hook("use", function(item)
	item.player:addRadiation(25)
	item.player:EmitSound(item.sound or "items/battery_pickup.wav")
	ix.chat.Send(item.player, "iteminternal", "eats a bit of their "..item.name..".", false)
	item.player:addRadiation(25)
end)
ITEM.weight = 0.1
ITEM.heal = 3
ITEM.healot = 2
ITEM:DecideFunction()