if Config.Framework ~= Config.FrameworkId.VRP2 then 
	return 
end

local frameworkFolder = Config.FrameworkFolder.VRP2
local function init()
	load(LoadResourceFile(frameworkFolder, 'lib/utils.lua'))()
	local Proxy = module(frameworkFolder, 'lib/Proxy')
	local vRP = Proxy.getInterface('vRP')
	vRP.loadScript(GetCurrentResourceName(), 'server/frameworks/modules/vrp2_extension')
	return Proxy.getInterface('vRP.EXT.LumanStudio')
end
local vRP2 = init()

Framework = {}

function Framework.hasItem(playerId, extensionName, amount)
	local hasItem = vRP2.hasItem(playerId, extensionName, amount)
    return hasItem
end

function Framework.takeItem(playerId, extensionName, amount)
    return vRP2.takeItem(playerId, extensionName, amount)
end

function Framework.giveItem(playerId, extensionName, amount)
    return vRP2.giveItem(playerId, extensionName, amount)
end

function Framework.hasMoney(playerId, amount)
	return vRP2.hasMoney(playerId, amount)
end

function Framework.takeMoney(playerId, amount)
	return vRP2.takeMoney(playerId, amount)
end

function Framework.giveMoney(playerId, amount)
	return vRP2.giveMoney(playerId, amount)
end

function Framework.showNotification(playerId, message)
    return vRP2.showNotification(playerId, message)
end

function Framework.getCharacterName(playerId)
    return vRP2.getCharacterName(playerId)
end