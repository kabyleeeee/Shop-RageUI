
if Config.VersionESX == "old" then 
    ESX = nil
    
    Citizen.CreateThread(function()
        while ESX == nil do
            TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
            Citizen.Wait(0)
        end
    end)
elseif Config.VersionESX == "new" then 
    ESX = exports["es_extended"]:getSharedObject()
end

OpenMenu = false
local mainMenu = RageUI.CreateMenu("Magasin", "Magasin 24/7")
mainMenu.Closed = function()
    OpenMenu = false
end

OpenMainMenuShop = function()
    if OpenMenu then
        OpenMenu = false
        RageUI.Visible(mainMenu, false)
        return
    else
        OpenMenu = true
        RageUI.Visible(mainMenu, true)


        CreateThread(function()
            while OpenMenu do
                Wait(1)

                RageUI.IsVisible(mainMenu, function()
                    
                    for k,v in pairs(Config.itemsPossibles) do 
                        RageUI.Button(v.label, nil, {RightLabel = "~g~"..ESX.Math.GroupDigits(v.price).." $"}, true, {
                            onSelected = function()
                                TriggerServerEvent("Kabyle:Shop:BuyItem", v)
                            end
                        })
                    end

                end)
            end
        end)
    end
end