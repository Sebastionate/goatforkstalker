local PLUGIN = PLUGIN
PLUGIN.name = "Faction Reputation"
PLUGIN.author = "Scrat Knapp"
PLUGIN.desc = "A simple automated system for tracking faction reputation."

ix.char.RegisterVar("LonerRep", {
    field = "lonerrep",
    fieldType = ix.type.number,
    default = 0,
    isLocal = true,
    bNoDisplay = true
})

ix.char.RegisterVar("DutyRep", {
    field = "dutyrep",
    fieldType = ix.type.number,
    default = 0,
    isLocal = true,
    bNoDisplay = true
})

ix.char.RegisterVar("FreedomRep", {
    field = "freedomrep",
    fieldType = ix.type.number,
    default = 0,
    isLocal = true,
    bNoDisplay = true
})

ix.char.RegisterVar("ArmyRep", {
    field = "armyrep",
    fieldType = ix.type.number,
    default = -5,
    isLocal = true,
    bNoDisplay = true
})

ix.char.RegisterVar("EcoRep", {
    field = "ecorep",
    fieldType = ix.type.number,
    default = 0,
    isLocal = true,
    bNoDisplay = true
})

ix.char.RegisterVar("MobRep", {
    field = "mobrep",
    fieldType = ix.type.number,
    default = -5,
    isLocal = true,
    bNoDisplay = true
})


ix.char.RegisterVar("MercRep", {
    field = "mercrep",
    fieldType = ix.type.number,
    default = -5,
    isLocal = true,
    bNoDisplay = true
})



