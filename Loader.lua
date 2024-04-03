repeat wait(1) until game:IsLoaded()
__Starcia = ({...})[1]
if __Starcia["NameProtect"] then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/x2-Neptune/Starcia/main/Modules/NameProtector.lua"))()
end
if __Starcia["ClientProtect"] then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/x2-Neptune/Starcia/main/Modules/ClientProtector.lua"))()
end
if __Starcia["Tools"] then
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
    if __Alchemy:RoExec() then __Alchemy["Fluent"][4] = UDim2.new(0.1, 315, 0.2, 310) else __Alchemy["Fluent"][4] = UDim2.new(0.1, 315, 0.1, 310) end
    ---------------------------------------------------------------------- [ WINDOW FLUENT ]
    __Alchemy["Window"] = {
        [1] = __Alchemy["Fluent"][1]:CreateWindow({
            Title = "Starcia",
            SubTitle = "| "..os.date('%A, %B %d %Y'),
            TabWidth = 160,Size = __Alchemy["Fluent"][4],
            Acrylic = __Alchemy["Setting"]["UI"]["Acrylic"],
            Theme = __Alchemy["Setting"]["UI"]["Theme"],
            MinimizeKey = __Alchemy["Setting"]["UI"]["Minimize Key"]
        })
    }
    ---------------------------------------------------------------------- [ TAB FLUENT ]
    __Alchemy["Tab"] = {
        [1] = __Alchemy["Window"][1]:AddTab({ Title = "Information", Icon = "info" }),
        [2] = __Alchemy["Window"][1]:AddTab({ Title = "Settings", Icon = "settings" })
    }
    ---------------------------------------------------------------------- [ OPTIONS FLUENT ]
    __Alchemy["Options"] = __Alchemy["Fluent"][1].Options
    __Alchemy["Add"] = {}
    ---------------------------------------------------------------------- [ SECTION FLUENT ]
    do
        --------------------------------------------------- [ SECTION FLUENT : General ]
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
        __Alchemy["Tab"][1]:AddButton({
            Title = "[>] Copy CFrame",
            Callback = function()
                __Alchemy["Send"](game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
            end
        })
        __Alchemy["Tab"][1]:AddButton({
            Title = "[>] Copy JobId",
            Callback = function()
                __Alchemy["Send"](game.JobId)
            end
        })
        __Alchemy["Tab"][1]:AddButton({
            Title = "[>] Copy PlaceId",
            Callback = function()
                __Alchemy["Send"](game.PlaceId)
            end
        })
        __Alchemy["Tab"][1]:AddButton({
            Title = "[>] Hop Server",
            Callback = function()
                __Alchemy.Hop()
            end
        })
        __Alchemy["Tab"][1]:AddButton({
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
            __Alchemy["Fluent"][3]:BuildInterfaceSection(__Alchemy["Tab"][2])
            __Alchemy["Fluent"][2]:BuildConfigSection(__Alchemy["Tab"][2])
            __Alchemy["Fluent"][2]:LoadAutoloadConfig()
        end)
    end
end
