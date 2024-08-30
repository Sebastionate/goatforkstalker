RECIPE.name = "Brew Hot Chocolate"
RECIPE.description = "Brew up some Hot Chocolate, makes about four mugs worth."
RECIPE.model = "models/mosi/fnv/props/junk/coffeemug.mdl"
RECIPE.category = "Cooking"

RECIPE.requirements = {
	["condensedmilk"] = 1,
	["alenka"] = 1,
	["cleanwater"] = 1
}

RECIPE.tools = {"kettle"}

RECIPE.results = {
["cupcoffee"] = 4
}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("st_vj_fireplace2")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 100) then
			return true
		end
	end
	
	return false, "Must be near a Campfire"
end)

