amdeathrayactive = 0 -- set variable on load so its not nil and maybe cause problems somehow

function am_update_deathray_variable() -- called on registered combat text events
	if event == "SPELLCAST_CHANNEL_START" then
		amdeathrayactive = 1
	elseif event == "SPELLCAST_CHANNEL_STOP" then
		amdeathrayactive = 0
	end
end

function am_deathray_eviscerate()
	if amdeathrayactive == 1 then
		--do nothing
	else
		CastSpellByName("Eviscerate") -- this is obviously the part to edit for any other class that wants to use this
	end
end
