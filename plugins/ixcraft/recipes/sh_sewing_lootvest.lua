RECIPE.name = "Loot Vest"
RECIPE.description = "Create a cozy vest with all sorts of pockets for more stuff."
RECIPE.model = "models/stalker/outfit/bandit2.mdl"
RECIPE.category = "Sewing"


RECIPE.requirements = {
["clothscrap"] = 5,
["canvasscrap"] = 3,
["kevlarscrap"] = 1,
["thread"] = 2
}

RECIPE.results = {
	["vest2"] = 1

}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetSkill("mechanic", 0) < 10) then 
		return false
	else
		return true 
	end 
end)

