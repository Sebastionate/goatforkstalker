RECIPE.name = "Military Pouch"
RECIPE.description = "Create a sturdy military pouch for magazines, grenades, or just goodies."
RECIPE.model = "models/kek1ch/outfit_waste_light.mdl"
RECIPE.category = "Sewing"

RECIPE.requirements = {
["kevlarscrap"] = 2,
["rubberscrap"] = 1,
["thread"] = 3
}

RECIPE.results = {
	["pouch3"] = 1

}

RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetSkill("mechanic", 0) < 15) then 
		return false
	else
		return true 
	end 
end)
