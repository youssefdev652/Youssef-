local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local HttpService = game:GetService("HttpService")

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/CAXAP26BKyCH/library/refs/heads/main/Uilibrary"))()
local Window = Library:AddWindow("DEVIL_YOUSSEF | Paid Version", {
    main_color = Color3.fromRGB(255, 0, 0),
    min_size = Vector2.new(500, 600),
    can_resize = true
})

local MainTab = Window:AddTab("Main")
local LocalPlayersFolder = MainTab:AddFolder("Local Players")
LocalPlayersFolder:AddSwitch("Auto Eat Protein Egg Every 30 Minutes", function(state)
    getgenv().autoEatProteinEggActive = state
    task.spawn(function()
        while getgenv().autoEatProteinEggActive and LocalPlayer.Character do
            local egg = LocalPlayer.Backpack:FindFirstChild("Protein Egg") or LocalPlayer.Character:FindFirstChild("Protein Egg")
            if egg then
                egg.Parent = LocalPlayer.Character
                ReplicatedStorage.muscleEvent:FireServer("rep")
            end
            task.wait(1800)
        end
    end)
end)
LocalPlayersFolder:AddSwitch("Auto Eat Protein Egg Every 1 hour", function(state)
    getgenv().autoEatProteinEggHourly = state
    task.spawn(function()
        while getgenv().autoEatProteinEggHourly and LocalPlayer.Character do
            local egg = LocalPlayer.Backpack:FindFirstChild("Protein Egg") or LocalPlayer.Character:FindFirstChild("Protein Egg")
            if egg then
                egg.Parent = LocalPlayer.Character
                ReplicatedStorage.muscleEvent:FireServer("rep")
            end
            task.wait(3600)
        end
    end)
end)
local MiscFolder = MainTab:AddFolder("Misc")
MiscFolder:AddSwitch("Auto Farm (Equip Any tool)", function(state)
    getgenv().autoFarm = state
    task.spawn(function()
        while getgenv().autoFarm and LocalPlayer.Character do
            for _, tool in pairs(LocalPlayer.Backpack:GetChildren()) do
                if tool:IsA("Tool") then
                    tool.Parent = LocalPlayer.Character
                    ReplicatedStorage.muscleEvent:FireServer("rep")
                    task.wait(0.1)
                end
            end
            task.wait()
        end
    end)
end)
MiscFolder:AddLabel("---Script Hub---")
MiscFolder:AddButton("Permanent ShiftLock", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/MiniNoobie/ShiftLockx/main/Shiftlock-MiniNoobie"))()
end)
MiscFolder:AddLabel("---Time---")
MiscFolder:AddButton("Night", function()
    Lighting.ClockTime = 0
end)
MiscFolder:AddButton("Morning", function()
    Lighting.ClockTime = 6
end)
MiscFolder:AddButton("Day", function()
    Lighting.ClockTime = 12
end)
MiscFolder:AddLabel("----Farming----")
local AutoBrawlFolder = MainTab:AddFolder("Auto Brawl")
AutoBrawlFolder:AddSwitch("Auto Win Brawl", function(state)
    getgenv().autoWinBrawl = state
    task.spawn(function()
        while getgenv().autoWinBrawl and LocalPlayer.Character do
            ReplicatedStorage.rEvents.joinBrawl:FireServer("Win")
            task.wait(1)
        end
    end)
end)
AutoBrawlFolder:AddSwitch("Auto Join Brawl (For Farming)", function(state)
    getgenv().autoBrawlFarm = state
    task.spawn(function()
        while getgenv().autoBrawlFarm and LocalPlayer.Character do
            ReplicatedStorage.rEvents.joinBrawl:FireServer("Farm")
            task.wait(1)
        end
    end)
end)
local OpStuffFolder = MainTab:AddFolder("Op stuff (for farm)")
OpStuffFolder:AddSwitch("Anti Knockback", function(state)
    getgenv().antiKnockback = state
    LocalPlayer.CharacterAdded:Connect(function(char)
        if getgenv().antiKnockback then
            char.HumanoidRootPart.Anchored = true
            task.wait(0.1)
            char.HumanoidRootPart.Anchored = false
        end
    end)
end)
OpStuffFolder:AddSwitch("Auto Pushups with Rock (10M) and Auto Punch", function(state)
    getgenv().autoPushups10M = state
    task.spawn(function()
        while getgenv().autoPushups10M and LocalPlayer.Character do
            local pushups = LocalPlayer.Backpack:FindFirstChild("Pushups") or LocalPlayer.Character:FindFirstChild("Pushups")
            if pushups then
                pushups.Parent = LocalPlayer.Character
                ReplicatedStorage.muscleEvent:FireServer("rep")
                local rock = Workspace.machinesFolder:FindFirstChild("Ancient Jungle Rock")
                if rock and LocalPlayer:FindFirstChild("Durability") and LocalPlayer.Durability.Value >= 10000000 then
                    firetouchinterest(rock.Rock, LocalPlayer.Character.RightHand, 0)
                    firetouchinterest(rock.Rock, LocalPlayer.Character.LeftHand, 0)
                    task.wait()
                    firetouchinterest(rock.Rock, LocalPlayer.Character.RightHand, 1)
                    firetouchinterest(rock.Rock, LocalPlayer.Character.LeftHand, 1)
                    ReplicatedStorage.muscleEvent:FireServer("punch", "rightHand")
                    ReplicatedStorage.muscleEvent:FireServer("punch", "leftHand")
                end
            end
            task.wait(0.1)
        end
    end)
end)
OpStuffFolder:AddSwitch("Free AutoLift Gamepass", function(state)
    getgenv().autoLiftGamepass = state
    task.spawn(function()
        while getgenv().autoLiftGamepass and LocalPlayer.Character do
            local gamepasses = ReplicatedStorage:FindFirstChild("gamepassIds")
            if gamepasses then
                local ownedGamepasses = LocalPlayer:FindFirstChild("ownedGamepasses") or Instance.new("Folder", LocalPlayer)
                ownedGamepasses.Name = "ownedGamepasses"
                local autoLift = ownedGamepasses:FindFirstChild("AutoLift") or Instance.new("IntValue", ownedGamepasses)
                autoLift.Name = "AutoLift"
                autoLift.Value = 1
            end
            task.wait(1)
        end
    end)
end)
OpStuffFolder:AddSwitch("Walk on Water", function(state)
    getgenv().walkOnWater = state
    if state then
        local part = Instance.new("Part")
        part.Size = Vector3.new(1000, 1, 1000)
        part.Position = Vector3.new(0, 0, 0)
        part.Anchored = true
        part.Transparency = 0.5
        part.CanCollide = true
        part.Parent = Workspace
        getgenv().waterPart = part
    else
        if getgenv().waterPart then
            getgenv().waterPart:Destroy()
            getgenv().waterPart = nil
        end
    end
end)
OpStuffFolder:AddButton("Remove Ad Portal", function()
    for _, portal in pairs(Workspace:GetDescendants()) do
        if portal.Name:match("AdPortal") then
            portal:Destroy()
        end
    end
end)

