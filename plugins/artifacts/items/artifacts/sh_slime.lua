ITEM.name = "Slime"
ITEM.model ="models/nasca/etherealsrp_artifacts/slime.mdl"
ITEM.description = "Slimey."
ITEM.longdesc = "This artifact forms in various chemical anomalies. While rendering its user susceptible to burns both chemical and thermal in nature, it serves to mitigate the bleeding in open wounds.\n\n+2 Bleed\n-1 Thermal\n-1 Chemical"
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