ix.command.Add("MyFactionRep", {
	description = "View your standing with established factions.",
	OnRun = function(self, client)
		local str = ""
        local char = client:GetCharacter()


        -- Loners --
        str = str .. "Loner: "
        if (char:GetLonerRep() <= -30) then
            str = str .. "Abysmal\n"
        end
        if (char:GetLonerRep() <= -15 and char:GetLonerRep() > -30) then
            str = str .. "Awful\n"
        end 
        if (char:GetLonerRep() < 0 and char:GetLonerRep() > -15) then
            str = str .. "Bad\n"
        end
        if (char:GetLonerRep() <= 4 and char:GetLonerRep() >= 0) then
            str = str .. "Neutral\n"
        end
        if (char:GetLonerRep() >= 5 and char:GetLonerRep() < 15)  then
            str = str .. "Good\n"
        end
        if (char:GetLonerRep() >= 15 and char:GetLonerRep() < 30)  then
            str = str .. "Great\n"
        end
        if (char:GetLonerRep() >= 30)   then
            str = str .. "Excellent\n"
        end
 
        -- Duty --
        str = str .. "Duty: "
        if (char:GetDutyRep() <= -30) then
            str = str .. "Abysmal\n"
        end
        if (char:GetDutyRep() <= -15 and char:GetDutyRep() > -30) then
            str = str .. "Awful\n"
        end 
        if (char:GetDutyRep() < 0 and char:GetDutyRep() > -15) then
            str = str .. "Bad\n"
        end
        if (char:GetDutyRep() <= 4 and char:GetDutyRep() >= 0) then
            str = str .. "Neutral\n"
        end
        if (char:GetDutyRep() >= 5 and char:GetDutyRep() < 15)  then
            str = str .. "Good\n"
        end
        if (char:GetDutyRep() >= 15 and char:GetDutyRep() < 30)  then
            str = str .. "Great\n"
        end
        if (char:GetDutyRep() >= 30)   then
            str = str .. "Excellent\n"
        end

        -- Freedom --
        str = str .. "Freedom: "
        if (char:GetFreedomRep() <= -30) then
            str = str .. "Abysmal\n"
        end
        if (char:GetFreedomRep() <= -15 and char:GetFreedomRep() > -30) then
            str = str .. "Awful\n"
        end
        if (char:GetFreedomRep() < 0 and char:GetFreedomRep() > -15) then
            str = str .. "Bad\n"
        end
        if (char:GetFreedomRep() <= 4 and char:GetFreedomRep() >=  0) then
            str = str .. "Neutral\n"
        end
        if (char:GetFreedomRep() >= 5 and char:GetFreedomRep() < 15)  then
            str = str .. "Good\n"
        end
        if (char:GetFreedomRep() >= 15 and char:GetFreedomRep() < 30)  then
            str = str .. "Great\n"
        end
        if (char:GetFreedomRep() >= 30)   then
            str = str .. "Excellent\n"
        end

        -- Army --
        str = str .. "Ukranian Military: "
        if (char:GetArmyRep() <= -30) then
            str = str .. "Abysmal\n"
        end
        if (char:GetArmyRep() <= -15 and char:GetArmyRep() > -30) then
            str = str .. "Awful\n"
        end
        if (char:GetArmyRep() < 0 and char:GetArmyRep() > -15) then
            str = str .. "Bad\n"
        end
        if (char:GetArmyRep() <= 4 and char:GetArmyRep() >= 0) then
            str = str .. "Neutral\n"
        end
        if (char:GetArmyRep() >= 5 and char:GetArmyRep() < 15)  then
            str = str .. "Good\n"
        end
        if (char:GetArmyRep() >= 15 and char:GetArmyRep() < 30)  then
            str = str .. "Great\n"
        end
        if (char:GetArmyRep() >= 30)   then
            str = str .. "Excellent\n"
        end

         -- Eco --
         str = str .. "Ecologists: "
         if (char:GetEcoRep() <= -30) then
             str = str .. "Abysmal\n"
         end
         if (char:GetEcoRep() <= -15 and char:GetEcoRep() > -30) then
             str = str .. "Awful\n"
         end
         if (char:GetEcoRep() < 0 and char:GetEcoRep() > -15) then
             str = str .. "Bad\n"
         end
         if (char:GetEcoRep() <= 4 and char:GetEcoRep() >= 0) then
             str = str .. "Neutral\n"
         end
         if (char:GetEcoRep() >= 5 and char:GetEcoRep() < 15)  then
             str = str .. "Good\n"
         end
         if (char:GetEcoRep() >= 15 and char:GetEcoRep() < 30)  then
             str = str .. "Great\n"
         end
         if (char:GetEcoRep() >= 30)   then
             str = str .. "Excellent\n"
         end

         -- Bandits --
         str = str .. "Bandits: "
         if (char:GetMobRep() <= -30) then
             str = str .. "Abysmal\n"
         end
         if (char:GetMobRep() <= -15 and char:GetMobRep() > -30) then
             str = str .. "Awful\n"
         end
         if (char:GetMobRep() < 0 and char:GetMobRep() > -15) then
             str = str .. "Bad\n"
         end
         if (char:GetMobRep() <= 4 and char:GetMobRep() >= 0) then
             str = str .. "Neutral\n"
         end
         if (char:GetMobRep() >= 5 and char:GetMobRep() < 15)  then
             str = str .. "Good\n"
         end
         if (char:GetMobRep() >= 15 and char:GetMobRep() < 30)  then
             str = str .. "Great\n"
         end
         if (char:GetMobRep() >= 30)   then
             str = str .. "Excellent\n"
         end

        -- Blue Eagle --
        str = str .. "Blue Eagle PMC: "
        if (char:GetMercRep() <= -30) then
            str = str .. "Abysmal\n"
        end
        if (char:GetMercRep() <= -15 and char:GetMercRep() > -30) then
            str = str .. "Awful\n"
        end
        if (char:GetMercRep() < 0 and char:GetMercRep() > -15) then
            str = str .. "Bad\n"
        end
        if (char:GetMercRep() <= 4 and char:GetMercRep() >= 0) then
            str = str .. "Neutral\n" 
        end
        if (char:GetMercRep() >= 5 and char:GetMercRep() < 15)  then
            str = str .. "Good\n"
        end
        if (char:GetMercRep() >= 15 and char:GetMercRep() < 30)  then
            str = str .. "Great\n"
        end
        if (char:GetMercRep() >= 30)   then
            str = str .. "Excellent\n"
        end


        return str

	end
})

