ITEM.name = "Russian Red's Vodka"
ITEM.model = "models/vodka.mdl"
ITEM.thirst = 50
ITEM.description = "A decorated bottle of liquor."
ITEM.longdesc = "An extravagantly designed liquor bottle with a label depicting an overly-stereotypical Russian brand. Claims to be extremely smooth, yet high in ABV. Drink responsible."
ITEM.quantity = 6
ITEM.price = 2500
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