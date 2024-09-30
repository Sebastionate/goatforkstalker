RECIPE.name = "RPK-74M"
RECIPE.description = "Modernize an RPK-74 with new synthetic parts."
RECIPE.model = "models/weapons/ethereal/w_f_rpk74m.mdl"
RECIPE.category = "Basic Gunsmithing"
RECIPE.toolkits = {
    "gunkitbasic",
    "gunkitadvanced",
    "gunkitexpert"
}
RECIPE.flag = "7"

RECIPE.requirements = {
    ["rpk74"] = 1,
    ["weaponpartswarsawrifle"] = 2,
    ["screws"] = 2,
}

RECIPE.results = {
	["rpk74m"] = 1

}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)

	local gun = client:GetCharacter():GetInventory():HasItem("rpk74")
    if (gun) then
        if (gun:GetData("durability") < 8000) then
            return false, "Base gun must be at least 80 percent condition"
        end
    end
		
end)