ITEM.name = "Pack of Croutons"
ITEM.model = "models/kiriki.mdl"
ITEM.hunger = 35
ITEM.description = "A packet with something crunchy inside."
ITEM.longdesc = "A foil baggy with seasoned, high-carb croutons inside of it. Definite better as an ingredient of a salad, however in trying times many Stalkers prefer this packet as a flavorful snack."
ITEM.quantity = 1
ITEM.price = 35
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