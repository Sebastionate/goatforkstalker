RECIPE.name = "Brew Beer"
RECIPE.description = "Shottily ferment watery canned corn with yeast and flour into cheap beer."
RECIPE.model = "models/mosi/fnv/props/drink/alcohol/beer.mdl"
RECIPE.category = "Cooking"

RECIPE.requirements = {
	["yeast"] = 1,
	["flour"] = 1,
	["cannedcorn"] = 1,
}

RECIPE.tools = {"ironpot",
	"bootlegger",}

RECIPE.results = {
["zonebeer"] = 5
}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("sent_vj_fireplace")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 100) then
			return true
		end
	end
	
	return false, "Must be near a Campfire"
end)

