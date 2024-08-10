RECIPE.name = "Utility Belt"
RECIPE.description = "Fashion a utility belt for carrying some more goodies."
RECIPE.model = "models/wick/wrbstalker/nlc7/items/wick_belt_2_art.mdl"
RECIPE.category = "Sewing"

RECIPE.requirements = {
["clothscrap"] = 3,
["canvasscrap"] = 1,
["thread"] = 1
}

RECIPE.results = {
	["belt1"] = 1
}

RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetSkill("mechanic", 0) < 5) then 
		return false
	else
		return true 
	end 
end)
