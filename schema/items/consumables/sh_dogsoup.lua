ITEM.name = "Dog Soup"
ITEM.model = "models/mosi/fnv/props/food/ratstew.mdl"
ITEM.hunger = 45
ITEM.description = "A soup made with stewed dog meat."
ITEM.longdesc = "Just as appetizing as it sounds. Still, it's food! "
ITEM.quantity = 3
ITEM.price = 400
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