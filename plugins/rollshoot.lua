PLUGIN.name = "Roll Shoot"
PLUGIN.author = "Scrat Knapp"
PLUGIN.description = "Adds automatic skill rolling when you fire a cweapon."



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

ix.command.Add("toggleoverwatch", {
    description = "Mark whether you're on Overwatch or not.",
    OnRun = function(self, client )
        
		if client:GetData("overwatch", false) == true then
			client:SetData("overwatch", false) 
			client:Notify("You've set yourself as no longer on Overwatch.")
		else
			client:SetData("overwatch", true )
			client:Notify("You've set yourself as on Overwatch.")
		end

    end
} )

ix.command.Add("RollshootDetails", {
    description = "Toggle whether you want to see extra details about your shots, for debugging or your own interest.",
    OnRun = function(self, client )
        
		if client:GetData("rollshootDetails", false) == true then
			client:SetData("rollshootDetails", false) 
			client:Notify("You'll now just see the results of your shots.")
		else
			client:SetData("rollshootDetails", true )
			client:Notify("You'll receive additional data about your shots.")
		end

    end
} )

ix.command.Add("CharJamGun", {
    description = "Toggle a forced mechanical failure on character's next shot.",
	adminOnly = true,
	arguments = {
		ix.type.character,
	},
    OnRun = function(self, client, target)
		local player = target:GetPlayer()
		local weaponItem = player:GetActiveWeaponItem()

		if weaponItem:GetData("jammed") then 
			weaponItem:SetData("jammed", false)
			client:Notify("Unjammed gun wielded by " .. target:GetName())
		else
			weaponItem:SetData("jammed", true)
			client:Notify("Forced a jam on gun wielded by " .. target:GetName())
		end

    end
} )

ix.command.Add("Unjam", {
    description = "Clear a mechanical failure on your firearm - if it has one.",
    OnRun = function(self, client)
		local weaponItem = client:GetActiveWeaponItem()

		if not weaponItem then return "You don't have a weapon capable of mechanical failures equipped." end 

		if weaponItem:GetData("jammed") then 
			weaponItem:SetData("jammed", false)
			ix.chat.Send(client, "gunjamclear", "", nil, nil)
			ix.log.Add(client, "gunJamClear")
			client:EmitSound("weapons/firearms/rifle_sako85/sako_boltopen.wav")
		else
			client:Notify("Your weapon isn't jammed!")
		end

    end
} )

ix.chat.Register("rollshoot", {
    format = "** %s fires their %s (%s/%s) %s: %s at %s distance target %s %s",
    color = Color(155, 111, 176),
    CanHear = ix.config.Get("chatRange", 280) * 2,
    deadCanChat = true,
    OnChatAdd = function(self, speaker, text, bAnonymous, data)
        local weaponname = data.weaponname
		local clip = data.clip
		local capacity = data.capacity
		local specialammo = data.specialammo
		local total = data.total
		local range = data.range
		local crit = data.crit
		local target = data.target

		if not target then target = "" end 
        local translated = L2(self.uniqueID.."Format", speaker:Name(), text)

        chat.AddText(self.color, translated and "** "..translated or string.format(self.format,speaker:Name(), weaponname, clip, capacity, specialammo, total, range, crit, target))
    end
})

ix.chat.Register("gunjam", {
    format = "** %s tries to fire their weapon, but it jams!",
    color = Color(155, 111, 176),
    CanHear = ix.config.Get("chatRange", 280) * 2,
    deadCanChat = true,
    OnChatAdd = function(self, speaker, text, bAnonymous, data)
        chat.AddText(self.color, translated and "** "..translated or string.format(self.format,speaker:Name()))
    end
})

ix.chat.Register("gunjamclear", {
    format = "** %s clears the mechanical failure on their firearm.",
    color = Color(155, 111, 176),
    CanHear = ix.config.Get("chatRange", 280) * 2,
    deadCanChat = true,
    OnChatAdd = function(self, speaker, text, bAnonymous, data)
        chat.AddText(self.color, translated and "** "..translated or string.format(self.format,speaker:Name()))
    end
})

