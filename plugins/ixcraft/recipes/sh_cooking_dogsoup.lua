RECIPE.name = "Dog Soup"
RECIPE.description = "Cook up some.. delicious... dog soup!"
RECIPE.model = "models/kek1ch/meat_dog.mdl"
RECIPE.category = "Cooking"

RECIPE.requirements = {
	["waterclean"] = 2,
	["dogmeatraw"] = 2
}

RECIPE.tools = {"ironpot"}

RECIPE.results = {
["roasteddog"] = 1
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

