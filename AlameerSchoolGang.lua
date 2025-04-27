-- AlameerSchoolGang Full Script
local Library = loadstring(game:HttpGet("https://pastebin.com/raw/Zz0C7jYz"))() -- UI Library Example
local Window = Library:CreateWindow("🍀 AlameerSchoolGang 🍀", Vector2.new(500, 400), Enum.KeyCode.RightControl)

-- AutoFarm Tab
local AutoFarmTab = Window:CreateTab("🏹 Auto Farm")
local Farming = false
local SelectedWeapon = "Melee"

AutoFarmTab:CreateDropdown("Choose Weapon", {"Melee", "Sword", "Fruit"}, function(selected)
    SelectedWeapon = selected
end)

AutoFarmTab:CreateToggle("Enable Auto Farm", function(toggle)
    Farming = toggle
end)

-- AutoFruit Tab
local FruitTab = Window:CreateTab("🍎 Fruits")
local AutoFruit = false
local AutoStore = false
local AutoBuyFruit = false

FruitTab:CreateToggle("Auto Collect Fruits", function(toggle)
    AutoFruit = toggle
end)

FruitTab:CreateToggle("Auto Store Fruits", function(toggle)
    AutoStore = toggle
end)

FruitTab:CreateToggle("Auto Buy Fruits", function(toggle)
    AutoBuyFruit = toggle
end)

-- Teleport Tab
local TP = Window:CreateTab("✈️ Teleports")
TP:CreateButton("Teleport to SafeZone", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1173, 10, 1676)
end)

TP:CreateButton("Server Hop", function()
    local HttpService = game:GetService("HttpService")
    local Servers = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/2753915549/servers/Public?sortOrder=2&limit=100"))
    for i,v in pairs(Servers.data) do
        if v.playing < v.maxPlayers then
            game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, v.id)
            break
        end
    end
end)

-- FPS Booster
local Misc = Window:CreateTab("⚡ Misc")
Misc:CreateButton("FPS Boost", function()
    for _,v in pairs(game:GetDescendants()) do
        if v:IsA("BasePart") then
            v.Material = Enum.Material.Plastic
            v.Reflectance = 0
        elseif v:IsA("Decal") or v:IsA("Texture") then
            v:Destroy()
        end
    end
end)

-- Notification Function
function notify(title, text, time)
    game.StarterGui:SetCore("SendNotification", {
        Title = title,
        Text = text,
        Duration = time
    })
end

-- Main Loops
task.spawn(function()
    while task.wait(0.5) do
        if Farming then
            pcall(function()
                -- Auto Quest and Farming
                notify("🏹 Auto Farming", "Using: " .. SelectedWeapon, 2)
                -- [Put your farming code here: find nearest enemy and attack with SelectedWeapon]
            end)
        end

        if AutoFruit then
            -- Auto Fruit Grabber
            notify("🍎 Fruit", "Auto Collecting Fruits", 2)
            -- [Put your fruit teleport code here]
        end

        if AutoStore then
            -- Auto Store Fruits
            notify("📦 Fruit", "Auto Storing Fruits", 2)
            -- [Put your auto-store fruits code here]
        end

        if AutoBuyFruit then
            -- Auto Buy Fruits
            notify("💰 Fruit", "Auto Buying Fruits", 2)
            -- [Put your auto-buy fruits code here]
        end
    end
end)
