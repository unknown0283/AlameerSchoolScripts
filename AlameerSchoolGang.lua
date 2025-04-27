--[[ 
    AlameerSchoolGang GUI 💚 
    Made for Alameer KING 👑 
--]]

-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local VirtualUser = game:GetService("VirtualUser")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

local LocalPlayer = Players.LocalPlayer

-- Load UI Library (using Dark Green Theme)
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()

local Window = OrionLib:MakeWindow({Name = "🌟 AlameerSchoolGang GUI 🌟", HidePremium = false, SaveConfig = true, ConfigFolder = "AlameerSchoolGang", IntroEnabled = true, IntroText = "Welcome King Alameer! 💚"})

-- Variables
local autofarm = false
local WeaponType = "Melee"
local AutoRaid = false
local AutoBuyFruit = false
local AutoStoreFruit = false
local AutoTPFruit = false
local selectmob = ""

-- Functions
function EquipSelectedWeapon()
    for i,v in pairs(LocalPlayer.Backpack:GetChildren()) do
        if v:IsA("Tool") and string.find(v.ToolTip, WeaponType) then
            LocalPlayer.Character.Humanoid:EquipTool(v)
            break
        end
    end
end

function AutoHaki()
    local Haki = LocalPlayer.Character:FindFirstChild("HasBuso")
    if not Haki then
        ReplicatedStorage.Remotes.CommF_:InvokeServer("Buso")
    end
end

function TweenTo(CF)
    local hrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if hrp then
        hrp.CFrame = CF
    end
end

function GetNearestEnemy()
    local nearest, dist = nil, math.huge
    for i,v in pairs(Workspace.Enemies:GetChildren()) do
        if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
            local mag = (LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude
            if mag < dist then
                nearest = v
                dist = mag
            end
        end
    end
    return nearest
end

-- Tabs and Sections
local FarmTab = Window:MakeTab({Name = "⚔️ Auto Farm", Icon = "rbxassetid://6034288326", PremiumOnly = false})
local FarmSection = FarmTab:AddSection({Name = "Main Auto Farm"})

FarmSection:NewDropdown("Select Weapon Type", "Choose what to attack with", {"Melee", "Sword", "Fruit", "Gun"}, function(option)
    WeaponType = option
end)

FarmSection:NewTextbox("Select Enemy (Optional)", "Type enemy name", function(txt)
    selectmob = txt
end)

FarmSection:NewToggle("Auto Farm", "Auto Farm enemies!", function(state)
    autofarm = state
end)

-- Extra Stuff Tab
local ExtraTab = Window:MakeTab({Name = "✨ Extra Features", Icon = "rbxassetid://6034509993", PremiumOnly = false})
local ExtraSection = ExtraTab:AddSection({Name = "Other Cool Features"})

ExtraSection:NewToggle("Auto Start Raid", "Automatically starts raids", function(state)
    AutoRaid = state
end)

ExtraSection:NewToggle("Auto Buy Random Fruit", "Buys fruits automatically", function(state)
    AutoBuyFruit = state
end)

ExtraSection:NewToggle("Auto Store Fruits", "Stores fruits automatically", function(state)
    AutoStoreFruit = state
end)

ExtraSection:NewToggle("Auto Teleport to Fruit", "Teleport to fruits when they spawn", function(state)
    AutoTPFruit = state
end)

-- Main AutoFarm Logic
RunService.RenderStepped:Connect(function()
    if autofarm then
        pcall(function()
            local enemy = nil
            if selectmob ~= "" then
                for i,v in pairs(Workspace.Enemies:GetChildren()) do
                    if v.Name:lower():find(selectmob:lower()) and v.Humanoid.Health > 0 then
                        enemy = v
                        break
                    end
                end
            else
                enemy = GetNearestEnemy()
            end
            if enemy then
                AutoHaki()
                EquipSelectedWeapon()
                if (LocalPlayer.Character.HumanoidRootPart.Position - enemy.HumanoidRootPart.Position).Magnitude > 5 then
                    TweenTo(enemy.HumanoidRootPart.CFrame * CFrame.new(0,10,0))
                else
                    LocalPlayer.Character.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame * CFrame.new(0,10,0)
                    VirtualUser:CaptureController()
                    VirtualUser:Button1Down(Vector2.new(1280, 672))
                end
            end
        end)
    end
end)

-- Auto Raid
task.spawn(function()
    while task.wait(1) do
        if AutoRaid then
            pcall(function()
                if Workspace["_WorldOrigin"].Locations:FindFirstChild("Island 5") then
                    fireclickdetector(Workspace["_WorldOrigin"].Locations:FindFirstChild("Island 5").ClickDetector)
                end
            end)
        end
    end
end)

-- Auto Buy Fruit
task.spawn(function()
    while task.wait(10) do
        if AutoBuyFruit then
            pcall(function()
                ReplicatedStorage.Remotes.CommF_:InvokeServer("PurchaseRandomFruit", true)
            end)
        end
    end
end)

-- Auto Store Fruit
task.spawn(function()
    while task.wait(5) do
        if AutoStoreFruit then
            pcall(function()
                for i,v in pairs(LocalPlayer.Backpack:GetChildren()) do
                    if v:IsA("Tool") and v.ToolTip == "Devil Fruit" then
                        ReplicatedStorage.Remotes.CommF_:InvokeServer("StoreFruit", v.Name)
                    end
                end
            end)
        end
    end
end)

-- Auto Teleport to Fruit
task.spawn(function()
    while task.wait(1) do
        if AutoTPFruit then
            pcall(function()
                for i,v in pairs(Workspace:GetDescendants()) do
                    if v:IsA("Tool") and v.Parent:IsA("Model") then
                        LocalPlayer.Character.HumanoidRootPart.CFrame = v.Parent.CFrame
                    end
                end
            end)
        end
    end
end)

OrionLib:Init()
