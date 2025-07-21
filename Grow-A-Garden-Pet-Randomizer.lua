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

-- Helper pour obtenir la Part principale d'un Model
local function getMainPart(model)
    for _, child in ipairs(model:GetChildren()) do
        if child:IsA("BasePart") then
            return child
        end
    end
    return nil
end

-- Affiche le nom du pet au-dessus de chaque œuf (Model ou Part)
local function showEggPets()
    for eggName, petList in pairs(eggs) do
        for _, egg in ipairs(workspace:GetChildren()) do
            if egg.Name == eggName or egg.Name == eggName.."Egg" or egg.Name == "CommonEgg" then
                local adornee = egg
                if egg:IsA("Model") then
                    adornee = getMainPart(egg)
                end
                if adornee then
                    local gui = adornee:FindFirstChild("PetESP")
                    if gui then gui:Destroy() end
                    local billboard = Instance.new("BillboardGui")
                    billboard.Name = "PetESP"
                    billboard.Size = UDim2.new(0, 110, 0, 18)
                    billboard.StudsOffset = Vector3.new(0, 3, 0)
                    billboard.Adornee = adornee
                    billboard.AlwaysOnTop = true
                    billboard.Parent = adornee

                    local text = Instance.new("TextLabel")
                    text.Size = UDim2.new(1, 0, 1, 0)
                    text.BackgroundTransparency = 1
                    text.Text = getRandomPet(petList)
                    text.TextColor3 = Color3.fromRGB(255, 255, 0)
                    text.TextStrokeTransparency = 0.5
                    text.TextScaled = false
                    text.TextSize = 13
                    text.Font = Enum.Font.GothamBold
                    text.Parent = billboard
                end
            end
        end
    end
end

local function randomizeEggPets()
    for eggName, petList in pairs(eggs) do
        for _, egg in ipairs(workspace:GetChildren()) do
            if egg.Name == eggName or egg.Name == eggName.."Egg" or egg.Name == "CommonEgg" then
                local adornee = egg
                if egg:IsA("Model") then
                    adornee = getMainPart(egg)
                end
                if adornee then
                    local billboard = adornee:FindFirstChild("PetESP")
                    if billboard and billboard:IsA("BillboardGui") then
                        local text = billboard:FindFirstChildOfClass("TextLabel")
                        if text then
                            text.Text = getRandomPet(petList)
                        end
                    end
                end
            end
        end
    end
end

local function removeEggPets()
    for _, egg in ipairs(workspace:GetChildren()) do
        local adornee = egg
        if egg:IsA("Model") then
            adornee = getMainPart(egg)
        end
        if adornee then
            local gui = adornee:FindFirstChild("PetESP")
            if gui then gui:Destroy() end
        end
    end
end

-- UI minimaliste
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "EggESPUI"
ScreenGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 220, 0, 80)
mainFrame.Position = UDim2.new(0.5, -110, 0.5, -40)
mainFrame.BackgroundColor3 = Color3.fromRGB(121, 77, 44)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = ScreenGui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 28)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundColor3 = Color3.fromRGB(102, 220, 105)
title.BorderSizePixel = 0
title.Text = "Pets randomizer"
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
    removeEggPets()
    ScreenGui:Destroy()
end)

local randomBtn = Instance.new("TextButton")
randomBtn.Size = UDim2.new(0.85, 0, 0, 36)
randomBtn.Position = UDim2.new(0.075, 0, 0.43, 0)
randomBtn.BackgroundColor3 = Color3.fromRGB(56, 160, 255)
randomBtn.Text = "Randomize pets"
randomBtn.TextColor3 = Color3.fromRGB(255,255,255)
randomBtn.TextScaled = true
randomBtn.Font = Enum.Font.GothamBold
randomBtn.Parent = mainFrame
randomBtn.MouseButton1Click:Connect(function()
    randomizeEggPets()
end)

showEggPets()
