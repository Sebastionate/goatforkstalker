RECIPE.name = "Vegetable Stew"
RECIPE.description = "Blend various canned vegetables into a delicious meal. Makes four servings."
RECIPE.model = "models/arskvshborsch/borsch.mdl"
RECIPE.category = "Cooking"

RECIPE.requirements = {
	["cannedcorn"] = 1,
	["cannedpeas"] = 1,
	["cannedtomato"] = 1,
	["seasoning"] = 1,
}

RECIPE.tools = {"ironpot"}

RECIPE.results = {
["vegetablestew"] = 4
}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)

	if (client:GetCharacter():GetSkill("survival", 0) < 5) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("st_vj_fireplace2")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 100) then
			return true
		end
	end
	
	return false, "Must be near a Campfire"
end)

