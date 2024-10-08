ITEM.name = "Ochakovo Beer, 2l"
ITEM.model = "models/kek1ch/dev_beer.mdl"
ITEM.thirst = 20
ITEM.description = "A bottle of beer"
ITEM.longdesc = "Ochakovo Beer is not subject to pasteurization. \nLong-term storage is based on cold filtering technology with the use of fine-meshed polymeric membranes which filter out even the smallest yeast."
ITEM.quantity = 3
ITEM.price = 400
ITEM.width = 1
ITEM.height = 2
ITEM.cookable = false
ITEM.sound = "stalkersound/inv_flask.mp3"
ITEM.flag = "5"
ITEM:Hook("use", function(item)
	item.player:EmitSound(item.sound or "items/battery_pickup.wav")
	ix.chat.Send(item.player, "iteminternal", "takes a swig of their "..item.name..".", false)
	item.player:addRadiation(-5)
end)
ITEM.weight = 0.1
ITEM.heal = 2
ITEM.healot = 1
ITEM:DecideFunction()