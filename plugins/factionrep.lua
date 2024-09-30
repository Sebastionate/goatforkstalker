local PLUGIN = PLUGIN
PLUGIN.name = "Faction Reputation"
PLUGIN.author = "Scrat Knapp"
PLUGIN.desc = "A simple automated system for tracking faction reputation."

ix.command.Add("MyFactionRep", {
	description = "View your standing with established factions.",
	OnRun = function(self, client)
		local str = ""
        local char = client:GetCharacter()

        str = str .. "Loner: " .. char:GetData("lonerrep", 0) ..", "
        str = str .. "Duty: " .. char:GetData("dutyrep", 0) ..", "
        str = str .. "Freedom: " .. char:GetData("freedomrep", 0) ..", "
        str = str .. "Ukranian Military: " .. char:GetData("armyrep", 0) ..", "
        str = str .. "Ecologists: " .. char:GetData("ecorep", 0) ..", "
        str = str .. "Sultan's Bandits: " .. char:GetData("banditrep", 0) ..", "
        str = str .. "Blue Eagle PMC: " .. char:GetData("mercrep", 0) ..", "

        return str

	end
})

ix.command.Add("CharGetFactionRep", {
	description = "View given player's faction reputation.",
    adminOnly = true,
    arguments = 
    {ix.type.character},
	OnRun = function(self, client, target)
		local str = ""
        local char = target

        str = str .. target:GetName() .. " has the following reputation:\n"
        str = str .. "Loners: " .. char:GetData("lonerrep", 0) .. "\n"
        str = str .. "Duty: " .. char:GetData("dutyrep", 0) .. "\n"
        str = str .. "Freedom: " .. char:GetData("freedomrep", 0) .. "\n"
        str = str .. "Ukranian Military: " .. char:GetData("armyrep", 0) .. "\n"
        str = str .. "Ecologists: " .. char:GetData("ecorep", 0) .. "\n"
        str = str .. "Bandits: " .. char:GetData("banditrep", 0) .. "\n"
        str = str .. "Blue Eagle: " .. char:GetData("mercrep", 0) .. "\n"
   
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

            if amount > 0 then
                if char:GetData("lonerrep", 0) >= 5 and amount < 0.5 then return "Character's rep with this faction is too high to get less than 0.5 points." end 
                if char:GetData("lonerrep", 0) >= 10 and amount < 1 then return "Character's rep with this faction is too high to get less than 1 point." end 
            end 


            char:SetData("lonerrep", (char:GetData("lonerrep", 0) + amount))
            if amount < 0 then
                char:GetPlayer():Notify("You lose favor with the Loner community.")
            else
                char:GetPlayer():Notify("You gain favor with the Loner community.")
            end 
            return "You gave " .. amount .. " Loner Rep Points to " .. char:GetName() .. ". They now have " .. char:GetData("lonerrep", 0).. " points."
        end

        if string.upper(faction) == "DUTY" then

            
            if amount > 0 then
                if char:GetData("dutyrep", 0) <= 5 and amount > 0.5 then return "Character's rep with this faction is too high to get less than 0.5 points." end 
                if char:GetData("dutyrep", 0) <= 10 and amount > 1 then return "Character's rep with this faction is too high to get less than 1 point." end 
            end 

            char:SetData("dutyrep", (char:GetData("dutyrep", 0) + amount))
            if amount < 0 then
                char:GetPlayer():Notify("You lose favor with Duty.")
            else
                char:GetPlayer():Notify("You gain favor with Duty.")
            end 
            return "You gave " .. amount .. " Duty Rep Points to " .. char:GetName() .. ". They now have " .. char:GetData("dutyrep", 0).. " points."
        end

        if string.upper(faction) == "FREEDOM" then

            
            if amount > 0 then
                if char:GetData("freedomrep", 0) <= 5 and amount > 0.5 then return "Character's rep with this faction is too high to get less than 0.5 points." end 
                if char:GetData("freedomrep", 0) <= 10 and amount > 1 then return "Character's rep with this faction is too high to get less than 1 point." end 
            end 



            char:SetData("freedomrep", (char:GetData("freedomrep", 0) + amount))
            if amount < 0 then
                char:GetPlayer():Notify("You lose favor with Freedom.")
            else
                char:GetPlayer():Notify("You gain favor with Freedom.")
            end 
            return "You gave " .. amount .. " Freedom Rep Points to " .. char:GetName() .. ". They now have " .. char:GetData("freedomrep", 0).. " points."
        end

        if string.upper(faction)== "ARMY" then

            if amount > 0 then
                if char:GetData("armyrep", 0) <= 5 and amount > 0.5 then return "Character's rep with this faction is too high to get less than 0.5 points." end 
                if char:GetData("armyrep", 0) <= 10 and amount > 1 then return "Character's rep with this faction is too high to get less than 1 point." end 
            end 

            char:SetData("armyrep", (char:GetData("armyrep", 0) + amount))
            if amount < 0 then
                char:GetPlayer():Notify("You lose favor with the Ukranian Military.")
            else
                char:GetPlayer():Notify("You gain favor with the Ukranian Military.")
            end 
            return "You gave " .. amount .. " Military Rep Points to " .. char:GetName() .. ". They now have " .. char:GetData("armyrep", 0).. " points."
        end

        if string.upper(faction) == "ECO" then

            if amount > 0 then
                if char:GetData("ecorep", 0) <= 5 and amount > 0.5 then return "Character's rep with this faction is too high to get less than 0.5 points." end 
                if char:GetData("ecorep", 0) <= 10 and amount > 1 then return "Character's rep with this faction is too high to get less than 1 point." end 
            end 

            char:SetData("ecorep", (char:GetData("ecorep", 0) + amount))
            if amount < 0 then
                char:GetPlayer():Notify("You lose favor with the Ecologists.")
            else
                char:GetPlayer():Notify("You gain favor with the Ecologists.")
            end 
            return "You gave " .. amount .. " Ecologist Rep Points to " .. char:GetName() .. ". They now have " .. char:GetData("ecorep", 0).. " points."
        end

        if string.upper(faction) == "BANDIT" then

            if amount > 0 then
                if char:GetData("banditrep", 0) <= 5 and amount > 0.5 then return "Character's rep with this faction is too high to get less than 0.5 points." end 
                if char:GetData("banditrep", 0) <= 10 and amount > 1 then return "Character's rep with this faction is too high to get less than 1 point." end 
            end 

            char:SetData("banditrep", (char:GetData("banditrep", 0) + amount))
            if amount < 0 then
                char:GetPlayer():Notify("You lose favor with Sultan's Bratva.")
            else
                char:GetPlayer():Notify("You gain favor with Sultan's Bratva.")
            end 
            return "You gave " .. amount .. " Bandit Rep Points to " .. char:GetName() .. ". They now have " .. char:GetData("banditrep", 0).. " points."
        end

        if string.upper(faction) == "MERC" then

            if amount > 0 then
                if char:GetData("mercrep", 0) <= 5 and amount > 0.5 then return "Character's rep with this faction is too high to get less than 0.5 points." end 
                if char:GetData("mercrep", 0) <= 10 and amount > 1 then return "Character's rep with this faction is too high to get less than 1 point." end 
            end 

            char:SetData("mercrep", (char:GetData("mercrep", 0) + amount))
            if amount < 0 then
                char:GetPlayer():Notify("You lose favor with Blue Eagle.")
            else
                char:GetPlayer():Notify("You gain favor with Blue Eagle.")
            end 
            return "You gave " .. amount .. " Mercenary Rep Points to " .. char:GetName() .. ". They now have " .. char:GetData("mercrep", 0).. " points."
        end


        return "Invalid faction. Valid factions are: Loner, Freedom, Duty, Freedom, Army, Eco, Bandit, and Merc."

    end
})


