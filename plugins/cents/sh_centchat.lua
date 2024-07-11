local PLUGIN = PLUGIN

do 
    ix.chat.Register("cent_w", {
        format = "%s whispers \"%s\"",
        GetColor = function(self, speaker, text)
            local color = ix.config.Get("chatColor")

            -- Make the whisper chat slightly darker than IC chat.
            return Color(color.r - 35, color.g - 35, color.b - 35)
        end,
        CanHear = ix.config.Get("chatRange", 280) * 0.25,
        font = "ixChatFont",
        deadCanChat = true
    })

    ix.chat.Register("cent_ic", {
        format = "%s says \"%s\"",
        GetColor = function(self, speaker, text)

            -- Otherwise, use the normal chat color.
            return ix.config.Get("chatColor")
        end,
        CanHear = ix.config.Get("chatRange", 280),
        deadCanChat = true
    })

    ix.chat.Register("cent_y", {
        format = "%s yells \"%s\"",
        GetColor = function(self, speaker, text)
            local color = ix.config.Get("chatColor")

            -- Make the yell chat slightly brighter than IC chat.
            return Color(color.r + 35, color.g + 35, color.b + 35)
        end,
        CanHear = ix.config.Get("chatRange", 280) * 2,
        font = "ixChatFont", 
        deadCanChat = true
    })
   
    ix.chat.Register("cent_s", {
        format = "%s screams \"%s\"",
        GetColor = function(speaker, text)
            return Color(200, 20, 20)
        end,
        CanHear = ix.config.Get("chatRange", 280) * 4,
        deadCanChat = true,
        font = "ixChatFont", 
    })

    ix.chat.Register("cent_me", {
        format = "** %s %s",
        GetColor = function(self, speaker, text)
            local color = ix.config.Get("chatColor")

            return Color(color.r, color.g, color.b)
        end,
        CanHear = ix.config.Get("chatRange", 280) * 2,
        deadCanChat = true
    })

    ix.chat.Register("cent_meclose", {
        format = "**%s %s",
        GetColor = function(speaker, text)
            local color = ix.chat.classes.ic.GetColor(speaker, text)
    
            return Color(color.r - 35, color.g - 35, color.b - 35)
        end,
        CanHear = ix.config.Get("chatRange", 280) * 0.25,
        font = "ixChatFontItalics",
        filter = "actions",
        deadCanChat = true
    })

    ix.chat.Register("cent_mefar", {
        format = "**%s %s",
        GetColor = function(speaker, text)
            local color = ix.chat.classes.ic.GetColor(speaker, text)
    
            return Color(color.r + 35, color.g + 35, color.b + 35)
        end,
        CanHear = ix.config.Get("chatRange", 280) * 2,
        font = "ixChatFontItalics",
        filter = "actions",
        deadCanChat = true
    })

    ix.chat.Register("cent_mefarfar", {
        format = "**%s %s",
        GetColor = function(speaker, text)
            local color = ix.chat.classes.ic.GetColor(speaker, text)
    
            return Color(color.r + 45, color.g + 45, color.b + 45)
        end,
        CanHear = ix.config.Get("chatRange", 280) * 4,
        font = "ixChatFontItalics",
        filter = "actions",
        deadCanChat = true
    })
    





end

function PLUGIN:CanAutoFormatMessage(speaker, chatType, text)
    if chatType:find("cent") and !chatType:find("cent_me") then
        return true
    end
end