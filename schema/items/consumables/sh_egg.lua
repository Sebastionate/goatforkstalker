ITEM.name = "Egg"
ITEM.model = "models/props_phx/misc/egg.mdl"
ITEM.hunger = 10
ITEM.description = "A very fragile oval."
ITEM.longdesc = "Not much to tell, this is quite the egg. Presumably from a chicken. Its white shell leads you to believe this was not laid in the Zone most likely, but brought in by others. A strange snack to carry, to be sure, but definitely a snack. Goes well with every breakfast."
ITEM.quantity = 1
ITEM.price = 50
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