RECIPE.name = "Loot Belt"
RECIPE.description = "Create a sturdy belt to clip a fair bit of goodies to."
RECIPE.model = "models/weapons/accessories/a_sling_bren_reparented.mdl"
RECIPE.category = "Sewing"

RECIPE.requirements = {
["clothscrap"] = 4,
["canvasscrap"] = 2,
["thread"] = 2
}

RECIPE.results = {
	["belt2"] = 1

}

RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetSkill("mechanic", 0) < 10) then 
		return false
	else
		return true 
	end 
end)
