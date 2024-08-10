ITEM.name = "Expert Gunsmith Toolkit"
ITEM.description = "Used by master gunsmiths for complex firearms work."
ITEM.longdesc = "A set of tools for working on mechanically complex or rare firearms, with replacement parts for them to keep the most testy of weapons ticking."
ITEM.model = "models/kek1ch/box_toolkit_3.mdl"
ITEM.width = 2
ITEM.height = 1
ITEM.category = "Technician"
ITEM.price = "25000"
ITEM.flag = "A"
ITEM.noDeathDrop = true
ITEM.maxStack = 100
ITEM.isTool = true
ITEM.toolMult = 1
ITEM.compMultiplier = 1.25
ITEM.repairAmount = 25
ITEM.sound = "stalkersound/inv_repair_kit_use_fast.mp3"
ITEM.weight = 0.012

function ITEM:GetDescription()
	local str = self.longdesc

	local customData = self:GetData("custom", {})
	if(customData.desc) then
		str = customData.desc
	end

	if (self.entity) then
		return self.description
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


