__StarciaConnect = {}
__StarciaGet = {}
__StarciaGet.InjectCheck = false
function __StarciaGet:Notify(Text_i)
    game.StarterGui:SetCore("SendNotification", {
        Title = "Starcia",
        Text = Text_i,
        Duration = 5
    })
end
function __StarciaConnect:GUI(CanvasSizeA,CanvasSizeB)
    local __Starcia = Instance.new("ScreenGui")
    local __Starcia_2 = Instance.new("Frame")
    local __Starcia_3 = Instance.new("UICorner")
    local __Starcia_4 = Instance.new("TextLabel")
    local __Execute = Instance.new("TextButton")
    local __Starcia_5 = Instance.new("UICorner")
    local __Inject = Instance.new("TextButton")
    local UICorner = Instance.new("UICorner")
    local __Starcia_6 = Instance.new("ScrollingFrame")
    local __Starcia_7 = Instance.new("TextBox")
    local UICorner_2 = Instance.new("UICorner")
    local __Starcia_8 = Instance.new("UIGradient")
    __Starcia.Name = "__Starcia"
    __Starcia.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    __Starcia.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    __Starcia_2.Name = "__Starcia"
    __Starcia_2.Parent = __Starcia
    __Starcia_2.AnchorPoint = Vector2.new(0.5, 0.5)
    __Starcia_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    __Starcia_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
    __Starcia_2.BorderSizePixel = 0
    __Starcia_2.Position = UDim2.new(0.5, 0, 0.5, 0)
    __Starcia_2.Size = UDim2.new(0.300000012, 0, 0.300000012, 0)
    __Starcia_3.CornerRadius = UDim.new(0, 5)
    __Starcia_3.Name = "__Starcia"
    __Starcia_3.Parent = __Starcia_2
    __Starcia_4.Name = "__Starcia"
    __Starcia_4.Parent = __Starcia_2
    __Starcia_4.AnchorPoint = Vector2.new(0.5, 0.5)
    __Starcia_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    __Starcia_4.BackgroundTransparency = 1.000
    __Starcia_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
    __Starcia_4.BorderSizePixel = 0
    __Starcia_4.Position = UDim2.new(0.499334067, 0, 0.0783208013, 0)
    __Starcia_4.Size = UDim2.new(0.884259284, 0, 0.0686716884, 0)
    __Starcia_4.Font = Enum.Font.GothamBold
    __Starcia_4.Text = "Starcia Executor : Alchemy Hub"
    __Starcia_4.TextColor3 = Color3.fromRGB(255, 255, 255)
    __Starcia_4.TextSize = 16.000
    __Execute.Name = "__Execute"
    __Execute.Parent = __Starcia_2
    __Execute.AnchorPoint = Vector2.new(0.5, 0.5)
    __Execute.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    __Execute.BackgroundTransparency = 0.900
    __Execute.BorderColor3 = Color3.fromRGB(0, 0, 0)
    __Execute.BorderSizePixel = 0
    __Execute.Position = UDim2.new(0.664375722, 0, 0.910609841, 0)
    __Execute.Size = UDim2.new(0.300000012, 0, 0.0916457772, 0)
    __Execute.Font = Enum.Font.Gotham
    __Execute.Text = "[ Execute ]"
    __Execute.TextColor3 = Color3.fromRGB(255, 255, 255)
    __Execute.TextSize = 16.000
    __Execute.TextWrapped = true
    __Starcia_5.CornerRadius = UDim.new(0, 3)
    __Starcia_5.Name = "__Starcia"
    __Starcia_5.Parent = __Execute
    __Inject.Name = "__Inject"
    __Inject.Parent = __Starcia_2
    __Inject.AnchorPoint = Vector2.new(0.5, 0.5)
    __Inject.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    __Inject.BackgroundTransparency = 0.900
    __Inject.BorderColor3 = Color3.fromRGB(0, 0, 0)
    __Inject.BorderSizePixel = 0
    __Inject.Position = UDim2.new(0.332187891, 0, 0.910609841, 0)
    __Inject.Size = UDim2.new(0.300000012, 0, 0.0916457772, 0)
    __Inject.Font = Enum.Font.Gotham
    __Inject.Text = "[ Inject ]"
    __Inject.TextColor3 = Color3.fromRGB(255, 255, 255)
    __Inject.TextSize = 16.000
    __Inject.TextWrapped = true
    UICorner.CornerRadius = UDim.new(0, 3)
    UICorner.Parent = __Inject
    __Starcia_6.Name = "__Starcia"
    __Starcia_6.Parent = __Starcia_2
    __Starcia_6.Active = true
    __Starcia_6.AnchorPoint = Vector2.new(0.5, 0.5)
    __Starcia_6.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    __Starcia_6.BackgroundTransparency = 1.000
    __Starcia_6.BorderColor3 = Color3.fromRGB(0, 0, 0)
    __Starcia_6.BorderSizePixel = 0
    __Starcia_6.Position = UDim2.new(0.500999987, 0, 0.488999993, 0)
    __Starcia_6.Size = UDim2.new(0.954999983, 0, 0.671000004, 0)
    __Starcia_6.CanvasSize = UDim2.new(CanvasSizeA, 0, CanvasSizeB, 0)
    __Starcia_6.ScrollBarThickness = 6
    __Starcia_6.VerticalScrollBarInset = Enum.ScrollBarInset.Always
    __Starcia_7.Name = "__Starcia"
    __Starcia_7.Parent = __Starcia_6
    __Starcia_7.AnchorPoint = Vector2.new(0.5, 0.5)
    __Starcia_7.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    __Starcia_7.BackgroundTransparency = 0.800
    __Starcia_7.BorderColor3 = Color3.fromRGB(0, 0, 0)
    __Starcia_7.BorderSizePixel = 0
    __Starcia_7.Position = UDim2.new(0.5, 0, 0.5, 0)
    __Starcia_7.Size = UDim2.new(1, 0, 1, 0)
    __Starcia_7.ClearTextOnFocus = false
    __Starcia_7.Font = Enum.Font.SourceSans
    __Starcia_7.MultiLine = true
    __Starcia_7.PlaceholderColor3 = Color3.fromRGB(103, 51, 154)
    __Starcia_7.PlaceholderText = "-- Starcia Exectuor Support By Alchemy Hub"
    __Starcia_7.Text = ""
    __Starcia_7.TextColor3 = Color3.fromRGB(255, 255, 255)
    __Starcia_7.TextSize = 16.000
    __Starcia_7.TextWrapped = true
    __Starcia_7.TextXAlignment = Enum.TextXAlignment.Left
    __Starcia_7.TextYAlignment = Enum.TextYAlignment.Top
    UICorner_2.CornerRadius = UDim.new(0, 3)
    UICorner_2.Parent = __Starcia_7
    __Starcia_8.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 0, 0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(51, 26, 77))}
    __Starcia_8.Rotation = 250
    __Starcia_8.Name = "__Starcia"
    __Starcia_8.Parent = __Starcia_2
    __Inject.MouseButton1Click:Connect(function()
        __Inject.Text = "[ Auth... ]"
        wait(0.5)
        __Inject.Text = "[ Connected ]"
        __StarciaGet.InjectCheck = true
    end)
    __Execute.MouseButton1Click:Connect(function()
        if __StarciaGet.InjectCheck then
            loadstring(tostring(__Starcia_7.Text))()
        else
            __StarciaGet:Notify("Inject before runnin script")
        end
    end)
end
return __StarciaConnect