ix.command.Add("CharGetFactionRep", {
	description = "View given player's faction reputation.",
    AdminOnly = true,
    arguments = 
    {ix.type.character},
	OnRun = function(self, client, target)
		local str = ""
        local char = target

        str = str .. target:GetName() .. " has the following reputation:\n"
        str = str .. "Loners: " .. char:GetLonerRep() .. "\n"
        str = str .. "Duty: " .. char:GetDutyRep() .. "\n"
        str = str .. "Freedom: " .. char:GetFreedomRep() .. "\n"
        str = str .. "Ukranian Military: " .. char:GetArmyRep() .. "\n"
        str = str .. "Ecologists: " .. char:GetEcoRep() .. "\n"
        str = str .. "Sultan's Bratva: " .. char:GetMobRep() .. "\n"
        str = str .. "Blue Eagle: " .. char:GetMercRep() .. "\n"
   
        return str
	end
})

ix.command.Add("CharAddFactionRep", {
    description = "Add faction reputation to a character.",
    adminOnly = true,
    arguments = {
    ix.type.character, 
    ix.type.string,
    ix.type.number},
    OnRun = function(self, client, target, faction, amount)
        local char = target

        if amount == 0 then
            return "Please enter a valid positive or negative number."
        end

        if string.upper(faction) == "LONER" then
            char:SetLonerRep(char:GetLonerRep() + amount)
            if amount < 0 then
                char:GetPlayer():Notify("You lose favor with the Loner community.")
            else
                char:GetPlayer():Notify("You gain favor with the Loner community.")
            end 
            return "You gave " .. amount .. " Loner Rep Points to " .. char:GetName() .. ". They now have " .. char:GetLonerRep().. " points."
        end

        if string.upper(faction) == "DUTY" then
            char:SetDutyRep(char:GetDutyRep() + amount)
            if amount < 0 then
                char:GetPlayer():Notify("You lose favor with Duty.")
            else
                char:GetPlayer():Notify("You gain favor with Duty.")
            end 
            return "You gave " .. amount .. " Duty Rep Points to " .. char:GetName() .. ". They now have " .. char:GetDutyRep().. " points."
        end

        if string.upper(faction) == "FREEDOM" then
            char:SetFreedomRep(char:GetFreedomRep() + amount)
            if amount < 0 then
                char:GetPlayer():Notify("You lose favor with Freedom.")
            else
                char:GetPlayer():Notify("You gain favor with Freedom.")
            end 
            return "You gave " .. amount .. " Freedom Rep Points to " .. char:GetName() .. ". They now have " .. char:GetFreedomRep().. " points."
        end

        if string.upper(faction)== "ARMY" then
            char:SetArmyRep(char:GetArmyRep() + amount)
            if amount < 0 then
                char:GetPlayer():Notify("You lose favor with the Ukranian Military.")
            else
                char:GetPlayer():Notify("You gain favor with the Ukranian Military.")
            end 
            return "You gave " .. amount .. " Military Rep Points to " .. char:GetName() .. ". They now have " .. char:GetArmyRep().. " points."
        end

        if string.upper(faction) == "ECO" then
            char:SetEcoRep(char:GetEcoRep() + amount)
            if amount < 0 then
                char:GetPlayer():Notify("You lose favor with the Ecologists.")
            else
                char:GetPlayer():Notify("You gain favor with the Ecologists.")
            end 
            return "You gave " .. amount .. " Ecologist Rep Points to " .. char:GetName() .. ". They now have " .. char:GetEcoRep().. " points."
        end

        if string.upper(faction) == "BANDIT" then
            char:SetMobRep(char:GetMobRep() + amount)
            if amount < 0 then
                char:GetPlayer():Notify("You lose favor with Sultan's Bratva.")
            else
                char:GetPlayer():Notify("You gain favor with Sultan's Bratva.")
            end 
            return "You gave " .. amount .. " Bandit Rep Points to " .. char:GetName() .. ". They now have " .. char:GetMobRep().. " points."
        end

        if string.upper(faction) == "MERC" then
            char:SetMercRep(char:GetMercRep() + amount)
            if amount < 0 then
                char:GetPlayer():Notify("You lose favor with Blue Eagle.")
            else
                char:GetPlayer():Notify("You gain favor with Blue Eagle.")
            end 
            return "You gave " .. amount .. " Mercenary Rep Points to " .. char:GetName() .. ". They now have " .. char:GetMercRep().. " points."
        end


        return "Invalid faction. Valid factions are: Duty, Freedom, Army, Eco, Bandit, and Merc."

    end
})


