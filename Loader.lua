__StarciaGet = {}
__StarciaGet.Pack = ({...})[1]
__StarciaGet.InjectCheck = false
__StarciaGet.UIEnable = true
function __StarciaGet:RandomString(length) 
    local characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    local result = ""  
    for i = 1, length do 
        local index = math.random(1, #characters) 
        result = result .. string.sub(characters, index, index) 
    end  
    return result
end
function __StarciaGet:Drag(Frame, object)
    dragToggle = nil
    dragSpeed = .25
    dragInput = nil
    dragStart = nil
    dragPos = nil
    function updateInput(input)
        Delta = input.Position - dragStart
        Position =
            UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
        game:GetService("TweenService"):Create(object, TweenInfo.new(dragSpeed), {Position = Position}):Play()
    end
    Frame.InputBegan:Connect(
        function(input)
            if
                (input.UserInputType == Enum.UserInputType.MouseButton1 or
                    input.UserInputType == Enum.UserInputType.Touch)
            then
                dragToggle = true
                dragStart = input.Position
                startPos = object.Position
                input.Changed:Connect(
                    function()
                        if (input.UserInputState == Enum.UserInputState.End) then
                            dragToggle = false
                        end
                    end
                )
            end
        end
    )
    Frame.InputChanged:Connect(
        function(input)
            if
                (input.UserInputType == Enum.UserInputType.MouseMovement or
                    input.UserInputType == Enum.UserInputType.Touch)
            then
                dragInput = input
            end
        end
    )
    game:GetService("UserInputService").InputChanged:Connect(
    function(input)
        if (input == dragInput and dragToggle) then
            updateInput(input)
        end
    end
    )
end
__StarciaGUI = {
    [1] = Instance.new("ScreenGui"),
    [2] = Instance.new("Frame"),
    [3] = Instance.new("UICorner"),
    [4] = Instance.new("TextLabel"),
    ["__Execute"] = Instance.new("TextButton"),
    [5] = Instance.new("UICorner"),
    ["__Inject"] = Instance.new("TextButton"),
    ["UICorner"] = Instance.new("UICorner"),
    [6] = Instance.new("ScrollingFrame"),
    [7] = Instance.new("TextBox"),
    ["UICorner_2"] = Instance.new("UICorner"),
    [8] = Instance.new("UIGradient")
}
__StarciaGUI[1].Name = tostring(__StarciaGet:RandomString(16))
__StarciaGUI[1].Parent = game.CoreGui
__StarciaGUI[1].ZIndexBehavior = Enum.ZIndexBehavior.Sibling
__StarciaGUI[2].Name = tostring(__StarciaGet:RandomString(16))
__StarciaGUI[2].Parent = __StarciaGUI[1]
__StarciaGUI[2].AnchorPoint = Vector2.new(0.5, 0.5)
__StarciaGUI[2].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
__StarciaGUI[2].BorderColor3 = Color3.fromRGB(0, 0, 0)
__StarciaGUI[2].BorderSizePixel = 0
__StarciaGUI[2].Position = UDim2.new(0.5, 0, 0.5, 0)
__StarciaGUI[2].Size = __StarciaGet.Pack[3]
__StarciaGUI[3].CornerRadius = UDim.new(0, 5)
__StarciaGUI[3].Name = tostring(__StarciaGet:RandomString(16))
__StarciaGUI[3].Parent = __StarciaGUI[2]
__StarciaGUI[4].Name = tostring(__StarciaGet:RandomString(16))
__StarciaGUI[4].Parent = __StarciaGUI[2]
__StarciaGUI[4].AnchorPoint = Vector2.new(0.5, 0.5)
__StarciaGUI[4].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
__StarciaGUI[4].BackgroundTransparency = 1.000
__StarciaGUI[4].BorderColor3 = Color3.fromRGB(0, 0, 0)
__StarciaGUI[4].BorderSizePixel = 0
__StarciaGUI[4].Position = UDim2.new(0.499334067, 0, 0.0783208013, 0)
__StarciaGUI[4].Size = UDim2.new(0.884259284, 0, 0.0686716884, 0)
__StarciaGUI[4].Font = Enum.Font.GothamBold
__StarciaGUI[4].Text = "Starcia Executor : Alchemy Hub"
__StarciaGUI[4].TextColor3 = Color3.fromRGB(255, 255, 255)
__StarciaGUI[4].TextSize = 16.000
__StarciaGUI["__Execute"].Name = "__Execute"
__StarciaGUI["__Execute"].Parent = __StarciaGUI[2]
__StarciaGUI["__Execute"].AnchorPoint = Vector2.new(0.5, 0.5)
__StarciaGUI["__Execute"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
__StarciaGUI["__Execute"].BackgroundTransparency = 0.900
__StarciaGUI["__Execute"].BorderColor3 = Color3.fromRGB(0, 0, 0)
__StarciaGUI["__Execute"].BorderSizePixel = 0
__StarciaGUI["__Execute"].Position = UDim2.new(0.664375722, 0, 0.910609841, 0)
__StarciaGUI["__Execute"].Size = UDim2.new(0.300000012, 0, 0.0916457772, 0)
__StarciaGUI["__Execute"].Font = Enum.Font.Gotham
__StarciaGUI["__Execute"].Text = "[ Execute ]"
__StarciaGUI["__Execute"].TextColor3 = Color3.fromRGB(255, 255, 255)
__StarciaGUI["__Execute"].TextSize = 14.000
__StarciaGUI["__Execute"].TextWrapped = true
__StarciaGUI[5].CornerRadius = UDim.new(0, 3)
__StarciaGUI[5].Name = tostring(__StarciaGet:RandomString(16))
__StarciaGUI[5].Parent = __Execute
__StarciaGUI["__Inject"].Name = "__Inject"
__StarciaGUI["__Inject"].Parent = __StarciaGUI[2]
__StarciaGUI["__Inject"].AnchorPoint = Vector2.new(0.5, 0.5)
__StarciaGUI["__Inject"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
__StarciaGUI["__Inject"].BackgroundTransparency = 0.900
__StarciaGUI["__Inject"].BorderColor3 = Color3.fromRGB(0, 0, 0)
__StarciaGUI["__Inject"].BorderSizePixel = 0
__StarciaGUI["__Inject"].Position = UDim2.new(0.332187891, 0, 0.910609841, 0)
__StarciaGUI["__Inject"].Size = UDim2.new(0.300000012, 0, 0.0916457772, 0)
__StarciaGUI["__Inject"].Font = Enum.Font.Gotham
__StarciaGUI["__Inject"].Text = "[ Clear ]"
__StarciaGUI["__Inject"].TextColor3 = Color3.fromRGB(255, 255, 255)
__StarciaGUI["__Inject"].TextSize = 14.000
__StarciaGUI["__Inject"].TextWrapped = true
__StarciaGUI["UICorner"].CornerRadius = UDim.new(0, 3)
__StarciaGUI["UICorner"].Parent = __Inject
__StarciaGUI[6].Name = tostring(__StarciaGet:RandomString(16))
__StarciaGUI[6].Parent = __StarciaGUI[2]
__StarciaGUI[6].Active = true
__StarciaGUI[6].AnchorPoint = Vector2.new(0.5, 0.5)
__StarciaGUI[6].BackgroundColor3 = Color3.fromRGB(0, 0, 0)
__StarciaGUI[6].BackgroundTransparency = 1.000
__StarciaGUI[6].BorderColor3 = Color3.fromRGB(0, 0, 0)
__StarciaGUI[6].BorderSizePixel = 0
__StarciaGUI[6].Position = UDim2.new(0.500999987, 0, 0.488999993, 0)
__StarciaGUI[6].Size = UDim2.new(0.954999983, 0, 0.671000004, 0)
__StarciaGUI[6].CanvasSize = UDim2.new(__StarciaGet.Pack[1], 0, __StarciaGet.Pack[2], 0)
__StarciaGUI[6].ScrollBarThickness = 6
__StarciaGUI[6].VerticalScrollBarInset = Enum.ScrollBarInset.Always
__StarciaGUI[7].Name = tostring(__StarciaGet:RandomString(16))
__StarciaGUI[7].Parent = __StarciaGUI[6]
__StarciaGUI[7].AnchorPoint = Vector2.new(0.5, 0.5)
__StarciaGUI[7].BackgroundColor3 = Color3.fromRGB(0, 0, 0)
__StarciaGUI[7].BackgroundTransparency = 0.800
__StarciaGUI[7].BorderColor3 = Color3.fromRGB(0, 0, 0)
__StarciaGUI[7].BorderSizePixel = 0
__StarciaGUI[7].Position = UDim2.new(0.5, 0, 0.5, 0)
__StarciaGUI[7].Size = UDim2.new(1, 0, 1, 0)
__StarciaGUI[7].ClearTextOnFocus = false
__StarciaGUI[7].Font = Enum.Font.SourceSans
__StarciaGUI[7].MultiLine = true
__StarciaGUI[7].PlaceholderColor3 = Color3.fromRGB(103, 51, 154)
__StarciaGUI[7].PlaceholderText = "-- Starcia Exectuor Support By Alchemy Hub"
__StarciaGUI[7].Text = ""
__StarciaGUI[7].TextColor3 = Color3.fromRGB(255, 255, 255)
__StarciaGUI[7].TextSize = 16.000
__StarciaGUI[7].TextWrapped = true
__StarciaGUI[7].TextXAlignment = Enum.TextXAlignment.Left
__StarciaGUI[7].TextYAlignment = Enum.TextYAlignment.Top
__StarciaGUI["UICorner_2"].CornerRadius = UDim.new(0, 3)
__StarciaGUI["UICorner_2"].Parent = __StarciaGUI[7]
__StarciaGUI[8].Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 0, 0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(51, 26, 77))}
__StarciaGUI[8].Rotation = 250
__StarciaGUI[8].Name = tostring(__StarciaGet:RandomString(16))
__StarciaGUI[8].Parent = __StarciaGUI[2]
__StarciaGUI["__Inject"].MouseButton1Click:Connect(function()
    __StarciaGUI[7].Text = ""
end)
__StarciaGUI["__Execute"].MouseButton1Click:Connect(function()
    if tostring(string.upper(__StarciaGUI[7].Text)) == "DEX" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/dex.lua"))()
    elseif tostring(string.upper(__StarciaGUI[7].Text)) == "IY" then
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    elseif tostring(string.upper(__StarciaGUI[7].Text)) == "SPY" or tostring(string.upper(__StarciaGUI[7].Text)) == "RSPY" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/78n/SimpleSpy/main/SimpleSpySource.lua"))()
    elseif tostring(string.upper(__StarciaGUI[7].Text)) == "HY" then
        local function webImport(file)
            return loadstring(game:HttpGetAsync(("https://raw.githubusercontent.com/%s/Hydroxide/%s/%s.lua"):format("Upbolt", "revision", file)), file .. '.lua')()
        end
        webImport("init")
        webImport("ui/main")
    else
        loadstring(tostring(__StarciaGUI[7].Text))()
    end
end)
game:GetService('UserInputService').InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.End then
        if __StarciaGet.UIEnable then
            __StarciaGet.UIEnable = false
            __StarciaGUI[2].Visible = false
        else
            __StarciaGet.UIEnable = true
            __StarciaGUI[2].Visible = true
        end
    end
end)
__StarciaGet:Drag(__StarciaGUI[2], __StarciaGUI[2])
-------------------------------------
--[[

]]
