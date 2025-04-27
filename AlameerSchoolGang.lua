-- AlameerSchoolV3 - All-in-One GUI (Dark Mode)
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

-- Create the GUI (Dark Mode)
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AlameerSchoolGang"
ScreenGui.Parent = player:WaitForChild("PlayerGui")

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 350, 0, 500)
MainFrame.Position = UDim2.new(0.5, -175, 0.5, -250)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Parent = ScreenGui

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 8)
Corner.Parent = MainFrame

-- Title Bar
local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1, 0, 0, 40)
TitleBar.BackgroundColor3 = Color3.fromRGB(0, 80, 0)
TitleBar.BorderSizePixel = 0
TitleBar.Parent = MainFrame

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 8, 0, 0)
TitleCorner.Parent = TitleBar

local Title = Instance.new("TextLabel")
Title.Text = "AlameerSchoolV3"
Title.Size = UDim2.new(0, 200, 0, 30)
Title.Position = UDim2.new(0.5, -100, 0.5, -15)
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.BackgroundTransparency = 1
Title.Parent = TitleBar

local CloseButton = Instance.new("TextButton")
CloseButton.Text = "X"
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -35, 0.5, -15)
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Parent = TitleBar

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Notifications function
local function Notify(message, duration)
    duration = duration or 3
    local Notif = Instance.new("Frame")
    Notif.Size = UDim2.new(0.9, 0, 0, 40)
    Notif.Position = UDim2.new(0.5, 0, 1, 10)
    Notif.AnchorPoint = Vector2.new(0.5, 1)
    Notif.BackgroundColor3 = Color3.fromRGB(0, 100, 0)
    Notif.BorderSizePixel = 0
    Notif.Parent = MainFrame

    local NotifCorner = Instance.new("UICorner")
    NotifCorner.Parent = Notif

    local NotifText = Instance.new("TextLabel")
    NotifText.Text = "⚡ " .. message
    NotifText.Size = UDim2.new(1, -20, 1, 0)
    NotifText.Position = UDim2.new(0, 10, 0, 0)
    NotifText.TextColor3 = Color3.fromRGB(255, 255, 255)
    NotifText.Font = Enum.Font.Gotham
    NotifText.BackgroundTransparency = 1
    NotifText.Parent = Notif

    TweenService:Create(Notif, TweenInfo.new(0.3), {Position = UDim2.new(0.5, 0, 1, -50)}):Play()
    task.delay(duration, function()
        TweenService:Create(Notif, TweenInfo.new(0.3), {Position = UDim2.new(0.5, 0, 1, 10)}):Play()
        task.wait(0.3)
        Notif:Destroy()
    end)
end

-- Auto Farm Button
local AutoFarm = Instance.new("TextButton")
AutoFarm.Text = "Auto Farm [ON/OFF]"
AutoFarm.Size = UDim2.new(0.9, 0, 0, 40)
AutoFarm.Position = UDim2.new(0.5, 0, 0, 60)
AutoFarm.AnchorPoint = Vector2.new(0.5, 0)
AutoFarm.BackgroundColor3 = Color3.fromRGB(0, 120, 0)
AutoFarm.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoFarm.Font = Enum.Font.GothamBold
AutoFarm.Parent = MainFrame

local AutoFarmCorner = Instance.new("UICorner")
AutoFarmCorner.Parent = AutoFarm

local isFarming = false
AutoFarm.MouseButton1Click:Connect(function()
    isFarming = not isFarming
    if isFarming then
        Notify("Auto Farm: Enabled")
        while isFarming do
            print("[SIM] Farming enemies...")
            task.wait(1)
        end
    else
        Notify("Auto Farm: Disabled")
    end
end)

-- Weapon Selection Dropdown
local WeaponLabel = Instance.new("TextLabel")
WeaponLabel.Text = "Choose Weapon:"
WeaponLabel.Size = UDim2.new(0.9, 0, 0, 20)
WeaponLabel.Position = UDim2.new(0.5, 0, 0, 120)
WeaponLabel.AnchorPoint = Vector2.new(0.5, 0)
WeaponLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
WeaponLabel.Font = Enum.Font.Gotham
WeaponLabel.BackgroundTransparency = 1
WeaponLabel.Parent = MainFrame

