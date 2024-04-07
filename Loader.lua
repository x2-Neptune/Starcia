repeat wait(1) until game:IsLoaded()
__Starcia = ({...})[1]
if __Starcia["Tools"] then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/x2-Neptune/Starcia/main/Modules/Tools.lua"))()
end
if __Starcia["NameProtect"] then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/x2-Neptune/Starcia/main/Modules/NameProtector.lua"))()
end
if __Starcia["ClientProtect"] then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/x2-Neptune/Starcia/main/Modules/ClientProtector.lua"))()
end
