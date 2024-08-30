ITEM.name = "Stalker Stew"
ITEM.model = "models/mosi/fnv/props/food/alienfood.mdl"
ITEM.hunger = 40
ITEM.description = "A stew made with whatever the chef had on hand."
ITEM.longdesc = "A delicious, meat and veggie-packed meal containing a variety of ingredients to make a pot of what seems like delicious slop. Outside of the Zone, it'd be considered lazy cooking, inside of it however, a delicacy to feed multiple Stalkers."
ITEM.quantity = 4
ITEM.price = 80
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