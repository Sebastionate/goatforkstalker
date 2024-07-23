ITEM.name = "Psi-Block"
ITEM.model = "models/stalker/item/medical/psy_pills.mdl"
ITEM.description = "Drug designed to protect the body from nervous overload by means of strong emotions or psy-attacks. Makes the user incredibly sluggish and slow-thinking.\n+20% Psi Resist for 5 turns, -4 Reflex and Insight"
ITEM.category = "Medical"
ITEM.price = 2500
ITEM.flag = "1"
ITEM.duration = 5
ITEM.sound = "stalker/interface/inv_eat_pills_effect.ogg"

ITEM.functions.use = {
	name = "Swallow",
	icon = "icon16/stalker/heal.png",
	OnRun = function(item)
		local quantity = item:GetData("quantity", item.quantity)
		ix.chat.Send(item.player, "iteminternal", "swallows some "..item.name..".", false)

		curplayer = item.player:GetCharacter()
		item.name = item.name
		duration = item.duration

		curplayer:AddBoost("psyblock", "reflex", -4)
		curplayer:AddBoost("psyblock", "insight", -4)

		curplayer:SetData("usingPsyblock", true)
		timer.Create(item.name, item.duration, 1, function() 
			curplayer:GetPlayer():Notify(item.name .. " has worn off.")
			curplayer:RemoveBoost("psyblock", "reflex")
			curplayer:RemoveBoost("psyblock", "insight")
			curplayer:SetData("usingPsyblock", false)

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
		if (curplayer:GetData("usingPsyblock")) then 
			return false
		else 
			return (!IsValid(item.entity))
		end 
	end
}