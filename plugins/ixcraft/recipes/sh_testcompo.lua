RECIPE.name = "Test Components"
RECIPE.description = "Expertly replace the busted bulb in your headlamp."
RECIPE.model = "models/jerry/headtorch.mdl"
RECIPE.category = "Repair"
RECIPE.requirements = {
	["aabatterycomp"] = 1,
}


RECIPE.results = {
	["bread"] = 1

}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
	local char = client:GetCharacter()
	local inventory = char:GetInventory()

	local hasenoughcomp

	local comps = inventory:GetItemsByUniqueID("aabatterycomp")

	for k, v in pairs (comps) do
		if v:GetData("quantity", 0) >= 15 then hasenoughcomp = true end 
	end 

	if hasenoughcomp then return true
	else return false, "You need at least 15 Batteries to make this."
	end 


	
	
end)


RECIPE:PreHook("OnCraft", function(recipeTable, client)
	
	local modifyitem
	local inventory = client:GetCharacter():GetInventory()
	local comps = inventory:GetItemsByUniqueID("aabatterycomp")

	for k, v in pairs (comps) do
		if v:GetData("quantity", 0) > 15 then modifyitem = v break end 
	end 

	

	if modifyitem then 
		local newcompositemquant = modifyitem:GetData("quantity") - 15
		local inv = client:GetCharacter():GetInventory()
		inv:Add("aabatterycomp", 1, {["quantity"] = newcompositemquant})
	end 
	
end)
