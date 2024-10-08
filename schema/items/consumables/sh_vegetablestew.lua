ITEM.name = "Vegetable Stew"
ITEM.model = "models/arskvshborsch/borsch.mdl"
ITEM.hunger = 35
ITEM.description = "A stew made with various canned vegetables."
ITEM.longdesc = "An absolutely delicious meal made up of different roasted vegetables and flavorings. A rich source of nutrients, vitamins, and calories."
ITEM.quantity = 3
ITEM.price = 450
ITEM.width = 1
ITEM.height = 1
ITEM.flag = "5"
ITEM.sound = "stalkersound/inv_eat_mutant_food.mp3"
ITEM:Hook("use", function(item)
	item.player:addRadiation(0)
	item.player:EmitSound(item.sound or "items/battery_pickup.wav")
	ix.chat.Send(item.player, "iteminternal", "eats a bit of their "..item.name..".", false)
	item.player:addRadiation(0)
end)
ITEM.weight = 0.1
ITEM.heal = 3
ITEM.healot = 2
ITEM:DecideFunction()