if (SERVER) then
    ix.log.AddType("rollShoot", function(client, weaponname, clip, capacity, specialammo, total, range, crit, target)
		if not target then target = "" end 
        return string.format("%s fires their %s (%s/%s) %s: %s at %s distance target %s %s", client:Name(), weaponname, clip, capacity, specialammo, total, range, crit, target)
    end)

	ix.log.AddType("gunJam", function(client)
        return string.format("%s tried to fire, but their gun is jammed.", client:Name())
    end)

	ix.log.AddType("gunJamClear", function(client)
        return string.format("** %s clears the mechanical failure on their firearm.", client:Name())
    end)
end

if (CLIENT) then return end 

function PLUGIN:WeaponFired(entity)

	if entity:GetData("inCombat", false) == false then return end



	

	local swep = entity:GetActiveWeapon()

	if (not swep and not swep.isCW) then return end

	

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

	
	if weaponItem.noRoll then return end

	local weaponcategory = weaponItem.weaponType or "rifles"




	if weaponItem:GetData("jammed") then 
		ix.chat.Send(entity, "gunjam", "", nil, nil)
		ix.log.Add(entity, "gunJam")
		return 
	end 
	local weapondura = weaponItem:GetData("durability", 10000)
	weapondura = math.Round(weapondura/100)

	-- Poor mans way of making sure a gun never jams at 80% or above without messing with conditionals
	if weapondura >= 80 then weapondura = 100 end 

	if weapondura < math.random(1, 100) then 
		weaponItem:SetData("jammed", true)
	end 





	


	local distance = self:GetEntityTarget(entity)
	
	local range = self:MetersToRange(distance)

	

	local scope
	local grip
	local laser
	local atts = weaponItem:GetData("attachments")
	if atts then
		for k,v in pairs(atts) do
			local attItem = ix.item.list[v[1]]
			if attItem.scopetype == "short" then scope = "short" 
			elseif attItem.scopetype == "medium" then scope = "medium" 
			elseif attItem.scopetype == "long" then scope = "long"
			elseif attItem.isGrip then grip = true
			elseif attItem.isLaser  then laser = true 
			end 
		end
	end
	local scopebonus = 0



	if scope then scopebonus = self:GetScopeBonus(range, scope) end 

	
	local critical = ""
	local value = math.random(1, 20)
	if value == 1 then critical = "!CRIT FAIL!" elseif value == 20 then critical = "!CRIT SUCCESS!" end
	local skillbonus = entity:GetChar():GetSkill(weaponcategory, 0)

	if entity:GetChar():GetData("usingRadioprotectant") then skillbonus = skillbonus - 5 end 


	if entity:GetChar():HasTrait("injury_arm1") then skillbonus = skillbonus - 5 end 
	if entity:GetChar():HasTrait("injury_arm3") then skillbonus = skillbonus - 5 end 

	if entity:GetChar():HasTrait("injury_arm2") and weaponcategory ~= "smallarms" then 
		entity:GetChar():AdjustHealth("hurt", math.random(1, 4))
		entity:Notify("You agitate your damaged arm by firing with a weapon that is not a smallarm!")
	end 

	local ammotype = swep.Primary["Ammo"]
	local ammobonus = 0
	local specialammo = ""
	if string.find(ammotype, "-MG-") then ammobonus = 3 specialammo = "using Match Ammo" end
	if string.find(ammotype, "-ZL-") then ammobonus = -2 specialammo = "using Zone-Loaded Ammo" end
	if string.find(ammotype, "-AP-") then ammobonus = 0 specialammo = "using Armor Piercing Ammo" end
	if string.find(ammotype, "-HP-") then ammobonus = 0 specialammo = "using Hollow Point Ammo" end

	local rofboost = 0
	local recoilboost = 0
	local accuracyboost = 0
	local atts = weaponItem:GetData("upgrades")
	if atts then
		for k,v in pairs(atts) do
			local upgItem = ix.item.list[v[1]]
			if upgItem.rofBoost then rofboost = rofboost + upgItem.rofBoost end 
			if upgItem.recoilBoost then recoilboost = recoilboost + upgItem.recoilBoost end
			if upgItem.accuracyBoost then accuracyboost = accuracyboost + upgItem.accuracyBoost end 
			
		end
	end

	local recoildebuff = 0
	if (weaponItem.recoil) then 
		recoil = weaponItem.recoil

		if grip then recoil = recoil + 1 end
		if entity:GetData("overwatch") then recoil = recoil - 4 end
		if entity:GetData("overwatch") and laser then recoil = recoil + 2 end

		recoil = recoil + recoilboost

		recoildebuff = recoil * entity:GetData("shotsfired", 0)

	end 




	local totalamount = value + skillbonus + scopebonus + ammobonus + recoildebuff + accuracyboost
	




	local shotsfired = entity:GetData("shotsfired", 0) + 1
	entity:SetData("shotsfired", shotsfired)
	if (weaponItem.RPM) then 

		local RPM = weaponItem.RPM + rofboost


		if shotsfired >= RPM then entity:Notify("You've fired your maximum RPM for your current weapon.") end 
	end 
	local shotsleft = swep:Clip1() - 1
	local capacity = swep.Primary["ClipSize"]

	local target 

	local shootingCent = entity:GetEyeTrace().Entity

	
	if IsValid(shootingCent) and shootingCent.combatEntity then 
		target = shootingCent:Name()
	end 

	

	ix.chat.Send(entity, "rollshoot", tostring(value), nil, nil, {
		weaponname = weaponItem:GetName(),
		clip = shotsleft,
		capacity = capacity,
		specialammo = specialammo,
		total = totalamount,
		range = range,
		crit = critical,
		target = target

	})
	ix.log.Add(entity, "rollShoot", weaponItem:GetName(), shotsleft, capacity, specialammo, totalamount, range, critical, target)


	

	if entity:GetData("rollshootDetails") == true then
		local shotinfo = ""
		shotinfo = shotinfo .. "\nInitial Roll: " .. value
		shotinfo = shotinfo .. "\nSkill Bonus: " .. skillbonus
		shotinfo = shotinfo .. "\nScope Bonus: " .. scopebonus
		shotinfo = shotinfo .. "\nAmmo Bonus: " .. ammobonus
		shotinfo = shotinfo .. "\nRecoil Debuff: " .. recoildebuff
		if accuracyboost ~= 0 then shotinfo = shotinfo .. "\nAccuracy Boost: " .. accuracyboost end

		entity:Notify(shotinfo)
	end 
	

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

