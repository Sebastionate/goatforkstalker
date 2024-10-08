ITEM.name = "Cossacks Vodka"
ITEM.model = "models/kek1ch/dev_vodka2.mdl"
ITEM.thirst = 25
ITEM.description = "A bottle with a clear substance inside."
ITEM.longdesc = "Made by GSC. Goes down easy and lowers the effects of radiation. Should be enjoyed in moderation."
ITEM.quantity = 3
ITEM.price = 450
ITEM.width = 1
ITEM.height = 2
ITEM.cookable = false
ITEM.sound = "stalkersound/inv_flask.mp3"
ITEM.flag = "5"
ITEM:Hook("use", function(item)
	item.player:EmitSound(item.sound or "items/battery_pickup.wav")
	ix.chat.Send(item.player, "iteminternal", "takes a swig of their "..item.name..".", false)
	item.player:addRadiation(-20)
end)
ITEM.weight = 0.1
ITEM.heal = 2
ITEM.healot = 1
ITEM:DecideFunction()