-- AlameerSchoolGang Script V2 - Full Fix
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local AutoFarmButton = Instance.new("TextButton")

-- Parent GUI
ScreenGui.Parent = game:GetService("CoreGui")

-- Frame
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.Position = UDim2.new(0.3, 0, 0.3, 0)
MainFrame.Size = UDim2.new(0, 400, 0, 300)
MainFrame.Active = true
MainFrame.Draggable = true

-- Title
Title.Name = "Title"
Title.Parent = MainFrame
Title.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
Title.Size = UDim2.new(1, 0, 0, 50)
Title.Font = Enum.Font.SourceSansBold
Title.Text = "🔥 AlameerSchoolGang 🔥"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextScaled = true

-- Auto Farm Button
AutoFarmButton.Name = "AutoFarmButton"
AutoFarmButton.Parent = MainFrame
AutoFarmButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
AutoFarmButton.Position = UDim2.new(0.15, 0, 0.4, 0)
AutoFarmButton.Size = UDim2.new(0, 280, 0, 60)
AutoFarmButton.Font = Enum.Font.SourceSansBold
AutoFarmButton.Text = "Start Auto Farm"
AutoFarmButton.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoFarmButton.TextScaled = true

-- Auto Farm Script
local autofarmActive = false

AutoFarmButton.MouseButton1Click:Connect(function()
    autofarmActive = not autofarmActive
    AutoFarmButton.Text = autofarmActive and "Stop Auto Farm" or "Start Auto Farm"

    while autofarmActive do
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
                plr.Character.Humanoid:ChangeState(11) -- Floating above enemy
                game:GetService'VirtualUser':Button1Down(Vector2.new(0,0))
            end
        end)
    end
end)
