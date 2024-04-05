repeat wait(1) until game:IsLoaded()
if __Starcia["Tools"] then
__Starcia = ({...})[1]
__Alchemy = {}
---------------------------------------------------------------------- [ SETTING ]
__Alchemy["Setting"] = {
    ["UI"] = {
        ["Minimize Key"] = Enum.KeyCode.End,
        ["Theme"] = "Amethyst",
        ["Acrylic"] = false,
        ["Add-On"] = true
    }
}
---------------------------------------------------------------------- [ VALUE ]
__Alchemy["ValueToggle"] = {6543210987654>9876543210987,987654321098765>543210987654321}
__Alchemy["Auto Parry"] = {__Alchemy["ValueToggle"][2],__Alchemy["ValueToggle"][1],__Alchemy["ValueToggle"][2]}
__Alchemy["Executor"] = identifyexecutor()
function __Alchemy:RoExec() if tostring(__Alchemy["Executor"]) == "Krampus" then return __Alchemy["ValueToggle"][2] else return __Alchemy["ValueToggle"][1] end end
function __Alchemy.Hop()
    local PlaceID = game.PlaceId
    local AllIDs = {}
    local foundAnything = ""
    local actualHour = os.date("!*t").hour
    local Deleted = __Alchemy["ValueToggle"][1]
    function TPReturner()
        local Site;
        if foundAnything == "" then
            Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
        else
            Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
        end
        local ID = ""
        if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
            foundAnything = Site.nextPageCursor
        end
        local num = 0;
        for i,v in pairs(Site.data) do
            local Possible = __Alchemy["ValueToggle"][2]
            ID = tostring(v.id)
            if tonumber(v.maxPlayers) > tonumber(v.playing) then
                for _,Existing in pairs(AllIDs) do
                    if num ~= 0 then
                        if ID == tostring(Existing) then
                            Possible = __Alchemy["ValueToggle"][1]
                        end
                    else
                        if tonumber(actualHour) ~= tonumber(Existing) then
                            local delFile = pcall(function()
                                AllIDs = {}
                                table.insert(AllIDs, actualHour)
                            end)
                        end
                    end
                    num = num + 1
                end
                if Possible == __Alchemy["ValueToggle"][2] then
                    table.insert(AllIDs, ID)
                    wait()
                    pcall(function()
                        wait()
                        game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                    end)
                    wait(4)
                end
            end
        end
    end
    function Teleport() 
        while wait() do
            pcall(function()
                TPReturner()
                if foundAnything ~= "" then
                    TPReturner()
                end
            end)
        end
    end
    Teleport()
end
__Alchemy["Call"] = function(input)
    loadstring(game:HttpGet(input))()
end
__Alchemy["Send"] = function(input)
    print(tostring(input))
    setclipboard(tostring(input))
end
__Alchemy["File_Script"] = ""
__Alchemy["Add_Script"] = function(input)
    __Alchemy["File_Script"] = __Alchemy["File_Script"].."\n [>] "..input
end
__Alchemy["File_Remote"] = ""
__Alchemy["Add_Remote"] = function(input)
    __Alchemy["File_Remote"] = __Alchemy["File_Remote"].."\n [>] "..input
end
__Alchemy["File_Script2"] = ""
__Alchemy["Add_Script2"] = function(input)
    __Alchemy["File_Script2"] = __Alchemy["File_Script2"].."\n [>] "..input
end
__Alchemy["File_Part"] = ""
__Alchemy["Add_Part"] = function(input)
    __Alchemy["File_Part"] = __Alchemy["File_Part"].."\n [>] "..input
end
__Alchemy["Lighting_Part"] = ""
__Alchemy["Add_Lighting"] = function(input)
    __Alchemy["Lighting_Part"] = __Alchemy["Lighting_Part"].."\n [>] "..input
end
__Alchemy["File_Gui"] = ""
__Alchemy["Add_Gui"] = function(input)
    __Alchemy["File_Gui"] = __Alchemy["File_Gui"].."\n [>] "..input
