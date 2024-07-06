PLUGIN.name = "Health and Damage"
PLUGIN.description = "Adds script HP and commands to apply damage."
PLUGIN.author = "Scrat Knapp"

ix.char.RegisterVar("currenthp", {
  field = "currenthp",
  fieldType = ix.type.number,
  default = 100,
  isLocal = true,
  bNoDisplay = true
})

ix.char.RegisterVar("maxhp", {
  field = "maxhp",
  fieldType = ix.type.number,
  default = 100,
  isLocal = true,
  bNoDisplay = true
})

ix.char.RegisterVar("maxhpboost", {
  field = "maxhpboost",
  fieldType = ix.type.number,
  default = 0,
  isLocal = true,
  bNoDisplay = true
})

ix.command.Add("GetResistance", {
	description = "Get total given resistance for character",
	adminOnly = true,
	arguments = {
		ix.type.character,
		ix.type.string,
    bit.bor(ix.type.bool, ix.type.optional)
	},
	OnRun = function(self, client, target, key, headonly)

    key = string.lower(key)
    key = key:gsub("^%l", string.upper)
		
    local resistance = target:GetResistance(key, headonly)



    return target:GetName() .. " has " .. resistance*100 .. "% resistance for " .. key .. "."
		
	end
})

ix.command.Add("Damage", {
	description = "Inflict non-bullet damage on a player.",
	adminOnly = true,
	arguments = {
		ix.type.character,
		ix.type.string,
    ix.type.number,
    bit.bor(ix.type.bool, ix.type.optional)
	},
	OnRun = function(self, client, target, damagetype, damage, headonly)

    damagetype = string.lower(damagetype)
    damagetype = damagetype:gsub("^%l", string.upper)


    local targethead = ""
    if headonly then targethead = " to the head" end

    target:GetPlayer():Notify("You're hit with " .. damage .. " " .. damagetype .. " damage " targethead .. "!"  )

    local resistance = target:GetResistance(damagetype, headonly)

    target:GetPlayer():Notify("Your protection reduces the damage by " .. resistance*100 .. "%!")
    
    damage = damage * (1 - resistance)
    damage = math.floor(damage)

    target:GetPlayer():Notify("You take " .. damage .. " damage!")


    target:AdjustHealth(hurt, damage)

		
	end
})


local charMeta = ix.meta.character

function charMeta:GetTotalHp()
  return self:Getmaxhp() + self:Getmaxhpboost()
end

function charMeta:GetResistance(key, headonly)

  local resistances = {
    [key] = 0
  }

  local inventory = self:GetInventory()

  for k, v in pairs (inventory:GetItems()) do
    if(!v:GetData("equip", false)) then continue end --ignores unequipped items
    if headonly and v.isBodyArmor then continue end -- Ignores body armor if set to only check for head protection (artifacts affect your full body)

    local res = v.res
    if res and res[key] then
      resistances[key] = resistances[key] + res[key] 
    end

  end

  if resistances[key] > 0.85 then resistances[key] = 0.85 end 

  
  return resistances[key]
end 

