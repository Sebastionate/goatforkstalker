ITEM.name = "Instant Noodle Cup"
ITEM.model = "models/doshirak_pure.mdl"
ITEM.hunger = 40
ITEM.description = "A styrofoam cup with something edible inside."
ITEM.longdesc = "A cup of dry noodles, vegetables, and chicken seasonsing. Served best with heated water with its ingredients stirred in, though, some Stalkers just prefer to crunch the block of noodles dry. Others, do not have a choice."
ITEM.quantity = 1
ITEM.price = 175
ITEM.width = 1
ITEM.height = 1
ITEM.flag = "5"
ITEM.sound = "stalkersound/inv_eat_ration2.mp3"
ITEM:Hook("use", function(item)
	item.player:EmitSound(item.sound or "items/battery_pickup.wav")
	ix.chat.Send(item.player, "iteminternal", "eats a bit of their "..item.name..".", false)
end)
ITEM.weight = 0.1
ITEM.heal = 3
ITEM.healot = 2
ITEM:DecideFunction()