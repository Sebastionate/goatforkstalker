ITEM.name = "Banka Beer"
ITEM.model = "models/banka2.mdl"
ITEM.thirst = 15
ITEM.description = "A can of beer"
ITEM.longdesc = "A piss-cheap beer fermented and packaged in various facilities across Western Russia. Not the mos quality of taste, but it certainly serves the roll of beer."
ITEM.quantity = 3
ITEM.price = 175
ITEM.width = 1
ITEM.height = 1
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