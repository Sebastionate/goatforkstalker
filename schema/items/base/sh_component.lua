ITEM.name = "Component"
ITEM.description = "Junk Items"
ITEM.longdesc = " "
ITEM.category = "junk"
ITEM.model = "models/Gibs/HGIBS.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.quantity = 1
ITEM.equipIcon = Material("materials/vgui/ui/stalker/misc/equip.png")

ITEM.functions.Sell = {
	name = "Sell",
	icon = "icon16/stalker/sell.png",
	sound = "physics/metal/chain_impact_soft2.wav",
	OnRun = function(item)
		local client = item.player
		local sellprice = item.price/0.25
		
		if item.quantity > 1 then
			sellprice = ((item.price/0.25) * (item:GetData("quantity",item.quantity)/item.quantity))
		end
		sellprice = math.Round(sellprice)
		client:Notify( "Sold for "..(sellprice).." rubles." )
		client:GetCharacter():GiveMoney(sellprice)
		return true 
	end,
	OnCanRun = function(item)
		return !IsValid(item.entity) and item:GetOwner():GetCharacter():HasFlags("1")
	end
}

ITEM.functions.Value = {
	name = "Value",
	icon = "icon16/help.png",
	sound = "physics/metal/chain_impact_soft2.wav",
	OnRun = function(item)
		local client = item.player
		local sellprice = (item.price * 0.60)
		
		if item.quantity > 1 then
			sellprice = (sellprice * (item:GetData("quantity",item.quantity)/item.quantity))
		end
		sellprice = math.Round(sellprice)
		client:Notify( "Item is sellable for "..(sellprice).." rubles." )
		return false
	end,
	OnCanRun = function(item)
		return !IsValid(item.entity) and item:GetOwner():GetCharacter():HasFlags("1")
	end
}

function ITEM:GetDescription()
	local quant = self:GetData("quantity", 1)
	local str = self.description
	if self.longdesc then
		str = str.."\n"..(self.longdesc or "")
	end

	str = str .. "Quantity: " .. quant

	local customData = self:GetData("custom", {})
	if(customData.desc) then
		str = customData.desc
	end

	if (self.entity) then
		return (self.description)
	else
        return (str)
	end
end

function ITEM:GetName()
	local name = self.name
	
	local customData = self:GetData("custom", {})
	if(customData.name) then
		name = customData.name
	end
	
	return name
end

ITEM.functions.Custom = {
	name = "Customize",
	tip = "Customize this item",
	icon = "icon16/wrench.png",
	OnRun = function(item)		
		ix.plugin.list["customization"]:startCustom(item.player, item)
		
		return false
	end,
	
	OnCanRun = function(item)
		local client = item.player
		return client:GetCharacter():HasFlags("N") and !IsValid(item.entity)
	end
}

ITEM.functions.Inspect = {
	name = "Inspect",
	tip = "Inspect this item",
	icon = "icon16/picture.png",
	OnClick = function(item, test)
		local customData = item:GetData("custom", {})

		local frame = vgui.Create("DFrame")
		frame:SetSize(540, 680)
		frame:SetTitle(item.name)
		frame:MakePopup()
		frame:Center()

		frame.html = frame:Add("DHTML")
		frame.html:Dock(FILL)
		
		local imageCode = [[<img src = "]]..customData.img..[["/>]]
		
		frame.html:SetHTML([[<html><body style="background-color: #000000; color: #282B2D; font-family: 'Book Antiqua', Palatino, 'Palatino Linotype', 'Palatino LT STD', Georgia, serif; font-size 16px; text-align: justify;">]]..imageCode..[[</body></html>]])
	end,
	OnRun = function(item)
		return false
	end,
	OnCanRun = function(item)
		local customData = item:GetData("custom", {})
	
		if(!customData.img) then
			return false
		end
		
		if(item.entity) then
			return false
		end
		
		return true
	end
}

ITEM.functions.Clone = {
	name = "Clone",
	tip = "Clone this item",
	icon = "icon16/wrench.png",
	OnRun = function(item)
		local client = item.player	
	
		client:requestQuery("Are you sure you want to clone this item?", "Clone", function(text)
			if text then
				local inventory = client:GetCharacter():GetInventory()
				
				if(!inventory:Add(item.uniqueID, 1, item.data)) then
					client:Notify("Inventory is full")
				end
			end
		end)
		return false
	end,
	OnCanRun = function(item)
		local client = item.player
		return client:GetCharacter():HasFlags("N") and !IsValid(item.entity)
	end
}

