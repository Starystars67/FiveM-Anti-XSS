local function OnPlayerConnecting(name, setKickReason, deferrals)
	deferrals.defer()
	local identifiers = GetPlayerIdentifiers(source)
	local cname = string.gsub(name, "%s+", "")
	deferrals.update(string.format("Hello %s. Your name is being checked.", name))

	-- Use this for logging and / or banning purposes!
	local ids = ''
	for _, v in pairs(identifiers) do
		local ids = ids..' '..v
	end
	
  	if string.find(cname, "<script") then
    	deferrals.done("Your username seems to be fishy...")
    	logPlayer(name, ids)
	else
		deferrals.done()
	end
end

AddEventHandler("playerConnecting", OnPlayerConnecting)

-- logging here, you can add your own ban system or what not
local function logPlayer(name, ids)
	local string = "Logged User -> "..name..", IDs: "ids.."."
	local file = io.open('resources/'.. GetCurrentResourceName() .. '/Logs/log.txt', "a")
	print(string)
	io.output(file)
	io.write(string)
	io.close(file)
end
