RECIPE.name = "Brew Vodka"
RECIPE.description = "Shottily ferment potatoes with yeast and water into a strong liquor."
RECIPE.model = "models/ethprops/consumable/flask_water.mdl"
RECIPE.category = "Cooking"

RECIPE.requirements = {
	["yeast"] = 1,
	["waterclean"] = 1,
	["potato"] = 3,
}

RECIPE.tools = {"ironpot",
	"bootlegger",}

RECIPE.results = {
["vodka2"] = 3
}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("sent_vj_fireplace")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 100) then
			return true
		end
	end
	
	return false, "Must be near a Campfire"
end)

