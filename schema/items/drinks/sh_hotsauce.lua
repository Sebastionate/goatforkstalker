ITEM.name = "Hot Sauce"
ITEM.model = "models/hlvr/props/bottles/garbage_glassbottle001a.mdl"
ITEM.thirst = 15
ITEM.description = "A bottle of Reznov's Hot Sauce."
ITEM.longdesc = "A glass bottle with some black and red labeling that describes the bottles as a tasteful bottle of spicy sauce. Paired best with roasted meat and the like, or added to sauce recipe. Served worst, alone."
ITEM.quantity = 1
ITEM.price = 200
ITEM.width = 1
ITEM.height = 2
ITEM.cookable = false
ITEM.sound = "stalkersound/inv_drink_flask_2.mp3"
ITEM.flag = "5"
ITEM:Hook("use", function(item)
	item.player:EmitSound(item.sound or "items/battery_pickup.wav")
	item.player:AddBuff("buff_staminarestore", 20, { amount = 0.5 })
	ix.chat.Send(item.player, "iteminternal", "takes a swig of their "..item.name..".", false)
end)
ITEM.weight = 0.1
ITEM.heal = 3
ITEM.healot = 2
ITEM:DecideFunction()