if Config.Framework ~= Config.FrameworkId.STANDALONE then
    return
end

Framework = {}

function Framework.hasItem(playerId, name, amount)
    return true
end

function Framework.takeItem(playerId, name, amount)

end

function Framework.giveItem(playerId, name, amount)

end

function Framework.hasMoney(playerId, amount)
    return true
end

function Framework.takeMoney(playerId, amount)

end

function Framework.giveMoney(playerId, amount)

end

function Framework.getCharacterName(playerId)
    return GetPlayerName(playerId)
end

function Framework.showNotification(playerId, message)
    TriggerClientEvent(EVENTS.SHOW_NOTIFICATION, playerId, message)
end