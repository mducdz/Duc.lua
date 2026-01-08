local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

-- 🌌 INTRO GUI
local gui = Instance.new("ScreenGui")
gui.Name = "DUCZIntro"
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local bg = Instance.new("Frame")
bg.Size = UDim2.new(1,0,1,0)
bg.BackgroundColor3 = Color3.fromRGB(0,0,0)
bg.BackgroundTransparency = 0.3
bg.Parent = gui

local logo = Instance.new("ImageLabel")
logo.Parent = gui
logo.AnchorPoint = Vector2.new(0.5,0.5)
logo.Position = UDim2.new(0.5,0,0.5,0)
logo.Size = UDim2.new(0,0,0,0)
logo.BackgroundTransparency = 1
logo.Image = "http://www.roblox.com/asset/?id=77111304194141"
logo.ImageTransparency = 1

TweenService:Create(logo, TweenInfo.new(1.5, Enum.EasingStyle.Elastic), {
    Size = UDim2.new(0,200,0,200),
    ImageTransparency = 0
}):Play()

task.spawn(function()
    while logo.Parent do
        logo.Rotation += 0.5
        task.wait(0.01)
    end
end)

local msg = Instance.new("TextLabel")
msg.Parent = gui
msg.AnchorPoint = Vector2.new(0.5,0)
msg.Position = UDim2.new(0.5,0,0.75,0)
msg.Size = UDim2.new(0,600,0,80)
msg.BackgroundTransparency = 1
msg.Text = "DUCZ HUB"
msg.TextColor3 = Color3.fromRGB(0,255,255)
msg.Font = Enum.Font.GothamBlack
msg.TextScaled = true
msg.TextStrokeTransparency = 0
msg.TextTransparency = 1

TweenService:Create(msg, TweenInfo.new(1.2), {TextTransparency=0}):Play()

task.wait(4)

TweenService:Create(logo, TweenInfo.new(1.2), {ImageTransparency=1}):Play()
TweenService:Create(msg, TweenInfo.new(1.2), {TextTransparency=1}):Play()
TweenService:Create(bg, TweenInfo.new(1.2), {BackgroundTransparency=1}):Play()
task.wait(1.5)
gui:Destroy()

------------------------------------------------------------
-- 🎛 MAIN UI BUTTON
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local ImageButton = Instance.new("ImageButton")
ImageButton.Parent = ScreenGui
ImageButton.BackgroundColor3 = Color3.fromRGB(0,0,0)
ImageButton.BorderSizePixel = 0
ImageButton.Position = UDim2.new(0.1,0,0.15,0)
ImageButton.Size = UDim2.new(0,40,0,40)
ImageButton.Draggable = true
ImageButton.Image = "http://www.roblox.com/asset/?id=77111304194141"

local UICorner = Instance.new("UICorner", ImageButton)
UICorner.CornerRadius = UDim.new(1,10)

------------------------------------------------------------
-- 📦 LOAD FLUENT
repeat task.wait() until game:IsLoaded()
local Fluent = loadstring(game:HttpGet(
"https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local Window = Fluent:CreateWindow({
    Title = "DUCZ HUB",
    SubTitle = "Tổng Hợp Script",
    TabWidth = 157,
    Size = UDim2.fromOffset(450,300),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.RightControl
})

-- 🔥 BIẾN TRẠNG THÁI
local isOpen = true

-- 🖱 NÚT TOGGLE UI (ĐÃ FIX)
ImageButton.MouseButton1Click:Connect(function()
    isOpen = not isOpen
    Window:Minimize(not isOpen)
end)

------------------------------------------------------------
-- 📑 TABS
local Tabs = {
    Main0 = Window:AddTab({Title="Thông Tin"}),
    Main1 = Window:AddTab({Title="Blox Fruits"}),
    Main2 = Window:AddTab({Title="Grow A Garden"}),
    Main3 = Window:AddTab({Title="99 Nights In The Forest"})
}

Tabs.Main0:AddButton({
    Title="Youtuber",
    Description="DUCZ HUB",
    Callback=function()
        setclipboard("https://youtube.com/@ducz")
    end
})
