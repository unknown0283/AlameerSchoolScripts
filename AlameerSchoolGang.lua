-- AlameerSchoolGang V2 Script Made With Love ❤️

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("🔥 AlameerSchoolGang V2 🔥", "Midnight") -- Black/Green Theme

-- MAIN TAB
local Main = Window:NewTab("Main")
local MainSection = Main:NewSection("Auto Farm / Boosts")

-- Auto Farm Button
MainSection:NewButton("Auto Farm", "Start Auto Farming Enemies", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/NeaPchX2/Nea/main/BF"))()
end)

-- Auto Quest Button
MainSection:NewButton("Auto Quest", "Auto Accepts Best Quest", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/NeaPchX2/Nea/main/BFQuest"))()
end)

-- Fast Attack Button
MainSection:NewButton("Fast Attack", "Attack Faster", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/acsu123/HOHO_H/main/Fastattack"))()
end)

-- Equip Best Weapon
MainSection:NewButton("Equip Best Weapon", "Equips Best Weapon Automatically", function()
    local tool = nil
    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v:IsA("Tool") then
            tool = v
            break
        end
    end
    if tool then
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
    end
end)

-- FPS Boost
MainSection:NewButton("FPS Boost", "Remove Lag and Boost FPS", function()
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("BasePart") then
            v.Material = Enum.Material.SmoothPlastic
            v.Reflectance = 0
        elseif v:IsA("Decal") then
            v.Transparency = 1
        end
    end
    settings().Rendering.QualityLevel = "Level01"
end)

-- TELEPORT TAB
local Teleport = Window:NewTab("Teleport")
local TeleportSection = Teleport:NewSection("Islands")

TeleportSection:NewButton("Teleport to Starter Island", "TP Fast", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1005, 17, 1050)
end)

-- Notification on Script Run
game.StarterGui:SetCore("SendNotification", {
    Title = "AlameerSchoolGang",
    Text = "Script Activated! Let's Farm 🔥",
    Duration = 5
})

