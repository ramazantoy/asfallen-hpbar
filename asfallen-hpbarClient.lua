
function Lerp(a, b, t)
    return a + (b - a) * t
end


function GetHealthColor(health)
    local red = Lerp(255, 0, health / 100) 
    local green = Lerp(0, 255, health / 100) 
    return math.floor(red), math.floor(green), 0 --(red, green, blue)
end


function DrawTextLeftAligned(x, y, text, maxWidth, scale)
    local textWidth = string.len(text) * scale * 0.008 -- Approximation of text width
    if textWidth > maxWidth then
        scale = scale * (maxWidth / textWidth) -- Adjust scale to fit text within the maxWidth
    end

    SetTextScale(scale, scale)
    SetTextFontForCurrentCommand(1)
    SetTextJustification(1) -- Left aligned
    SetTextColor(255, 255, 255, 215)
    DisplayText(CreateVarString(10, "LITERAL_STRING", text), x, y)
end

Citizen.CreateThread(function()
    while true do
        local playerPed = PlayerPedId()
        local players = GetActivePlayers()
        local playerCoords = GetEntityCoords(playerPed)

        for _, playerId in ipairs(players) do
            local targetPed = GetPlayerPed(playerId) 

   
            if targetPed ~= playerPed then
                local targetCoords = GetEntityCoords(targetPed) + vector3(0.0, 0.0, 1.1) 
                local distance = #(playerCoords - targetCoords)

          
                if distance < 20.0 and HasEntityClearLosToEntity(playerPed, targetPed, 17) then
                    local health = (GetEntityHealth(targetPed) - 100) / (GetEntityMaxHealth(targetPed) - 100) * 100

              
                    if health > 0 then
                 
                        local red, green, blue = GetHealthColor(health)

                        local onScreen, screenX, screenY = GetScreenCoordFromWorldCoord(targetCoords.x, targetCoords.y, targetCoords.z)
                        if onScreen then
                    
                            local barWidth, barHeight = 0.05, 0.008 
                            DrawRect(screenX, screenY, barWidth, barHeight, 255, 255, 255, 200)

                    
                            local fillWidth = (health / 100) * barWidth
                            DrawRect(screenX - (barWidth / 2) + (fillWidth / 2), screenY, fillWidth, barHeight - 0.002, red, green, blue, 255)

                 
                            local nameStartX = screenX - (barWidth / 2) 
                            DrawTextLeftAligned(nameStartX, screenY - 0.025, GetPlayerName(playerId), barWidth, 0.25)
                        end
                    end
                end
            end
        end

        Citizen.Wait(0)
    end
end)
