ITEM.name = "Radio Protectant"
ITEM.model = "models/kek1ch/drug_radioprotector.mdl"
ITEM.description = "Drug designed to protect the body from absorbing gamma radiation. Often results in the user suffering from Tremors, greatly reducing their focus, and especially their aim.\n+20% Rad Resist for 5 turns, -5 Accuracy with ranged weapons "
ITEM.category = "Medical"
ITEM.price = 750
ITEM.weight = 0.25
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


		curplayer:SetData("usingRadioprotectant", true)
		timer.Create(item.name, item.duration, 1, function() 
			curplayer:GetPlayer():Notify(item.name .. " has worn off.")
			curplayer:SetData("usingRadioprotectant", false)

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
		if (curplayer:GetData("usingRadioprotectant")) then 
			return false
		else 
			return (!IsValid(item.entity))
		end 
	end
}