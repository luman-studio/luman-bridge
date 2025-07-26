if Config.Framework ~= Config.FrameworkId.ESX then
    return
end

local ESX = exports[Config.FrameworkFolder.ESX]:getSharedObject()

Framework = {}

function Framework.showNotification(message)
    return ESX.ShowNotification(message)
end

RegisterNetEvent(EVENTS.SHOW_NOTIFICATION, function(message)
    Framework.showNotification(message)
end)