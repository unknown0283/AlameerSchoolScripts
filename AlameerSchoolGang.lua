-- AlameerSchoolGang V2 Script 🔥

-- Notification on Load
game.StarterGui:SetCore("SendNotification", {
    Title = "AlameerSchoolGang V2";
    Text = "Activated Successfully!";
    Duration = 5;
})

-- Create GUI
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local AutoFarmButton = Instance.new("TextButton")
local AutoQuestButton = Instance.new("TextButton")
local EquipBestButton = Instance.new("TextButton")
local FastAttackButton = Instance.new("TextButton")
local TeleportButton = Instance.new("TextButton")

-- Parent GUI
ScreenGui.Parent = game:GetService("CoreGui")

-- Frame
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.Position = UDim2.new(0.3, 0, 0.3, 0)
MainFrame.Size = UDim2.new(0, 450, 0, 400)
MainFrame.Active = true
MainFrame.Draggable = true

-- Title
Title.Name = "Title"
Title.Parent = MainFrame
Title.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
Title.Size = UDim2.new(1, 0, 0, 50)
Title.Font = Enum.Font.SourceSansBold
Title.Text = "🔥 AlameerSchoolGang V2 🔥"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextScaled = true

-- Button Setup Function
local function createButton(name, text, position, callback)
    local button = Instance.new("TextButton")
    button.Name = name
    button.Parent = MainFrame
    button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    button.Position = position
    button.Size = UDim2.new(0, 400, 0, 50)
    button.Font = Enum.Font.SourceSansBold
    button.Text = text
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextScaled = true
    button.MouseButton1Click:Connect(callback)
end

-- Auto Farm
local autofarm = false
createButton("AutoFarmButton", "Start Auto Farm", UDim2.new(0, 25, 0, 70), function()
    autofarm = not autofarm
    while autofarm do
        task.wait(0.1)
        pcall(function()
            local Enemy = nil
            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                    Enemy = v
                    break
                end
            end
            if Enemy then
                local plr = game.Players.LocalPlayer
                plr.Character.HumanoidRootPart.CFrame = Enemy.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0)
                plr.Character.Humanoid:ChangeState(11)
                game:GetService'VirtualUser':Button1Down(Vector2.new(0,0))
            end
        end)
    end
end)

-- Auto Quest
local autoquest = false
createButton("AutoQuestButton", "Start Auto Quest", UDim2.new(0, 25, 0, 130), function()
    autoquest = not autoquest
    while autoquest do
        task.wait(2)
        pcall(function()
            local args = {
                [1] = "StartQuest",
                [2] = "BanditQuest1", -- You can change the quest name based on your island
                [3] = 1
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        end)
    end
end)

-- Equip Best Weapon
createButton("EquipBestButton", "Equip Best Weapon", UDim2.new(0, 25, 0, 190), function()
    pcall(function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EquipSword", "Saber") -- Change "Saber" if you want another sword
    end)
end)

-- Fast Attack
local fastattack = false
createButton("FastAttackButton", "Fast Attack", UDim2.new(0, 25, 0, 250), function()
    fastattack = not fastattack
    while fastattack do
        task.wait(0.05)
        pcall(function()
            game:GetService'VirtualUser':Button1Down(Vector2.new(0,0))
            game:GetService'VirtualUser':Button1Up(Vector2.new(0,0))
        end)
    end
end)

-- Teleport Button
createButton("TeleportButton", "Teleport to Starter Island", UDim2.new(0, 25, 0, 310), function()
    local plr = game.Players.LocalPlayer
    plr.Character.HumanoidRootPart.CFrame = CFrame.new(1050, 150, 1050) -- Change to any location you want
end)
