ITEM.name = "Fried Tushkano Bits"
ITEM.model = "models/mosi/fnv/props/food/antbits.mdl"
ITEM.hunger = 75
ITEM.description = "A baggy of rat nuggets."
ITEM.longdesc = "A small baggy of breaded, sauced, and fried meat. A bit chewy, but a wonderful, though fatty, meal for any Stalker. The taste is similar to Buffalo Chicken Nuggets."
ITEM.quantity = 3
ITEM.price = 400
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