local WeaponDropdown = Instance.new("TextButton")
WeaponDropdown.Text = "Melee | Sword | Fruit"
WeaponDropdown.Size = UDim2.new(0.9, 0, 0, 40)
WeaponDropdown.Position = UDim2.new(0.5, 0, 0, 140)
WeaponDropdown.AnchorPoint = Vector2.new(0.5, 0)
WeaponDropdown.BackgroundColor3 = Color3.fromRGB(0, 100, 0)
WeaponDropdown.TextColor3 = Color3.fromRGB(255, 255, 255)
WeaponDropdown.Font = Enum.Font.GothamBold
WeaponDropdown.Parent = MainFrame

local WeaponCorner = Instance.new("UICorner")
WeaponCorner.Parent = WeaponDropdown

WeaponDropdown.MouseButton1Click:Connect(function()
    Notify("Selected: " .. WeaponDropdown.Text)
end)

-- Auto Buy Fruits Button
local AutoBuy = Instance.new("TextButton")
AutoBuy.Text = "Auto Buy Fruits"
AutoBuy.Size = UDim2.new(0.9, 0, 0, 40)
AutoBuy.Position = UDim2.new(0.5, 0, 0, 200)
AutoBuy.AnchorPoint = Vector2.new(0.5, 0)
AutoBuy.BackgroundColor3 = Color3.fromRGB(0, 120, 0)
AutoBuy.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoBuy.Font = Enum.Font.GothamBold
AutoBuy.Parent = MainFrame

local AutoBuyCorner = Instance.new("UICorner")
AutoBuyCorner.Parent = AutoBuy

AutoBuy.MouseButton1Click:Connect(function()
    Notify("Auto Buy: Searching for fruits...")
end)

-- Auto Raids Button
local AutoRaids = Instance.new("TextButton")
AutoRaids.Text = "Auto Raids [ON/OFF]"
AutoRaids.Size = UDim2.new(0.9, 0, 0, 40)
AutoRaids.Position = UDim2.new(0.5, 0, 0, 260)
AutoRaids.AnchorPoint = Vector2.new(0.5, 0)
AutoRaids.BackgroundColor3 = Color3.fromRGB(0, 120, 0)
AutoRaids.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoRaids.Font = Enum.Font.GothamBold
AutoRaids.Parent = MainFrame

local AutoRaidsCorner = Instance.new("UICorner")
AutoRaidsCorner.Parent = AutoRaids

local isRaiding = false
AutoRaids.MouseButton1Click:Connect(function()
    isRaiding = not isRaiding
    if isRaiding then
        Notify("Auto Raids: Enabled")
    else
        Notify("Auto Raids: Disabled")
    end
end)

-- Auto Store Fruits Button
local AutoStore = Instance.new("TextButton")
AutoStore.Text = "Auto Store Fruits"
AutoStore.Size = UDim2.new(0.9, 0, 0, 40)
AutoStore.Position = UDim2.new(0.5, 0, 0, 320)
AutoStore.AnchorPoint = Vector2.new(0.5, 0)
AutoStore.BackgroundColor3 = Color3.fromRGB(0, 120, 0)
AutoStore.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoStore.Font = Enum.Font.GothamBold
AutoStore.Parent = MainFrame

local AutoStoreCorner = Instance.new("UICorner")
AutoStoreCorner.Parent = AutoStore

AutoStore.MouseButton1Click:Connect(function()
    Notify("Auto Store: Storing fruits...")
end)

-- Toggle GUI with a keybind (e.g., RightShift)
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if input.KeyCode == Enum.KeyCode.RightShift then
        MainFrame.Visible = not MainFrame.Visible
    end
end)

Notify("AlameerSchoolV3 Loaded! Press RightShift to toggle.", 5)
