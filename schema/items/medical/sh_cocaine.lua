ITEM.name = "Cocaine"
ITEM.description = "Imported cocaine."
ITEM.longdesc = "Small aluminium case containing cocaine and the tools facilitating use. Cocaine is a powerful nervous system stimulant. Cocaine increases alertness, induces feelings of well-being, competence and sexuality.\n+4 Reflex, Strength, Fortitude for 5 turns. Beware the consequences of long term abuse..."
ITEM.model = "models/kek1ch/drink_cocaine.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.category = "Medical"
ITEM.price = "750"
ITEM.flag = "1"
ITEM.quantity = 3
ITEM.duration = 5
ITEM.sound = "stalkersound/inv_sniff_2.mp3"
ITEM.weight = 0.05

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
	name = "Snort",
	icon = "icon16/stalker/heal.png",
	OnRun = function(item)
		local quantity = item:GetData("quantity", item.quantity)
		ix.chat.Send(item.player, "iteminternal", "snorts some "..item.name..".", false)

		curplayer = item.player:GetCharacter()
		item.name = item.name
		duration = item.duration

		curplayer:AddBoost("cocaine", "strength", 4)
		curplayer:AddBoost("cocaine", "reflex", 4)
		curplayer:AddBoost("cocaine", "fortitude", 4)

		curplayer:SetData("usingCocaine", true)

		local cokeuses = curplayer:GetData("cocaineUse", 0)
		local overdosechance = math.random(1, 100)

		if cokeuses >= overdosechance then 
			item.player:Notify("As you snort the line of coke, your heart rapidly beats hard enough you hear it in your ears! Then, it seizes up...")
			curplayer:AdjustHealth("hurt", 150)
		end 

		curplayer:SetData("cocaineUse", cokeuses + 1)




		timer.Create(item.name, item.duration, 1, function() 
			curplayer:GetPlayer():Notify(item.name .. " has worn off.")
			curplayer:SetData("usingCocaine", false)
			curplayer:RemoveBoost("cocaine", "strength")
			curplayer:RemoveBoost("cocaine", "reflex")
			curplayer:RemoveBoost("cocaine", "fortitude")

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
		if (curplayer:GetData("usingCocaine")) then 
			return false
		else 
			return (!IsValid(item.entity))
		end 
	end
}
