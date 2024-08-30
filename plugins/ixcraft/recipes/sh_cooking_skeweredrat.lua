RECIPE.name = "Tushkebab"
RECIPE.description = "Roast Tushkano meat in canned tomato chunks and its sauce."
RECIPE.model = "models/shampur.mdl"
RECIPE.category = "Cooking"

RECIPE.requirements = {
	["cannedtomatoes"] = 1,
	["ratmeatraw"] = 2
}

RECIPE.tools = {"ironpot"}

RECIPE.results = {
["skeweredrat"] = 1
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

