-------------------
-- Notifications --
-------------------
exports('notify', function(message)
    Framework.notify(message)
end)

RegisterNetEvent(EVENTS.SHOW_NOTIFICATION, function(message)
    Framework.notify(message)
end)