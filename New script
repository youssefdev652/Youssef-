--[[
DEVIL_YOUSSEF | Paid Version
واجهة مستخدم Rayfield مع كل الوظائف الأساسية
]]

local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")

local Window = Rayfield:CreateWindow({
    Name = "DEVIL_YOUSSEF | Paid Version",
    LoadingTitle = "Loading DEVIL_YOUSSEF Script...",
    LoadingSubtitle = "by YOUSEF",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = nil,
        FileName = "DEVIL_YOUSSEFConfig"
    },
    Discord = {
        Enabled = false,
        Invite = "", 
        RememberJoins = true
    },
    KeySystem = false
})

-- === Main Tab ===
local MainTab = Window:CreateTab("Main")

local LocalPlayersSection = MainTab:CreateSection("Local Players")

LocalPlayersSection:CreateToggle({
    Name = "Auto Eat Protein Egg Every 30 Minutes",
    CurrentValue = false,
    Flag = "autoEatProteinEgg30",
    Callback = function(state)
        getgenv().autoEatProteinEgg30 = state
        task.spawn(function()
            while getgenv().autoEatProteinEgg30 and LocalPlayer.Character do
                local egg = LocalPlayer.Backpack:FindFirstChild("Protein Egg") or LocalPlayer.Character:FindFirstChild("Protein Egg")
                if egg then
                    egg.Parent = LocalPlayer.Character
                    ReplicatedStorage.muscleEvent:FireServer("rep")
                end
                task.wait(1800)
            end
        end)
    end
})

LocalPlayersSection:CreateToggle({
    Name = "Auto Eat Protein Egg Every 1 Hour",
    CurrentValue = false,
    Flag = "autoEatProteinEgg60",
    Callback = function(state)
        getgenv().autoEatProteinEgg60 = state
        task.spawn(function()
            while getgenv().autoEatProteinEgg60 and LocalPlayer.Character do
                local egg = LocalPlayer.Backpack:FindFirstChild("Protein Egg") or LocalPlayer.Character:FindFirstChild("Protein Egg")
                if egg then
                    egg.Parent = LocalPlayer.Character
                    ReplicatedStorage.muscleEvent:FireServer("rep")
                end
                task.wait(3600)
            end
        end)
    end
})

local MiscSection = MainTab:CreateSection("Misc")

MiscSection:CreateToggle({
    Name = "Auto Farm (Equip Any tool)",
    CurrentValue = false,
    Flag = "autoFarm",
    Callback = function(state)
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
    end
})

MiscSection:CreateButton({
    Name = "Permanent ShiftLock",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/MiniNoobie/ShiftLockx/main/Shiftlock-MiniNoobie"))()
    end
})

MiscSection:CreateButton({
    Name = "Set Time: Night",
    Callback = function()
        Lighting.ClockTime = 0
    end
})

MiscSection:CreateButton({
    Name = "Set Time: Morning",
    Callback = function()
        Lighting.ClockTime = 6
    end
})

MiscSection:CreateButton({
    Name = "Set Time: Day",
    Callback = function()
        Lighting.ClockTime = 12
    end
})

MiscSection:CreateButton({
    Name = "Remove Ad Portal",
    Callback = function()
        for _, portal in pairs(Workspace:GetDescendants()) do
            if portal.Name:match("AdPortal") then
                portal:Destroy()
            end
        end
    end
})

-- === Auto Brawl Tab ===
local BrawlTab = Window:CreateTab("Auto Brawl")
local BrawlSection = BrawlTab:CreateSection("Auto Brawl Options")

BrawlSection:CreateToggle({
    Name = "Auto Win Brawl",
    CurrentValue = false,
    Flag = "autoWinBrawl",
    Callback = function(state)
        getgenv().autoWinBrawl = state
        task.spawn(function()
            while getgenv().autoWinBrawl and LocalPlayer.Character do
                ReplicatedStorage.rEvents.joinBrawl:FireServer("Win")
                task.wait(1)
            end
        end)
    end
})

BrawlSection:CreateToggle({
    Name = "Auto Join Brawl (For Farming)",
    CurrentValue = false,
    Flag = "autoBrawlFarm",
    Callback = function(state)
        getgenv().autoBrawlFarm = state
        task.spawn(function()
            while getgenv().autoBrawlFarm and LocalPlayer.Character do
                ReplicatedStorage.rEvents.joinBrawl:FireServer("Farm")
                task.wait(1)
            end
        end)
    end
})

