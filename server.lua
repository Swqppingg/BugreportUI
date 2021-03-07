function GetPlayerNeededIdentifiers(source)
		local ids = GetPlayerIdentifiers(source)
		for i,theIdentifier in ipairs(ids) do
			if string.find(theIdentifier,"license:") or -1 > -1 then
				license = theIdentifier
			elseif string.find(theIdentifier,"steam:") or -1 > -1 then
				steam = theIdentifier
			elseif string.find(theIdentifier,"discord:") or -1 > -1 then
				discord = theIdentifier
			end
		end
		if not steam then
			steam = "Not found"
		end
		if not discord then
			discord = "Not found"
		end
		return license, steam, discord2
	end


RegisterNetEvent("BugreportUI:sendReport")
AddEventHandler("BugreportUI:sendReport", function(data)

  discord = data['data'][1]
  description = data['data'][2]

	  local license, steam, discord2 = GetPlayerNeededIdentifiers(source)

if Config.displayidentifiers then
  PerformHttpRequest(Config.discordwebhooklink, function(err, text, headers) end, 'POST', json.encode(
    {
      username = "Bug Reports",
      --avatar_url = Image,
      embeds = {
        {
          title = "New Bug Report",
          color = 16754176,
          description = "**User:** ".. GetPlayerName(source) .. " **[ID:** ".. source .."**]**\n**Bug Description:** ".. description .."\n**Steam:** ".. steam:gsub('steam:', '') .."\n**GameLicense:** ".. license:gsub('license:', '') .."\n**Discord UID:** ".. discord:gsub('discord:', '') .."\n**Discord Tag:** <@!"..  discord:gsub('discord:', '') .. ">",
        }
      },
    }), { ['Content-Type'] = 'application/json' })


  TriggerClientEvent("BugreportUI:reportSent", source)
  TriggerClientEvent("pNotify:SendNotification", source,{text = "Your bug report was successfully sent to our developers", type = "success", queue = "global", timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_open", close = "gta_effects_fade_out"},killer = true})
else
  PerformHttpRequest(Config.discordwebhooklink, function(err, text, headers) end, 'POST', json.encode(
    {
      username = "Bug Reports",
      --avatar_url = Image,
      embeds = {
        {
          title = "New Bug Report",
          color = 16754176,
          description = "**User:** ".. GetPlayerName(source) .. " **[ID:** ".. source .."**]**\n**Bug Description:** ".. description .."",
        }
      },
    }), { ['Content-Type'] = 'application/json' })


  TriggerClientEvent("BugreportUI:reportSent", source)
  TriggerClientEvent("pNotify:SendNotification", source,{text = "Your bug report was successfully sent to our developers", type = "success", queue = "global", timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_open", close = "gta_effects_fade_out"},killer = true})
  end
end)

RegisterNetEvent("BugreportUI:emptyFields")
AddEventHandler("BugreportUI:emptyFields", function(data)
	TriggerClientEvent("pNotify:SendNotification", source,{text = "Please fill in all the required fields", type = "error", queue = "global", timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_open", close = "gta_effects_fade_out"},killer = true})
end)

Citizen.CreateThread(function()
	if (GetCurrentResourceName() ~= "BugreportUI") then 
		print("[" .. GetCurrentResourceName() .. "] " .. "IMPORTANT: This resource must be named BugreportUI for it to work properly!");
		print("[" .. GetCurrentResourceName() .. "] " .. "IMPORTANT: This resource must be named BugreportUI for it to work properly!");
		print("[" .. GetCurrentResourceName() .. "] " .. "IMPORTANT: This resource must be named BugreportUI for it to work properly!");
		print("[" .. GetCurrentResourceName() .. "] " .. "IMPORTANT: This resource must be named BugreportUI for it to work properly!");
	end
end)

Citizen.CreateThread(function()
    if Config.discordwebhooklink == "WEBHOOK_HERE" then
        print("[" .. GetCurrentResourceName() .. "] " .. "IMPORTANT: You need to change the webhook link in server.lua for it to work properly");
        print("[" .. GetCurrentResourceName() .. "] " .. "IMPORTANT: You need to change the webhook link in server.lua for it to work properly");
        print("[" .. GetCurrentResourceName() .. "] " .. "IMPORTANT: You need to change the webhook link in server.lua for it to work properly");
        print("[" .. GetCurrentResourceName() .. "] " .. "IMPORTANT: You need to change the webhook link in server.lua for it to work properly");
    end
end)

-- Version Check
Citizen.CreateThread(
	function()
		if Config.versionchecker then
		local vRaw = LoadResourceFile(GetCurrentResourceName(), 'version.json')
		if vRaw and Config.versionCheck then
			local v = json.decode(vRaw)
			PerformHttpRequest(
				'https://raw.githubusercontent.com/Swqppingg/BugreportUI/main/version.json',
				function(code, res, headers)
					if code == 200 then
						local rv = json.decode(res)
						if rv.version ~= v.version then
							print(
								([[^1
-------------------------------------------------------
BugreportUI
UPDATE: %s AVAILABLE
CHANGELOG: %s
DOWNLOAD: https://github.com/Swqppingg/BugreportUI
-------------------------------------------------------
^0]]):format(
									rv.version,
									rv.changelog
								)
							)
						end
					else
						print('^BugreportUI was unable to check version^0')
					end
				end,
				'GET'
			)
		end
	end
end)
