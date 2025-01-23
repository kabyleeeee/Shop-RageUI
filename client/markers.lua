CreateThread(function()
    while true do
        timer = 750
        local playerCoords = GetEntityCoords(PlayerPedId())
        for k,v in pairs(Config.positions) do
            local distance = #(playerCoords - vector3(v.x, v.y, v.z))
            if distance < 10 then
                timer = 0
                if distance < 5 then
                    DrawMarker(27, v.x, v.y, v.z - 0.98, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.5, 0, 255, 0, 100, 0, 0, 0, 0)
                    ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour accéder au magasin")
                    if IsControlJustPressed(0, 51) then
                        OpenMainMenuShop()
                    end
                end
            elseif distance > 5.0 and distance < 15.0 then
                timer = 750
            end
        end
        Wait(timer)
    end
end)
