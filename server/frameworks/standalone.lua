if Config.Framework ~= Config.FrameworkId.STANDALONE then
    return
end

Framework = {}

function Framework.getCharacterName(playerId)
    return GetPlayerName(playerId), ''
end

function Framework.getItemAmount(playerId, name)
    return math.huge
end

function Framework.removeItem(playerId, name, amount)
    return true
end

function Framework.addItem(playerId, name, amount)
    return true
end

function Framework.getMoneyAmount(playerId)
    return math.huge
end

function Framework.removeMoney(playerId, amount)
    return true
end

function Framework.addMoney(playerId, amount)
    return true
end

function Framework.getJob(playerId)
    return ''
end