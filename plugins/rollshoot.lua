PLUGIN.name = "Roll Shoot"
PLUGIN.author = "Scrat Knapp"
PLUGIN.description = "Adds automatic skill rolling when you fire a cweapon."

function PLUGIN:EntityFireBullets(entity, bulletInfo)
	local weaponItem = entity:GetActiveWeapon().ixItem
	if (not weaponItem and weaponItem.isCW) then return end

	entity:Notify("You fired a weapon")
end