function PLUGIN:MetersToRange(distance)
	local range

	if distance < 15 then range = "Short"
		elseif distance > 15 and distance < 44 then range = "Medium"
		elseif distance >= 44 and distance < 74 then range = "Long"
		elseif distance >= 74 and distance < 125 then range = "Very Long"
		elseif distance >= 125 then range = "Extreme"
		end 

	return range
end 



function PLUGIN:GetScopeBonus(range, scope)
	local bonus = 0
	range = string.lower(range)

	-- Short scopes (sights, red dots with no zoom) provide +4 bonus to Short Range only
	-- Medium scopes with some magnification (ACOG) provide +2 bonus to Short and Medium range
	-- Long scopes (PU scope, Leupold) provide +4 bonus to Long, +3 to Very Long, +2 to Long, +2 to Medium, and -4 to Short 

	if range == "short" and scope == "short" then bonus = 4 
	elseif range == "short" and scope == "medium" then bonus = 2
	elseif range == "short" and scope == "long" then bonus = -4
	elseif range == "medium" and scope == "medium" then bonus = 2
	elseif range == "long" and scope == "long" then bonus = 4
	elseif range == "very long" and scope == "long" then bonus = 3
	elseif range == "extreme" and scope == "long" then bonus = 2
	end 
	return bonus
end 


function PLUGIN:PlayerWeaponChanged(client, weapon)
	-- Reset count of how many times player has fired if they switch weaponry
	client:SetData("shotsfired", 0)
end 


local playerMeta = FindMetaTable("Player")


function playerMeta:GetActiveWeaponItem()

	local swep = self:GetActiveWeapon()
	if not swep then return false end 
	local weaponItem
	local wepclass = swep:GetClass()

	for k,v in pairs(self:GetChar():GetInv():GetItems()) do
		if v.isPLWeapon then
			if v:GetData("equip",false) == true then
				if wepclass == v.class then
					weaponItem = v
				end
			end
		end
	end

	return weaponItem


	

end 

--[[ function playerMeta:CanShootWeapon()
	local swep = self:GetActiveWeapon()
	if not swep then return true end 
	local weaponItem = self:GetActiveWeaponItem()

	if weaponItem and weaponItem:GetData("jammed", false) then 
		return false
	else 
		return self:GetNetVar("canShoot", true)
	end 
end  ]]






