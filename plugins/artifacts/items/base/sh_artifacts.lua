ITEM.name = "Artifact"
ITEM.width = 1
ITEM.height = 1
ITEM.category = "Artifacts"
ITEM.description = "An artifact. Valuable."
ITEM.longdesc = "Longer description here."
ITEM.equipIcon = Material("materials/vgui/ui/stalker/misc/equip.png")
ITEM.price = 1

function ITEM:GetDescription()
    local quant = self:GetData("quantity", 1)
    local str = self.description
    if self.longdesc then
        str = str.."\n"..(self.longdesc or "")
    end

    local customData = self:GetData("custom", {})
    if(customData.desc) then
        str = customData.desc
    end

    if self.ballisticRating then
        str = str .. "\nBallistic Rating: +" .. self.ballisticRating 
    end 

    if self.bonusMove then
        str = str .. "\nMovement: " .. self.bonusMove .. "m" 
    end 

    if self.res then
        local resistances = {
            ["Impact"] = 0,
            ["Rupture"] = 0,
            ["Bullet"] = 0,
            ["Shock"] = 0,
            ["Burn"] = 0,
            ["Radiation"] = 0,
            ["Chemical"] = 0,
            ["Psi"] = 0,
        }
        
        for k,v in pairs(self.res) do
            if resistances[k] then
                resistances[k] = resistances[k] + v
            end
        end

        for k,v in pairs(resistances) do
            if v ~= 0 then
                str = str.."\n"..k..": ".. (v*100) .. "%"
            end 
        end
    end 

    if self.rads then 
        if self.rads > 0 then str = str .. "\nRads +" .. self.rads
        else str = str .. "\nRads -" .. self.rads
        end  
    end 

    if self.bleeds then 
        str = str .. "\nBleed +" .. self.bleeds  
    end 

    if self.bleedReduce then 
        str = str .. "\nBleed -" .. self.bleedReduce 
    end 

    if self.passiveHeal then 
        str = str .. "\nHeal " .. self.passiveHeal .. "hp per turn" 
    end 






    if (self.entity) then
        return (self.description)
    else
        return (str)
    end
end

function ITEM:OnLoadout()
	if self:GetData("equip") then
		self:SetData("equip", false)
	end
end
 
ITEM:Hook("drop", function(item)
    local client = item.player;
    local character = client:GetChar();

    if (item:GetData("equip")) then
        
        local buffs = item.buffs
        
        if (buffs) then
            for k, v in pairs(buffs) do
                character:RemoveBoost(item.name, k)
            end
        end
        
        item:SetData("equip", nil);
    end;
end);

ITEM.functions.Equip = 
{
    name = "Equip",
    tip = "equipTip",
    icon = "icon16/tick.png",
    
    OnRun = function(item)
        local client = item.player
		local character = client:GetCharacter()
        local buffs = item.buffs

        if (buffs) then
            for k, v in pairs(buffs) do
                character:AddBoost(item.name, k, v)
            end
        end

        item:SetData("equip", true)
        
        return false
    end;
    
    OnCanRun = function(item)
        local client = item.player
		local character = client:GetCharacter()
		local artislots = character:GetData("ArtiSlots") or "0"
        local cap = util.StringToType(artislots, "int")
        local char = client:GetChar()
        local inv = char:GetInv()
        local items = inv:GetItems()
        local curr = 0
        
        for k, invItem in pairs(items) do
            if invItem.isArtefact and invItem:GetData("equip") then
                curr = curr + 1
            end
        end
        
        if cap > curr then
            return (!IsValid(item.entity) and item:GetData("equip") ~= true)
        else
            return false
        end
    end;
    
}

ITEM.functions.UnEquip =
{
    name = "Unequip",
    tip = "unequipTip",
    icon = "icon16/cross.png",
    
    OnRun = function(item)
        local client = item.player
		local character = client:GetCharacter()
        local buffs = item.buffs
        
        if (buffs) then
            for k, v in pairs(buffs) do
                character:RemoveBoost(item.name, k)
            end
        end
        
        item:SetData("equip", false)
        
        return false
    end;
    
    OnCanRun = function(item)
        return (!IsValid(item.entity) and item:GetData("equip") == true)
    end;
}

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

if (CLIENT) then
	game.AddParticles("particles/vortigaunt_fx.pcf")
	PrecacheParticleSystem("vortigaunt_charge_token_d")
	


    function ITEM:DrawEntity(entity, item)

        local skillbonus = 0
        if LocalPlayer():GetCharacter() then 
            skillbonus = skillbonus + LocalPlayer():GetCharacter():GetSkill("zonelore", 0) * 10
        end

        local artifactrenderdistance = 50 + skillbonus

        if not self.notAnomalous then 
            if LocalPlayer():GetPos():Distance(entity:GetPos()) > artifactrenderdistance then
                entity:SetMaterial("models/shadertest/predator.vmt")
                entity:DrawShadow(false)
                entity:StopAndDestroyParticles()
            else
                entity:SetMaterial(null)
                entity:DrawShadow(true)
                local visualeffect = CreateParticleSystem(entity,"vortigaunt_charge_token_d",1)
                timer.Simple(3, function() if entity:IsValid() then entity:StopAndDestroyParticles() end end)
            end
        end 

        entity:DrawModel()
    end


    function ITEM:PaintOver(item, w, h)
        if (item:GetData("equip")) then
            surface.SetDrawColor(110, 255, 110, 255)
        else
            surface.SetDrawColor(255, 110, 110, 255)
        end

        surface.SetMaterial(item.equipIcon)
        surface.DrawTexturedRect(w-23,h-23,19,19)
    end
end

ITEM.functions.Sell = {
    icon = "icon16/coins.png",
    sound = "physics/metal/chain_impact_soft2.wav",
    OnRun = function(item)
        local client = item.player
		local character = client:GetCharacter()
		
        client:Notify( "Sold for "..(item.price * 0.60).." rubles." )
        character:GiveMoney(item.price/1.25)
		
        if (item:GetData("equip")) then
			
			local buffs = item.buffs
            if (buffs) then
                for k, v in pairs(buffs) do
                    character:RemoveBoost(item.name, k)
                end
            end

			item:SetData("equip", nil);
		end;
    end,
    OnCanRun = function(item)
        return !IsValid(item.entity) and item:GetOwner():GetCharacter():HasFlags("1")
    end
}

ITEM.functions.Value = {
    icon = "icon16/help.png",
    sound = "physics/metal/chain_impact_soft2.wav",
    OnRun = function(item)
        local client = item.player
        client:Notify( "Item is sellable for "..(item.price * 0.60).." rubles." )
        return false
    end,
    OnCanRun = function(item)
        return !IsValid(item.entity) and item:GetOwner():GetChar():HasFlags("1")
    end
}