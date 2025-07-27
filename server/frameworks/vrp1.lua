if Config.Framework ~= Config.FrameworkId.VRP1 then
    return
end

local frameworkFolder = 'vrp'
local function init()
	load(LoadResourceFile(frameworkFolder, 'lib/utils.lua'))()
	local Proxy = module(frameworkFolder, "lib/Proxy")
	return Proxy.getInterface("vRP")
end

local vRP = init()

Framework = {}

function Framework.getCharacterName(playerId)
	playerId = tonumber(playerId)
	local userId = vRP.getUserId(playerId)
	local identityPromise = promise.new()
	local identity = vRP.getUserIdentity(userId)
	return identity.firstname .. ' ' .. identity.name
end

function Framework.hasItem(playerId, name, amount)
	playerId = tonumber(playerId)
	local userId = vRP.getUserId(playerId)
	return vRP.getInventoryItemAmount(userId, name) >= amount
end

function Framework.takeItem(playerId, name, amount)
	playerId = tonumber(playerId)
	local userId = vRP.getUserId(playerId)
	vRP.tryGetInventoryItem(userId, name, amount, true)
end

function Framework.giveItem(playerId, name, amount)
	playerId = tonumber(playerId)
	local userId = vRP.getUserId(playerId)
	vRP.giveInventoryItem(userId, name, amount, true)
end

function Framework.hasMoney(playerId, amount)
	playerId = tonumber(playerId)
	local userId = vRP.getUserId(playerId)
	return vRP.getMoney(userId) >= amount
end

function Framework.takeMoney(playerId, amount)
	playerId = tonumber(playerId)
	local userId = vRP.getUserId(playerId)
	vRP.tryPayment(userId, amount)
end

function Framework.giveMoney(playerId, amount)
	playerId = tonumber(playerId)
	local userId = vRP.getUserId(playerId)
	vRP.giveMoney(userId, amount)
end

function Framework.showNotification(playerId, message)
    TriggerClientEvent(EVENTS.SHOW_NOTIFICATION, playerId, message)
end