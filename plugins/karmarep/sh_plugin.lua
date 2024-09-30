local PLUGIN = PLUGIN
PLUGIN.name = "Reputation"
PLUGIN.author = "Verne?"
PLUGIN.desc = "Reputation System"

ix.char.RegisterVar("CombatSkillPoints", {
    field = "combatskillpoints",
    fieldType = ix.type.number,
    default = 0,
    isLocal = true,
    bNoDisplay = true
})


PLUGIN.repDefs = {
	{"Tourist", 0},
	{"Rookie", 1000},
	{"Trainee", 2500},
	{"Experienced", 5000},
	{"Seasoned", 10000},
    {"Professional", 20000},
	{"Long-Timer", 40000},
	{"Veteran", 80000},
    {"Expert", 160000},
	{"Master", 320000},
}

local playerMeta = FindMetaTable("Player")
local entityMeta = FindMetaTable("Entity")

function playerMeta:getReputation()
	return (self:GetNetVar("reputation")) or 0
end

function playerMeta:getRepName()
	return (self:GetNetVar("repOverride")) or 0
end

function playerMeta:addReputation(amount)
	self:SetNetVar("reputation", self:getReputation() + amount)
end

function playerMeta:setReputation(amount)
	self:SetNetVar("reputation", amount)
end

