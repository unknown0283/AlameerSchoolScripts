-- Script for AlameerSchoolGang GUI (Dark Mode) with requested features
local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player.PlayerGui

-- Dark Mode Background
local background = Instance.new("Frame")
background.Size = UDim2.new(1, 0, 1, 0)
background.BackgroundColor3 = Color3.fromRGB(30, 30, 30)  -- Dark background color
background.Parent = screenGui

-- Button Style (Green)
local function createButton(name, position)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 200, 0, 50)
    button.Position = position
    button.BackgroundColor3 = Color3.fromRGB(34, 139, 34)  -- Green color
    button.Text = name
    button.Font = Enum.Font.GothamBold
    button.TextSize = 24
    button.TextColor3 = Color3.fromRGB(255, 255, 255)  -- White text
    button.Parent = background
    return button
end

-- Creating Buttons
local autoFarmButton = createButton("Auto Farm", UDim2.new(0, 50, 0, 50))
local chooseWeaponButton = createButton("Choose Weapon", UDim2.new(0, 50, 0, 120))
local autoBuyButton = createButton("Auto Buy Fruits", UDim2.new(0, 50, 0, 190))
local autoStoreButton = createButton("Auto Store Fruits", UDim2.new(0, 50, 0, 260))
local autoTPButton = createButton("Auto TP to Fruits", UDim2.new(0, 50, 0, 330))
local autoRaidsButton = createButton("Auto Raids", UDim2.new(0, 50, 0, 400))

-- Variables for Auto Farm
local autoFarmActive = false
local targetEnemy = nil

-- Function to find and select an enemy
local function selectEnemy()
    local enemies = {}  -- You can filter this by your specific NPCs
    for _, npc in pairs(workspace:GetChildren()) do
        if npc:FindFirstChild("Humanoid") then
            table.insert(enemies, npc)
        end
    end
    
    -- Select the nearest enemy (simple distance check)
    local closestEnemy = nil
    local shortestDistance = math.huge
    for _, enemy in pairs(enemies) do
        local distance = (enemy.PrimaryPart.Position - game.Players.LocalPlayer.Character.PrimaryPart.Position).Magnitude
        if distance < shortestDistance then
            shortestDistance = distance
            closestEnemy = enemy
        end
    end
    
    return closestEnemy
end

-- Function to start auto farming
local function startAutoFarm()
    while autoFarmActive do
        targetEnemy = selectEnemy()
        if targetEnemy then
            -- Attack the selected enemy (you would need to trigger an attack animation or effect)
            print("Attacking enemy:", targetEnemy.Name)
        end
        wait(1)
    end
end

-- Toggle auto farm
autoFarmButton.MouseButton1Click:Connect(function()
    autoFarmActive = not autoFarmActive
    if autoFarmActive then
        startAutoFarm()
    end
end)

-- Function to choose weapon (Melee, Sword, or Fruit)
local function chooseWeapon(weaponType)
    if weaponType == "Melee" then
        -- Equip melee weapon (this could be adding a tool to the player’s character)
        print("Equipping Melee Weapon")
    elseif weaponType == "Sword" then
        -- Equip sword weapon
        print("Equipping Sword")
    elseif weaponType == "Fruit" then
        -- Equip fruit (power or ability)
        print("Equipping Fruit")
    end
end

-- Weapon selection button functionality
chooseWeaponButton.MouseButton1Click:Connect(function()
    chooseWeapon("Sword")  -- Example: Choose sword when button is clicked
end)

-- Function for auto buying fruits
local function autoBuyFruits()
    -- Assuming you have a way to check fruits available for purchase and prices
    print("Buying fruits automatically")
    -- Implement the logic for buying fruits from the store or marketplace
end

-- Button to buy fruits
autoBuyButton.MouseButton1Click:Connect(function()
    autoBuyFruits()
end)

-- Function for auto storing fruits
local function autoStoreFruits()
    -- Logic to store fruits in a player's storage or inventory
    print("Storing fruits automatically")
end

-- Button to store fruits
autoStoreButton.MouseButton1Click:Connect(function()
    autoStoreFruits()
end)

-- Function for auto teleporting to fruits
local function autoTPToFruits()
    -- Assume you have some fruits placed in the world with a tag or identifiable part
    local fruits = {}  -- Add logic to get fruits in your world
    for _, fruit in pairs(fruits) do
        -- Teleport player to the fruit's position
        game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(fruit.CFrame)
    end
end

-- Button for teleporting to fruits
autoTPButton.MouseButton1Click:Connect(function()
    autoTPToFruits()
end)

-- Function to start raids automatically
local function startRaid()
    -- Logic to trigger a raid
    print("Starting raid automatically")
    -- You can spawn enemies or trigger a raid event here
end

-- Button for starting raids
autoRaidsButton.MouseButton1Click:Connect(function()
    startRaid()
end)

-- Function for notifications
local function showNotification(message)
    local notification = Instance.new("TextLabel")
    notification.Text = message
    notification.Size = UDim2.new(0, 300, 0, 50)
    notification.Position = UDim2.new(0.5, -150, 0.1, 0)  -- Centered at top
    notification.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    notification.TextColor3 = Color3.fromRGB(255, 255, 255)
    notification.Parent = screenGui
    wait(3)
    notification:Destroy()
end

-- Example notification usage
showNotification("Raid started!")

-- Clean and optimized for performance:
-- Using event-driven code for button clicks to avoid unnecessary loops
