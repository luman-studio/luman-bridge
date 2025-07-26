if Config.Framework ~= Config.FrameworkId.QB then
    return
end

local QBCore = exports[Config.FrameworkFolder.QB]:GetCoreObject()

Framework = {}

function Framework.getCharacterName(playerId)
    local Ply = QBCore.Functions.GetPlayer(winnerId)
    return Ply.PlayerData.charinfo.firstname .. ' ' .. Ply.PlayerData.charinfo.lastname
end

function Framework.hasItem(playerId, name, amount)
    local Ply = QBCore.Functions.GetPlayer(playerId)
    local itemData = Ply.Functions.GetItemByName(name)
    return itemData ~= nil and itemData.amount >= amount
end

function Framework.takeItem(playerId, name, amount)
    local Ply = QBCore.Functions.GetPlayer(playerId)
    Ply.Functions.RemoveItem(name, amount)
end

function Framework.giveItem(playerId, name, amount)
    local Ply = QBCore.Functions.GetPlayer(playerId)
    Ply.Functions.AddItem(name, amount)
end

function Framework.hasMoney(playerId, amount)
    local Ply = QBCore.Functions.GetPlayer(playerId)
    return Ply.PlayerData.money['cash'] >= amount
end

function Framework.takeMoney(playerId, amount)
    local Ply = QBCore.Functions.GetPlayer(playerId)
    Ply.Functions.RemoveMoney('cash', amount, 'luman-bridge')
end

function Framework.giveMoney(playerId, amount)
    local Ply = QBCore.Functions.GetPlayer(playerId)
    Ply.Functions.AddMoney('cash', amount, 'luman-bridge')
end

function Framework.showNotification(playerId, message)
    TriggerClientEvent(EVENTS.SHOW_NOTIFICATION, playerId, message)
end