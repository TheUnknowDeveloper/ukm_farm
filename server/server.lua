ESX = nil

ESX = exports['es_extended']:getSharedObject()

-- ════════════════════════════════════════════════════════════════════════════════════ --
--                              		Item Farmen 
-- ════════════════════════════════════════════════════════════════════════════════════ --

RegisterServerEvent('farming:giveItem')
AddEventHandler('farming:giveItem', function(item, ItemCount)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addInventoryItem(item, ItemCount)
end) 

-- ════════════════════════════════════════════════════════════════════════════════════ --
--                              	Verkauf der Items
-- ════════════════════════════════════════════════════════════════════════════════════ --

RegisterServerEvent('farming:sell')
AddEventHandler('farming:sell', function(ItemLabel, ItemName, ItemPrice)
    local xPlayer = ESX.GetPlayerFromId(source)

    local itemcount = xPlayer.getInventoryItem(ItemName).count

    if itemcount >= 6 then

        xPlayer.removeInventoryItem(ItemName, 6)
        xPlayer.addMoney(ItemPrice)
        TriggerClientEvent('esx:showNotification', source, ("Du hast ~y~ "..ItemLabel.."~w~ für insgesamt ~g~"..ItemPrice.."$~w~ verkauft"))
    else 
        TriggerClientEvent('esx:showNotification', source, ("Geh farmen"))
    end

end)


ESX.RegisterServerCallback('farming:items', function()
    
end)

-- ════════════════════════════════════════════════════════════════════════════════════ --
--                              	Geldwäsche
-- ════════════════════════════════════════════════════════════════════════════════════ --

RegisterServerEvent('moneywash:wash')
AddEventHandler('money:wash', function(amount)

    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getAccount('black_money').money >= amount then
        xPlayer.removeAccountMoney('black_money', amount)
        xPlayer.addAccountMoney('money', math.floor(amount / 2))
        xPlayer.showNotification('~r~' .. amount .. '$ Schwarzgeld ~s~ wurden zu ~g~' .. math.floor(amount / 2) .. '$ ~s~ umgewandelt')
    else
        xPlayer.showNotification('~r~Nicht genügend Schwarzgeld!')
    end
end)

