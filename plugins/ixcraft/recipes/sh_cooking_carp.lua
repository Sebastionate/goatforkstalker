RECIPE.name = "Roast Carp Fillet"
RECIPE.description = "Fillet and Cook a Carp."
RECIPE.model = "models/mosi/fnv/props/food/geckosteak.mdl"
RECIPE.category = "Cooking"

RECIPE.requirements = {
	["fishraw"] = 1
}

RECIPE.tools = {"ironpot"}

RECIPE.results = {
["cookecarp"] = 2
}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("sent_vj_fireplace")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 100) then
			return true
		end
	end
	
	return false, "Must be near a Campfire"
end)

