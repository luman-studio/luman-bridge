if Config.Framework ~= Config.FrameworkId.STANDALONE then
    return
end

Framework = {}

function Framework.getCharacterName(playerId)
    return GetPlayerName(playerId), ''
end

function Framework.getItemAmount(playerId, name)
    return 0
end

function Framework.removeItem(playerId, name, amount)

end

function Framework.addItem(playerId, name, amount)

end

function Framework.getMoneyAmount(playerId)
    return 0
end

function Framework.removeMoney(playerId, amount)

end

function Framework.addMoney(playerId, amount)

end