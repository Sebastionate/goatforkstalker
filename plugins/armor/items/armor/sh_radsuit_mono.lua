ITEM.name = "Monolith Exosuit"
ITEM.model ="models/kek1ch/exolight_outfit.mdl"
ITEM.replacements ="models/nasca/stalker/male_exo_mono.mdl"
ITEM.description= "A set of TB-3 heavy armor."
ITEM.longdesc = "The Monolith has built a stockpile of these heavily armored suits over the years. Possessing efficient weight distribution due to advances in the design, this outfit is used by the most elite warriors of the Monolith. Those tasked with defending areas of vital importance such as the Brain Scorcher or Chernobyl NPP are afforded nothing but the best to ensure success in their mission."
ITEM.width = 2
ITEM.height = 4
ITEM.price = 300000
ITEM.flag = "A"
ITEM.br = 0.6
ITEM.fbr = 11
ITEM.ar = 0.2
ITEM.far = 3
ITEM.isArmor = true
ITEM.overlayPath = "vgui/overlays/hud_merc"
ITEM.img = Material("vgui/hud/xm40.png")
ITEM.noBusiness = true
ITEM.artifactcontainers = {"2"}
ITEM.weightClass = 3
ITEM.ballisticRating = 55
ITEM.res = {
	["Impact"] = 0.38,
	["Rupture"] = 0.35,
	["Bullet"] = 0.35,
	["Shock"] = 0.02,
	["Burn"] = 0.01,
	["Radiation"] = 0.08,
	["Chemical"] = 0.03,
	["Psi"] = 0.10,
}


ITEM.newSkin = 0
ITEM.bodyGroups = {
	["Servomotors"] = 1,
}