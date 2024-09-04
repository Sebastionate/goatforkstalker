ITEM.name = "Beef Stew"
ITEM.model = "models/mosi/fnv/props/food/strangemeatpie.mdl"
ITEM.hunger = 45
ITEM.description = "A stew made with various meats and seasoning."
ITEM.longdesc = "An absolutely delicious meal made up of different roasted meats and spices. A rich source of nutrients, protein, and calories."
ITEM.quantity = 3
ITEM.price = 125
ITEM.width = 1
ITEM.height = 1
ITEM.flag = "5"
ITEM.sound = "stalkersound/inv_eat_mutant_food.mp3"
ITEM:Hook("use", function(item)
	item.player:addRadiation(15)
	item.player:EmitSound(item.sound or "items/battery_pickup.wav")
	ix.chat.Send(item.player, "iteminternal", "eats a bit of their "..item.name..".", false)
	item.player:addRadiation(10)
end)
ITEM.weight = 0.1
ITEM.heal = 3
ITEM.healot = 2
ITEM:DecideFunction()