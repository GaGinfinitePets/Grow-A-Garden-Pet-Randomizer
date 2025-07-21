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

-- ESP permanent pour chaque egg
local function createESP()
    for eggName, petList in pairs(eggs) do
        for _, egg in ipairs(workspace:GetChildren()) do
            if egg.Name == eggName then
                local esp = egg:FindFirstChild("PetESP")
                if esp then esp:Destroy() end
                local billboard = Instance.new("BillboardGui")
                billboard.Name = "PetESP"
                billboard.Size = UDim2.new(0, 110, 0, 18)
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
                text.TextScaled = false
                text.Font = Enum.Font.GothamBold
                text.TextSize = 11 -- TEXTE PETIT !
                text.Parent = billboard
            end
        end
    end
end

local function updateESP()
    for eggName, petList in pairs(eggs) do
        for _, egg in ipairs(workspace:GetChildren()) do
            if egg.Name == eggName then
                local billboard = egg:FindFirstChild("PetESP")
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

local function removeESP()
    for eggName, _ in pairs(eggs) do
        for _, egg in ipairs(workspace:GetChildren()) do
            if egg.Name == eggName then
                local billboard = egg:FindFirstChild("PetESP")
                if billboard then billboard:Destroy() end
            end
        end
    end
end

-- UI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "EggESPUI"
ScreenGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 240, 0, 130) -- UI UN PEU PLUS GROS !
mainFrame.Position = UDim2.new(0.5, -120, 0.5, -65)
mainFrame.BackgroundColor3 = Color3.fromRGB(121, 77, 44)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = ScreenGui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 32)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundColor3 = Color3.fromRGB(102, 220, 105)
title.BorderSizePixel = 0
title.Text = "Egg Pet ESP"
title.TextColor3 = Color3.fromRGB(255,255,255)
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.Parent = mainFrame

local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 22, 0, 22)
closeButton.Position = UDim2.new(1, -26, 0, 5)
closeButton.BackgroundColor3 = Color3.fromRGB(255, 95, 95)
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255,255,255)
closeButton.TextScaled = true
closeButton.Font = Enum.Font.GothamBold
closeButton.Parent = mainFrame
closeButton.MouseButton1Click:Connect(function()
    removeESP()
    ScreenGui:Destroy()
end)

local randomBtn = Instance.new("TextButton")
randomBtn.Size = UDim2.new(0.85, 0, 0, 36)
randomBtn.Position = UDim2.new(0.075, 0, 0.42, 0)
randomBtn.BackgroundColor3 = Color3.fromRGB(56, 160, 255)
randomBtn.Text = "Refresh ESP"
randomBtn.TextColor3 = Color3.fromRGB(255,255,255)
randomBtn.TextScaled = true
randomBtn.Font = Enum.Font.GothamBold
randomBtn.Parent = mainFrame
randomBtn.MouseButton1Click:Connect(function()
    updateESP()
end)

local info = Instance.new("TextLabel")
info.Size = UDim2.new(1, -16, 0, 24)
info.Position = UDim2.new(0, 8, 1, -28)
info.BackgroundTransparency = 1
info.Text = "Les noms sont petits et l'ESP est permanent.\nFerme l'UI pour tout retirer."
info.TextColor3 = Color3.fromRGB(255,255,255)
info.TextScaled = false
info.TextSize = 13
info.Font = Enum.Font.Gotham
info.Parent = mainFrame

-- ESP au lancement
createESP()
