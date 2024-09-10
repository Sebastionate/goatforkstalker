ITEM.name = "Carrot"
ITEM.model = "models/mosi/fnv/props/food/crops/carrot.mdl"
ITEM.hunger = 15
ITEM.description = "Rabbit's favorite vegetable."
ITEM.longdesc = "A lengthy, ridged carrot. Could've been grown in the Zone, but also could've been smuggled in. Either or, can be used in a variety of nutrient-rich meals, making it an excellent source of calories and energy."
ITEM.quantity = 1
ITEM.price = 50
ITEM.width = 1
ITEM.height = 1
ITEM.cookable = false
ITEM.flag = "5"
ITEM.sound = "anomalyrp/backpack/inv_food.wav"
ITEM:Hook("use", function(item)
	item.player:EmitSound(item.sound or "items/battery_pickup.wav")
	ix.chat.Send(item.player, "iteminternal", "eats a bit of their "..item.name..".", false)
end)
ITEM.weight = 0.1
ITEM.heal = 3
ITEM.healot = 2
ITEM:DecideFunction()