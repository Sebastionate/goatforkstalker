RECIPE.name = "Tactical Belt"
RECIPE.description = "Create a tactical belt for holding stuff safely and securely."
RECIPE.model = "models/weapons/upgrades/a_sling_ithaca_reparented.mdl"
RECIPE.category = "Sewing"


RECIPE.requirements = {
["kevlarscrap"] = 3,
["rubberscrap"] = 2,
["thread"] = 3
}

RECIPE.results = {
	["belt3"] = 1

}

RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetSkill("mechanic", 0) < 15) then 
		return false
	else
		return true 
	end 
end)
