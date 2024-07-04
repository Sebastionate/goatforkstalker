PLUGIN.name = "Roll Shoot"
PLUGIN.author = "Scrat Knapp"
PLUGIN.description = "Adds automatic skill rolling when you fire a cweapon."
PLUGIN.rollshoot = 0

ix.command.Add("togglecombat", {
    description = "Mark whether you're in Combat or not.",
    OnRun = function(self, client )
        
		if client:GetData("inCombat", false) == true then
			client:SetData("inCombat", false) 
			client:SetData("shotsfired", 0)
			client:Notify("You've set yourself as Out Of Combat.")
		else
			client:SetData("inCombat", true )
			client:Notify("You've set yourself as In Combat.")
		end

    end
} )

if (CLIENT) then return end 

function PLUGIN:WeaponFired(entity)

	if entity:GetData("inCombat", false) == false then return end

	local swep = entity:GetActiveWeapon()

	if (not swep and swep.isCW) then return end

	local weaponItem
	local wepclass = swep:GetClass()

	for k,v in pairs(entity:GetChar():GetInv():GetItems()) do
		if v.isPLWeapon then
			if v:GetData("equip",false) == true then
				if wepclass == v.class then
					weaponItem = v
				end
			end
		end
	end

	
	local distance = self:GetEntityTarget(entity)

	local scope = "No Scope"
	local atts = weaponItem:GetData("attachments")

	if atts then
		for k,v in pairs(atts) do
			local attItem = ix.item.list[v[1]]
			if attItem.scopetype == "med" then
				scope = "Has Scope"
			end
		end
	end


	local shotsfired = entity:GetData("shotsfired", 0) + 1

	entity:SetData("shotsfired", shotsfired)


	if (weaponItem.RPM) then 
		if shotsfired >= weaponItem.RPM then entity:Notify("You've fired your maximum RPM for your current weapon.") end 
	end 
	

	local shotsleft = swep:Clip1() - 1
	local capacity = swep.Primary["ClipSize"]

	local ammotype = swep.Primary["Ammo"]

	entity:Notify("You fired a " .. weaponItem:GetName() .. ". " .. shotsleft .. "/" .. capacity .."shots left. Target:" .. distance .. "m "  .. scope .. "Shots Fired:  " ..  shotsfired)
end 


function PLUGIN:GetEntityTarget(entity)
	local startPos = entity:GetPos()
	local endPos = entity:GetEyeTrace().HitPos
	local target = entity:GetEyeTrace().Entity
	local distance = endPos:Distance(startPos)
	distance =  distance - (distance % 1)
	distance = (distance / 39.3701) 
	distance =  distance - (distance % 1)
	return distance 
end 



function PLUGIN:PlayerWeaponChanged(client, weapon)

	-- Reset count of how many times player has fired if they switch weaponry
	client:SetData("shotsfired", 0)

end 



