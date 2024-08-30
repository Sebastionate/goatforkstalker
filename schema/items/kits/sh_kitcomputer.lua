ITEM.name = "PC Block"
ITEM.description= "A PC case with electronic internals."
ITEM.longdesc = "You'll need to disassemble it and see what parts are actually salvageable."
ITEM.model = "models/props_lab/harddrive02.mdl"
ITEM.width = 2
ITEM.height = 2
ITEM.category = "Kits"
ITEM.itemsForcedDrop = {}
ITEM.items[1] = {
	dropAmount = 3, --How many times it will roll for drop
	dropRareChance = 30, --chances for the rarer drops
	dropVeryRareChance = 15,
	itemsCommon = {
		{"spareelectronics",}, 
		{"damagedharddrive",},
		{"wiring",},
	},
	itemsRare = {
		{"psu",}, 
		{"solidstatedrive",}, 

	},
	itemsVeryRare = {
		{"graphicscard",}, 
	}


}







--[[ Example format
ITEM.items[1] = {
	dropAmount = 5, --How many times it will roll for drop
	dropRareChance = 40, --chances for the rarer drops
	dropVeryRareChance = 20,
	itemsCommon = {
		{"9x18"},
		{"9x19"},
		{"12gauge"},
	},
	itemsRare = {
		{"57x28"},
		{"380acp"},
		{"762x25"},
	},
	itemsVeryRare = {
		{"22lr"},
		{"mp5", {["durability"] = 30}}, --Data can also be passed
		{"45acp"},
	},
}
]]--

