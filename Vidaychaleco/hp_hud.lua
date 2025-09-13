script_name('Numeric HP')
script_author('NeaDuruki')
script_version('pervaya lol')
function main()
	while true do wait(0)
		while not isPlayerPlaying(PLAYER_HANDLE) do wait(0) end
		useRenderCommands(true) -- use lua render
		setTextCentre(true) -- set text centered
		setTextScale(0.2, 0.5) -- x y size
		setTextColour(255--[[r]], 255--[[g]], 255--[[b]], 255--[[a]])
		setTextEdge(1--[[outline size]], 0--[[r]], 0--[[g]], 0--[[b]], 255--[[a]])
		displayTextWithNumber(578.0, 68.5, 'NUMBER', getCharHealth(PLAYER_PED))
		if getCharArmour(PLAYER_PED) > 0 then
			setTextCentre(true) -- set text centered
			setTextScale(0.2, 0.5) -- x y size
			setTextColour(255--[[r]], 255--[[g]], 255--[[b]], 255--[[a]])
			setTextEdge(1--[[outline size]], 0--[[r]], 0--[[g]], 0--[[b]], 255--[[a]])
			displayTextWithNumber(578.0, 47.0, 'NUMBER', getCharArmour(PLAYER_PED))
		end
	end
end