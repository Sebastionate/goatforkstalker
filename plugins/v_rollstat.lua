local PLUGIN = PLUGIN
PLUGIN.name = "Stat Rolling"
PLUGIN.author = "Scrat"
PLUGIN.description = "cheese.wav"


----= Attributes =----


-- Chat type for rolls
ix.chat.Register("rollstat", {
    format = "** %s rolled for %s: %s Roll + %s Stat Boost %s = %s %s",
    color = Color(155, 111, 176),
    CanHear = ix.config.Get("chatRange", 280),
    deadCanChat = true,
    OnChatAdd = function(self, speaker, text, bAnonymous, data)
        local att = data.attr or "STR"
        local add = data.additive
        local mod = data.mod
        local total = data.initialroll + add + mod
        local crit = data.crit or false

        if mod ~= 0 then
            mod = "with a Modifier of " .. mod .. " "
        else
            mod = ""
        end

        if not crit then crit = "" end

        local translated = L2(self.uniqueID.."Format", speaker:Name(), text)

        chat.AddText(self.color, translated and "** "..translated or string.format(self.format,speaker:Name(), att, text, add, mod, total, crit))
    end
})

 if (SERVER) then
    ix.log.AddType("rollStat", function(client, value, attrib, add, mod)

        total = value + add + mod
        return string.format("%s has rolled for %s: %s with a %s Stat Bonus and %s modifier = %s", client:Name(), attrib, value, add, mod, total)
    end)
end

-- Go through each attribute and make a command of the same that rolls a d20, then adds stat value to it.
for k, v in pairs(ix.attributes.list) do

    ix.command.Add(string.lower(v.name), {
        description = "Roll a " .. v.name .. " check on a d20 + Attribute. Optional modifier.",
        arguments = {bit.bor(ix.type.number, ix.type.optional)},
        OnRun = function(self, client, modifier)
            local value = math.random(1, 20)
            local attr = v.name
            local att = client:GetCharacter():GetAttribute(string.lower(v.name))

            local add = att 
            local char = client:GetCharacter()
            local modifier = modifier or 0

            local critical
            if value == 1 then critical = "!CRIT FAIL!" elseif value == 20 then critical = "!CRIT SUCCESS!" end
                
            ix.chat.Send(client, "rollStat", tostring(value), nil, nil, {
                attr = attr,
                additive=add,
                initialroll = value,
                mod = modifier,
                crit = critical
    
            })
    
           ix.log.Add(client, "rollStat", value, attr, add, modifier)
        end
    })
end 


----= Skills =----

for k, v in pairs (ix.skills.list) do 
    ix.command.Add(k, {
        description = "Roll a " ..v.name.. "  check on a d20 + Skill Level. Optional modifier.",
        arguments = {bit.bor(ix.type.number, ix.type.optional)},
        OnRun = function(self, client, modifier)
            local char = client:GetCharacter()
            local value = math.random(1, 20)
            local attr = v.name
            local att =  0
            local add = att + math.floor(char:GetSkill(k))
            local modifier = modifier or 0

            local critical

            if value == 1 then critical = "!CRIT FAIL!" elseif value == 20 then critical = "!CRIT SUCCESS!" end
            
            ix.chat.Send(client, "rollStat", tostring(value), nil, nil, {
                attr = attr,
                additive=add,
                initialroll = value,
                mod = modifier,
                crit = critical
            })

            ix.log.Add(client, "rollStat", value, attr, add, modifier)
        end
    })

    
end 














ix.command.Add("Rollstatmodifier", {
    description = "Roll a number out of the given maximum and add the given amount to it.",
    arguments = {ix.type.number, bit.bor(ix.type.number, ix.type.optional)},
    OnRun = function(self, client, modifier, maximum)
        maximum = math.Clamp(maximum or 100, 0, 1000000)

        local value = math.random(0, maximum)
        local modifier = modifier or 0
        local total = value + modifier
     
        
        ix.chat.Send(client, "rollStatModifier", tostring(value), nil, nil, {
            val = value,
            mod = modifier,
            max = maximum,
            tot = total
            
        })
    end
})

ix.chat.Register("rollStatModifier", {
    format = "** %s rolled %s + %s = %s out of %s",
    color = Color(155, 111, 176),
    CanHear = ix.config.Get("chatRange", 280),
    deadCanChat = true,
    OnChatAdd = function(self, speaker, text, bAnonymous, data)
        local max = data.max or 100
        local mod = data.mod or 0
        local val = data.val
        local tot = data.tot
     
        --local total = add + data.initialroll
        local translated = L2(self.uniqueID.."Format", speaker:Name(), text, max)

        chat.AddText(self.color, translated and "** "..translated or string.format(self.format,speaker:Name(), val, mod, tot, max))
    end
})



