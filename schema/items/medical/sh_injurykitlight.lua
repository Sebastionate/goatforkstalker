ITEM.name = "Light Injury Kit"
ITEM.description = "A comprehensive kit for dealing with light injuries."
ITEM.longdesc = "A comprehensive kit for dealing with long-term but not too serious wounds.\nMedic skill required: 5\nUse with GM assistance to cure Light injuries"
ITEM.model = "models/gorka/stalker/items/medbag_1.mdl"
ITEM.width = 2
ITEM.height = 2
ITEM.category = "Medical"
ITEM.sound = "stalkersound/inv_bandage.mp3"
ITEM.price = "5000"
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


