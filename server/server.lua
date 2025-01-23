if Config.VersionESX == "old" then 
    ESX = nil
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
else
    ESX = exports["es_extended"]:getSharedObject()
end

RegisterNetEvent("Kabyle:Shop:BuyItem", function(v)
    local _source = source 
    local xPlayer = ESX.GetPlayerFromId(_source)

    if not xPlayer then return print("xPlayer not found") end

    if not v.label or not v.item or not v.price then return print("ID: ".._source.." Cheating") end

    if xPlayer.getMoney() >= v.price then 
        xPlayer.removeMoney(v.price)
        xPlayer.addInventoryItem(v.item, 1)
        xPlayer.showNotification("Vous avez acheté un x1 un(e) "..v.label.." pour "..v.price.."$")
    else
        xPlayer.showNotification("~r~Vous n'avez pas assez d'argent")
    end
end)