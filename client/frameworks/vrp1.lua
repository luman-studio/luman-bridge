if Config.Framework ~= Config.FrameworkId.VRP1 then
    return
end

local frameworkFolder = 'vrp'
local function init()
    load(LoadResourceFile(frameworkFolder, 'lib/utils.lua'))()
    local Proxy = module(frameworkFolder, "lib/Proxy")
	return Proxy.getInterface('vRP')
end

local vRP = init()

Framework = {}

function Framework.showNotification(message)
    vRP.notify(message)
end

RegisterNetEvent(EVENTS.SHOW_NOTIFICATION, function(message)
    Framework.showNotification(message)
end)