-- === OP Stuff Tab ===
local OpTab = Window:CreateTab("Op Stuff")

local OpSection = OpTab:CreateSection("Op Stuff Options")

OpSection:CreateToggle({
    Name = "Anti Knockback",
    CurrentValue = false,
    Flag = "antiKnockback",
    Callback = function(state)
        getgenv().antiKnockback = state
        LocalPlayer.CharacterAdded:Connect(function(char)
            if getgenv().antiKnockback then
                char.HumanoidRootPart.Anchored = true
                task.wait(0.1)
                char.HumanoidRootPart.Anchored = false
            end
        end)
    end
})

OpSection:CreateToggle({
    Name = "Auto Pushups with Rock (10M) and Auto Punch",
    CurrentValue = false,
    Flag = "autoPushups10M",
    Callback = function(state)
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
    end
})

OpSection:CreateToggle({
    Name = "Free AutoLift Gamepass",
    CurrentValue = false,
    Flag = "autoLiftGamepass",
    Callback = function(state)
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
    end
})

OpSection:CreateToggle({
    Name = "Walk on Water",
    CurrentValue = false,
    Flag = "walkOnWater",
    Callback = function(state)
        getgenv().walkOnWater = state
        if state then
            local part = Instance.new("Part")
            part.Size = Vector3.new(1000, 1, 1000)
            part.Position = Vector3.new(0, 0, 0)
            part.Anchored = true
            part.Transparency = 0.5
            part.CanCollide = true
            part.Name = "WalkOnWaterPart"
            part.Parent = Workspace
            getgenv().waterPart = part
        else
            if getgenv().waterPart then
                getgenv().waterPart:Destroy()
                getgenv().waterPart = nil
            end
        end
    end
})

-- === Killing Tab ===
local KillingTab = Window:CreateTab("Killing")
local KillingSection = KillingTab:CreateSection("Killing")

KillingSection:CreateToggle({
    Name = "Auto Equip Punch",
    CurrentValue = false,
    Flag = "autoEquipPunch",
    Callback = function(state)
        getgenv().autoEquipPunch = state
        task.spawn(function()
            while getgenv().autoEquipPunch and LocalPlayer.Character do
                local punch = LocalPlayer.Backpack:FindFirstChild("Punch") or LocalPlayer.Character:FindFirstChild("Punch")
                if punch then
                    punch.Parent = LocalPlayer.Character
                else
                    LocalPlayer.Character.Humanoid:UnequipTools()
                end
                task.wait(0.5)
            end
        end)
    end
})

KillingSection:CreateToggle({
    Name = "Auto Punch {With Movement}",
    CurrentValue = false,
    Flag = "autoPunchMove",
    Callback = function(state)
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
    end
})

KillingSection:CreateToggle({
    Name = "Auto Punch",
    CurrentValue = false,
    Flag = "autoPunch",
    Callback = function(state)
        getgenv().autoPunch = state
        task.spawn(function()
            while getgenv().autoPunch and LocalPlayer.Character do
                local punch = LocalPlayer.Character:FindFirstChild("Punch")
                if punch then
                    ReplicatedStorage.muscleEvent:FireServer("punch", "rightHand")
                    ReplicatedStorage.muscleEvent:FireServer("punch", "leftHand")
                end
                task.wait(0.1)
            end
        end)
    end
})

KillingSection:CreateToggle({
    Name = "Unlock Fast Punch",
    CurrentValue = false,
    Flag = "fastPunch",
    Callback = function(state)
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
    end
})

KillingSection:CreateTextbox({
    Name = "Whitelist Player",
    PlaceholderText = "Player Name",
    RemoveTextAfterFocusLost = true,
    Callback = function(name)
        getgenv().whitelist = getgenv().whitelist or {}
        table.insert(getgenv().whitelist, name)
    end
})

KillingSection:CreateButton({
    Name = "Clear Whitelist",
    Callback = function()
        getgenv().whitelist = {}
    end
})

KillingSection:CreateToggle({
    Name = "Auto Kill",
    CurrentValue = false,
    Flag = "autoKill",
    Callback = function(state)
        getgenv().autoKill = state
        task.spawn(function()
            while getgenv().autoKill and LocalPlayer.Character do
                for _, player in ipairs(Players:GetPlayers()) do
                    if player ~= LocalPlayer and not table.find(getgenv().whitelist or {}, player.Name) then
                        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                            LocalPlayer.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame
                            ReplicatedStorage.muscleEvent:FireServer("punch", "rightHand")
                            ReplicatedStorage.muscleEvent:FireServer("punch", "leftHand")
                        end
                    end
                end
                task.wait(0.1)
            end
        end)
    end
})

