local function registerExtension(extensionName)
    local extension = class(extensionName, vRP.Extension)

    function extension:__construct()
        vRP.Extension.__construct(self)
    end

    extension.event = {}
    extension.tunnel = {}
    extension.proxy = {}

    function extension.proxy:getCharacterName(playerId)
        local user = vRP.users_by_source[tonumber(playerId)]
        local identity = vRP.EXT.Identity:getIdentity(user.cid)
        return identity.firstname .. ' ' .. identity.name
    end

    function extension.proxy:registerItem(item, name, description)
        vRP.EXT.Inventory:defineItem(item, name, description, nil, 0.05)
    end

    function extension.proxy:hasItem(playerId, item, amount)
        local user = vRP.users_by_source[tonumber(playerId)]
        return user:getItemAmount(item) >= amount
    end

    function extension.proxy:takeItem(playerId, item, amount)
        local user = vRP.users_by_source[tonumber(playerId)]
        return user:tryTakeItem(item, amount)
    end

    function extension.proxy:giveItem(playerId, item, amount)
        local user = vRP.users_by_source[tonumber(playerId)]
        return user:tryGiveItem(item, amount)
    end

    function extension.proxy:hasMoney(playerId, amount)
        local user = vRP.users_by_source[tonumber(playerId)]
        return user:getWallet() >= amount
    end

    function extension.proxy:giveMoney(playerId, amount)
        local user = vRP.users_by_source[tonumber(playerId)]
        user:giveWallet(amount)
        return true
    end

    function extension.proxy:takeMoney(playerId, amount)
        local user = vRP.users_by_source[tonumber(playerId)]
        return user:tryPayment(amount)
    end

    function extension.proxy:showNotification(playerId, message)
        return vRP.EXT.Base.remote._notify(tonumber(playerId), message)
    end

    vRP:registerExtension(extension)

    print(('[luman-bridge]: Extension %s loaded.'):format(extensionName))
end
registerExtension('LumanStudio')