local KillingTab = Window:AddTab("Killing")
KillingTab:AddSwitch("Auto Equip Punch", function(state)
    getgenv().autoEquipPunch = state
    task.spawn(function()
        while getgenv().autoEquipPunch and LocalPlayer.Character do
            local punch = LocalPlayer.Backpack:FindFirstChild("Punch") or LocalPlayer.Character:FindFirstChild("Punch")
            if punch then
                punch.Parent = LocalPlayer.Character
            else
                LocalPlayer.Character.Humanoid:UnequipTools()
                local backpackPunch = LocalPlayer.Backpack:FindFirstChild("Punch")
                if backpackPunch then
                    backpackPunch.Parent = LocalPlayer.Character
                end
            end
            task.wait(0.5)
        end
    end)
end)
KillingTab:AddSwitch("Auto Punch {With Movement}", function(state)
    getgenv().autoPunchMove = state
    task.spawn(function()
        while getgenv().autoPunchMove and LocalPlayer.Character do
            local punch = LocalPlayer.Character:FindFirstChild("Punch")
            if punch then
                ReplicatedStorage.muscleEvent:FireServer("punch", "rightHand")
                ReplicatedStorage.muscleEvent:FireServer("punch", "leftHand")
                LocalPlayer.Character.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame + LocalPlayer.Character.Humanoid.MoveDirection * 0.5
            end
            task.wait(0.1)
        end
    end)
end)
KillingTab:AddSwitch("Auto Punch", function(state)
    getgenv().autopunch = state
    task.spawn(function()
        while getgenv().autopunch and LocalPlayer.Character do
            local punch = LocalPlayer.Character:FindFirstChild("Punch")
            if punch then
                ReplicatedStorage.muscleEvent:FireServer("punch", "rightHand")
                ReplicatedStorage.muscleEvent:FireServer("punch", "leftHand")
            end
            task.wait(0.1)
        end
    end)
end)
KillingTab:AddSwitch("Unlock Fast Punch", function(state)
    getgenv().fastPunch = state
    task.spawn(function()
        while getgenv().fastPunch and LocalPlayer.Character do
            local punch = LocalPlayer.Character:FindFirstChild("Punch")
            if punch then
                ReplicatedStorage.muscleEvent:FireServer("punch", "rightHand")
                ReplicatedStorage.muscleEvent:FireServer("punch", "leftHand")
            end
            task.wait(0.05)
        end
    end)
end)
KillingTab:AddTextBox("Whitelist Player", function(name)
    getgenv().whitelist = getgenv().whitelist or {}
    table.insert(getgenv().whitelist, name)
end)
KillingTab:AddButton("Clear Whitelist", function()
    getgenv().whitelist = {}
end)
KillingTab:AddSwitch("Auto Kill", function(state)
    getgenv().autokill = state
    task.spawn(function()
        while getgenv().autokill and LocalPlayer.Character do
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and not table.find(getgenv().whitelist or {}, player.Name) then
                    if player.Character and player.Character.HumanoidRootPart then
                        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(player.Character.HumanoidRootPart.Position)
                        ReplicatedStorage.muscleEvent:FireServer("punch", "rightHand")
                        ReplicatedStorage.muscleEvent:FireServer("punch", "leftHand")
                    end
                end
            end
            task.wait(0.1)
        end
    end)
end)
KillingTab:AddSwitch("Auto Kill Players", function(state)
    getgenv().autoKillActive = state
    local function onPlayerAdded(player)
        if getgenv().autoKillActive and player ~= LocalPlayer and not table.find(getgenv().whitelist or {}, player.Name) then
            task.spawn(function()
                while getgenv().autoKillActive and player.Character and LocalPlayer.Character do
                    if player.Character.HumanoidRootPart then
                        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(player.Character.HumanoidRootPart.Position)
                        ReplicatedStorage.muscleEvent:FireServer("punch", "rightHand")
                        ReplicatedStorage.muscleEvent:FireServer("punch", "leftHand")
                    end
                    task.wait(0.1)
                end
            end)
        end
    end
    Players.PlayerAdded:Connect(onPlayerAdded)
    Players.PlayerRemoving:Connect(function(player)
        if getgenv().autoKillActive then
            onPlayerAdded(player)
        end
    end)
end)
KillingTab:AddDropdown("Players", function()
    local playerNames = {LocalPlayer.Name}
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            table.insert(playerNames, player.Name)
        end
    end
    return playerNames
end)
KillingTab:AddTextBox("Kill Player", function(name)
    local target = Players:FindFirstChild(name)
    if target and target.Character and LocalPlayer.Character then
        task.spawn(function()
            while target.Character and LocalPlayer.Character do
                LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(target.Character.HumanoidRootPart.Position)
                ReplicatedStorage.muscleEvent:FireServer("punch", "rightHand")
                ReplicatedStorage.muscleEvent:FireServer("punch", "leftHand")
                task.wait(0.1)
            end
        end)
    end
end)
KillingTab:AddLabel("---------------")
KillingTab:AddTextBox("View Player", function(name)
    local target = Players:FindFirstChild(name)
    if target and target.Character then
        Workspace.CurrentCamera.CameraSubject = target.Character.Humanoid
    end
end)
KillingTab:AddButton("Unview Player", function()
    if LocalPlayer.Character then
        Workspace.CurrentCamera.CameraSubject = LocalPlayer.Character.Humanoid
    end
end)

