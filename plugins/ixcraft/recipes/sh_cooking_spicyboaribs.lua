RECIPE.name = "Cook Spicy Boar Ribs"
RECIPE.description = "Sauce, slice, and roast Boar ribs into a tasteful meal."
RECIPE.model = "models/mosi/fnv/props/food/fireantbits.mdl"
RECIPE.category = "Cooking"

RECIPE.requirements = {
	["firesyrup"] = 1,
	["boarmeatraw"] = 1,
	["seasoning"] = 1,
}

RECIPE.tools = {"ironpot"}

RECIPE.results = {
["spicyboaribs"] = 2
}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("sent_vj_fireplace")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 100) then
			return true
		end
	end
	
	return false, "Must be near a Campfire"
end)