ITEM.functions.stackcomp = {
	name = "Stack Component",
	icon = "vgui/ui/stalker/weaponupgrades/weight.png",
	OnRun = function(item)
		local quantity = item:GetData("quantity", item.quantity)
		curplayer = item.player:GetCharacter()
		
		inv = curplayer:GetInventory()

		local comps = inv:GetItemsByUniqueID(item.uniqueID)
		local newtotal = 0

		for k, v in pairs (comps) do
			local compquantity = v:GetData("quantity", v.quantity)
			newtotal = newtotal + compquantity
			v:Remove(false, true)
		end 

		inv:Add(item.uniqueID, 1, {["quantity"] = newtotal})
		return false

	end,

	OnCanRun = function(item)
		return (!IsValid(item.entity))
	end
}

ITEM.functions.remove1comp = {
	name = "Remove 1 Component",
	icon = "vgui/ui/stalker/weaponupgrades/handling.png",
	OnRun = function(item)
		local quantity = item:GetData("quantity", item.quantity)
		curplayer = item.player:GetCharacter()
		inv = curplayer:GetInventory()



		item:SetData("quantity", item:GetData("quantity") - 1)

		inv:Add(item.uniqueID, 1, {["quantity"] = 1})
		return false

	end,
	OnCanRun = function(item)
		local quantity = item:GetData("quantity", item.quantity)

		if item:GetData("quantity", quantity) > 1 then 
			return (!IsValid(item.entity))
		else
			return false 
		end 
	end
}

ITEM.functions.remove5comp = {
	name = "Remove 5 Components",
	icon = "vgui/ui/stalker/weaponupgrades/handling.png",
	OnRun = function(item)
		local quantity = item:GetData("quantity", item.quantity)
		curplayer = item.player:GetCharacter()
		inv = curplayer:GetInventory()



		item:SetData("quantity", item:GetData("quantity") - 5)

		inv:Add(item.uniqueID, 1, {["quantity"] = 5})
		return false

	end,
	OnCanRun = function(item)
		local quantity = item:GetData("quantity", item.quantity)

		if item:GetData("quantity", quantity) > 5 then 
			return (!IsValid(item.entity))
		else
			return false 
		end 
	end
}

ITEM.functions.remove10comp = {
	name = "Remove 10 Components",
	icon = "vgui/ui/stalker/weaponupgrades/handling.png",
	OnRun = function(item)
		local quantity = item:GetData("quantity", item.quantity)
		curplayer = item.player:GetCharacter()
		inv = curplayer:GetInventory()



		item:SetData("quantity", item:GetData("quantity") - 10)

		inv:Add(item.uniqueID, 1, {["quantity"] = 10})
		return false

	end,
	OnCanRun = function(item)
		local quantity = item:GetData("quantity", item.quantity)

		if item:GetData("quantity", quantity) > 10 then 
			return (!IsValid(item.entity))
		else
			return false 
		end 
	end
}

ITEM.functions.remove15comp = {
	name = "Remove 15 Components",
	icon = "vgui/ui/stalker/weaponupgrades/handling.png",
	OnRun = function(item)
		local quantity = item:GetData("quantity", item.quantity)
		curplayer = item.player:GetCharacter()
		inv = curplayer:GetInventory()



		item:SetData("quantity", item:GetData("quantity") - 15)

		inv:Add(item.uniqueID, 1, {["quantity"] = 15})
		return false

	end,
	OnCanRun = function(item)
		local quantity = item:GetData("quantity", item.quantity)

		if item:GetData("quantity", quantity) > 15 then 
			return (!IsValid(item.entity))
		else
			return false 
		end 
	end
}




function ITEM:OnInstanced(invID, x, y)
	self:SetData("quantity", item.quantity)
end

if (CLIENT) then
	function ITEM:PaintOver(item, w, h)
		draw.SimpleText(item:GetData("quantity", item.quantity), "DermaDefault", 3, h - 1, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, color_black)
	end
end