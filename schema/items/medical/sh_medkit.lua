ITEM.name = "First-Aid Kit"
ITEM.description = "A small general-purpose medkit."
ITEM.longdesc = "Basic first aid kit for dealing with minor pains and wounds, but does not stop bleeding by itself.\nBase Heal: 25hp"
ITEM.model = "models/kek1ch/dev_aptechka_low.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.category = "Medical"
ITEM.heal = 25
ITEM.sound = "stalkersound/inv_bandage.mp3"
ITEM.price = "300"
ITEM.flag = "1"
ITEM.quantity = 3
ITEM.weight = 0.3
ITEM.stopsBleed = true


function ITEM:GetDescription()
	if (!self.entity or !IsValid(self.entity)) then
		local quant = self:GetData("quantity", self.quantity)
		local str = self.longdesc.."\n \nThere's only "..quant.." use left."

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
	name = "Heal",
	icon = "icon16/stalker/heal.png",
	OnRun = function(item)
		local quantity = item:GetData("quantity", item.quantity)
		ix.chat.Send(item.player, "iteminternal", "opens a "..item.name.." and uses it.", false)
		

		local char = item.player:GetCharacter()
		local skillbonusheal = (char:GetSkill("medic") / 100)
		skillbonusheal = skillbonusheal * 2
		skillbonusheal = item.heal + (skillbonusheal * item.heal)
		skillbonusheal = math.Round(skillbonusheal)
	



		char:AdjustHealth("heal", skillbonusheal)
		item.player:Notify("Healed " .. skillbonusheal .. "hp.")




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

			local char = item.player:GetCharacter()
			local skillbonusheal = (char:GetSkill("medic") / 100)
			skillbonusheal = skillbonusheal * 2
			skillbonusheal = item.heal + (skillbonusheal * item.heal)
			skillbonusheal = math.Round(skillbonusheal)
		



			target:AdjustHealth("heal", skillbonusheal)
			item.player:Notify("Healed " .. target:Name() .. " for " .. skillbonusheal .. "hp.")
			target:GetPlayer():Notify(char:Name() .. " heals you for " .. skillbonusheal .. "hp.")

			
			ix.chat.send(item.player, "iteminternal", "opens a "..item.name.." and uses it on "..target:Name()..".", false)
			
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
