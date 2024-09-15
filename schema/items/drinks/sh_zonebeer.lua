ITEM.name = "Zone Brewed Beer"
ITEM.model = "models/mosi/fnv/props/drink/alcohol/beer.mdl"
ITEM.thirst = 35
ITEM.description = "An unlabeled, glass bottle filled with a fizzy liquid."
ITEM.longdesc = "This beer is Stalker-Certified, made by Stalkers, for Stalkers. Could be radiocative, or contain Swamp Water. Who knows where it came from? But hey, at least it's beer."
ITEM.quantity = 3
ITEM.price = 500
ITEM.width = 1
ITEM.height = 1
ITEM.cookable = false
ITEM.sound = "stalkersound/inv_flask.mp3"
ITEM.flag = "5"
ITEM:Hook("use", function(item)
	item.player:EmitSound(item.sound or "items/battery_pickup.wav")
	ix.chat.Send(item.player, "iteminternal", "takes a swig of their "..item.name..".", false)
	item.player:addRadiation(10)
end)
ITEM.weight = 0.1
ITEM.heal = 2
ITEM.healot = 1
ITEM:DecideFunction()