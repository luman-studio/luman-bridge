if Config.Framework ~= Config.FrameworkId.STANDALONE then
    return
end

Framework = {}

function Framework.showNotification(message)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(message)
    DrawNotification(false, false)
end

RegisterNetEvent(EVENTS.SHOW_NOTIFICATION, function(message)
    Framework.showNotification(message)
end)