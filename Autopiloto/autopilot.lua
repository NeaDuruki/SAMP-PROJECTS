script_name("AutoPilot")
script_author("NeaDuruki")
pSpeed = 30
require "lib.moonloader"

function main()
	repeat wait(0) until isSampAvailable()
	sampRegisterChatCommand("ap", AutoPilot)
	sampRegisterChatCommand("ap.speed", Speed)
	sampRegisterChatCommand("ap.stop", Stop)
	wait(-1)
end


function AutoPilot()
	printStringNow("Ah shit, here we go again.", 2000)
	if isCharInAnyCar(PLAYER_PED) then
		if getTargetBlipCoordinatesFixed() then
			local _, x, y, z = getTargetBlipCoordinatesFixed()
			taskCarDriveToCoord(PLAYER_PED, storeCarCharIsInNoSave(PLAYER_PED), x, y, z, pSpeed, 0, 0, 2)
		end
	end
end

function Speed(arg)
	pSpeed = arg
	printStringNow(pSpeed, 2000)
end

function getTargetBlipCoordinatesFixed()
    local bool, x, y, z = getTargetBlipCoordinates(); if not bool then return false end
    requestCollision(x, y); loadScene(x, y, z)
    local bool, x, y, z = getTargetBlipCoordinates()
    return bool, x, y, z
end

function Stop()
	taskWarpCharIntoCarAsDriver(PLAYER_PED, storeCarCharIsInNoSave(PLAYER_PED))
end