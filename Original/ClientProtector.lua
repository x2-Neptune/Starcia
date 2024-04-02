__StarciaProtector = {
    game:GetService("RbxAnalyticsService"),
    game:GetService("HttpService"),
    "Protect By Starcia [ Alchemy Hub ]"
}
for i,v in pairs({__StarciaProtector[1].GetClientId, __StarciaProtector[1]["GetClientId\00"]}) do
    hookfunction(v, function()
        return __StarciaProtector[3]
    end)
end
local oldNamecall
oldNamecall = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
    if self == __StarciaProtector[1] and getnamecallmethod() == "GetClientId" then
        return __StarciaProtector[3]
    end
    return oldNamecall(self, ...)
end))
local oldNamecall
oldNamecall = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
    if self == __StarciaProtector[2] and getnamecallmethod() == "JSONDecode" then
        return {__StarciaProtector[3],__StarciaProtector[3],origin = __StarciaProtector[3]}
    end
    return oldNamecall(self, ...)
end))
