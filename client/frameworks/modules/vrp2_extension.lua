local function registerExtension(extensionName)
    local extension = class(extensionName, vRP.Extension)

    extension.proxy = {}
    extension.event = {}
    extension.tunnel = {}

    function extension.proxy:notify(message)
        vRP.EXT.Base:notify(message)
    end

    vRP:registerExtension(extension)

    print(('[luman-bridge]: Extension %s loaded.'):format(extensionName))
end
registerExtension('LumanStudio')