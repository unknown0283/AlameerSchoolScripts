-- AlameerSchoolGang V1 - Best Blox Fruits Script 💚
-- Made with love for my bro 💚

-- Load UI Library
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

local Window = Library.CreateLib("AlameerSchoolGang 💚", "BloodTheme")

-- Variables
local autofarm = false
local selectedWeapon = "Melee"

-- Functions
function EquipWeapon(toolName)
    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v.Name == toolName then
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
        end
    end
end

function GetNearestMob()
    local dist, thing = math.huge
    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
            local magnitude = (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude
            if magnitude < dist then
                dist = magnitude
                thing = v
            end
        end
    end
    return thing
end

function AutoFarm()
    while autofarm do
        local mob = GetNearestMob()
        if mob then
            pcall(function()
                repeat
                    task.wait()
                    if selectedWeapon == "Melee" or selectedWeapon == "Sword" or selectedWeapon == "Fruit" then
                        EquipWeapon(selectedWeapon)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = mob.HumanoidRootPart.CFrame * CFrame.new(0,10,0)
                        game:GetService('VirtualUser'):CaptureController()
                        game:GetService('VirtualUser'):Button1Down(Vector2.new(1280, 672))
                    end
                until mob.Humanoid.Health <= 0 or not autofarm
            end)
        end
        task.wait(1)
    end
end

-- Tabs
local AutoFarmTab = Window:NewTab("Auto Farm")
local FruitTab = Window:NewTab("Fruits")
local BossTab = Window:NewTab("Boss Raids")
local SettingsTab = Window:NewTab("Settings")

-- Sections
local AutoFarmSection = AutoFarmTab:NewSection("Auto Farm Settings")
local FruitSection = FruitTab:NewSection("Fruit Options")
local BossSection = BossTab:NewSection("Boss Features")
local SettingsSection = SettingsTab:NewSection("General")

-- Autofarm Controls
AutoFarmSection:NewToggle("Enable AutoFarm", "Start/Stop Auto Farming", function(state)
    autofarm = state
    if state then
        AutoFarm()
    end
end)

AutoFarmSection:NewDropdown("Select Weapon", "Pick your fighting style", {"Melee", "Sword", "Fruit"}, function(currentOption)
    selectedWeapon = currentOption
end)

-- Fruit Controls
FruitSection:NewButton("Auto Buy Random Fruit", "Buys random fruit", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits")
end)

FruitSection:NewButton("Auto Store Fruit", "Store fruit in backpack", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit")
end)

FruitSection:NewButton("Auto TP to Random Fruit", "Teleports to random fruit", function()
    for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
        if v:IsA("Tool") and v:FindFirstChild("Handle") then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Handle.CFrame
        end
    end
end)

-- Boss Controls
BossSection:NewButton("Auto Start Raid", "Start a random raid", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Raid", "Start")
end)

BossSection:NewButton("Auto Kill Bosses", "Kills nearby boss", function()
    -- Later update for bosses
end)

-- Settings
SettingsSection:NewButton("Discord Notification", "Sends a fake notification", function()
    game.StarterGui:SetCore("SendNotification", {
        Title = "AlameerSchoolGang 💚",
        Text = "Script running perfectly!",
        Duration = 5
    })
end)

SettingsSection:NewKeybind("Toggle UI", "Hide/Show UI", Enum.KeyCode.RightControl, function()
    Library:ToggleUI()
end)

print("✅ AlameerSchoolGang Loaded Successfully 💚")
