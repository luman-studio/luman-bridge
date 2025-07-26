if Config.Framework ~= Config.FrameworkId.VRP1 then
    return
end

local function init()
	return load(LoadResourceFile(GetCurrentResourceName(), 'client/frameworks/modules/vrp1_proxy.lua'))()
end

local vRP = init()

Framework = {}

function Framework.showNotification(message)
    vRP.notify({message})
end

RegisterNetEvent(EVENTS.SHOW_NOTIFICATION, function(message)
    Framework.showNotification(message)
end)