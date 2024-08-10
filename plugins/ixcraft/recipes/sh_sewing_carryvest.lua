RECIPE.name = "Carry Vest"
RECIPE.description = "Fashion a pocketed vest to hold more stuff."
RECIPE.model = "models/stalker/outfit/rookie.mdl"
RECIPE.category = "Sewing"

RECIPE.requirements = {
["clothscrap"] = 4,
["canvasscrap"] = 2,
["thread"] = 1
}

RECIPE.results = {
	["vest1"] = 1
}

RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetSkill("mechanic", 0) < 5) then 
		return false
	else
		return true 
	end 
end)

