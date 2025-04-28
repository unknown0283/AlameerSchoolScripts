-- AlameerSchoolGang Ultimate Script
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("AlameerSchoolGang 💚", "Midnight")

-- Variables
_G.AutoFarm = false
_G.UseMelee = true
_G.AutoKen = true
_G.AutoHaki = true
_G.AutoFruitGrab = true
_G.AutoFruitStore = true

-- Notifications
function Notify(msg)
    game.StarterGui:SetCore("SendNotification", {
        Title = "AlameerSchoolGang 💚",
        Text = msg,
        Duration = 3
    })
end

Notify("Welcome to AlameerSchoolGang 💚!")

-- Auto Farm Functions
function StartAutoFarm()
    spawn(function()
        while _G.AutoFarm do
            pcall(function()
                local Enemies = workspace.Enemies:GetChildren()
                for _, Enemy in pairs(Enemies) do
                    if Enemy:FindFirstChild("Humanoid") and Enemy.Humanoid.Health > 0 then
                        repeat
                            wait()
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Enemy.HumanoidRootPart.CFrame * CFrame.new(0,0,5)
                            if _G.UseMelee then
                                game:GetService("VirtualUser"):Button1Down(Vector2.new(0,0))
                            end
                        until not _G.AutoFarm or Enemy.Humanoid.Health <= 0
                    end
                end
            end)
            wait()
        end
    end)
end

-- Auto Haki & Ken Functions
spawn(function()
    while wait(5) do
        if _G.AutoKen then
            local args = {
                [1] = "KenTalk",
                [2] = "Active"
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        end
        if _G.AutoHaki then
            pcall(function()
                if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                end
            end)
        end
    end
end)

-- Auto Grab & Store Fruit
spawn(function()
    while wait(5) do
        if _G.AutoFruitGrab then
            for i,v in pairs(game.Workspace:GetChildren()) do
                if v:IsA("Tool") and v:FindFirstChild("Handle") then
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Handle, 0)
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Handle, 1)
                end
            end
        end
        if _G.AutoFruitStore then
            local fruit = game.Players.LocalPlayer.Backpack:FindFirstChildWhichIsA("Tool")
            if fruit then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit",fruit.Name)
            end
        end
    end
end)

-- GUI Buttons
AutoFarmTab:CreateToggle({
    Name = "Auto Farm Enemies",
    CurrentValue = false,
    Callback = function(Value)
        _G.AutoFarm = Value
        if Value then
            Notify("Auto Farm ON ✅")
            StartAutoFarm()
        else
            Notify("Auto Farm OFF ❌")
        end
    end
})

AutoFarmTab:CreateDropdown({
    Name = "Attack With:",
    Options = {"Melee (Default)"},
    CurrentOption = "Melee (Default)",
    Callback = function(Option)
        if Option == "Melee (Default)" then
            _G.UseMelee = true
        end
    end
})

FruitTab:CreateToggle({
    Name = "Auto Grab Fruits",
    CurrentValue = true,
    Callback = function(Value)
        _G.AutoFruitGrab = Value
        if Value then
            Notify("Auto Grab Fruits ON ✅")
        else
            Notify("Auto Grab Fruits OFF ❌")
        end
    end
})

FruitTab:CreateToggle({
    Name = "Auto Store Fruits",
    CurrentValue = true,
    Callback = function(Value)
        _G.AutoFruitStore = Value
        if Value then
            Notify("Auto Store Fruits ON ✅")
        else
            Notify("Auto Store Fruits OFF ❌")
        end
    end
})

SettingsTab:CreateToggle({
    Name = "Auto Haki (Buso)",
    CurrentValue = true,
    Callback = function(Value)
        _G.AutoHaki = Value
    end
})

SettingsTab:CreateToggle({
    Name = "Auto Ken (Dodge)",
    CurrentValue = true,
    Callback = function(Value)
        _G.AutoKen = Value
    end
})

Notify("AlameerSchoolGang Loaded 💚 Enjoy!")
