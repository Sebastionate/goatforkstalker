RECIPE.name = "Fry Tushkano Bits"
RECIPE.description = "Sauce, slice, and fry Tushkano chunks into a tasteful meal."
RECIPE.model = "models/mosi/fnv/props/food/antbits.mdl"
RECIPE.category = "Cooking"

RECIPE.requirements = {
	["firesyrup"] = 1,
	["ratmeatraw"] = 2,
	["flour"] = 1,
}

RECIPE.tools = {"ironpot"}

RECIPE.results = {
["friedtushbits"] = 2
}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("sent_vj_fireplace")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 100) then
			return true
		end
	end
	
	return false, "Must be near a Campfire"
end)

