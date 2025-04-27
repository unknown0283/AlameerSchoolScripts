-- AlameerSchoolGang Hub (by ChatGPT <3)

-- Load Library
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

local Window = Library.CreateLib("AlameerSchoolGang - Blox Fruits", "Midnight")

-- Tabs
local FarmTab = Window:NewTab("Auto Farm")
local FarmSection = FarmTab:NewSection("Farming")

local FruitTab = Window:NewTab("Devil Fruits")
local FruitSection = FruitTab:NewSection("Fruits Options")

local SettingsTab = Window:NewTab("Settings")
local SettingsSection = SettingsTab:NewSection("Settings")

-- Variables
local AutoFarm = false
local SelectedWeapon = "Melee"

-- Functions
function EquipWeapon()
    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v.Name == SelectedWeapon then
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
        end
    end
end

function AutoHaki()
    if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
    end
end

function AutoKen()
    if not game.Players.LocalPlayer.PlayerGui:FindFirstChild("Observation") then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk", "Activate")
    end
end

function StartFarm()
    while AutoFarm do
        pcall(function()
            AutoHaki()
            AutoKen()

            local QuestHandler = require(game:GetService("ReplicatedStorage").Quest.QuestUtil)
            local EnemyHandler = require(game:GetService("ReplicatedStorage").Enemy.EnemyUtil)

            -- Automatically get the best quest
            local myLevel = game.Players.LocalPlayer.Data.Level.Value
            QuestHandler.RequestQuest(myLevel)

            -- Find the nearest enemy
            local enemy = nil
            for i,v in pairs(workspace.Enemies:GetChildren()) do
                if v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                    enemy = v
                    break
                end
            end

            -- Move to enemy
            if enemy then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame * CFrame.new(0,10,0)

                -- Equip Weapon
                EquipWeapon()

                -- Attack
                game:GetService("VirtualUser"):CaptureController()
                game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
            end
        end)
        wait(0.3)
    end
end

-- AutoFarm Section
FarmSection:NewToggle("Auto Farm Level", "Automatically farms enemies and quests.", function(state)
    AutoFarm = state
    if AutoFarm then
        StartFarm()
    end
end)

FarmSection:NewDropdown("Select Weapon", "Pick the weapon to use.", {"Melee","Sword","Fruit"}, function(option)
    SelectedWeapon = option
end)

-- Devil Fruit Section
FruitSection:NewButton("Auto Buy Fruit", "Buys a random fruit.", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits")
end)

FruitSection:NewButton("Auto Store Fruits", "Stores any fruit you pick up.", function()
    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v:IsA("Tool") and v:FindFirstChild("Fruit") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", v.Name)
        end
    end
end)

FruitSection:NewButton("Teleport To Random Fruit", "Teleports you to a fruit on map.", function()
    for i,v in pairs(game.Workspace:GetChildren()) do
        if string.find(v.Name, "Fruit") then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
        end
    end
end)

-- Settings Section
SettingsSection:NewKeybind("Toggle UI", "Open/Close UI", Enum.KeyCode.RightShift, function()
    Library:ToggleUI()
end)
