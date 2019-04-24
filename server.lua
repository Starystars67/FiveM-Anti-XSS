local function OnPlayerConnecting(name, setKickReason, deferrals)
    deferrals.defer()
    local cname = string.gsub(name, "%s+", "")
    deferrals.update(string.format("Hello %s. Your name is being checked.", name))

    if string.find(cname, "<script") then
        deferrals.done("Your username seems to be fishy...")
    else
        deferrals.done()
    end
end

AddEventHandler("playerConnecting", OnPlayerConnecting)
