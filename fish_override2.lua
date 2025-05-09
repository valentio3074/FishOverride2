-- fish_override1.lua

-- Lista dei pesci (può essere espansa)
local fishList = {
    "Roslit Volcano",
    "Ember Snapper",
    "Volcanic Geode",
    "Obsidian Salmon",
    "Obsidian Swordfish",
    "Herring",
    "Arctic Char",
    "Glacier Pike",
    "Pond Emperor",
    "Glacierfish",
    "Swamp Bass",
    "Bowfin",
    "Marsh Gar",
    "Alligator",
    "Haddock",
    "Mackerel",
    "Sea Bass",
    "Smallmouth Bass",
    "White Bass",
    "Golden Smallmouth Bass",
    "Gazerfish",
    "Globe Jellyfish",
    "Eyefestation",
    "Skate Tuna",
    "Phantom Ray",
    "Cockatoo Squid",
    "Shortfin Mako Shark",
    "Galleon Goliath",
    "Shipwreck Barracuda",
    "Captain’s Goldfish",
    "Deep-Sea Hatchetfish",
    "Deep-Sea Dragonfish",
    "Candy Fish",
    "Skelefish",
    "Lego Fish",
    "Phantom Megalodon",
    "Megalodon",
    "Ancient Megalodon"
}

local selectedFish = nil
local guiOpen = true
local autoFishing = false

-- Funzione per creare la GUI
local function createGUI()
    local ScreenGui = Instance.new("ScreenGui", game.Players.LocalPlayer:WaitForChild("PlayerGui"))
    ScreenGui.Name = "FishOverrideGui"

    local Frame = Instance.new("Frame", ScreenGui)
    Frame.Size = UDim2.new(0, 300, 0, 400)
    Frame.Position = UDim2.new(0.5, -150, 0.5, -200)
    Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Frame.BorderSizePixel = 0
    Frame.Visible = true

    local Title = Instance.new("TextLabel", Frame)
    Title.Text = "Seleziona il Pesce da Pescare"
    Title.Size = UDim2.new(1, 0, 0, 40)
    Title.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    Title.TextColor3 = Color3.new(1, 1, 1)
    Title.Font = Enum.Font.SourceSansBold
    Title.TextSize = 20

    local Scroll = Instance.new("ScrollingFrame", Frame)
    Scroll.Position = UDim2.new(0, 0, 0, 40)
    Scroll.Size = UDim2.new(1, 0, 1, -40)
    Scroll.CanvasSize = UDim2.new(0, 0, 0, #fishList * 30)
    Scroll.ScrollBarThickness = 8
    Scroll.BackgroundColor3 = Color3.fromRGB(40, 40, 40)

    for i, fish in ipairs(fishList) do
        local Button = Instance.new("TextButton", Scroll)
        Button.Text = fish
        Button.Size = UDim2.new(1, -10, 0, 30)
        Button.Position = UDim2.new(0, 5, 0, (i - 1) * 30)
        Button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        Button.TextColor3 = Color3.new(1, 1, 1)
        Button.Font = Enum.Font.SourceSans
        Button.TextSize = 18

        Button.MouseButton1Click:Connect(function()
            selectedFish = fish
            print("Prossimo pesce selezionato:", selectedFish)
        end)
    end
end

-- Simula l’auto pesca
local function simulateFishing()
    while autoFishing do
        if selectedFish then
            print("Auto-pesca simulata per:", selectedFish)
            -- Qui va la logica per simulare il click o l’azione necessaria nel gioco
        end
        wait(2) -- attesa tra un tentativo di pesca e l’altro
    end
end

-- Controlli da tastiera
local UserInputService = game:GetService("UserInputService")
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.F then
        local gui = game.Players.LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("FishOverrideGui")
        if gui then
            gui.Enabled = not gui.Enabled
        end
    elseif input.KeyCode == Enum.KeyCode.R then
        autoFishing = not autoFishing
        if autoFishing then
            print("Auto pesca attivata")
            simulateFishing()
        else
            print("Auto pesca disattivata")
        end
    end
end)

createGUI()