function charMeta:AdjustHealth(type, amount)
  local char = self
  local player = self:GetPlayer()

  -- A player is considered staggered if they're at or below 80% HP, Stunned if at or below 40% HP, and Incapped at 0% HP. Find out what these tresholds are by comparing them to player's max hp.
  maxhp = self:GetTotalHp()
  stagger = maxhp * 0.80
  stun = maxhp * 0.40
  incap = 0

  -- If hurt, reduce player HP by damage amount. If the amount would drop them below 0, put them to zero as we don't use negative HP here. Script HP already has this in place.
  if type == "hurt" then
      char:Setcurrenthp(char:Getcurrenthp() - amount)
      if char:Getcurrenthp() < 0 then char:Setcurrenthp(0) end
      player:SetHealth(player:Health() - amount)
  end 

  -- If heal, increase player HP by damage amount. If the amount would put them above their current maximum, just set them to the maximum as we don't use overheals here.
  if type == "heal" then
      if (char:Getcurrenthp() + amount > player:GetTotalHp()) then
          char:Setcurrenthp(player:GetTotalHp())
          player:SetHealth(player:GetTotalHp())
      else
          char:Setcurrenthp(char:Getcurrenthp() + amount)
          player:SetHealth(player:Health() + amount)
      end
  end 

  newhp = char:Getcurrenthp()

  -- Based on new health after hurt/heal, give a status message and apply debuffs to stats. If health goes down, remove lighter debuffs and replace with worse ones. As health goes up, reduce 

  if newhp == 0 then
      player:Notify("You're incapacitated and unable to fight, requiring stabilization.")

      if type == "heal" then
          ix.log.Add(client, "damage", char, "healed", amount, "and is currently Incapacitated.")
      else
          ix.log.Add(client, "damage", char, "taken", amount, "and is currently Incapacitated.")
      end 

      char:AddBoost("incap", "fortitude", -4)
      char:AddBoost("incap", "reflex", -4)
      char:AddBoost("incap", "observation", -4)
      char:AddBoost("incap", "strength", -4)

      char:RemoveBoost("stun", "fortitude")
      char:RemoveBoost("stun", "reflex")
      char:RemoveBoost("stun", "observation")
      char:RemoveBoost("stun", "strength")
      return

  elseif newhp <= stun then
      player:Notify("You're stunned by incoming damage and take a notable hit to your stats.")
   
      if type == "heal" then
          ix.log.Add(client, "damage", char, "healed", amount, "and is currently Stunned.")
      else
          ix.log.Add(client, "damage", char, "taken", amount, "and is currently Stunned.")
      end 

      char:AddBoost("stun", "fortitude", -3)
      char:AddBoost("stun", "reflex", -3)
      char:AddBoost("stun", "observation", -3)
      char:AddBoost("stun", "strength", -3)

      char:RemoveBoost("stagger", "fortitude")
      char:RemoveBoost("stagger", "reflex")
      char:RemoveBoost("stagger", "observation")
      char:RemoveBoost("stagger", "strength")
      
      char:RemoveBoost("incap", "fortitude")
      char:RemoveBoost("incap", "reflex")
      char:RemoveBoost("incap", "observation")
      char:RemoveBoost("incap", "strength")
      
      return

  elseif newhp <= stagger then
      player:Notify("You're staggered by incoming damage and take a slight hit to your stats.")
     
      if type == "heal" then
          ix.log.Add(client, "damage", char, "healed", amount, "and is currently Staggered.")
      else
          ix.log.Add(client, "damage", char, "taken", amount, "and is currently Staggered.")
      end 

      char:AddBoost("stagger", "fortitude", -1)
      char:AddBoost("stagger", "reflex", -1)
      char:AddBoost("stagger", "observation", -1)
      char:AddBoost("stagger", "strength", -1)

      char:RemoveBoost("incap", "fortitude")
      char:RemoveBoost("incap", "reflex")
      char:RemoveBoost("incap", "observation")
      char:RemoveBoost("incap", "strength")
      
      char:RemoveBoost("stun", "fortitude")
      char:RemoveBoost("stun", "reflex")
      char:RemoveBoost("stun", "observation")
      char:RemoveBoost("stun", "strength")
  
      return

  else
      if type == "heal" then
          ix.log.Add(client, "damage", char, "healed", amount, ".")
      else
          ix.log.Add(client, "damage", char, "taken", amount, ".")
      end 

      char:RemoveBoost("incap", "fortitude")
      char:RemoveBoost("incap", "reflex")
      char:RemoveBoost("incap", "observation")
      char:RemoveBoost("incap", "strength")
      
      char:RemoveBoost("stun", "fortitude")
      char:RemoveBoost("stun", "reflex")
      char:RemoveBoost("stun", "observation")
      char:RemoveBoost("stun", "strength")

      char:RemoveBoost("stagger", "fortitude")
      char:RemoveBoost("stagger", "reflex")
      char:RemoveBoost("stagger", "observation")
      char:RemoveBoost("stagger", "strength")
  end 
end 






