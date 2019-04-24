local function OnPlayerConnecting(name, setKickReason, deferrals)
  local identifiers, licenseIdentifier, discordIdentifier, steamIdentifier = GetPlayerIdentifiers(source)
  deferrals.defer()
  local cname = string.gsub(name, "%s+", "")
  deferrals.update(string.format("Hello %s. Your name is being checked.", name))

  -- Use this for logging and / or banning purposes!
  for _, v in pairs(identifiers) do
    if string.find(v, "steam") then
      steamIdentifier = v
      break
    end
    if string.find(v, "license") then
      licenseIdentifier = v
      break
    end
    if string.find(v, "discord") then
      discordIdentifier = v
      break
    end
  end

  if string.find(cname, "<script") then
    deferrals.done("Your username seems to be fishy...")
    logPlayer(name, licenseIdentifier, steamIdentifier, discordIdentifier)
  else
    deferrals.done()
  end
end

AddEventHandler("playerConnecting", OnPlayerConnecting)

-- logging here, you can add your own ban system or what not
local function logPlayer(n, l, s, d)
  local string = "Logged User -> "..n..", License: "..l..", Steam: "..s..", Discord: "..d.."."
  print(string)
	file = io.open('resources/'.. GetCurrentResourceName() .. '/Logs/log.txt', "a")
	io.output(file)
  io.write(string)
  io.close(file)
end
