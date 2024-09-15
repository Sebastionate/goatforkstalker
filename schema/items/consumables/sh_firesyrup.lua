ITEM.name = "Fiery Syrup Sauce"
ITEM.model = "models/mosi/fnv/props/food/bloodpaste.mdl"
ITEM.hunger = 15
ITEM.description = "A container of a darkish red sauce."
ITEM.longdesc = "Sticky to the touch and sweet in scent, this sauce seems to be made up of various seasonsing, hot-sauce, and some sort of sweetener. Similar to a BBQ sauce, but spicier. Rumors say this recipe originally came out of Zaton, others say they don't give a shit."
ITEM.quantity = 1
ITEM.price = 200
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