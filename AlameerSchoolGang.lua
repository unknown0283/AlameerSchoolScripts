-- AlameerSchoolGang V2
-- Created for KING ALAMEER 👑

-- Services
local VirtualUser = game:GetService('VirtualUser')
local Players = game:GetService('Players')
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService('RunService')
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Functions
function EquipWeapon()
    for i,v in pairs(LocalPlayer.Backpack:GetChildren()) do
        if v:IsA("Tool") and v.ToolTip == "Melee" then
            LocalPlayer.Character.Humanoid:EquipTool(v)
        end
    end
end

function AutoHaki()
    if not LocalPlayer.Character:FindFirstChild("HasBuso") then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
    end
end

function TweenTo(pos)
    local tween = TweenService:Create(LocalPlayer.Character.HumanoidRootPart, TweenInfo.new((LocalPlayer.Character.HumanoidRootPart.Position - pos.Position).Magnitude/300, Enum.EasingStyle.Linear), {CFrame = pos})
    tween:Play()
    return tween
end

function GetNearestEnemy()
    local dist = math.huge
    local target = nil
    for i,v in pairs(workspace.Enemies:GetChildren()) do
        if v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and v:FindFirstChild("HumanoidRootPart") then
            local mag = (LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude
            if mag < dist then
                dist = mag
                target = v
            end
        end
    end
    return target
end

-- GUI
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = library.CreateLib("🔥 AlameerSchoolGang V2 🔥", "GrapeTheme")

-- Tabs
local FarmTab = Window:NewTab("Auto Farm")
local TeleportTab = Window:NewTab("Teleport")
local SettingsTab = Window:NewTab("Settings")

local FarmSection = FarmTab:NewSection("Main Farm")
local TeleportSection = TeleportTab:NewSection("Teleport")
local SettingsSection = SettingsTab:NewSection("Settings")

-- Variables
local autofarm = false
local selectmob = ""

-- AutoFarm
FarmSection:NewToggle("Auto Farm Level", "AutoFarm your level enemy", function(state)
    autofarm = state
end)

FarmSection:NewTextBox("Select Enemy", "Type Enemy Name", function(txt)
    selectmob = txt
end)

-- Teleport
TeleportSection:NewButton("Teleport to First Sea", "", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-260, 5, 1200)
end)

TeleportSection:NewButton("Teleport to Second Sea", "", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(876, 5, 14400)
end)

TeleportSection:NewButton("Teleport to Third Sea", "", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-12500, 5, 6000)
end)

-- FPS Boost
SettingsSection:NewButton("FPS Boost", "", function()
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("BasePart") and v.Transparency == 0 then
            v.Material = Enum.Material.SmoothPlastic
            v.Reflectance = 0
        end
    end
    setfpscap(60)
end)

-- Notifications
function Notify(title, text)
    game.StarterGui:SetCore("SendNotification", {
        Title = title,
        Text = text,
        Duration = 5
    })
end

-- AutoFarm Loop
RunService.RenderStepped:Connect(function()
    if autofarm then
        pcall(function()
            local enemy = nil
            if selectmob ~= "" then
                for i,v in pairs(workspace.Enemies:GetChildren()) do
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
                EquipWeapon()
                if (LocalPlayer.Character.HumanoidRootPart.Position - enemy.HumanoidRootPart.Position).Magnitude > 5 then
                    TweenTo(enemy.HumanoidRootPart.CFrame * CFrame.new(0,10,0))
                else
                    LocalPlayer.Character.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame * CFrame.new(0,10,0)
                    LocalPlayer.VirtualUser:CaptureController()
                    LocalPlayer.VirtualUser:Button1Down(Vector2.new(1280, 672))
                end
            end
        end)
    end
end)

Notify("🔥 AlameerSchoolGang Loaded", "Welcome King!")
