RECIPE.name = "Loot Pouch"
RECIPE.description = "Create a better quality carrying pouch with some common materials."
RECIPE.model = "models/kek1ch/kit_hunt.mdl"
RECIPE.category = "Sewing"


RECIPE.requirements = {
["clothscrap"] = 3,
["canvasscrap"] = 2,
["thread"] = 2
}

RECIPE.results = {
	["pouch2"] = 1

}

RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetSkill("mechanic", 0) < 10) then 
		return false
	else
		return true 
	end 
end)