local StatsTab = Window:AddTab("Stats")
local StatsFolder = StatsTab:AddFolder("Stats")
StatsFolder:AddButton("Show Kills Gui", function()
    local leaderstats = LocalPlayer:FindFirstChild("leaderstats")
    if leaderstats then
        local killsLabel = StatsFolder:AddLabel("Kills: " .. (leaderstats.Kills and leaderstats.Kills.Value or 0))
        local strengthLabel = StatsFolder:AddLabel("Strength: " .. (leaderstats.Strength and math.ceil(leaderstats.Strength.Value) or 0))
        local durabilityLabel = StatsFolder:AddLabel("Durability: " .. (leaderstats.Durability and leaderstats.Durability.Value or 0))
        if leaderstats.Kills then
            leaderstats.Kills.Changed:Connect(function(value)
                killsLabel.Text = "Kills: " .. value
            end)
        end
        if leaderstats.Strength then
            leaderstats.Strength.Changed:Connect(function(value)
                strengthLabel.Text = "Strength: " .. math.ceil(value)
            end)
        end
        if leaderstats.Durability then
            leaderstats.Durability.Changed:Connect(function(value)
                durabilityLabel.Text = "Durability: " .. value
            end)
        end
        LocalPlayer.CharacterAdded:Connect(function()
            killsLabel:Destroy()
            strengthLabel:Destroy()
            durabilityLabel:Destroy()
        end)
        LocalPlayer.CharacterRemoving:Connect(function()
            killsLabel:Destroy()
            strengthLabel:Destroy()
            durabilityLabel:Destroy()
        end)
    end
end)
StatsTab:AddFolder("Stats Gained")
local RebirthFolder = StatsTab:AddFolder("Rebirth Calculation")
local rebirthLabels = {
    RebirthsGainedLabel = RebirthFolder:AddLabel("Rebirths Gained In 1 Minute: ..."),
    RebirthsPerMinuteLabel = RebirthFolder:AddLabel("Rebirths Per Minute: ..."),
    RebirthsPerHourLabel = RebirthFolder:AddLabel("Rebirths Per Hour: ..."),
    RebirthsPerDayLabel = RebirthFolder:AddLabel("Rebirths Per Day: ..."),
    RebirthsPerWeekLabel = RebirthFolder:AddLabel("Rebirths Per Week: ...")
}
task.spawn(function()
    local rebirthsStart = 0
    local startTime = os.time()
    while true do
        local leaderstats = LocalPlayer:FindFirstChild("leaderstats")
        if leaderstats and leaderstats.Rebirths then
            local rebirths = leaderstats.Rebirths.Value
            local elapsed = os.time() - startTime
            if elapsed > 0 then
                local perMinute = (rebirths - rebirthsStart) / (elapsed / 60)
                rebirthLabels.RebirthsGainedLabel.Text = "Rebirths Gained In 1 Minute: " .. math.ceil(perMinute)
                rebirthLabels.RebirthsPerMinuteLabel.Text = "Rebirths Per Minute: " .. string.format("%.2f", perMinute)
                rebirthLabels.RebirthsPerHourLabel.Text = "Rebirths Per Hour: " .. string.format("%.2f", perMinute * 60)
                rebirthLabels.RebirthsPerDayLabel.Text = "Rebirths Per Day: " .. string.format("%.2f", perMinute * 60 * 24)
                rebirthLabels.RebirthsPerWeekLabel.Text = "Rebirths Per Week: " .. string.format("%.2f", perMinute * 60 * 24 * 7)
            end
        end
        task.wait(10)
    end
end)
local SpyStatsFolder = StatsTab:AddFolder("Spy stats")
local targetPlayerName
SpyStatsFolder:AddTextBox("Target Name", function(name)
    targetPlayerName = name
end)
local spyLabels = {
    ViewStats = SpyStatsFolder:AddLabel("View Stats:"),
    StrengthLabel = SpyStatsFolder:AddLabel("Strength: 0"),
    DurabilityLabel = SpyStatsFolder:AddLabel("Durability: 0"),
    AgilityLabel = SpyStatsFolder:AddLabel("Agility: 0"),
    RebirthsLabel = SpyStatsFolder:AddLabel("Rebirths: 0"),
    KillsLabel = SpyStatsFolder:AddLabel("Kills: 0"),
    EvilKarmaLabel = SpyStatsFolder:AddLabel("Evil Karma: 0"),
    GoodKarmaLabel = SpyStatsFolder:AddLabel("Good Karma: 0"),
    TargetPetsLabel = SpyStatsFolder:AddLabel("Target Equipped Pets: N/A")
}
task.spawn(function()
    while true do
        if targetPlayerName then
            local target = Players:FindFirstChild(targetPlayerName)
            if target then
                local leaderstats = target:FindFirstChild("leaderstats")
                if leaderstats then
                    spyLabels.StrengthLabel.Text = "Strength: " .. (leaderstats.Strength and string.format("%.2f", math.ceil(leaderstats.Strength.Value)) or 0)
                    spyLabels.DurabilityLabel.Text = "Durability: " .. (leaderstats.Durability and leaderstats.Durability.Value or 0)
                    spyLabels.AgilityLabel.Text = "Agility: " .. (leaderstats.Agility and leaderstats.Agility.Value or 0)
                    spyLabels.RebirthsLabel.Text = "Rebirths: " .. (leaderstats.Rebirths and leaderstats.Rebirths.Value or 0)
                    spyLabels.KillsLabel.Text = "Kills: " .. (leaderstats.Kills and leaderstats.Kills.Value or 0)
                    spyLabels.EvilKarmaLabel.Text = "Evil Karma: " .. (leaderstats.EvilKarma and leaderstats.EvilKarma.Value or 0)
                    spyLabels.GoodKarmaLabel.Text = "Good Karma: " .. (leaderstats.GoodKarma and leaderstats.GoodKarma.Value or 0)
                end
                local pets = ""
                local petsFolder = target:FindFirstChild("petsFolder")
                if petsFolder then
                    for _, folder in pairs(petsFolder:GetChildren()) do
                        if folder:IsA("Folder") then
                            for _, pet in pairs(folder:GetChildren()) do
                                pets = pets .. pet.Name .. ", "
                            end
                        end
                    end
                end
                spyLabels.TargetPetsLabel.Text = "Target Equipped Pets: " .. (pets ~= "" and pets:sub(1, -3) or "N/A")
            end
        end
        task.wait(1)
    end
end)

