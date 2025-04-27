-- AlameerSchoolGang Script
-- Made with ❤️ for AlameerSchoolGang

local AlameerUI = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local AutoFarmButton = Instance.new("TextButton")
local WeaponDropdown = Instance.new("TextButton")
local AutoBuyFruit = Instance.new("TextButton")
local AutoStoreFruit = Instance.new("TextButton")
local AutoTeleportFruit = Instance.new("TextButton")
local AutoRaid = Instance.new("TextButton")
local Notification = Instance.new("TextLabel")

-- UI Properties
AlameerUI.Name = "AlameerSchoolGang"
AlameerUI.Parent = game.CoreGui

MainFrame.Name = "MainFrame"
MainFrame.Parent = AlameerUI
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.Position = UDim2.new(0.3, 0, 0.2, 0)
MainFrame.Size = UDim2.new(0, 400, 0, 400)
MainFrame.Active = true
MainFrame.Draggable = true

Title.Name = "Title"
Title.Parent = MainFrame
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 0, 0, 0)
Title.Size = UDim2.new(1, 0, 0, 50)
Title.Font = Enum.Font.GothamBold
Title.Text = "AlameerSchoolGang"
Title.TextColor3 = Color3.fromRGB(0, 255, 0)
Title.TextSize = 30

AutoFarmButton.Name = "AutoFarm"
AutoFarmButton.Parent = MainFrame
AutoFarmButton.Position = UDim2.new(0.1, 0, 0.2, 0)
AutoFarmButton.Size = UDim2.new(0, 300, 0, 40)
AutoFarmButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
AutoFarmButton.Font = Enum.Font.Gotham
AutoFarmButton.Text = "Start Auto Farm"
AutoFarmButton.TextColor3 = Color3.fromRGB(0, 0, 0)
AutoFarmButton.TextSize = 20

WeaponDropdown.Name = "WeaponDropdown"
WeaponDropdown.Parent = MainFrame
WeaponDropdown.Position = UDim2.new(0.1, 0, 0.35, 0)
WeaponDropdown.Size = UDim2.new(0, 300, 0, 40)
WeaponDropdown.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
WeaponDropdown.Font = Enum.Font.Gotham
WeaponDropdown.Text = "Choose Weapon: Melee/Sword/Fruit"
WeaponDropdown.TextColor3 = Color3.fromRGB(0, 0, 0)
WeaponDropdown.TextSize = 20

AutoBuyFruit.Name = "AutoBuyFruit"
AutoBuyFruit.Parent = MainFrame
AutoBuyFruit.Position = UDim2.new(0.1, 0, 0.5, 0)
AutoBuyFruit.Size = UDim2.new(0, 300, 0, 40)
AutoBuyFruit.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
AutoBuyFruit.Font = Enum.Font.Gotham
AutoBuyFruit.Text = "Auto Buy Fruit"
AutoBuyFruit.TextColor3 = Color3.fromRGB(0, 0, 0)
AutoBuyFruit.TextSize = 20

AutoStoreFruit.Name = "AutoStoreFruit"
AutoStoreFruit.Parent = MainFrame
AutoStoreFruit.Position = UDim2.new(0.1, 0, 0.65, 0)
AutoStoreFruit.Size = UDim2.new(0, 300, 0, 40)
AutoStoreFruit.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
AutoStoreFruit.Font = Enum.Font.Gotham
AutoStoreFruit.Text = "Auto Store Fruit"
AutoStoreFruit.TextColor3 = Color3.fromRGB(0, 0, 0)
AutoStoreFruit.TextSize = 20

AutoTeleportFruit.Name = "AutoTeleportFruit"
AutoTeleportFruit.Parent = MainFrame
AutoTeleportFruit.Position = UDim2.new(0.1, 0, 0.8, 0)
AutoTeleportFruit.Size = UDim2.new(0, 300, 0, 40)
AutoTeleportFruit.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
AutoTeleportFruit.Font = Enum.Font.Gotham
AutoTeleportFruit.Text = "Auto TP to Fruit"
AutoTeleportFruit.TextColor3 = Color3.fromRGB(0, 0, 0)
AutoTeleportFruit.TextSize = 20

AutoRaid.Name = "AutoRaid"
AutoRaid.Parent = MainFrame
AutoRaid.Position = UDim2.new(0.1, 0, 0.95, 0)
AutoRaid.Size = UDim2.new(0, 300, 0, 40)
AutoRaid.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
AutoRaid.Font = Enum.Font.Gotham
AutoRaid.Text = "Auto Start Raid"
AutoRaid.TextColor3 = Color3.fromRGB(0, 0, 0)
AutoRaid.TextSize = 20

Notification.Name = "Notification"
Notification.Parent = MainFrame
Notification.Position = UDim2.new(0, 0, 1, 0)
Notification.Size = UDim2.new(1, 0, 0, 50)
Notification.BackgroundTransparency = 1
Notification.Font = Enum.Font.GothamBold
Notification.Text = "Welcome, AlameerSchoolGang!"
Notification.TextColor3 = Color3.fromRGB(0, 255, 0)
Notification.TextSize = 20

-- Functions (put your functions here)
AutoFarmButton.MouseButton1Click:Connect(function()
    Notification.Text = "Auto Farm Started!"
    -- Your Auto Farm Code Here
end)

WeaponDropdown.MouseButton1Click:Connect(function()
    Notification.Text = "Weapon Selected!"
    -- Your Weapon Select Code Here
end)

AutoBuyFruit.MouseButton1Click:Connect(function()
    Notification.Text = "Auto Buying Fruits!"
    -- Your Auto Buy Fruits Code Here
end)

AutoStoreFruit.MouseButton1Click:Connect(function()
    Notification.Text = "Auto Storing Fruits!"
    -- Your Auto Store Fruits Code Here
end)

AutoTeleportFruit.MouseButton1Click:Connect(function()
    Notification.Text = "Teleporting to Fruits!"
    -- Your Auto TP Fruits Code Here
end)

AutoRaid.MouseButton1Click:Connect(function()
    Notification.Text = "Starting Raids!"
    -- Your Auto Raids Code Here
end)
