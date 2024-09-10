ITEM.name = "Tushkebab"
ITEM.model = "models/shampur.mdl"
ITEM.hunger = 45
ITEM.description = "A skewer lined with roasted meat chunks."
ITEM.longdesc = "Chunks of Tushkano seasoned and roasted alongside various ingredients, making for a delightfully tasting meal."
ITEM.quantity = 3
ITEM.price = 250
ITEM.width = 1
ITEM.height = 2
ITEM.flag = "5"
ITEM.sound = "stalkersound/inv_eat_mutant_food.mp3"
ITEM:Hook("use", function(item)
	item.player:addRadiation(10)
	item.player:EmitSound(item.sound or "items/battery_pickup.wav")
	ix.chat.Send(item.player, "iteminternal", "eats a bit of their "..item.name..".", false)
	item.player:addRadiation(5)
end)
ITEM.weight = 0.1
ITEM.heal = 3
ITEM.healot = 2
ITEM:DecideFunction()