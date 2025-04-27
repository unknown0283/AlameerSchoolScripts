-- AlameerSchoolGang GUI Full Script
-- Made with love 💚 by your bro

-- Loading Screen
local loadingGui = Instance.new("ScreenGui")
local loadingFrame = Instance.new("Frame")
local loadingLabel = Instance.new("TextLabel")

loadingGui.Parent = game.CoreGui
loadingFrame.Parent = loadingGui
loadingFrame.Size = UDim2.new(0, 300, 0, 100)
loadingFrame.Position = UDim2.new(0.5, -150, 0.5, -50)
loadingFrame.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
loadingFrame.BackgroundTransparency = 0.3
loadingFrame.BorderSizePixel = 0
loadingFrame.Visible = true

loadingLabel.Parent = loadingFrame
loadingLabel.Size = UDim2.new(1, 0, 1, 0)
loadingLabel.BackgroundTransparency = 1
loadingLabel.Text = "Loading AlameerSchoolGang GUI... 🛠️"
loadingLabel.Font = Enum.Font.SourceSansBold
loadingLabel.TextSize = 24
loadingLabel.TextColor3 = Color3.new(1,1,1)

wait(2)
loadingGui:Destroy()

-- Main GUI
local Library = loadstring(game:HttpGet("https://pastebin.com/raw/FsJak6AT"))()

local Window = Library:CreateWindow("AlameerSchoolGang 💚", Vector2.new(600, 400), Enum.KeyCode.RightControl)

-- Auto Farm Tab
local farmTab = Window:CreateTab("🥷 Auto Farm")

farmTab:CreateToggle("Auto Farm Level", function(state)
    getgenv().AutoFarm = state
    while getgenv().AutoFarm do
        -- AutoFarm Script
        pcall(function()
            -- Your auto farm code for level quest goes here
        end)
        wait(1)
    end
end)

farmTab:CreateDropdown("Choose Weapon", {"Melee", "Sword", "Fruit"}, function(selected)
    getgenv().SelectedWeapon = selected
end)

-- Devil Fruits Tab
local fruitTab = Window:CreateTab("🍏 Devil Fruits")

fruitTab:CreateToggle("Auto Buy Random Fruit", function(state)
    getgenv().AutoBuyFruit = state
    while getgenv().AutoBuyFruit do
        -- Auto buy fruit logic
        wait(1)
    end
end)

fruitTab:CreateToggle("Auto Store Fruit", function(state)
    getgenv().AutoStoreFruit = state
    while getgenv().AutoStoreFruit do
        -- Auto store fruit logic
        wait(1)
    end
end)

fruitTab:CreateToggle("Auto TP to Spawned Fruit", function(state)
    getgenv().AutoTPFruit = state
    while getgenv().AutoTPFruit do
        -- Auto teleport to fruit logic
        wait(1)
    end
end)

-- Raids/Boss Tab
local raidTab = Window:CreateTab("⚔️ Bosses / Raids")

raidTab:CreateToggle("Auto Raid Boss", function(state)
    getgenv().AutoRaid = state
    while getgenv().AutoRaid do
        -- Auto raid boss logic
        wait(1)
    end
end)

-- Settings Tab
local settingsTab = Window:CreateTab("⚙️ Settings")

settingsTab:CreateToggle("Notifications", function(state)
    getgenv().Notifications = state
end)

settingsTab:CreateToggle("Safe Mode (Auto Respawn)", function(state)
    getgenv().SafeMode = state
    while getgenv().SafeMode do
        pcall(function()
            if game.Players.LocalPlayer.Character.Humanoid.Health == 0 then
                wait(3)
                game.Players.LocalPlayer:Kick("Respawning...")
            end
        end)
        wait(1)
    end
end)
