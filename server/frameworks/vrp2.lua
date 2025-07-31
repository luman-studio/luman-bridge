if Config.Framework ~= Config.FrameworkId.VRP2 then 
	return 
end

local frameworkFolder = 'vrp'
local function init()
	load(LoadResourceFile(frameworkFolder, 'lib/utils.lua'))()
	local Proxy = module(frameworkFolder, 'lib/Proxy')
	local vRP = Proxy.getInterface('vRP')
	vRP.loadScript(GetCurrentResourceName(), 'server/frameworks/modules/vrp2_extension')
	return Proxy.getInterface('vRP.EXT.LumanStudio')
end
local vRP2 = init()

Framework = {}

function Framework.getCharacterName(playerId)
    local identity = vRP2.getIdentity(playerId)
	return identity.firstname, identity.name
end

function Framework.getItemAmount(playerId, extensionName)
	return vRP2.getItemAmount(playerId, extensionName)
end

function Framework.removeItem(playerId, extensionName, amount)
    return vRP2.tryTakeItem(playerId, extensionName, amount)
end

function Framework.addItem(playerId, extensionName, amount)
    return vRP2.tryGiveItem(playerId, extensionName, amount)
end

function Framework.getMoneyAmount(playerId)
	return vRP2.getWallet(playerId)
end

function Framework.removeMoney(playerId, amount)
	return vRP2.tryPayment(playerId, amount)
end

function Framework.addMoney(playerId, amount)
	return vRP2.giveWallet(playerId, amount)
end

function Framework.getJob(playerId)
	return vRP2.getGroupByType(playerId, 'job')
end