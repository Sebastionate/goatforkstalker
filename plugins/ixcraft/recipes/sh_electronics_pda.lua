RECIPE.name = "Repair Damaged PDA"
RECIPE.description = "Restore a busted PDA to functionality - though its storage is wiped as a result."
RECIPE.model = "models/kek1ch/dev_pda.mdl"
RECIPE.category = "Electronics"
RECIPE.requirements = {
	["wire"] = 2,
	["capacitors"] = 2,
	["resistors"] = 2,
	["spareelectronics"] = 1,
	["damagedpda"] = 1,
}


RECIPE.results = {
	["pda"] = 1

}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetSkill("mechanic", 0) < 5) then 
		return false
	else
		return true 
	end 
end)

