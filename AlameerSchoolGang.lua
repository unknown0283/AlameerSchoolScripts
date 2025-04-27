-- AlameerSchoolGang Script V1
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local AutoFarmButton = Instance.new("TextButton")

ScreenGui.Parent = game.CoreGui

MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.Position = UDim2.new(0.3, 0, 0.3, 0)
MainFrame.Size = UDim2.new(0, 400, 0, 300)
MainFrame.Active = true
MainFrame.Draggable = true

Title.Name = "Title"
Title.Parent = MainFrame
Title.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
Title.Size = UDim2.new(1, 0, 0, 50)
Title.Font = Enum.Font.SourceSansBold
Title.Text = "🔥 AlameerSchoolGang 🔥"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextScaled = true

AutoFarmButton.Name = "AutoFarmButton"
AutoFarmButton.Parent = MainFrame
AutoFarmButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
AutoFarmButton.Position = UDim2.new(0.15, 0, 0.4, 0)
AutoFarmButton.Size = UDim2.new(0, 280, 0, 60)
AutoFarmButton.Font = Enum.Font.SourceSansBold
AutoFarmButton.Text = "Start Auto Farm"
AutoFarmButton.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoFarmButton.TextScaled = true
AutoFarmButton.MouseButton1Click:Connect(function()
    -- Real working simple auto farm
    _G.AutoFarm = true
    while _G.AutoFarm do
        task.wait(0.1)
        pcall(function()
            local Enemy = game:GetService("Workspace").Enemies:FindFirstChild("Bandit [Lv. 5]")
            if Enemy and Enemy:FindFirstChild("HumanoidRootPart") and Enemy.Humanoid.Health > 0 then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Enemy.HumanoidRootPart.CFrame * CFrame.new(0,10,0)
                game:GetService'VirtualUser':Button1Down(Vector2.new(0,0))
            end
        end)
    end
end)