local FarmPlusTab = Window:AddTab("Farm++")
local AutoGymFolder = FarmPlusTab:AddFolder("Auto Gym")
AutoGymFolder:AddLabel("Jungle Gym")
local jungleGymMachines = {
    ["Jungle Bench"] = "autoJungleBench",
    ["Jungle Bar Lift"] = "autoJungleBarLift",
    ["Jungle Boulder"] = "autoJungleBoulder",
    ["Jungle Squat"] = "autoJungleSquat"
}
for machineName, varName in pairs(jungleGymMachines) do
    AutoGymFolder:AddSwitch("Auto " .. machineName, function(state)
        getgenv()[varName] = state
        task.spawn(function()
            while getgenv()[varName] and LocalPlayer.Character do
                local machine = Workspace.machinesFolder:FindFirstChild(machineName)
                if machine then
                    LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(machine.interactSeat.Position)
                    ReplicatedStorage.rEvents.machineInteractRemote:InvokeServer("useMachine", machine)
                    ReplicatedStorage.muscleEvent:FireServer("rep")
                end
                task.wait(0.1)
            end
        end)
    end)
end)
local AutoEquipFolder = FarmPlusTab:AddFolder("Auto Equip Weight Tools")
local toolSwitches = {
    ["Auto Handstands"] = "Handstands",
    ["Auto Weight"] = "Weight",
    ["Auto Pushups"] = "Pushups",
    ["Auto Situps"] = "Situps"
}
for label, toolName in pairs(toolSwitches) do
    AutoEquipFolder:AddSwitch(label, function(state)
        getgenv()[label] = state
        task.spawn(function()
            while getgenv()[label] and LocalPlayer.Character do
                local tool = LocalPlayer.Backpack:FindFirstChild(toolName) or LocalPlayer.Character:FindFirstChild(toolName)
                if tool then
                    tool.Parent = LocalPlayer.Character
                    ReplicatedStorage.muscleEvent:FireServer("rep")
                end
                task.wait(0.5)
            end
        end)
    end)
