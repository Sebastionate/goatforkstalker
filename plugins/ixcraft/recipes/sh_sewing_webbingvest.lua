RECIPE.name = "Webbing Vest"
RECIPE.description = "Create a webbing vest for keeping crucial supplies close at hand."
RECIPE.model = "models/kek1ch/bron_k.mdl"
RECIPE.category = "Sewing"
RECIPE.requirements = {
["kevlarscrap"] = 4,
["rubberscrap"] = 3,
["thread"] = 3
}

RECIPE.results = {
	["vest3"] = 1

}
RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetSkill("mechanic", 0) < 15) then 
		return false
	else
		return true 
	end 
end)
