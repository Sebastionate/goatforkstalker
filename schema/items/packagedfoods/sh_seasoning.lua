ITEM.name = "Bottled Seasoning"
ITEM.model = "models/mosi/fnv/props/health/radx.mdl"
ITEM.hunger = 5
ITEM.description = "A small bottle of various blended spices."
ITEM.longdesc = "A smuggled-in bottle of various blended spices, typically used for making recipes taste so much better. Consuming this by itself would not only be extremely dry and displeasing, it also won't satiate your hunger in the slightest."
ITEM.quantity = 1
ITEM.price = 750
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