end)

local ServerTab = Window:AddTab("Server")
ServerTab:AddSwitch("Auto Kill Good Karma", function(state)
    getgenv().autoKillGoodKarma = state
    task.spawn(function()
        while getgenv().autoKillGoodKarma and LocalPlayer.Character do
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("GoodKarma") and player.Character.GoodKarma.Value > 0 then
                    LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(player.Character.HumanoidRootPart.Position)
                    ReplicatedStorage.muscleEvent:FireServer("punch", "rightHand")
                    ReplicatedStorage.muscleEvent:FireServer("punch", "leftHand")
                end
            end
            task.wait(0.1)
        end
    end)
end)
ServerTab:AddSwitch("Auto Kill Evil Karma", function(state)
    getgenv().autoKillEvilKarma = state
    task.spawn(function()
        while getgenv().autoKillEvilKarma and LocalPlayer.Character do
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("EvilKarma") and player.Character.EvilKarma.Value > 0 then
                    LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(player.Character.HumanoidRootPart.Position)
                    ReplicatedStorage.muscleEvent:FireServer("punch", "rightHand")
                    ReplicatedStorage.muscleEvent:FireServer("punch", "leftHand")
                end
            end
            task.wait(0.1)
        end
    end)
end)
ServerTab:AddLabel("Ring Aura")
ServerTab:AddTextBox("Whitelist Player", function(name)
    getgenv().whitelist = getgenv().whitelist or {}
    table.insert(getgenv().whitelist, name)
end)
ServerTab:AddButton("Clear Whitelist", function()
    getgenv().whitelist = {}
end)
ServerTab:AddTextBox("Ring Aura Color (RGB)", function(value)
    local r, g, b = value:match("(%d+),(%d+),(%d+)")
    getgenv().ringAuraColor = Color3.fromRGB(tonumber(r) or 255, tonumber(g) or 0, tonumber(b) or 0)
end)
ServerTab:AddTextBox("Ring Aura Radius", function(value)
    getgenv().ringAuraRadius = math.clamp(tonumber(value) or 10, 1, 100)
end)
ServerTab:AddSwitch("Ring Aura", function(state)
    getgenv().ringAura = state
    task.spawn(function()
        while getgenv().ringAura and LocalPlayer.Character do
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and not table.find(getgenv().whitelist or {}, player.Name) and player.Character and player.Character.HumanoidRootPart then
                    local distance = (LocalPlayer.Character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
                    if distance <= (getgenv().ringAuraRadius or 10) then
                        ReplicatedStorage.muscleEvent:FireServer("punch", "rightHand")
                        ReplicatedStorage.muscleEvent:FireServer("punch", "leftHand")
                    end
                end
            end
            task.wait(0.1)
        end
    end)
end)
ServerTab:AddLabel("Fast Rebirths")
ServerTab:AddSwitch("Fast Rebirths | Required New Packs |", function(state)
    getgenv().fastRebirths = state
    task.spawn(function()
        while getgenv().fastRebirths and LocalPlayer.Character do
            ReplicatedStorage.rEvents.rebirthRemote:InvokeServer("rebirthRequest")
            task.wait(0.1)
        end
    end)
end)
ServerTab:AddSwitch("Fast Gain", function(state)
    getgenv().fastGain = state
    task.spawn(function()
        while getgenv().fastGain and LocalPlayer.Character do
            ReplicatedStorage.muscleEvent:FireServer("rep")
            task.wait(0.05)
        end
    end)
end)
ServerTab:AddSwitch("Hide Frames", function(state)
    getgenv().hideFrames = state
    task.spawn(function()
        while getgenv().hideFrames do
            for _, frame in pairs(game:GetService("CoreGui"):GetDescendants()) do
                if frame:IsA("Frame") then
                    frame.Visible = false
                end
            end
            task.wait(0.1)
        end
    end)
end)

local EggsTab = Window:AddTab("Eggs")
EggsTab:AddTextBox("Select Pet", function(petName)
    getgenv().selectedPet = petName
end)
EggsTab:AddSwitch("Auto Buy Pet", function(state)
    getgenv().autoBuyPet = state
    task.spawn(function()
        while getgenv().autoBuyPet and LocalPlayer.Character do
            if getgenv().selectedPet then
                ReplicatedStorage.rEvents.equipPetEvent:FireServer("equipPet", getgenv().selectedPet)
                task.wait(0.1)
                ReplicatedStorage.rEvents.buyPetEvent:FireServer(getgenv().selectedPet)
            end
            task.wait(1)
        end
    end)
end)
local crystals = {
    "Blue Crystal", "Green Crystal", "Frozen Crystal", "Mythical Crystal", "Inferno Crystal",
    "Legends Crystal", "Dark Nebula Crystal", "Muscle Elite Crystal", "Galaxy Oracle Crystal",
    "Battle Legends Crystal", "Sky Eclipse Crystal", "Jungle Crystal"
}
EggsTab:AddDropdown("Select Crystal", crystals, function(crystal)
    getgenv().crystal = crystal
end)
EggsTab:AddSwitch("Auto Hatch Crystal", function(state)
    getgenv().autoHatchCrystal = state
    task.spawn(function()
        while getgenv().autoHatchCrystal and LocalPlayer.Character do
            if getgenv().crystal then
                ReplicatedStorage.rEvents.openCrystalRemote:InvokeServer("openCrystal", getgenv().crystal)
            end
            task.wait(1)
        end
    end)
end)

local PlayersTab = Window:AddTab("Players")
PlayersTab:AddTextBox("Walkspeed", function(value)
    getgenv().walkspeed = math.clamp(tonumber(value) or 16, 0, 1000)
end)
PlayersTab:AddSwitch("Set Walkspeed", function(state)
    getgenv().setWalkspeed = state
    task.spawn(function()
        while getgenv().setWalkspeed and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") do
            LocalPlayer.Character.Humanoid.WalkSpeed = getgenv().walkspeed or 16
            task.wait()
        end
    end)
end)
PlayersTab:AddTextBox("JumpPower", function(value)
    getgenv().jumpPower = math.clamp(tonumber(value) or 50, 0, 500)
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.JumpPower = getgenv().jumpPower
    end
end)
PlayersTab:AddTextBox("HipHeight", function(value)
    getgenv().hipHeight = math.clamp(tonumber(value) or 0, -10, 100)
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.HipHeight = getgenv().hipHeight
    end
end)
PlayersTab:AddTextBox("Max Zoom Distance", function(value)
    LocalPlayer.CameraMaxZoomDistance = math.clamp(tonumber(value) or 128, 0, 1000)
end)
PlayersTab:AddLabel("--------")
PlayersTab:AddSwitch("Lock Client Position", function(state)
    getgenv().lockPosition = state
    if state then
        getgenv().lockedPos = LocalPlayer.Character.HumanoidRootPart.CFrame
        getgenv().lockConnection = RunService.Heartbeat:Connect(function()
            if LocalPlayer.Character and LocalPlayer.Character.HumanoidRootPart then
                LocalPlayer.Character.HumanoidRootPart.CFrame = getgenv().lockedPos
            end
        end)
    else
        if getgenv().lockConnection then
            getgenv().lockConnection:Disconnect()
        end
    end
end)
PlayersTab:AddButton("Remove Punch", function()
    local punch = LocalPlayer.Backpack:FindFirstChild("Punch") or LocalPlayer.Character:FindFirstChild("Punch")
    if punch then
        punch:Destroy()
    end
end)
PlayersTab:AddButton("Recover Punch", function()
    ReplicatedStorage.rEvents.giveTool:FireServer("Punch")
end)
PlayersTab:AddSwitch("Infinite Jump", function(state)
    getgenv().infiniteJump = state
    game:GetService("UserInputService").JumpRequest:Connect(function()
        if getgenv().infiniteJump and LocalPlayer.Character then
            LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end)
end)
PlayersTab:AddSwitch("Noclip", function(state)
    getgenv().noclip = state
    if state then
        getgenv().noclipConnection = RunService.Stepped:Connect(function()
            if LocalPlayer.Character then
                for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end
        end)
    else
        if getgenv().noclipConnection then
            getgenv().noclipConnection:Disconnect()
        end
    end
end)
PlayersTab:AddButton("Anti AFK", function()
    game:GetService("VirtualUser").CaptureController:ClickButton2(Vector2.new())
    game:GetService("VirtualUser").Idled:Connect(function()
        game:GetService("VirtualUser").CaptureController:ClickButton2(Vector2.new())
    end)
end)
PlayersTab:AddButton("Anti Lag", function()
    for _, v in pairs(Workspace:GetDescendants()) do
        if v:IsA("BasePart") and not v.Parent:IsA("Model") then
            v.Material = Enum.Material.SmoothPlastic
            v.Reflectance = 0
        end
    end
end)
PlayersTab:AddButton("ChatSpy", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/CAXAP26BKyCH/ChatSpy/main/ChatSpy"))()
end)

local CreditsTab = Window:AddTab("Credits")
CreditsTab:AddLabel("This Script made by Doca")
CreditsTab:AddLabel("Roblox: Xx_GPWArka")
CreditsTab:AddLabel("Discord: itsdocas_60003")
CreditsTab:AddButton("Copy Discord Invite link", function()
    setclipboard("https://discord.gg/itsdocas_60003")
end)

local PaidTab = Window:AddTab("Paid Tab")
local FastGlitchFolder = PaidTab:AddFolder("Fast Glitch")
local rockData = {
    {Name = "TinyIslandRock", Title = "Tiny Rock", Description = "Fast Glitch Tiny Rock (0)", Durability = 0},
    {Name = "PunchingIslandRock", Title = "Punching Rock", Description = "Fast Glitch Punching Rock (10)", Durability = 10},
    {Name = "LargeIslandRock", Title = "Large Rock", Description = "Fast Glitch Large Rock (100)", Durability = 100},
    {Name = "GoldenBeachRock", Title = "Golden Rock", Description = "Fast Glitch Rock (5K)", Durability = 5000},
    {Name = "FrostGymRock", Title = "Frost Rock", Description = "Fast Glitch Frost Rock (150K)", Durability = 150000},
    {Name = "MythicalGymRock", Title = "Mythical Rock", Description = "Fast Glitch Mythical Rock (400K)", Durability = 400000},
    {Name = "InfernoGymRock", Title = "Inferno Rock", Description = "Fast Glitch Inferno Rock (750K)", Durability = 750000},
    {Name = "LegendsGymRock", Title = "Legends Rock", Description = "Fast Glitch Legends Rock (1M)", Durability = 1000000},
    {Name = "MuscleKingGymRock", Title = "Muscle King Gym Rock", Description = "Fast Glitch Muscle King Rock (5M)", Durability = 5000000},
    {Name = "AncientJungleRock", Title = "Ancient Jungle Rock", Description = "Fast Glitch Ancient Jungle Rock (10M)", Durability = 10000000}
}
for _, rock in ipairs(rockData) do
    FastGlitchFolder:AddSwitch(rock.Title, function(state)
        getgenv().fastGlitch = getgenv().fastGlitch or {}
        getgenv().fastGlitch[rock.Name] = state
        task.spawn(function()
            while getgenv().fastGlitch[rock.Name] and LocalPlayer.Character do
                if LocalPlayer:FindFirstChild("Durability") and LocalPlayer.Durability.Value >= rock.Durability then
                    local rockObj = Workspace:FindFirstChild(rock.Name)
                    if rockObj then
                        firetouchinterest(rockObj.Rock, LocalPlayer.Character.RightHand, 0)
                        firetouchinterest(rockObj.Rock, LocalPlayer.Character.LeftHand, 0)
                        task.wait()
                        firetouchinterest(rockObj.Rock, LocalPlayer.Character.RightHand, 1)
                        firetouchinterest(rockObj.Rock, LocalPlayer.Character.LeftHand, 1)
                        ReplicatedStorage.muscleEvent:FireServer("punch", "rightHand")
                        ReplicatedStorage.muscleEvent:FireServer("punch", "leftHand")
                    end
                end
                task.wait(0.05)
            end
        end)
    end)
end)
local FastGlitchV2Folder = PaidTab:AddFolder("Fast Glitch V2")
local glitchV2Data = {
    ["Tiny Rock Fast Glitch"] = "Tiny Island Rock",
    ["Punching Rock Fast Glitch"] = "Punching Rock",
    ["Large Rock Fast Glitch"] = "Large Island Rock",
    ["Golden Fast Glitch"] = "Golden Rock",
    ["Frost Rock Fast Glitch"] = "Frost Gym Rock",
    ["Mythical Rock Fast Glitch"] = "Mythical Gym Rock",
    ["Eternal Rock Fast Glitch"] = "Eternal Gym Rock",
    ["Legends Rock Fast Glitch"] = "Legend Gym Rock",
    ["Muscle King Fast Glitch"] = "Muscle King Gym Rock",
    ["Ancient Jungle Fast Glitch"] = "Ancient Jungle Rock"
}
for title, rockName in pairs(glitchV2Data) do
    FastGlitchV2Folder:AddSwitch(title, function(state)
        getgenv().fastGlitchV2 = getgenv().fastGlitchV2 or {}
        getgenv().fastGlitchV2[rockName] = state
        task.spawn(function()
            while getgenv().fastGlitchV2[rockName] and LocalPlayer.Character do
                local rockObj = Workspace.machinesFolder:FindFirstChild(rockName)
                if rockObj then
                    LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(rockObj.Rock.Position + Vector3.new(0, 5, 0))
                    ReplicatedStorage.muscleEvent:FireServer("punch", "rightHand")
                    ReplicatedStorage.muscleEvent:FireServer("punch", "leftHand")
                end
                task.wait(0.05)
            end
        end)
    end)
