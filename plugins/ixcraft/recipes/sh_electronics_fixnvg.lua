RECIPE.name = "Fix Broken Nightvision Goggles"
RECIPE.description = "Restore a set of broken consumer-grade NVGs to full working order."
RECIPE.model = "models/kek1ch/dev_detector_1.mdl"
RECIPE.category = "Electronics"
RECIPE.requirements = {
["wire"] = 2,
["capacitors"] = 2,
["resistors"] = 2,
["sparelectronics"] = 1,
["brokennvg"] = 1,
}


RECIPE.results = {
	["nvg_civillian"] = 1

}

RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetSkill("mechanic", 0) < 5) then 
		return false
	else
		return true 
	end 
end)
