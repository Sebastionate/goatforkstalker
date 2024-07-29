ITEM.name = "Improvised Stimulant"
ITEM.description = "A locally made stimulant in a syringe."
ITEM.longdesc = "An unknown concoction of stimulants produced by a hopefully clean lab in the Zone that help keep you working even with grevious injury. \nHeal: 10hp per turn for 5 turns"
ITEM.model = "models/kek1ch/stim1.mdl"
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
ITEM.heal = 10


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


