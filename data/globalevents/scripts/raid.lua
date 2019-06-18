local raids =
	{
		[1] = 
			{
				name = 'HornedFox',
				type = 'weekly',
				days = {'friday'},
				hour = 20,
				minu = 00
			}
	}
	
local last_execsutes = {}

function onThink(interval, lastExecution, thinkInterval)
	local static_time = os.time()
	for k, raid in ipairs(raids) do
		if (raid.type == 'weekly') then
			local day = os.date("%A", static_time):lower()
			if isInArray(raid.days, day) then
				local hour = tonumber(os.date("%H", static_time))
				if (raid.hour == hour) then
					local minute = tonumber(os.date("%M", static_time))
					if (raid.minu == minute) then
						local day_number = tonumber(os.date("%d", static_time))
						if (last_execsutes[k] ~= day_number) then
							last_execsutes[k] = day_number
							doExecuteRaid(raid.name)
						end
					end
				end
			end
		elseif (raid.type == 'exact') then
			local month = tonumber(os.date("%m", static_time))
			if (raid.date.month == month) then
				local day = tonumber(os.date("%d", static_time))
				if (raid.date.day == day) then
					local hour = tonumber(os.date("%H", static_time))
					if (raid.hour == hour) then
						local minute = tonumber(os.date("%M", static_time))
						if (raid.minu == minute) then
							if (last_execsutes[k] ~= day) then
								last_execsutes[k] = day
								doExecuteRaid(raid.name)
							end
						end
					end
				end
			end
		end
	end
	return true
end