local AllIDs = {}
local actualHour = os.date("!*t").hour
local S_T = game:GetService("TeleportService")
local S_H = game:GetService("HttpService")

local File = pcall(function()
	AllIDs = S_H:JSONDecode(readfile("server-hop-temp.json"))
end)
if not File then
	table.insert(AllIDs, actualHour)
	pcall(function()
		writefile("server-hop-temp.json", S_H:JSONEncode(AllIDs))
	end)
end

local function TPReturner(placeId, region)
	local foundAnything = ""
	local servers = {}

	repeat
		local Site
		if foundAnything == "" then
			Site = S_H:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. placeId .. '/servers/Public?sortOrder=Asc&limit=100&region=' .. region))
		else
			Site = S_H:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. placeId .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything .. '&region=' .. region))
		end

		for i, v in pairs(Site.data) do
			if tonumber(v.playing) < tonumber(v.maxPlayers) then
				table.insert(servers, v)
			end
		end

		foundAnything = Site.nextPageCursor
	until not foundAnything or foundAnything == "null"

	if #servers > 0 then
		table.sort(servers, function(a, b)
			return a.playing < b.playing
		end)

		for _, v in pairs(servers) do
			local ID = tostring(v.id)
			local Possible = true
			for _, Existing in pairs(AllIDs) do
				if ID == tostring(Existing) then
					Possible = false
					break
				end
			end

			if Possible then
				table.insert(AllIDs, ID)
				pcall(function()
					writefile("server-hop-temp.json", S_H:JSONEncode(AllIDs))
					S_T:TeleportToPlaceInstance(placeId, ID, game.Players.LocalPlayer)
				end)
				break
			end
		end
	end
end

local module = {}
function module:Teleport(placeId, region)
	while true do
		pcall(function()
			TPReturner(placeId, region)
		end)
	end
end

return module
