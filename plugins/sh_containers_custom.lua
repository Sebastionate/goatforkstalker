--[[
	ix.container.Register(model, {
		name = "Crate",
		description = "A simple wooden create.",
		width = 4,
		height = 4,
		locksound = "",
		opensound = ""
	})
]]--

PLUGIN.name = "Custom Containers Test"
PLUGIN.author = "Bath"
PLUGIN.description = "At."

ix.container.Register("models/props_junk/wood_crate001a.mdl", {
	name = "Crate",
	description = "A simple wooden crate.",
	width = 4,
	height = 4,
})

ix.container.Register("models/props_c17/lockers001a.mdl", {
	name = "Locker",
	description = "A white locker.",
	width = 3,
	height = 5,
})

ix.container.Register("models/props_wasteland/controlroom_storagecloset001a.mdl", {
	name = "Metal Cabinet",
	description = "A green metal cabinet.",
	width = 8,
	height = 10,
})

ix.container.Register("models/props_wasteland/controlroom_storagecloset001b.mdl", {
	name = "Metal Cabinet",
	description = "A green metal cabinet.",
	width = 8,
	height = 10,
})

ix.container.Register("models/props_wasteland/controlroom_filecabinet001a.mdl", {
	name = "File Cabinet",
	description = "A metal filing cabinet.",
	width = 5,
	height = 3
})

ix.container.Register("models/props_wasteland/controlroom_filecabinet002a.mdl", {
	name = "File Cabinet",
	description = "A metal filing cabinet.",
	width = 3,
	height = 6,
})

ix.container.Register("models/props_lab/filecabinet02.mdl", {
	name = "File Cabinet",
	description = "A metal filing cabinet.",
	width = 5,
	height = 3
})

ix.container.Register("models/props_c17/furniturefridge001a.mdl", {
	name = "Refrigerator",
	description = "A metal box for keeping food in.",
	width = 6,
	height = 8,
})

ix.container.Register("models/props_wasteland/kitchen_fridge001a.mdl", {
	name = "Large Refrigerator",
	description = "A large metal box for storing even more food in.",
	width = 6,
	height = 8,
})

ix.container.Register("models/props_junk/trashbin01a.mdl", {
	name = "Trash Bin",
	description = "What do you expect to find in here?",
	width =4,
	height =6,
})

ix.container.Register("models/props_junk/trashdumpster01a.mdl", {
	name = "Dumpster",
	description = "A dumpster meant to stow away trash. It emanates an unpleasant smell.",
	width = 14,
	height = 10
})

ix.container.Register("models/items/ammocrate_smg1.mdl", {
	name = "Ammo Crate",
	description = "A heavy crate that stores ammo.",
	width = 10,
	height = 6,
	OnOpen = function(entity, activator)
		local closeSeq = entity:LookupSequence("Close")
		entity:ResetSequence(closeSeq)

		timer.Simple(2, function()
			if (entity and IsValid(entity)) then
				local openSeq = entity:LookupSequence("Open")
				entity:ResetSequence(openSeq)
			end
		end)
	end
})

ix.container.Register("models/props_forest/footlocker01_closed.mdl", {
	name = "Footlocker",
	description = "A small chest to store belongings in.",
	width = 5,
	height = 3
})

ix.container.Register("models/Items/item_item_crate.mdl", {
	name = "Item Crate",
	description = "A crate to store some belongings in.",
	width = 5,
	height = 3
})

ix.container.Register("models/props_c17/cashregister01a.mdl", {
	name = "Cash Register",
	description = "A register with some buttons and a drawer.",
	width = 2,
	height = 1
})

ix.container.Register("models/hgn/srp/containers/crate_unbreakable.mdl", {
	name = "Wooden crate",
	description = "A simple wooden crate.",
	width = 4,
	height = 4
})

ix.container.Register("models/hgn/srp/containers/footlocker_02.mdl", {
	name = "Footlocker",
	description = "A footlocker to save some stuff in.",
	width = 6,
	height = 5
})

ix.container.Register("models/hgn/srp/containers/footlocker_03.mdl", {
	name = "Footlocker",
	description = "A footlocker to save some stuff in.",
	width = 6,
	height = 5
})

ix.container.Register("models/hgn/srp/items/backpack-1.mdl", {
	name = "Backpack",
	description = "Just a backpack that could to be used as a stash.",
	width = 3,
	height = 3
})

ix.container.Register("models/hgn/srp/items/backpack-2.mdl", {
	name = "Backpack",
	description = "Just a backpack that could to be used as a stash.",
	width = 3,
	height = 3
})

ix.container.Register("models/illusion/eftcontainers/ammocase.mdl", {
	name = "Ammo Case",
	description = "A small, plastic ammo case.",
	width = 3,
	height = 2
})

ix.container.Register("models/props/toolbox1.mdl", {
	name = "Tool Box",
	description = "A metal tool box.",
	width = 4,
	height = 3
})

ix.container.Register("models/tnb/props/filing_cabinet_small.mdl", {
	name = "Rusted Filing Cabinet",
	description = "An old, rusted filing Cabine with a few drawers.",
	width = 2,
	height = 8
})

ix.container.Register("models/kali/props/cases/hard case c.mdl", {
	name = "Large Hardcase",
	description = "A Military Storage Hardcase.",
	width = 5,
	height = 4
})

ix.container.Register("models/illusion/eftcontainers/weaponcase.mdl", {
	name = "Weapons Hardcase",
	description = "A long weapons hardcase.",
	width = 4,
	height = 3
})

ix.container.Register("models/illusion/eftcontainers/moneycase.mdl", {
	name = "Bank Hardcase",
	description = "A briefcase fit for storing rubles.",
	width = 3,
	height = 3
})

ix.container.Register("models/illusion/eftcontainers/thermobag.mdl", {
	name = "Cooler Box",
	description = "A refrigerated cooler box.",
	width = 3,
	height = 3
})

ix.container.Register("models/hgn/srp/containers/metal_box_04.mdl", {
	name = "Soviet Storage Case",
	description = "An old, rusted transport case.",
	width = 6,
	height = 5
})

ix.container.Register("models/hgn/srp/containers/safe_01.mdl", {
	name = "Aged Safe",
	description = "A sturdy, old safe.",
	width = 4,
	height = 6
})

ix.container.Register("models/maver1k_xvii/stalker/props/box/expl_dinamit.mdl", {
	name = "Explosives Crate",
	description = "A small, labeled crate.",
	width = 4,
	height = 4
})

ix.container.Register("models/z-o-m-b-i-e/st/box/st_box_metall_01.mdl", {
	name = "Supply Box",
	description = "A small, metallic case.",
	width = 2,
	height = 2
})