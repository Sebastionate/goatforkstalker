ITEM.name = "Spicy Boar Ribs"
ITEM.model = "models/mosi/fnv/props/food/fireantbits.mdl"
ITEM.hunger = 75
ITEM.description = "A baggy of greasy pork ribs."
ITEM.longdesc = "A small baggy containing a half-rack of what appears to be large, meat-covered boar ribs. Similar to normal ribs, though these certainly seem to be a bit large in comparison. Slathered and marinated in a spicy, sweet sauce of some sort."
ITEM.quantity = 4
ITEM.price = 800
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