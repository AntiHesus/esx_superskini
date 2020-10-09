ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


-- superskini
ESX.RegisterUsableItem('varjaus', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    TriggerClientEvent('esx_extraitems:varjaus', source)
end)