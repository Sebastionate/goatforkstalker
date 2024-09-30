ITEM.name = "Civillian First Aid Kit"
ITEM.description = "A common first aid kit with basic tools."
ITEM.longdesc = "A civillian grade medkit that anybody could purchase, stored in cars or closets to deal with minor everyday injury. Still has its uses in a combat scenario.\nBase Heal: 25hp, -1 Bleed"
ITEM.model = "models/illusion/eftcontainers/carmedkit.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.heal = 25
ITEM.category = "Medical"
ITEM.quantity = 4
ITEM.price = "350"
ITEM.flag = "1"
ITEM.sound = "stalkersound/inv_bandage.mp3"
ITEM.weight = 0.05

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

			local char = item.player:GetCharacter()
			target = target:GetCharacter()
			local skillbonusheal = (char:GetSkill("medic") / 100)
			skillbonusheal = skillbonusheal * 2
			skillbonusheal = item.heal + (skillbonusheal * item.heal)
			skillbonusheal = math.Round(skillbonusheal)
		



			target:AdjustHealth("heal", skillbonusheal)
			item.player:Notify("Healed " .. target:GetName() .. " for " .. skillbonusheal .. "hp.")
			target:GetPlayer():Notify(char:GetName() .. " heals you for " .. skillbonusheal .. "hp.")
			target:RemoveBleedStacks(1)


			
			ix.chat.Send(item.player, "iteminternal", "opens a "..item.name.." and uses it on "..target:GetName()..".", false)
			
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
