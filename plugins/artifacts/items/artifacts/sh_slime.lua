ITEM.name = "Slime"
ITEM.model ="models/nasca/etherealsrp_artifacts/slime.mdl"
ITEM.description = "Slimey."
ITEM.longdesc = "This mucus-like artifact is amorphous, with the consistency of jelly - though its connection to itself renders attempts to separate it into parts nearly impossible. Even so, it is difficult to keep in one shape, so many stalkers place it into a thin container. The slime acts as a coagulant, covering and sealing wounds as they appear. However, as the slime generates its formations over the body, it renders the user susceptible to dangerous chemicals and burns.\n\n+2 Bleed\n-1 Thermal\n-1 Chemical"
ITEM.width = 1
ITEM.height = 1
ITEM.price = 2500
ITEM.flag = "A"
ITEM.isArtefact = true
ITEM.bleedReduce = 1
ITEM.weight = 0.9
ITEM.res = {
	["Burn"] = -0.15,
	["Chemical"] = -0.15,
}