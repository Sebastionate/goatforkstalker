RECIPE.name = "Stalker Stew"
RECIPE.description = "Create a large pot's worth of tasteful Stew for yourself and affilates. Makes eight servings."
RECIPE.model = "models/props_c17/metalpot001a.mdl"
RECIPE.category = "Cooking"

RECIPE.requirements = {
	["waterclean"] = 1,
	["dogmeatraw"] = 1,
	["cannedchilibeans"] = 1,
	["cannedcorn"] = 1,
	["cannedpeas"] = 1,
	["cannedtomato"] = 1,
	["cannedbeef"] = 1,
	["seasoning"] = 1,
	["tourist"] = 1,
}

RECIPE.tools = {"ironpot"}

RECIPE.results = {
["stalkerstew"] = 8
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

