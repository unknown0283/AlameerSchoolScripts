-- AlameerSchoolV3 - Educational GUI Script (Not for real Blox Fruits)
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")

-- Create the GUI (Dark Mode)
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AlameerSchoolGang"
ScreenGui.Parent = player:WaitForChild("PlayerGui")

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 350, 0, 500)
MainFrame.Position = UDim2.new(0.5, -175, 0.5, -250)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

local Title = Instance.new("TextLabel")
Title.Text = "AlameerSchoolV3"
Title.Size = UDim2.new(0, 300, 0, 40)
Title.Position = UDim2.new(0.5, -150, 0, 10)
Title.TextColor3 = Color3.fromRGB(0, 255, 0) -- Green
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.GothamBold
Title.Parent = MainFrame

-- Notifications function
local function Notify(message)
    local Notif = Instance.new("TextLabel")
    Notif.Text = "⚠️ " .. message
    Notif.Size = UDim2.new(0, 300, 0, 30)
    Notif.Position = UDim2.new(0.5, -150, 0, 450)
    Notif.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    Notif.TextColor3 = Color3.fromRGB(255, 255, 255)
    Notif.Font = Enum.Font.Gotham
    Notif.Parent = MainFrame
    task.delay(3, function() Notif:Destroy() end)
end

-- Auto Farm Button
local AutoFarm = Instance.new("TextButton")
AutoFarm.Text = "Auto Farm (Level + Enemy)"
AutoFarm.Size = UDim2.new(0, 300, 0, 40)
AutoFarm.Position = UDim2.new(0.5, -150, 0, 70)
AutoFarm.BackgroundColor3 = Color3.fromRGB(0, 150, 0) -- Dark Green
AutoFarm.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoFarm.Font = Enum.Font.GothamBold
AutoFarm.Parent = MainFrame

AutoFarm.MouseButton1Click:Connect(function()
    Notify("Auto Farm: Enabled (Simulated)")
    -- Simulated farming loop (not real)
    while true do
        task.wait(1)
        print("[SIM] Farming enemies...")
    end
end)

-- Weapon Selection Dropdown
local WeaponLabel = Instance.new("TextLabel")
WeaponLabel.Text = "Choose Weapon:"
WeaponLabel.Size = UDim2.new(0, 300, 0, 20)
WeaponLabel.Position = UDim2.new(0.5, -150, 0, 130)
WeaponLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
WeaponLabel.BackgroundTransparency = 1
WeaponLabel.Font = Enum.Font.Gotham
WeaponLabel.Parent = MainFrame

local WeaponDropdown = Instance.new("TextButton")
WeaponDropdown.Text = "Melee | Sword | Fruit"
WeaponDropdown.Size = UDim2.new(0, 300, 0, 40)
WeaponDropdown.Position = UDim2.new(0.5, -150, 0, 150)
WeaponDropdown.BackgroundColor3 = Color3.fromRGB(0, 100, 0)
WeaponDropdown.TextColor3 = Color3.fromRGB(255, 255, 255)
WeaponDropdown.Font = Enum.Font.GothamBold
WeaponDropdown.Parent = MainFrame

WeaponDropdown.MouseButton1Click:Connect(function()
    Notify("Selected: " .. WeaponDropdown.Text)
end)

-- Auto Buy Fruits Button
local AutoBuy = Instance.new("TextButton")
AutoBuy.Text = "Auto Buy Fruits"
AutoBuy.Size = UDim2.new(0, 300, 0, 40)
AutoBuy.Position = UDim2.new(0.5, -150, 0, 210)
AutoBuy.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
AutoBuy.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoBuy.Font = Enum.Font.GothamBold
AutoBuy.Parent = MainFrame

AutoBuy.MouseButton1Click:Connect(function()
    Notify("Auto Buy: Searching for fruits...")
end)

-- Auto Raids Button
local AutoRaids = Instance.new("TextButton")
AutoRaids.Text = "Auto Raids"
AutoRaids.Size = UDim2.new(0, 300, 0, 40)
AutoRaids.Position = UDim2.new(0.5, -150, 0, 270)
AutoRaids.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
AutoRaids.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoRaids.Font = Enum.Font.GothamBold
AutoRaids.Parent = MainFrame

AutoRaids.MouseButton1Click:Connect(function()
    Notify("Auto Raids: Joining raid...")
end)

-- Close GUI Button
local CloseButton = Instance.new("TextButton")
CloseButton.Text = "X"
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -35, 0, 5)
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Parent = MainFrame

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Toggle GUI with a keybind (e.g., RightShift)
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if input.KeyCode == Enum.KeyCode.RightShift then
        MainFrame.Visible = not MainFrame.Visible
    end
end)

Notify("AlameerSchoolV3 Loaded! Press RightShift to toggle.")
