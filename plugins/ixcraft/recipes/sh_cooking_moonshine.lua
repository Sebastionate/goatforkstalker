RECIPE.name = "Brew Moonshine"
RECIPE.description = "Shottily ferment sugar with yeast and water into a very strong liquor."
RECIPE.model = "models/mosi/fnv/props/drink/alcohol/moonshine.mdl"
RECIPE.category = "Cooking"

RECIPE.requirements = {
	["yeast"] = 1,
	["waterclean"] = 1,
	["sugar"] = 1,
}

RECIPE.tools = {"ironpot",
	"bootlegger",}

RECIPE.results = {
["moonshine"] = 1
}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("sent_vj_fireplace")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 100) then
			return true
		end
	end
	
	return false, "Must be near a Campfire"
end)

