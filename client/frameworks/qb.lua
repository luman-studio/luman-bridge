if Config.Framework ~= Config.FrameworkId.QB then
    return
end

local QBCore = exports[Config.FrameworkFolder.QB]:GetCoreObject()

Framework = {}

function Framework.showNotification(message)
    TriggerEvent('QBCore:Notify', message)
end

RegisterNetEvent(EVENTS.SHOW_NOTIFICATION, function(message)
    Framework.showNotification(message)
end)