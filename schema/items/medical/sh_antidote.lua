ITEM.name = "Antidote"
ITEM.model = "models/kek1ch/drug_antidot.mdl"
ITEM.description = "A combination drug that counter-acts poisoning and chemical weapons inhalation. Makes user experience vertigo at random points, making climbing and acrobatic stunts impossible.\n+20% Chemical resist for 5 turns, -6 Reflex"
ITEM.category = "Medical"
ITEM.price = 750
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

		curplayer:AddBoost("antidote", "reflex", -6)

		curplayer:SetData("usingAntidote", true)
		timer.Create(item.name, item.duration, 1, function() 
			curplayer:GetPlayer():Notify(item.name .. " has worn off.")
			curplayer:RemoveBoost("antidote", "reflex")
			curplayer:SetData("usingAntidote", false)

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
		if (curplayer:GetData("usingAntidote")) then 
			return false
		else 
			return (!IsValid(item.entity))
		end 
	end
}