__Starcia = {({...})[1],{},{"discord.gg/alchemyhub",1}}
if __Starcia[1][1] then
    table.insert("https://raw.githubusercontent.com/x2-Neptune/Starcia/main/Modules/NameProtector.lua",__Starcia[2])
end
if __Starcia[1][2] then
    table.insert("https://raw.githubusercontent.com/x2-Neptune/Starcia/main/Modules/NameProtector.lua",__Starcia[2])
end
for stc=__Starcia[3][1],#__Starcia[2] do
    loadstring(game:HttpGet(__Starcia[2][stc]))()
end
