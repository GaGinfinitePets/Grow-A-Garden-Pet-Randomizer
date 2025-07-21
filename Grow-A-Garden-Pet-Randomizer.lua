local eggs = {
    ["RareSummerEgg"] = {"Flamingo", "Toucan", "Sea Turtle", "Orangutan", "Seal"},
    ["ParadiseEgg"] = {"Ostrich", "Peacock", "Capybara", "Scarlet Macaw", "Mimic Octopus"},
    ["OasisEgg"] = {"Meerkat", "Sand Snake", "Axolotl", "Hyacinth Macaw", "Fennec Fox"},
    ["PremiumOasisEgg"] = {"Meerkat", "Sand Snake", "Axolotl", "Hyacinth Macaw", "Fennec Fox"},
    ["DinosaurEgg"] = {"Raptor", "Triceratops", "Stegosaurus", "Pterodactyl", "Brontosaurus", "T-Rex"},
    ["PremiumNightEgg"] = {"Hedgehog", "Mole", "Frog", "Echo Frog", "Night Owl", "Raccoon"},
    ["BeeEgg"] = {"Bee", "Honey Bee", "Bear Bee", "Petal Bee", "Queen Bee (Pet)"},
    ["AntiBeeEgg"] = {"Wasp", "Tarantula Hawk", "Moth", "Butterfly", "Disco Bee"},
    ["PremiumAntiBeeEgg"] = {"Wasp", "Tarantula Hawk", "Moth", "Butterfly", "Disco Bee"},
    ["CommonSummerEgg"] = {"Starfish", "Seagull", "Crab"},
    ["MythicalEgg"] = {"Grey Mouse", "Brown Mouse", "Squirrel", "Red Giant Ant", "Red Fox"},
    ["BugEgg"] = {"Snail", "Giant Ant", "Caterpillar", "Praying Mantis", "Dragonfly"},
    ["ExoticBugEgg"] = {"Snail", "Giant Ant", "Caterpillar", "Praying Mantis", "Dragonfly"},
    ["NightEgg"] = {"Hedgehog", "Mole", "Frog", "Echo Frog", "Night Owl", "Raccoon"},
    ["CommonEgg"] = {"Golden Lab", "Dog", "Bunny"},
    ["UncommonEgg"] = {"Black Bunny", "Chicken", "Cat", "Deer"},
    ["RareEgg"] = {"Orange Tabby", "Spotted Deer", "Pig", "Rooster", "Monkey"},
    ["LegendaryEgg"] = {"Cow", "Silver Monkey", "Sea Otter", "Turtle", "Polar Bear"},
    ["PrimalEgg"] = {"Parasaurolophus", "Iguanodon", "Pachycephalosaurus"},
    ["PremiumPrimalEgg"] = {"Dilophosaurus", "Ankylosaurus", "Spinosaurus"},
    ["ZenEgg"] = {"Shiba Inu", "Nihonzaru", "Tanuki", "Tanchozuru", "Kappa", "Kitsune"},
}

local function getRandomPet(pets)
    return pets[math.random(1, #pets)]
end

local function randomizeEggs()
    for eggName, petList in pairs(eggs) do
        local egg = workspace:FindFirstChild(eggName)
        if egg then
            local existing = egg:FindFirstChild("PetNameGui")
            if existing then existing:Destroy() end

            local billboard = Instance.new("BillboardGui")
            billboard.Name = "PetNameGui"
            billboard.Size = UDim2.new(0, 180, 0, 40)
            billboard.StudsOffset = Vector3.new(0, 3, 0)
            billboard.Adornee = egg
            billboard.AlwaysOnTop = true
            billboard.Parent = egg

            local text = Instance.new("TextLabel")
            text.Size = UDim2.new(1, 0, 1, 0)
            text.BackgroundTransparency = 1
            text.Text = getRandomPet(petList)
            text.TextColor3 = Color3.fromRGB(255, 255, 0)
            text.TextStrokeTransparency = 0.5
            text.TextScaled = true
            text.Font = Enum.Font.GothamBold
            text.Parent = billboard
        end
    end
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "EggRandomizerUI"
ScreenGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 220, 0, 90)
mainFrame.Position = UDim2.new(0.5, -110, 0.5, -45)
mainFrame.BackgroundColor3 = Color3.fromRGB(121, 77, 44)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true -- UI draggable
mainFrame.Parent = ScreenGui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 28)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundColor3 = Color3.fromRGB(102, 220, 105)
title.BorderSizePixel = 0
title.Text = "Egg Randomizer"
title.TextColor3 = Color3.fromRGB(255,255,255)
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.Parent = mainFrame

local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 22, 0, 22)
closeButton.Position = UDim2.new(1, -26, 0, 3)
closeButton.BackgroundColor3 = Color3.fromRGB(255, 95, 95)
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255,255,255)
closeButton.TextScaled = true
closeButton.Font = Enum.Font.GothamBold
closeButton.Parent = mainFrame
closeButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

local randomBtn = Instance.new("TextButton")
randomBtn.Size = UDim2.new(0.85, 0, 0, 36)
randomBtn.Position = UDim2.new(0.075, 0, 0.55, 0)
randomBtn.BackgroundColor3 = Color3.fromRGB(56, 160, 255)
randomBtn.Text = "Randomize Pet"
randomBtn.TextColor3 = Color3.fromRGB(255,255,255)
randomBtn.TextScaled = true
randomBtn.Font = Enum.Font.GothamBold
randomBtn.Parent = mainFrame

randomBtn.MouseButton1Click:Connect(function()
    randomBtn.Text = "Randomizing..."
    randomizeEggs()
    wait(0.35)
    randomBtn.Text = "Randomize Pet"
end)