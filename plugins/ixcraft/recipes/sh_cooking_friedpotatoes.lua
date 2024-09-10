RECIPE.name = "Fry Potatoes"
RECIPE.description = "Slice, season, and fry up some potatoes."
RECIPE.model = "models/mosi/fnv/props/food/alienfood03.mdl"
RECIPE.category = "Cooking"

RECIPE.requirements = {
	["potato"] = 1,
	["seasoning"] = 1
}

RECIPE.tools = {"ironpot"}

RECIPE.results = {
["friedpotatoes"] = 2
}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("sent_vj_fireplace")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 100) then
			return true
		end
	end
	
	return false, "Must be near a Campfire"
end)

