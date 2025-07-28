if Config.Framework ~= Config.FrameworkId.VRP2 then
    return
end

local frameworkFolder = 'vrp'
local function init()
	load(LoadResourceFile(frameworkFolder, 'lib/utils.lua'))()
	local Proxy = module(frameworkFolder, 'lib/Proxy')
	local vRP = Proxy.getInterface('vRP')
	vRP.loadScript(GetCurrentResourceName(), 'client/frameworks/modules/vrp2_extension')
	return Proxy.getInterface('vRP.EXT.LumanStudio')
end
local vRP2 = init()

Framework = {}

function Framework.notify(message)
    vRP2.notify(message)
end