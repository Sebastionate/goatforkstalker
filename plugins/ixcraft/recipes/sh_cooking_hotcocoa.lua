RECIPE.name = "Brew Hot Chocolate"
RECIPE.description = "Brew up some Hot Chocolate, makes about four mugs worth."
RECIPE.model = "models/mosi/fnv/props/junk/coffeemug.mdl"
RECIPE.category = "Cooking"

RECIPE.requirements = {
	["condensedmilk"] = 1,
	["alenka"] = 1,
	["waterclean"] = 1
}

RECIPE.tools = {"kettle"}

RECIPE.results = {
["cuphotchocolate"] = 4
}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("sent_vj_fireplace")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 100) then
			return true
		end
	end
	
	return false, "Must be near a Campfire"
end)