end)

local KillingV2Tab = Window:AddTab("Killing V2")
KillingV2Tab:AddSwitch("Auto Punch", function(state)
    getgenv().autopunch = state
    task.spawn(function()
        while getgenv().autopunch and LocalPlayer.Character do
            local punch = LocalPlayer.Character:FindFirstChild("Punch")
            if not punch then
                punch = LocalPlayer.Backpack:FindFirstChild("Punch")
                if punch then
                    LocalPlayer.Character.Humanoid:EquipTool(punch)
                end
            end
            if punch then
                ReplicatedStorage.muscleEvent:FireServer("punch", "rightHand")
                ReplicatedStorage.muscleEvent:FireServer("punch", "leftHand")
            end
            task.wait(0.1)
        end
    end)
end)
KillingV2Tab:AddSwitch("Fast Punch", function(state)
    getgenv().fastPunch = state
    task.spawn(function()
        while getgenv().fastPunch and LocalPlayer.Character do
            local punch = LocalPlayer.Character:FindFirstChild("Punch")
            if not punch then
                punch = LocalPlayer.Backpack:FindFirstChild("Punch")
                if punch then
                    LocalPlayer.Character.Humanoid:EquipTool(punch)
                end
            end
            if punch then
                ReplicatedStorage.muscleEvent:FireServer("punch", "rightHand")
                ReplicatedStorage.muscleEvent:FireServer("punch", "leftHand")
            end
            task.wait(0.05)
        end
    end)
end)
KillingV2Tab:AddSwitch("Auto Kill Everyone", function(state)
    getgenv().autoKillActive = state
    task.spawn(function()
        while getgenv().autoKillActive and LocalPlayer.Character do
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and not table.find(getgenv().whitelist or {}, player.Name) then
                    if player.Character and player.Character.HumanoidRootPart then
                        if getgenv().killMethod == "Teleport" then
                            LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(player.Character.HumanoidRootPart.Position)
                        end
                        ReplicatedStorage.muscleEvent:FireServer("punch", "rightHand")
                        ReplicatedStorage.muscleEvent:FireServer("punch", "leftHand")
                    end
                end
            end
            task.wait(0.1)
        end
    end)
end)
KillingV2Tab:AddDropdown("Select Kill Method", {"Teleport", "Non-Teleport"}, function(method)
    getgenv().killMethod = method
    print("Kill Method set to: " .. method)
end)
KillingV2Tab:AddDropdown("Whitelist Players", function()
    local playerNames = {LocalPlayer.Name}
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            table.insert(playerNames, player.Name)
        end
    end
    return playerNames
end, function(name)
    getgenv().whitelist = getgenv().whitelist or {}
    if name ~= LocalPlayer.Name and not table.find(getgenv().whitelist, name) then
        table.insert(getgenv().whitelist, name)
    end
end)
Players.PlayerAdded:Connect(function(player)
    if getgenv().autoKillActive and player ~= LocalPlayer and not table.find(getgenv().whitelist or {}, player.Name) then
        task.spawn(function()
            while getgenv().autoKillActive and player.Character and LocalPlayer.Character do
                if player.Character.HumanoidRootPart then
                    if getgenv().killMethod == "Teleport" then
                        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(player.Character.HumanoidRootPart.Position)
                    end
                    ReplicatedStorage.muscleEvent:FireServer("punch", "rightHand")
                    ReplicatedStorage.muscleEvent:FireServer("punch", "leftHand")
                end
                task.wait(0.1)
            end
        end)
    end
end)
Players.PlayerRemoving:Connect(function() end)
KillingV2Tab:AddSwitch("Fast Kill Aura", function(state)
    getgenv().fastKillAura = state
    task.spawn(function()
        while getgenv().fastKillAura and LocalPlayer.Character do
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and not table.find(getgenv().whitelist or {}, player.Name) and player.Character and player.Character.HumanoidRootPart then
                    local distance = (LocalPlayer.Character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
                    if distance <= (getgenv().ringAuraRadius or 10) then
                        ReplicatedStorage.muscleEvent:FireServer("punch", "rightHand")
                        ReplicatedStorage.muscleEvent:FireServer("punch", "leftHand")
                    end
                end
            end
            task.wait(0.05)
        end
    end)
end)
KillingV2Tab:AddLabel("---Single Kill---")
KillingV2Tab:AddTextBox("Player Username", function(name)
    getgenv().targetPlayerName = name
end)
KillingV2Tab:AddSwitch("Auto Fast Kill Player", function(state)
    getgenv().autoFastKillPlayer = state
    task.spawn(function()
        while getgenv().autoFastKillPlayer and LocalPlayer.Character and getgenv().targetPlayerName do
            local target = Players:FindFirstChild(getgenv().targetPlayerName)
            if target and target.Character and target.Character.HumanoidRootPart then
                if getgenv().killMethod == "Teleport" then
                    LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(target.Character.HumanoidRootPart.Position)
                end
                ReplicatedStorage.muscleEvent:FireServer("punch", "rightHand")
                ReplicatedStorage.muscleEvent:FireServer("punch", "leftHand")
            end
            task.wait(0.05)
        end
    end)
end)
KillingV2Tab:AddSwitch("Spy Player", function(state)
    getgenv().spyPlayer = state
    task.spawn(function()
        while getgenv().spyPlayer and getgenv().targetPlayerName do
            local target = Players:FindFirstChild(getgenv().targetPlayerName)
            if target and target.Character then
                Workspace.CurrentCamera.CameraSubject = target.Character.Humanoid
            end
            task.wait(1)
        end
        if LocalPlayer.Character then
            Workspace.CurrentCamera.CameraSubject = LocalPlayer.Character.Humanoid
        end
    end)
end)

LocalPlayer.CharacterAdded:Connect(function(char)
    if getgenv().setWalkspeed then
        char.Humanoid.WalkSpeed = getgenv().walkspeed or 16
    end
    if getgenv().jumpPower then
        char.Humanoid.JumpPower = getgenv().jumpPower or 50
    end
    if getgenv().hipHeight then
        char.Humanoid.HipHeight = getgenv().hipHeight or 0
    end
end)
