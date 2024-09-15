ITEM.name = "Pack Of Sugar"
ITEM.model = "models/illusion/eftcontainers/sugar.mdl"
ITEM.hunger = 15
ITEM.description = "A bulky pack of granular sugar."
ITEM.longdesc = "A thick-papered pack of granular sugar, a delicacy of man. Fit for baking, cooking, sweetening your tea and coffee, and even making explosives if you're savvy enough. Its most prominent use in the Zone is seen in Moonshining and other Bootlegging Operations."
ITEM.quantity = 1
ITEM.price = 850
ITEM.width = 1
ITEM.height = 1
ITEM.cookable = false
ITEM.flag = "5"
ITEM.sound = "stalkersound/inv_eat_paperwrap.mp3"
ITEM:Hook("use", function(item)
	item.player:EmitSound(item.sound or "items/battery_pickup.wav")
	ix.chat.Send(item.player, "iteminternal", "eats a bit of their "..item.name..".", false)
end)
ITEM.weight = 0.1
ITEM.heal = 3
ITEM.healot = 2
ITEM:DecideFunction()