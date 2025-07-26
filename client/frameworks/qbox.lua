if Config.Framework ~= Config.FrameworkId.QBOX then
    return
end

local QBOXCore = exports[Config.FrameworkFolder.QBOX]:GetCoreObject()

Framework = {}

function Framework.showNotification(message)
    -- TriggerEvent('QBCore:Notify', message)
    -- exports.qbx_core:Notify(message, 'success')
    QBOXCore:Notify(message)
end

RegisterNetEvent(EVENTS.SHOW_NOTIFICATION, function(message)
    Framework.showNotification(message)
end)