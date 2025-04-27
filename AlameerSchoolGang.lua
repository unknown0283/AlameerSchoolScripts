-- AlameerSchoolGang GUI v2
local AlameerGUI = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local OpenButton = Instance.new("ImageButton")

-- GUI Setup
AlameerGUI.Name = "AlameerSchoolGang"
AlameerGUI.Parent = game.CoreGui
AlameerGUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

MainFrame.Name = "MainFrame"
MainFrame.Parent = AlameerGUI
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 75, 65)
MainFrame.Position = UDim2.new(0.25, 0, 0.2, 0)
MainFrame.Size = UDim2.new(0, 500, 0, 400)
MainFrame.Visible = false

OpenButton.Name = "OpenButton"
OpenButton.Parent = AlameerGUI
OpenButton.BackgroundColor3 = Color3.fromRGB(0, 200, 150)
OpenButton.Position = UDim2.new(0, 10, 0.5, 0)
OpenButton.Size = UDim2.new(0, 100, 0, 40)
OpenButton.Image = "rbxassetid://15513459483" -- (your green button with arrow)
OpenButton.MouseButton1Click:Connect(function()
	MainFrame.Visible = not MainFrame.Visible
end)

-- Libraries
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("AlameerSchoolGang", "DarkTheme")

-- Tabs
local FarmTab = Window:NewTab("Auto Farm")
local FruitTab = Window:NewTab("Devil Fruits")
local SettingsTab = Window:NewTab("Settings")

-- Sections
local FarmSection = FarmTab:NewSection("Farm Settings")
local FruitSection = FruitTab:NewSection("Fruit Settings")
local SettingsSection = SettingsTab:NewSection("Main Settings")

-- Auto Farm
FarmSection:NewDropdown("Select Weapon", "Choose your weapon to farm with", {"Melee", "Sword", "Fruit"}, function(currentWeapon)
	_G.SelectedWeapon = currentWeapon
end)

FarmSection:NewToggle("Auto Farm Level", "Auto farm based on your level", function(state)
	_G.AutoFarm = state
	while _G.AutoFarm do
		task.wait()
		-- Attack code here
		local tool = nil
		for _,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
			if v:IsA("Tool") and v.Name:find(_G.SelectedWeapon) then
				tool = v
			end
		end
		if tool then
			tool.Parent = game.Players.LocalPlayer.Character
			game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
			task.wait(0.2)
			game:GetService("VirtualUser"):Button1Up(Vector2.new(1280, 672))
		end
	end
end)

FarmSection:NewToggle("Auto Ken (Observation Haki)", "Auto enable Ken", function(state)
	_G.AutoKen = state
	while _G.AutoKen do
		task.wait(5)
		game:GetService("ReplicatedStorage").Remotes.CommE:InvokeServer("KenTalk","Activate")
	end
end)

FarmSection:NewToggle("Auto Haki", "Auto activate Enhancement", function(state)
	_G.AutoHaki = state
	while _G.AutoHaki do
		task.wait(2)
		pcall(function()
			if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
				game:GetService("ReplicatedStorage").Remotes.CommE:InvokeServer("Buso")
			end
		end)
	end
end)

-- Devil Fruits
FruitSection:NewToggle("Auto Buy Fruit", "Automatically buy random fruits", function(state)
	_G.AutoBuyFruit = state
	while _G.AutoBuyFruit do
		task.wait(600)
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits")
	end
end)

FruitSection:NewToggle("Auto Store Fruit", "Automatically store fruits", function(state)
	_G.AutoStoreFruit = state
	while _G.AutoStoreFruit do
		task.wait(3)
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit")
	end
end)

FruitSection:NewToggle("Auto TP to Fruits", "Teleports you to devil fruits on map", function(state)
	_G.AutoTPFruit = state
	while _G.AutoTPFruit do
		task.wait(5)
		for _,v in pairs(workspace:GetChildren()) do
			if v:IsA("Tool") and v:FindFirstChild("Handle") then
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Handle.CFrame
			end
		end
	end
end)

-- Settings
SettingsSection:NewButton("Rejoin Game", "Rejoins your server", function()
	game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
end)

SettingsSection:NewButton("Destroy GUI", "Closes AlameerSchoolGang GUI", function()
	AlameerGUI:Destroy()
end)

-- Notifications
game.StarterGui:SetCore("SendNotification",{
	Title = "AlameerSchoolGang",
	Text = "Loaded Successfully!",
	Icon = "",
	Duration = 5
})