KillingSection:CreateToggle({
    Name = "Auto Kill Players (On Join)",
    CurrentValue = false,
    Flag = "autoKillActive",
    Callback = function(state)
        getgenv().autoKillActive = state
        if state then
            Players.PlayerAdded:Connect(function(player)
                if player ~= LocalPlayer and not table.find(getgenv().whitelist or {}, player.Name) then
                    task.spawn(function()
                        while getgenv().autoKillActive and player.Character and LocalPlayer.Character do
                            if player.Character:FindFirstChild("HumanoidRootPart") then
                                LocalPlayer.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame
                                ReplicatedStorage.muscleEvent:FireServer("punch", "rightHand")
                                ReplicatedStorage.muscleEvent:FireServer("punch", "leftHand")
                            end
                            task.wait(0.1)
                        end
                    end)
                end
            end)
        end
    end
})

KillingSection:CreateTextbox({
    Name = "Kill Player",
    PlaceholderText = "Player Name",
    RemoveTextAfterFocusLost = true,
    Callback = function(name)
        local target = Players:FindFirstChild(name)
        if target and target.Character and LocalPlayer.Character then
            task.spawn(function()
                while target.Character and LocalPlayer.Character do
                    LocalPlayer.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame
                    ReplicatedStorage.muscleEvent:FireServer("punch", "rightHand")
                    ReplicatedStorage.muscleEvent:FireServer("punch", "leftHand")
                    task.wait(0.1)
                end
            end)
        end
    end
})

KillingSection:CreateTextbox({
    Name = "View Player",
    PlaceholderText = "Player Name",
    RemoveTextAfterFocusLost = true,
    Callback = function(name)
        local target = Players:FindFirstChild(name)
        if target and target.Character then
            Workspace.CurrentCamera.CameraSubject = target.Character.Humanoid
        end
    end
})

KillingSection:CreateButton({
    Name = "Unview Player",
    Callback = function()
        if LocalPlayer.Character then
            Workspace.CurrentCamera.CameraSubject = LocalPlayer.Character.Humanoid
        end
    end
})

-- === Stats Tab ===
local StatsTab = Window:CreateTab("Stats")
local StatsSection = StatsTab:CreateSection("Stats")

StatsSection:CreateButton({
    Name = "Show Kills GUI",
    Callback = function()
        local leaderstats = LocalPlayer:FindFirstChild("leaderstats")
        if leaderstats then
            print("Kills: "..(leaderstats.Kills and leaderstats.Kills.Value or 0))
            print("Strength: "..(leaderstats.Strength and math.ceil(leaderstats.Strength.Value) or 0))
            print("Durability: "..(leaderstats.Durability and leaderstats.Durability.Value or 0))
        end
    end
})

local RebirthSection = StatsTab:CreateSection("Rebirth Calculation")

local rebirthLabels = {
    RebirthsGainedIn1Min = "Calculating...",
    RebirthsPerMinute = "Calculating...",
    RebirthsPerHour = "Calculating...",
    RebirthsPerDay = "Calculating...",
    RebirthsPerWeek = "Calculating..."
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
                rebirthLabels.RebirthsGainedIn1Min = "Rebirths Gained In 1 Minute: " .. math.ceil(perMinute)
                rebirthLabels.RebirthsPerMinute = "Rebirths Per Minute: " .. string.format("%.2f", perMinute)
                rebirthLabels.RebirthsPerHour = "Rebirths Per Hour: " .. string.format("%.2f", perMinute * 60)
                rebirthLabels.RebirthsPerDay = "Rebirths Per Day: " .. string.format("%.2f", perMinute * 60 * 24)
                rebirthLabels.RebirthsPerWeek = "Rebirths Per Week: " .. string.format("%.2f", perMinute * 60 * 24 * 7)
            end
        end
        task.wait(10)
    end
end)

-- === Spy Stats Tab ===
local SpyStatsTab = Window:CreateTab("Spy Stats")
local SpyStatsSection = SpyStatsTab:CreateSection("Spy Stats")

local targetPlayerName = nil

SpyStatsSection:CreateTextbox({
    Name = "Target Name",
    PlaceholderText = "Player Name",
    RemoveTextAfterFocusLost = true,
    Callback = function(name)
        targetPlayerName = name
