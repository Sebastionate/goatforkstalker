RECIPE.name = "Geiger Counter"
RECIPE.description = "Dig through some spare electronics and use some replacement parts to fashion a Geiger Counter. Shouldn't leave home without one!"
RECIPE.model = "models/illusion/eftcontainers/geigercounter.mdl"
RECIPE.category = "Electronics"
RECIPE.requirements = {
["wire"] = 2,
["capacitors"] = 2,
["resistors"] = 2,
["sparelectronics"] = 2,
}


RECIPE.results = {
	["geigercounter"] = 1

}

RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetSkill("mechanic", 0) < 5) then 
		return false
	else
		return true 
	end 
end)
