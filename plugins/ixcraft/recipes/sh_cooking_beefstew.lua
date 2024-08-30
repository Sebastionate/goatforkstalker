RECIPE.name = "Beef Stew"
RECIPE.description = "Blend various meats and spices into a delicious meal. Makes four servings."
RECIPE.model = "models/mosi/fnv/props/food/strangemeatpie.mdl"
RECIPE.category = "Cooking"

RECIPE.requirements = {
	["seasoning"] = 1,
	["cannedbeef"] = 1,
	["boarmeatraw"] = 1,
	["seasoning"] = 1,
}

RECIPE.tools = {"ironpot"}

RECIPE.results = {
["beefstew"] = 4
}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)

	if (client:GetCharacter():GetSkill("survival", 0) < 5) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("sent_vj_fireplace")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 100) then
			return true
		end
	end
	
	return false, "Must be near a Campfire"
end)

