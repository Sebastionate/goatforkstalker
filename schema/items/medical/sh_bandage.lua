ITEM.name = "Bandage"
ITEM.description = "A small bandage for wounds."
ITEM.longdesc = "A normal elastic bandage used to stop bleeding and prevent infection of wounds. For regular bleeding, carefully apply the bandage to the wound. For arterial bleeding, urgently tie the bandage around the affected area.\n -1 Bleed"
ITEM.model = "models/kek1ch/dev_bandage.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.category = "Medical"

ITEM.sound = "stalkersound/inv_bandage_2p9.mp3"
ITEM.price = "50"
ITEM.flag = "1"
ITEM.weight = 0.05

ITEM.functions.use = {
	name = "Heal",
	icon = "icon16/stalker/heal.png",
	OnRun = function(item)
		local quantity = item:GetData("quantity", item.quantity)
		ix.chat.Send(item.player, "iteminternal", "applies a " ..item.name, false)
		local char = item.player:GetCharacter()
		char:RemoveBleedStacks(1)

		quantity = quantity - 1

		if (quantity >= 1) then
			item:SetData("quantity", quantity)
			return false
		end
		
		

		return true
	end,

	OnCanRun = function(item)
		return (!IsValid(item.entity))
	end
}

ITEM.functions.usetarget = {
	name = "Heal Target",
	icon = "icon16/stalker/heal.png",
	OnRun = function(item)
		local data = {}
			data.start = item.player:GetShootPos()
			data.endpos = data.start + item.player:GetAimVector()*96
			data.filter = item.player
		local target = util.TraceLine(data).Entity
		local quantity = item:GetData("quantity", item.quantity)
		if (IsValid(target) and target:IsPlayer()) then

			target = target:GetCharacter()
			local quantity = item:GetData("quantity", item.quantity)
			ix.chat.Send(item.player, "iteminternal", "applies a " ..item.name .. " to " ..target:GetName(), false)
			local char = item.player:GetCharacter()
			target:RemoveBleedStacks(1)
			

			quantity = quantity - 1

			if (quantity >= 1) then
				item:setData("quantity", quantity)
				return false
			end
			
			
		else
			item.player:Notify("Not looking at a player!")
			return false
		end

		return true
	end,
	OnCanRun = function(item)
		return (!IsValid(item.entity))
	end
}
