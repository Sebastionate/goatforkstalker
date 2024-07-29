ITEM.name = "Army Stimulant"
ITEM.description = "A stimulant produced for the Military in a quick-inject syringe."
ITEM.longdesc = "An concoction of controlled substances produced by the governent, issued to Spetsnaz to keep them awake and fighting in the Zone's hellish conditions. It finds its way into the greater zone via corrupt supply officers, or picked off the corpses of dead soldiers.  \nHeal: 15hp per turn for 5 turns"
ITEM.model = "models/kek1ch/stim2.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.category = "Medical"
ITEM.duration = 5
ITEM.sound = "stalker/interface/inv_syringe.ogg"
ITEM.price = "300"
ITEM.flag = "1"
ITEM.quantity = 1
ITEM.weight = 0.3
ITEM.stopsBleed = true
ITEM.heal = 15


function ITEM:GetDescription()
	if (!self.entity or !IsValid(self.entity)) then
		local quant = self:GetData("quantity", self.quantity)
		local str = self.longdesc.."\n \nThere's only "..quant.." use left."

		return str
	else
		return self.desc
	end
end

ITEM.functions.use = {
	name = "Heal",
	icon = "icon16/stalker/heal.png",
	OnRun = function(item)
		local quantity = item:GetData("quantity", item.quantity)
		ix.chat.Send(item.player, "iteminternal", "opens a "..item.name.." and uses it.", false)
		local char = item.player:GetCharacter()


		curplayer:SetData("usingStim", item.heal )
		timer.Create(item.name, item.duration, 1, function() 
			curplayer:GetPlayer():Notify(item.name .. " has worn off.")
			curplayer:SetData("usingStim", nil)
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
		if (curplayer:GetData("usingStim")) then 
			return false
		else 
			return (!IsValid(item.entity))
		end 
	end
}


