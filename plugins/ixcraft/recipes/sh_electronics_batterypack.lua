RECIPE.name = "Battery Pack"
RECIPE.description = "Wire two regular AA batteries together to form a makeshift battery pack for electronic devices."
RECIPE.model = "models/black1dez/olr/dez_item_battery_02.mdl"
RECIPE.category = "Electronics"
RECIPE.requirements = {
	["wire"] = 1,
	["aabattery"] = 2,
}

RECIPE.results = {
	["batterypack"] = 1

}

RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetSkill("mechanic", 0) < 5) then 
		return false
	else
		return true 
	end 
end)
