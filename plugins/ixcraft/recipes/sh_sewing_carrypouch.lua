RECIPE.name = "Carry Pouch"
RECIPE.description = "Create a simple carrying pouch with basic materials."
RECIPE.model = "models/items/jewels/purses/big_purse.mdl"
RECIPE.category = "Sewing"

RECIPE.requirements = {
["clothscrap"] = 2,
["thread"] = 1
}

RECIPE.results = {
	["pouch1"] = 1

}

RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetSkill("mechanic", 0) < 5) then 
		return false
	else
		return true 
	end 
end)

