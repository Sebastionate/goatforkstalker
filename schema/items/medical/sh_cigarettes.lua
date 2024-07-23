ITEM.name = "Cigarettes"
ITEM.description = "An old pack of cigarettes, a bit damaged, but still smokable."
ITEM.longdesc = "Old Russian cigarettes commonly sold throughout the exclusion zone, containing tobacco and various other chemicals within it. Notoriously bad for someone's health.\n+2 Insight, Fortitude, Observation for 8 turns"
ITEM.model = "models/ethprops/consumable/cigar1.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.category = "Medical"
ITEM.sound = "stalkersound/inv_smoke.mp3"
ITEM.price = "350"
ITEM.flag = "1"
ITEM.quantity = 6
ITEM.weight = 0.05
ITEM.duration = 8

function ITEM:GetDescription()
	if (!self.entity or !IsValid(self.entity)) then
		local quant = self:GetData("quantity", self.quantity)
		local str = self.longdesc.."\n \nThere's only "..quant.." uses left."

		return str
	else
		return self.desc
	end
end

if (CLIENT) then
	function ITEM:PaintOver(item, w, h)

		draw.SimpleText(item:GetData("quantity", item.quantity).."/"..item.quantity, "DermaDefault", 3, h - 1, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, color_black)
	end
end

ITEM.functions.use = {
	name = "Smoke",
	icon = "icon16/stalker/heal.png",
	OnRun = function(item)
		local quantity = item:GetData("quantity", item.quantity)
		ix.chat.Send(item.player, "iteminternal", "smokes one of their "..item.name..".", false)

		curplayer = item.player:GetCharacter()
		item.name = item.name
		duration = item.duration

		curplayer:AddBoost("cigarette", "observation", 2)
		curplayer:AddBoost("cigarette", "foritude", 2)
		curplayer:AddBoost("cigarette", "insight", 2)


		curplayer:SetData("usingCigarette", true)
		timer.Create(item.name, item.duration, 1, function() 
			curplayer:GetPlayer():Notify(item.name .. " has worn off.")
			curplayer:SetData("usingCigarette", false)
			curplayer:RemoveBoost("cigarette", "observation")
			curplayer:RemoveBoost("cigarette", "fortitude")
			curplayer:RemoveBoost("cigarette", "insight")

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
