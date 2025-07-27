if Config.Framework ~= Config.FrameworkId.VRP1 then
    return
end

local frameworkFolder = Config.FrameworkFolder.VRP1
local function init()
	load(LoadResourceFile(frameworkFolder, 'lib/utils.lua'))()
	local Proxy = module(frameworkFolder, "lib/Proxy")
	local Tunnel = module(frameworkFolder, "lib/Tunnel")
	local vRPclient = Tunnel.getInterface("vRP", GetCurrentResourceName())
	return Proxy.getInterface("vRP")
end

local vRP = init()

Framework = {}

function Framework.hasItem(playerId, name, amount)
	local userId = vRP.getUserId({playerId})
	return vRP.getInventoryItemAmount({userId, name}) >= amount
end

function Framework.takeItem(playerId, name, amount)
	local userId = vRP.getUserId({playerId})
	vRP.tryGetInventoryItem({userId, name, amount, true})
end

function Framework.giveItem(playerId, name, amount)
	local userId = vRP.getUserId({playerId})
	vRP.giveInventoryItem({userId, name, amount, true})
end

function Framework.hasMoney(playerId, amount)
	local userId = vRP.getUserId({playerId})
	return vRP.getMoney({userId}) >= amount
end

function Framework.takeMoney(playerId, amount)
	local userId = vRP.getUserId({playerId})
	vRP.tryPayment({userId, amount})
end

function Framework.giveMoney(playerId, amount)
	local userId = vRP.getUserId({playerId})
	vRP.giveMoney({userId, amount})
end

function Framework.getCharacterName(playerId)
	local userId = vRP.getUserId({playerId})
	local identityPromise = promise.new()
	vRP.getUserIdentity(userId, function(identity)
		identityPromise.resolve(identity.firstname .. ' ' .. identity.name)
	end)
	return Citizen.Await(identityPromise)
end

function Framework.showNotification(playerId, message)
    TriggerClientEvent(EVENTS.SHOW_NOTIFICATION, playerId, message)
end