if Config.Framework ~= Config.FrameworkId.ESX then
    return
end

local ESX = exports[Config.FrameworkFolder.ESX]:getSharedObject()

Framework = {}

function Framework.getCharacterName(playerId)
    local xPlayer = ESX.GetPlayerFromId(playerId)
    return xPlayer.getName()
end

function Framework.hasItem(playerId, name, amount)
    local xPlayer = ESX.GetPlayerFromId(playerId)
    local itemData = xPlayer.getInventoryItem(name)
    return itemData ~= nil and itemData.count >= amount 
end

function Framework.takeItem(playerId, name, amount)
    local xPlayer = ESX.GetPlayerFromId(playerId)
    xPlayer.removeInventoryItem(name, amount)
end

function Framework.giveItem(playerId, name, amount)
    local xPlayer = ESX.GetPlayerFromId(playerId)
    xPlayer.addInventoryItem(name, amount)
end

function Framework.hasMoney(playerId, amount)
    local xPlayer = ESX.GetPlayerFromId(playerId)
    local money = xPlayer.getMoney()
    return money >= amount
end

function Framework.takeMoney(playerId, amount)
    local xPlayer = ESX.GetPlayerFromId(playerId)
    xPlayer.removeMoney(amount)
end

function Framework.giveMoney(playerId, amount)
    local xPlayer = ESX.GetPlayerFromId(playerId)
    xPlayer.addMoney(amount)
end

function Framework.showNotification(playerId, message)
    TriggerClientEvent(EVENTS.SHOW_NOTIFICATION, playerId, message)
end