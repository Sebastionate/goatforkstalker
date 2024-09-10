RECIPE.name = "Fiery Syrup Sauce"
RECIPE.description = "Simmer Hot Sauce, sugar, and various seasonings together to make a very tasteful sauce."
RECIPE.model = "models/mosi/fnv/props/food/bloodpaste.mdl"
RECIPE.category = "Cooking"

RECIPE.requirements = {
["hotsauce"] = 1,
["sugar"] = 1,
["seasoning"] = 1
}

RECIPE.tools = {"ironpot"}

RECIPE.results = {
["firesyrup"] = 3
}


RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("sent_vj_fireplace")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 100) then
			return true
		end
	end
	
	return false, "Must be near a Campfire"
end)

