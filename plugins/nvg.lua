PLUGIN.name = 'NVG'
PLUGIN.author = 'Scrat Knapp'
PLUGIN.description = 'Plugin for NVG Base'




local playerMeta = FindMetaTable("Player")

function PLUGIN:PlayerLoadedCharacter(client, character, currentChar)

    client:SetNWInt("nvg", 0)
    local inventory = client:GetCharacter():GetInventory()

    for k, v in pairs (inventory:GetItems()) do
        if(!v:GetData("equip", false)) then continue end --ignores unequipped items
        if v.isGoggles then ArcticNVGs_SetPlayerGoggles(client, v.goggleType) end 
    end


end 


if SERVER then

    local ticktimer = 0

    function PLUGIN:PlayerTick(ply)
            
        if ticktimer > CurTime() then return end
        ticktimer = CurTime() + 1
        
        local char = ply:GetCharacter()
        
        

        if ply:GetNetVar("nvgbatterytick", 0) <= CurTime() then

            if ply:GetNWBool("nvg_on", false) then
                local inventory = char:GetInventory()
                for k, v in pairs (inventory:GetItems()) do
                    if(!v:GetData("equip", false)) then continue end --ignores unequipped items
                    if v.isGoggles then 
                        v:SetData("durability", v:GetData("durability") - (0.5 * v.drainFactor))

                        if v:GetData("durability") <= 0 then
                            v:SetData("durability", 0)
                            v:SetData("equip", false )
                            ply:SetNWInt("nvg", 0)
                            ply:SetNWBool("nvg_on", false)

                            ply:Notify("Your goggles' battery has run out. Use a Battery Pack to recharge it.")
                        end 

                    end 

                end



            end 

            

            ply:SetNetVar("nvgbatterytick", 30 + CurTime())
        end

    
    end
end 
