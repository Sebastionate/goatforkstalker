ITEM.name = "Keeper of Freedom"
ITEM.model ="models/kek1ch/scientific_outfit.mdl"
ITEM.replacements ="models/nasca/stalker/male_seva_free.mdl"
ITEM.description= "A closed cycle suit."
ITEM.longdesc = "Used by Freedom members especially for observing anomalous phenomena in the Zone, the closed system of breathing and specially treated materials provide excellent protection against harmful radiation and anomalous effects. However, the armor of the base PSZ-9M the suit is constructed from isn't the best and can be damaged somewhat easily, so it is not suitable for active hostilities."
ITEM.width = 2
ITEM.height = 2
ITEM.price = 95000
ITEM.flag = "4"
ITEM.br = 0.2
ITEM.fbr = 10
ITEM.ar = 0.6
ITEM.far = 6
ITEM.isArmor = true
ITEM.radProt = 0.3
ITEM.overlayPath = "vgui/overlays/hud_sci"
ITEM.img = Material("vgui/hud/seva.png")
ITEM.noBusiness = true
ITEM.artifactcontainers = {"5"}
ITEM.weightClass = 1
ITEM.ballisticRating = 36
ITEM.res = {
	["Impact"] = 0.13,
	["Rupture"] = 0.17,
	["Bullet"] = 0.12,
	["Shock"] = 0.23,
	["Burn"] = 0.16,
	["Radiation"] = 0.07,
	["Chemical"] = 0.09,
	["Psi"] = 0.10,
}

ITEM.newSkin = 0
ITEM.bodyGroups = {
	["Screen"] = 0,
}