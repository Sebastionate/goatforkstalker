ITEM.name = "Moderate Injury Kit"
ITEM.description = "A comprehensive kit for dealing with moderate injuries."
ITEM.longdesc = "A comprehensive kit for dealing with long-term and serious wounds of pretty much any type.\nMedic skill required: 15\nUse with GM assistance to cure Moderate injuries"
ITEM.model = "models/gorka/stalker/items/medbag_2.mdl"
ITEM.width = 2
ITEM.height = 2
ITEM.category = "Medical"
ITEM.sound = "stalkersound/inv_bandage.mp3"
ITEM.price = "25000"
ITEM.flag = "1"
ITEM.weight = 0.3
ITEM.stopsBleed = true



function ITEM:GetDescription()
	if (!self.entity or !IsValid(self.entity)) then
		local str = self.longdesc
		return str
	else
		return self.desc
	end
end