function playerMeta:getCurrentRankName()
	local rep = self:GetNetVar("reputation") or 0

	if self:getRepName() != 0 then
		return self:getRepName()
	end
	
	for i = 1, #PLUGIN.repDefs do
		if PLUGIN.repDefs[i][2] > rep then
			return PLUGIN.repDefs[i-1][1]
		end
	end

	return PLUGIN.repDefs[#PLUGIN.repDefs][1]
end

function playerMeta:getArbitraryRankName(rep)
	for i = 1, #PLUGIN.repDefs do
		if PLUGIN.repDefs[i][2] > rep then
			return PLUGIN.repDefs[i-1][1]
		end
	end

	return PLUGIN.repDefs[#PLUGIN.repDefs][1]
end

function PLUGIN:PopulateCharacterInfo(client, character, container)
	local repnametext = container:AddRow("reputation")
	repnametext:SetText(client:getCurrentRankName())
	repnametext:SetTextColor(Color(138, 43, 226))
	repnametext:SizeToContents()
end

-- Register HUD Bars.
if (SERVER) then
	local PLUGIN = PLUGIN
	
	function PLUGIN:CharacterPreSave(character)
		character:SetData("reputation", character.player:getReputation())
		character:SetData("repOverride", character.player:getRepName())
	end

	function PLUGIN:PlayerLoadedCharacter(client, character, lastChar)	
		if (character:GetData("reputation")) then
			client:SetNetVar("reputation", character:GetData("reputation"))
		else
			client:SetNetVar("reputation", 0)
		end

		if (character:GetData("repOverride")) then
			client:SetNetVar("repOverride", character:GetData("repOverride"))
		else
			client:SetNetVar("repOverride", 0)
		end
	end
end

ix.command.Add("charsetreputation", {
	adminOnly = true,
	arguments = {
		ix.type.string,
		ix.type.number
	},
	OnRun = function(self, client, target, reputation)
		local target = ix.util.FindPlayer(target)
		local reputation = tonumber(reputation)

		target:setReputation(reputation)

		if client == target then
            client:Notify("You have set your reputation to "..reputation)
        else
            client:Notify("You have set "..target:Name().."'s reputation to "..reputation)
            target:Notify(client:Name().." has set your reputation to "..reputation)
        end
	end
})

ix.command.Add("charaddreputation", {
	adminOnly = true,
	arguments = {
		ix.type.string,
		ix.type.number
	},
	OnRun = function(self, client, target, reputation)
		local target = ix.util.FindPlayer(target)
		local initiallevel = 0
		local newlevel = 0
		local reputation = tonumber(reputation)
		

		local oldrank = target:getCurrentRankName()

		if oldrank == "Professional" then return "Player has hit the current XP cap and cannot gain any more currently." end 
		target:addReputation(reputation)
		local newrank = target:getCurrentRankName()

		
		if client == target then
            client:Notify("You have added "..reputation.." to your reputation.")
        else
            client:Notify("You have added "..reputation.." to "..target:Name().."'s reputation.")
            target:Notify(client:Name().." has added "..reputation.." to your reputation.")
        end


		if newrank != oldrank then 
			target:Notify("You've reached the rank of " .. newrank .. " and gained 5 Combat Skillpoints!")
			target:GetCharacter():SetCombatSkillPoints(target:GetCharacter():GetCombatSkillPoints() + 5)

		end 
	end
})

ix.command.Add("charcheckreputation", {
	adminOnly = true,
	arguments = {
		ix.type.string,
	},
	OnRun = function(self, client, target)
		local target = ix.util.FindPlayer(target)

		if target then 
        	client:Notify(target:Name() .. " has "..target:getReputation().." reputation.")
    	else
            client:Notify("Player not found")
        end
	end
})

ix.command.Add("charrepnameset", {
	adminOnly = true,
	arguments = {
		ix.type.string,
		ix.type.string
	},
	OnRun = function(self, client, target, name)
		local target = ix.util.FindPlayer(target)
		local reputation = name

		target:SetNetVar("repOverride", reputation)

		if client == target then
            client:Notify("Custom rankname set.")
        else
            client:Notify("Custom rankname set.")
            target:Notify(client:Name().." has set your repname.")
        end
	end
})

ix.command.Add("charrepnameremove", {
	adminOnly = true,
	arguments = {
		ix.type.string,
	},
	OnRun = function(self, client, target)
		local target = ix.util.FindPlayer(target)

		target:SetNetVar("repOverride", 0)

		if client == target then
            client:Notify("Custom rankname removed.")
        else
            client:Notify("Custom rankname removed.")
            target:Notify(client:Name().." has removed your repname.")
        end
	end
}) 


ix.command.Add("CharAddCombatSkillpoints", {
    description = "Add Combat skill points to a character.",
    adminOnly = true,
    arguments = {
    ix.type.character, 
    ix.type.number},
    OnRun = function(self, client, target, points)
        local currentpoints = target:GetCombatSkillPoints()
        target:SetCombatSkillPoints(currentpoints + points)
        client:Notify(target:GetName() .. " now has " .. tostring(currentpoints + points .. " Combat skill points."))
    end
})

ix.command.Add("SpendCombatSkillpoints", {
    description = "Spend some of your Utility skill points on your Utility skills.",
    arguments = {
    ix.type.string, 
    ix.type.number},
    OnRun = function(self, client, skill, pointstospend)
        local char = client:GetCharacter()
        local ply = client
        local currentpoints = char:GetCombatSkillPoints()
        local skill = string.lower(skill)

        
        
        if (currentpoints == 0) then
            client:Notify("You don't have any Combat Skillpoints to spend.")
            return
        end 

        if (pointstospend < 0) then
            client:Notify("Cannot spend a negative number of points.")
            return
        end 

        if (currentpoints < pointstospend) then
            client:Notify("You don't have enough Combat Skillpoints to upgrade your skill to that level.")
            return
        end 

        local skillLevel = char:GetSkills()[skill]

        if not (skillLevel == nil) then

            if ix.skills.list[skill].type == "utility" then
                client:Notify("You cannot spend Combat Skillpoints on Utility skills.")
                return
            end 

            if (skillLevel + pointstospend > 30) then
                client:Notify("You cannot raise a skill above 30.")
                return
            end 

            char:UpdateSkill(skill, pointstospend)
            local newlevel = char:GetSkills()[skill]
            char:SetCombatSkillPoints(char:GetCombatSkillPoints() - pointstospend)
            client:Notify("Your " .. skill .. " skill has been increased from " ..skillLevel.. " to " ..newlevel.. ". \n Combat Skillpoints Remaining: " .. char:GetCombatSkillPoints())
        else 
            client:Notify("Invalid skill name.")
        end 
        
        return
        
    end
})

ix.command.Add("MyProgress", {
	description = "View your current level, skill points, and progress.",
	OnRun = function(self, client)
		local str = ""
        local char = client:GetCharacter()
        local rep = client:getReputation()
        local utilitylevel = char:GetUtilityLevel()
        local utilityxp = char:GetLifetimeUtilityXP()
        local utilityskillpoints = char:GetUtilitySkillPoints()

	
	
        
        str = str .. "Rank: " .. client:getCurrentRankName() .. "\n"
        str = str .. "Total Reputation: " .. client:getReputation()  .. "\n"
        str = str .. "Combat Skillpoints: " ..char:GetCombatSkillPoints() .. " \n"
        str = str .. "Utility Level: " ..utilitylevel .. " \n"
        str = str .. "Total Utility XP: " ..utilityxp .. " \n"
        str = str .. "Utility Skillpoints: " ..utilityskillpoints
        return str
	end
})

