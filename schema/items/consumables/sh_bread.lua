ITEM.name = "Bread"
ITEM.model = "models/kek1ch/dev_bred.mdl"
ITEM.hunger = 20
ITEM.description = "A loaf of bread"
ITEM.longdesc = "No bakers have ever been identified in the Zone, but this bread is neither contaminated nor radioactive, being fresh and quite edible. \nAt least no complaints have been reported thus far."
ITEM.price = 40
ITEM.quantity = 1
ITEM.width = 1
ITEM.height = 1
ITEM.flag = "5"
ITEM.heal = 5
ITEM.sound = "stalkersound/inv_bread1.mp3"
ITEM.weight = 0.1
ITEM:Hook("use", function(item)
	item.player:EmitSound(item.sound or "items/battery_pickup.wav")
	ix.chat.Send(item.player, "iteminternal", "eats their "..item.name..".", false)
end)
ITEM:DecideFunction()
