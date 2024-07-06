local PLUGIN = PLUGIN
PLUGIN.name = "Skills"
PLUGIN.author = "Scrat Knapp"
PLUGIN.desc = "Define and upgrade skills."



ix.char.RegisterVar("UtilitySkillPoints", {
    field = "utilityskillpoints",
    fieldType = ix.type.number,
    default = 0,
    isLocal = true,
    bNoDisplay = true
})

ix.char.RegisterVar("UtilityLevel", {
    field = "utilitylevel",
    fieldType = ix.type.number,
    default = 1,
    isLocal = true,
    bNoDisplay = true
})

ix.char.RegisterVar("UtilityXP", {
    field = "utilityxp",
    fieldType = ix.type.number,
    default = 0,
    isLocal = true,
    bNoDisplay = true
})

ix.char.RegisterVar("UtilityXPToNextLevel", {
    field = "utilityxptonextlevel",
    fieldType = ix.type.number,
    default = 250,
    isLocal = true,
    bNoDisplay = true
})

ix.char.RegisterVar("LifetimeUtilityXP", {
    field = "lifetimeutilityxp",
    fieldType = ix.type.number,
    default = 0,
    isLocal = true,
    bNoDisplay = true
})

ix.command.Add("CharRewardUtilityXP", {
    description = "Add Utility XP to a character.",
    adminOnly = true,
    arguments = {
    ix.type.character, 
    ix.type.number},
    OnRun = function(self, client, target, points)

        if (points <= 0) then
            return "Cannot give zero or negative XP."
        end 

        if (currentlevel == 10) then
            return "Character is max level."
        end 

        target:AddUtilityXp(target, points)

        return "You gave " .. target:GetName() .. " " .. points .. " Utility XP."
      
        

    end
})


ix.command.Add("CharGetSkills", {
	description = "View given player's skills.",
    AdminOnly = true,
    arguments = 
    {ix.type.character},
	OnRun = function(self, client, target)
		local str = "\n"
        local char = target

        local skills = ix.skills.list

        for k, v in pairs (skills) do
            str = str .. v.name .. ": " .. char:GetSkill(k) .. "\n"
        end 

        return str
	end
})

ix.command.Add("CharAddUtilitySkillpoints", {
    description = "Add Utility skill points to a character.",
    adminOnly = true,
    arguments = {
    ix.type.character, 
    ix.type.number},
    OnRun = function(self, client, target, points)
        local currentpoints = target:GetUtilitySkillPoints()
        target:SetUtilitySkillPoints(currentpoints + points)
        client:Notify(target:GetName() .. " now has " .. tostring(currentpoints + points .. " Utility skill points."))
    end
})

ix.command.Add("CharSetSkill", {
    description = "Set char's given skill to given level directly.",
    adminOnly = true,
    arguments = {
    ix.type.character, 
    ix.type.string,
    ix.type.number},
    OnRun = function(self, client, target, skill, level)

        if not target:GetSkill(skill) then return "Invalid skill." end

        target:SetSkill(skill, level)
        client:Notify(target:GetName() .. " now has a " ..skill.. " level of " .. target:GetSkill(skill) )
    end
})

ix.command.Add("SpendUtilitySkillpoints", {
    description = "Spend some of your Utility skill points on your Utility skills.",
    arguments = {
    ix.type.string, 
    ix.type.number},
    OnRun = function(self, client, skill, pointstospend)
        local char = client:GetCharacter()
        local ply = client
        local currentpoints = char:GetUtilitySkillPoints()
        local skill = string.lower(skill)

        
        
        if (currentpoints == 0) then
            client:Notify("You don't have any Utility skillpoints to spend.")
            return
        end 

        if (pointstospend < 0) then
            client:Notify("Cannot spend a negative number of points.")
            return
        end 

        if (currentpoints < pointstospend) then
            client:Notify("You don't have enough skillpoints to upgrade your skill to that level.")
            return
        end 

        local skillLevel = char:GetSkills()[skill]

        if not (skillLevel == nil) then

            if ix.skills.list[skill].type == "combat" then
                client:Notify("You cannot spend Utility skillpoints on Combat skills.")
                return
            end 

            if (skillLevel + pointstospend > 25) then
                client:Notify("You cannot raise a skill above 25.")
                return
            end 

            char:UpdateSkill(skill, pointstospend)
            local newlevel = char:GetSkills()[skill]
            char:SetUtilitySkillPoints(char:GetUtilitySkillPoints() - pointstospend)
            client:Notify("Your " .. skill .. " skill has been increased from " ..skillLevel.. " to " ..newlevel.. ". \n Utility Skillpoints Remaining: " .. char:GetUtilitySkillPoints())
        else 
            client:Notify("Invalid skill name.")
        end 
        
        return
        
    end
})

local charmeta = ix.meta.character

function charmeta:AddUtilityXp(target, points)

    local currentxp = target:GetUtilityXP()
    local currentlifetimexp = target:GetLifetimeUtilityXP()
    local currentlevel = target:GetUtilityLevel()
    local currentskillpoints = target:GetSkillPoints()

    

    target:SetUtilityXP(currentxp + points)
    target:SetLifetimeUtilityXP(currentlifetimexp + points)

    if (target:GetUtilityXP() >= target:GetUtilityXPToNextLevel()) then 
        target:SetUtilityLevel(currentlevel + 1)

        if (target:GetUtilityLevel() == 10) then
            target:SetUtilityXPToNextLevel(0)
            target:GetPlayer():Notify("You receive " .. points .. " Utility XP, and reach the maximum Utility level of " .. target:GetUtilityLevel().. "! No more Utility XP can be gained.")
            return
        end 


        target:SetUtilityXP (target:GetUtilityXP() - target:GetUtilityXPToNextLevel())

        target:SetUtilityXPToNextLevel(target:GetUtilityXPToNextLevel()  * 2)
        target:SetUtilityXPToNextLevel(math.floor(target:GetUtilityXPToNextLevel()))

        target:SetUtilitySkillPoints(target:GetUtilitySkillPoints() + 5)

        
        target:GetPlayer():Notify("You receive " .. points .. " Utility XP, and reach Level " .. target:GetUtilityLevel().. "!")

    else 
        target:GetPlayer():Notify("You receive " .. points .. " Utility XP!")
    end 

end 
















