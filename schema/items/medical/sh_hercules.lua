ITEM.name = "Hercules"
ITEM.description = "A bottle of liquid steroids."
ITEM.longdesc = "Fast-acting anabolic steroids, rushes the user with a feeling of Strength and Energy.\n+6 Strength for 5 turns. Beware the consequences of long term abuse.."
ITEM.model = "models/ethprops/medical/booster.mdl"
ITEM.width = 1
ITEM.height = 2
ITEM.category = "Medical"
ITEM.price = "2500"
ITEM.flag = "1"
ITEM.duration = 5
ITEM.sound = "stalkersound/inv_drink_flask.mp3"
ITEM.weight = 0.25


ITEM.functions.use = {
	name = "Drink",
	icon = "icon16/stalker/heal.png",
	OnRun = function(item)
		local quantity = item:GetData("quantity", item.quantity)
		ix.chat.Send(item.player, "iteminternal", "drinks some "..item.name..".", false)

		curplayer = item.player:GetCharacter()
		item.name = item.name
		duration = item.duration

		curplayer:AddBoost("hercules", "strength", 6)

		local steroiduses = curplayer:GetData("steroidUse", 0)
		local overdosechance = math.random(1, 100)

		if steroiduses >= overdosechance then 
			item.player:Notify("As you down the bottle of Hercules, your heart begins to beat rapidly, loud enough that you hear it in your ears, before seizing up...")
			curplayer:AdjustHealth("hurt", 150)
		end 

		curplayer:SetData("steroidUse", steroiduses + 1)

		curplayer:SetData("usingHercules", true)
		timer.Create(item.name, item.duration, 1, function() 
			curplayer:GetPlayer():Notify(item.name .. " has worn off.")
			curplayer:SetData("usingHercules", false)
			curplayer:RemoveBoost("hercules", "strength")

		end)

		timer.Pause(item.name)
		local drugtable = curplayer:GetData("timertable") or {}
		table.insert(drugtable, item.name)
		curplayer:SetData("timertable", drugtable)


	
		quantity = quantity - 1
		
		if (quantity >= 1) then
			item:SetData("quantity", quantity)
			return false
		end
	
		return true
	end,
	OnCanRun = function(item)
		curplayer = item.player:GetCharacter()
		if (curplayer:GetData("usingHercules")) then 
			return false
		else 
			return (!IsValid(item.entity))
		end 
	end
}
