ITEM.name = "Fried Potatoes"
ITEM.model = "models/mosi/fnv/props/food/alienfood03.mdl"
ITEM.hunger = 60
ITEM.description = "A small containers of sliced and cooked potatoes."
ITEM.longdesc = "Sliced, seasoned, and fried potatoes. A great side to any meal really, though most importantly a great source of calories."
ITEM.quantity = 1
ITEM.price = 250
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