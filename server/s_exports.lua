-------------------
-- Notifications --
-------------------
exports('notify', function(playerId, message)
	playerId = tonumber(playerId)
    TriggerClientEvent(EVENTS.SHOW_NOTIFICATION, playerId, message)
end)

---------------
-- Character --
---------------
exports('getCharacterName', function(playerId)
    playerId = tonumber(playerId)
    local firstName, lastName = Framework.getCharacterName(playerId)
    return firstName, lastName
end)

---------------
-- Inventory --
---------------
exports('getItemAmount', function(playerId, itemName)
    playerId = tonumber(playerId)
    return Framework.getItemAmount(playerId, itemName)
end)

exports('addItem', function(playerId, itemName, amount)
    playerId = tonumber(playerId)
    amount = tonumber(amount) or 1
    if amount <= 0 then
        return false
    end
    local expectedAmount = Framework.getItemAmount(playerId, itemName) + amount
    Framework.addItem(playerId, itemName, amount)
    return Framework.getItemAmount(playerId, itemName) == expectedAmount
end)

exports('removeItem', function(playerId, itemName, amount)
    playerId = tonumber(playerId)
    amount = tonumber(amount) or 1
    if amount <= 0 then
        return false
    end
    if Framework.getItemAmount(playerId, itemName) < amount then
        return false
    end
    local expectedAmount = Framework.getItemAmount(playerId, itemName) - amount
    Framework.removeItem(playerId, itemName, amount)
    return Framework.getItemAmount(playerId, itemName) == expectedAmount
end)

-----------
-- Money --
-----------
exports('getMoneyAmount', function(playerId)
    playerId = tonumber(playerId)
    return Framework.getMoneyAmount(playerId)
end)

exports('addMoney', function(playerId, amount)
    playerId = tonumber(playerId)
    amount = tonumber(amount) or 0
    if amount <= 0 then
        return false
    end
    local expectedAmount = Framework.getMoneyAmount(playerId) + amount
    Framework.addMoney(playerId, amount)
    return Framework.getMoneyAmount(playerId) == expectedAmount
end)

exports('removeMoney', function(playerId, amount)
    playerId = tonumber(playerId)
    amount = tonumber(amount) or 0
    if amount <= 0 then
        return false
    end
    if Framework.getMoneyAmount(playerId) < amount then
        return false
    end
    local expectedAmount = Framework.getMoneyAmount(playerId) - amount
    Framework.removeMoney(playerId, amount)
    return Framework.getMoneyAmount(playerId) == expectedAmount
end)

exports('getJob', function(playerId)
    return Framework.getJob(playerId) or ''
end)