-- AlameerSchool Blox Fruits GUI v1
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local AutoFarmButton = Instance.new("TextButton")
local TeleportButton = Instance.new("TextButton")
local ShopButton = Instance.new("TextButton")
local ESPButton = Instance.new("TextButton")
local FastAttackButton = Instance.new("TextButton")

ScreenGui.Parent = game.CoreGui

MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.Position = UDim2.new(0.3, 0, 0.3, 0)
MainFrame.Size = UDim2.new(0, 350, 0, 400)
MainFrame.Active = true
MainFrame.Draggable = true

Title.Name = "Title"
Title.Parent = MainFrame
Title.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Title.Size = UDim2.new(1, 0, 0, 50)
Title.Font = Enum.Font.SourceSansBold
Title.Text = "🔥 AlameerSchool Blox Fruits GUI 🔥"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextScaled = true
Title.BackgroundTransparency = 0

AutoFarmButton.Name = "AutoFarmButton"
AutoFarmButton.Parent = MainFrame
AutoFarmButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
AutoFarmButton.Position = UDim2.new(0.1, 0, 0.2, 0)
AutoFarmButton.Size = UDim2.new(0, 280, 0, 40)
AutoFarmButton.Font = Enum.Font.SourceSansBold
AutoFarmButton.Text = "Auto Farm"
AutoFarmButton.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoFarmButton.TextScaled = true
AutoFarmButton.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/1f0yt/community/main/bf"))()
end)

TeleportButton.Name = "TeleportButton"
TeleportButton.Parent = MainFrame
TeleportButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
TeleportButton.Position = UDim2.new(0.1, 0, 0.35, 0)
TeleportButton.Size = UDim2.new(0, 280, 0, 40)
TeleportButton.Font = Enum.Font.SourceSansBold
TeleportButton.Text = "Teleport Menu"
TeleportButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TeleportButton.TextScaled = true
TeleportButton.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xQuartyx/DonateMe/main/ScriptLoader"))()
end)

ShopButton.Name = "ShopButton"
ShopButton.Parent = MainFrame
ShopButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
ShopButton.Position = UDim2.new(0.1, 0, 0.5, 0)
ShopButton.Size = UDim2.new(0, 280, 0, 40)
ShopButton.Font = Enum.Font.SourceSansBold
ShopButton.Text = "Shop GUI"
ShopButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ShopButton.TextScaled = true
ShopButton.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/UltraStuff/scripts2/main/bloxfruitsmemehub.lua"))()
end)

ESPButton.Name = "ESPButton"
ESPButton.Parent = MainFrame
ESPButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
ESPButton.Position = UDim2.new(0.1, 0, 0.65, 0)
ESPButton.Size = UDim2.new(0, 280, 0, 40)
ESPButton.Font = Enum.Font.SourceSansBold
ESPButton.Text = "ESP (See Players)"
ESPButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ESPButton.TextScaled = true
ESPButton.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/z4gs/scripts/main/BF_ESP.lua"))()
end)

FastAttackButton.Name = "FastAttackButton"
FastAttackButton.Parent = MainFrame
FastAttackButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
FastAttackButton.Position = UDim2.new(0.1, 0, 0.8, 0)
FastAttackButton.Size = UDim2.new(0, 280, 0, 40)
FastAttackButton.Font = Enum.Font.SourceSansBold
FastAttackButton.Text = "Fast Attack"
FastAttackButton.TextColor3 = Color3.fromRGB(255, 255, 255)
FastAttackButton.TextScaled = true
FastAttackButton.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/TrixAde/scripts/main/fastattack"))()
end)
