RECIPE.name = "Flesh Chili"
RECIPE.description = "Blend Flesh meat, tomato sauce, and kidney beans into Chili. Makes four servings."
RECIPE.model = "models/arskvshborsch/borsch.mdl"
RECIPE.category = "Cooking"

RECIPE.requirements = {
	["cannedtomatoes"] = 1,
	["cannedbeans"] = 1,
	["fleshmeatraw"] = 1,
	["seasoning"] = 1,
}

RECIPE.tools = {"ironpot"}

RECIPE.results = {
["chili"] = 4
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

