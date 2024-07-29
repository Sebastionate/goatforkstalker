PLUGIN.name = 'NVG'
PLUGIN.author = 'Scrat Knapp'
PLUGIN.description = 'Plugin for NVG Base'

function PLUGIN:OnCharacterCreated(client, character)

    client:NVGBASE_SetLoadout("")

end 


local playerMeta = FindMetaTable("Player")


function playerMeta:SetNVG(loadout)
    self:SetConVar("NVGBASE_LOADOUT", "Splinter Cell")
end 


ix.command.Add( "GiveNVG", {
    description = "Begin or Finish counting movement.",
    OnRun = function( self, client )
        client:SetNVG("Splinter Cell")
        client:Notify(tostring(client:NVGBASE_GetLoadout()))
    end
} )

ix.command.Add( "TakeNVG", {
    description = "Begin or Finish counting movement.",
    OnRun = function( self, client )
        client:SetNVG("")
    end
} )