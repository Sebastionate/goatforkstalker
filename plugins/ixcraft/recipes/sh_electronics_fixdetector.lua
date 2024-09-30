RECIPE.name = "Fix Broken Detector"
RECIPE.description = "Restore a busted Echo detector to full working order."
RECIPE.model = "models/kek1ch/dev_detector_1.mdl"
RECIPE.category = "Electronics"
RECIPE.requirements = {
["wire"] = 2,
["capacitors"] = 2,
["resistors"] = 2,
["spareelectronics"] = 1,
["brokendetector"] = 1,
}


RECIPE.results = {
	["detectorecho"] = 1

}

RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetSkill("mechanic", 0) < 5) then 
		return false
	else
		return true 
	end 
end)