end
---------------------------------------------------------------------- [ LOAD FLUENT ]
__Alchemy["Fluent"] = {
    [1] = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))(),
    [2] = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))(),
    [3] = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
}
--[[
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
]]
if __Alchemy:RoExec() then __Alchemy["Fluent"][4] = UDim2.fromOffset(600, 600) else __Alchemy["Fluent"][4] = UDim2.fromOffset(500, 500) end
---------------------------------------------------------------------- [ WINDOW FLUENT ]
__Alchemy["Window"] = {
    [1] = __Alchemy["Fluent"][1]:CreateWindow({
        Title = "Starcia Tools",
        SubTitle = "| "..os.date('%A, %B %d %Y'),
        TabWidth = 160,Size = __Alchemy["Fluent"][4],
        Acrylic = __Alchemy["Setting"]["UI"]["Acrylic"],
        Theme = __Alchemy["Setting"]["UI"]["Theme"],
        MinimizeKey = __Alchemy["Setting"]["UI"]["Minimize Key"]
    })
}
---------------------------------------------------------------------- [ TAB FLUENT ]
__Alchemy["Tab"] = {
    [1] = __Alchemy["Window"][1]:AddTab({ Title = "Load Tools", Icon = "scroll" }),
    [2] = __Alchemy["Window"][1]:AddTab({ Title = "Copy Data", Icon = "feather" }),
    [3] = __Alchemy["Window"][1]:AddTab({ Title = "Miscellaneous", Icon = "globe" })
}
---------------------------------------------------------------------- [ OPTIONS FLUENT ]
__Alchemy["Options"] = __Alchemy["Fluent"][1].Options
__Alchemy["Add"] = {}
---------------------------------------------------------------------- [ SECTION FLUENT ]
do
    --------------------------------------------------- [ SECTION FLUENT : Load Tools ]
    __Alchemy["Tab"][1]:AddSection("Scripts")
    __Alchemy["Tab"][1]:AddButton({
        Title = "[>] Load Dark-Dex",
        Callback = function()
            __Alchemy["Call"]("https://raw.githubusercontent.com/infyiff/backup/main/dex.lua")
        end
    })
    __Alchemy["Tab"][1]:AddButton({
        Title = "[>] Load Remote-Spy (Simple)",
        Callback = function()
            __Alchemy["Call"]("https://raw.githubusercontent.com/78n/SimpleSpy/main/SimpleSpySource.lua")
        end
    })
    __Alchemy["Tab"][1]:AddButton({
        Title = "[>] Load Infinity-Yield",
        Callback = function()
            __Alchemy["Call"]('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source')
        end
    })
    __Alchemy["Tab"][1]:AddButton({
        Title = "[>] Load Hydroxide",
        Callback = function()
            local function webImport(file)
                return loadstring(game:HttpGetAsync(("https://raw.githubusercontent.com/%s/Hydroxide/%s/%s.lua"):format("Upbolt", "revision", file)), file .. '.lua')()
            end
            webImport("init")
            webImport("ui/main")
        end
    })
    --------------------------------------------------- [ SECTION FLUENT : Copy Data ]
    __Alchemy["Tab"][2]:AddSection("Valuable")
    __Alchemy["Tab"][2]:AddButton({
        Title = "[>] Copy CFrame",
        Callback = function()
            __Alchemy["Send"](game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
        end
    })
    __Alchemy["Tab"][2]:AddButton({
        Title = "[>] Copy JobId",
        Callback = function()
            __Alchemy["Send"](game.JobId)
        end
    })
    __Alchemy["Tab"][2]:AddButton({
        Title = "[>] Copy PlaceId",
        Callback = function()
            __Alchemy["Send"](game.PlaceId)
        end
    })
    __Alchemy["Tab"][2]:AddSection("Events")
    __Alchemy["Tab"][2]:AddButton({
        Title = "[>] Copy All Remote",
        Callback = function()
            __Alchemy["File_Remote"] = ""
            __Alchemy["Remote_Count"] = 0
            for i,v in pairs(game:GetDescendants()) do
                if v:IsA("RemoteEvent") or v:IsA("RemoteFunction") then
                    __Alchemy["Add_Remote"](v.Name.." ( Type : "..v.ClassName.." / Parent : "..tostring(v.Parent.Name).." )")
                    __Alchemy["Remote_Count"] = __Alchemy["Remote_Count"] + 1
                end
            end
            __Alchemy["RemoteSendStart"] = "-- Starcia Tools [ discord.gg/alchemyhub ]\n\nFound : "..tostring(__Alchemy["Remote_Count"]).." Remote-Events\n"
            __Alchemy["File_Remote"] = __Alchemy["RemoteSendStart"]..__Alchemy["File_Remote"]
            __Alchemy["Send"](__Alchemy["File_Remote"])
        end
    })
    __Alchemy["Tab"][2]:AddButton({
        Title = "[>] Copy All Local-Script",
        Callback = function()
            __Alchemy["File_Script"] = ""
            __Alchemy["Script_Count"] = 0
            for i,v in pairs(game:GetDescendants()) do
                if v:IsA("LocalScript") then
                    __Alchemy["Add_Script"](v.Name.." ( Parent : "..tostring(v.Parent.Name).." )")
                    __Alchemy["Script_Count"] = __Alchemy["Script_Count"] + 1
                end
            end
            __Alchemy["ScriptSendStart"] = "-- Starcia Tools [ discord.gg/alchemyhub ]\n\nFound : "..tostring(__Alchemy["Script_Count"]).." Local-Scripts\n"
            __Alchemy["File_Script"] = __Alchemy["ScriptSendStart"]..__Alchemy["File_Script"]
            __Alchemy["Send"](__Alchemy["File_Script"])
        end
    })
    __Alchemy["Tab"][2]:AddButton({
        Title = "[>] Copy All Modules-Script",
        Callback = function()
            __Alchemy["File_Script2"] = ""
            __Alchemy["Script_Count2"] = 0
            for i,v in pairs(game:GetDescendants()) do
                if v:IsA("ModuleScript") then
                    __Alchemy["Add_Script2"](v.Name.." ( Parent : "..tostring(v.Parent.Name).." )")
                    __Alchemy["Script_Count2"] = __Alchemy["Script_Count2"] + 1
                end
            end
            __Alchemy["ScriptSendStart2"] = "-- Starcia Tools [ discord.gg/alchemyhub ]\n\nFound : "..tostring(__Alchemy["Script_Count2"]).." Module-Scripts\n"
            __Alchemy["File_Script2"] = __Alchemy["ScriptSendStart2"]..__Alchemy["File_Script2"]
            __Alchemy["Send"](__Alchemy["File_Script2"])
        end
    })
    __Alchemy["Tab"][2]:AddSection("Objects")
    __Alchemy["Tab"][2]:AddButton({
        Title = "[>] Copy Part in Workspace",
        Callback = function()
            __Alchemy["File_Part"] = ""
            __Alchemy["Part_Count"] = 0
            for i,v in pairs(game:GetDescendants()) do
                if v:IsA("Part") then
                    __Alchemy["Add_Part"](v.Name.." ( Parent : "..tostring(v.Parent.Name).." )")
                    __Alchemy["Part_Count"] = __Alchemy["Part_Count"] + 1
                end
            end
            __Alchemy["PartSendStart"] = "-- Starcia Tools [ discord.gg/alchemyhub ]\n\nFound : "..tostring(__Alchemy["Part_Count"]).." Parts\n"
            __Alchemy["File_Part"] = __Alchemy["PartSendStart"]..__Alchemy["File_Part"]
            __Alchemy["Send"](__Alchemy["File_Part"])
        end
    })
    __Alchemy["Tab"][2]:AddButton({
        Title = "[>] Copy Children in Lighting",
        Callback = function()
            __Alchemy["Lighting_Part"] = ""
            __Alchemy["Lighting_Count"] = 0
            for i,v in pairs(game:GetService("Lighting"):GetDescendants()) do
                __Alchemy["Add_Lighting"](v.Name.." ( Type : "..v.ClassName.." / Parent : "..tostring(v.Parent.Name).." )")
                __Alchemy["Lighting_Count"] = __Alchemy["Lighting_Count"] + 1
            end
            __Alchemy["LightingSendStart"] = "-- Starcia Tools [ discord.gg/alchemyhub ]\n\nFound : "..tostring(__Alchemy["Lighting_Count"]).." Objects\n"
            __Alchemy["Lighting_Part"] = __Alchemy["LightingSendStart"]..__Alchemy["Lighting_Part"]
            __Alchemy["Send"](__Alchemy["Lighting_Part"])
        end
    })
    __Alchemy["Tab"][2]:AddButton({
        Title = "[>] Copy Children in CoreGui",
        Callback = function()
            __Alchemy["File_Gui"] = ""
            __Alchemy["Gui_Count"] = 0
            for i,v in pairs(game:GetService("CoreGui"):GetDescendants()) do
                __Alchemy["Add_Gui"](v.Name.." ( Type : "..v.ClassName.." / Parent : "..tostring(v.Parent.Name).." )")
                __Alchemy["Gui_Count"] = __Alchemy["Gui_Count"] + 1
            end
            __Alchemy["GuiSendStart"] = "-- Starcia Tools [ discord.gg/alchemyhub ]\n\nFound : "..tostring(__Alchemy["Gui_Count"]).." Objects\n"
            __Alchemy["File_Gui"] = __Alchemy["GuiSendStart"]..__Alchemy["File_Gui"]
            __Alchemy["Send"](__Alchemy["File_Gui"])
        end
    })
    --------------------------------------------------- [ SECTION FLUENT : Server ]
    __Alchemy["Tab"][3]:AddSection("Server")
    __Alchemy["Tab"][3]:AddButton({
        Title = "[>] Hop Server",
        Callback = function()
            __Alchemy.Hop()
        end
    })
    __Alchemy["Tab"][3]:AddButton({
        Title = "[>] Rejoin Server",
        Callback = function()
            game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
        end
    })
end
__Alchemy["Anti AFK"] = __Alchemy["ValueToggle"][2]
---------------------------------------------------------------------- [ FUNCTION ]
spawn(function()
    pcall(function()
        game:GetService("Players").LocalPlayer.Idled:connect(function()
            if __Alchemy["Anti AFK"] then
                game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
                wait(1)
                game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
            end
        end)
    end)
end)
---------------------------------------------------------------------- [ ENDING ]
__Alchemy["Window"][1]:SelectTab(1)
__Alchemy["Fluent"][1]:Notify({
    Title = "Alchemy Hub",
    Content = "The script load successful",
    Duration = 5
})
if __Alchemy["Setting"]["UI"]["Add-On"] then
    pcall(function()
        __Alchemy["Fluent"][2]:SetLibrary(__Alchemy["Fluent"][1])
        __Alchemy["Fluent"][3]:SetLibrary(__Alchemy["Fluent"][1])
        __Alchemy["Fluent"][2]:SetIgnoreIndexes({})
        __Alchemy["Fluent"][3]:SetFolder("Starcia")
        __Alchemy["Fluent"][2]:SetFolder("Starcia/init")
        __Alchemy["Fluent"][3]:BuildInterfaceSection(__Alchemy["Tab"][3])
        __Alchemy["Fluent"][2]:BuildConfigSection(__Alchemy["Tab"][3])
        __Alchemy["Fluent"][2]:LoadAutoloadConfig()
    end)
end
end
if __Starcia["NameProtect"] then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/x2-Neptune/Starcia/main/Modules/NameProtector.lua"))()
end
if __Starcia["ClientProtect"] then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/x2-Neptune/Starcia/main/Modules/ClientProtector.lua"))()
end
