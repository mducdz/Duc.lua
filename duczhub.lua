local CorrectKey = "duczontop"
local GetKeyLink = "https://link4sub.com/notes/SKRi"

local Player = game.Players.LocalPlayer

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = Player:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

local Frame = Instance.new("Frame")
Frame.Parent = ScreenGui
Frame.Size = UDim2.new(0,300,0,180)
Frame.Position = UDim2.new(0.5,-150,0.5,-90)
Frame.BackgroundColor3 = Color3.fromRGB(30,30,30)

local Title = Instance.new("TextLabel")
Title.Parent = Frame
Title.Size = UDim2.new(1,0,0,35)
Title.BackgroundTransparency = 1
Title.Text = "HZZ HUB | GET KEY"
Title.TextColor3 = Color3.new(1,1,1)

local KeyBox = Instance.new("TextBox")
KeyBox.Parent = Frame
KeyBox.Size = UDim2.new(0.9,0,0,35)
KeyBox.Position = UDim2.new(0.05,0,0.3,0)
KeyBox.PlaceholderText = "Enter Key"
KeyBox.Text = ""

local GetKeyButton = Instance.new("TextButton")
GetKeyButton.Parent = Frame
GetKeyButton.Size = UDim2.new(0.4,0,0,35)
GetKeyButton.Position = UDim2.new(0.05,0,0.7,0)
GetKeyButton.Text = "Get Key"

local CheckButton = Instance.new("TextButton")
CheckButton.Parent = Frame
CheckButton.Size = UDim2.new(0.4,0,0,35)
CheckButton.Position = UDim2.new(0.55,0,0.7,0)
CheckButton.Text = "Check"

GetKeyButton.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard(GetKeyLink)
    end
    print("Copied:", GetKeyLink)
end)

local function OpenMainHub()
    local MainFrame = Instance.new("Frame")
    MainFrame.Parent = ScreenGui
    MainFrame.Size = UDim2.new(0,400,0,250)
    MainFrame.Position = UDim2.new(0.5,-200,0.5,-125)
    MainFrame.BackgroundColor3 = Color3.fromRGB(20,20,20)

    local Label = Instance.new("TextLabel")
    Label.Parent = MainFrame
    Label.Size = UDim2.new(1,0,0,40)
    Label.BackgroundTransparency = 1
    Label.Text = "HZZ HUB"
    Label.TextColor3 = Color3.new(1,1,1)
end

CheckButton.MouseButton1Click:Connect(function()
    if KeyBox.Text:gsub("%s+","") == CorrectKey then
        Frame:Destroy()
        OpenMainHub()
    else
        warn("Wrong Key")
    end
end)
end)
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

-- 🌌 INTRO GUI
local gui = Instance.new("ScreenGui")
gui.Name = "DUCZIntro"
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- Nền tối nhẹ
local bg = Instance.new("Frame")
bg.Size = UDim2.new(1,0,1,0)
bg.BackgroundColor3 = Color3.fromRGB(0,0,0)
bg.BackgroundTransparency = 0.3
bg.Parent = gui

-- Logo Image
local logo = Instance.new("ImageLabel")
logo.Parent = gui
logo.AnchorPoint = Vector2.new(0.5,0.5)
logo.Position = UDim2.new(0.5,0,0.5,0)
logo.Size = UDim2.new(0,0,0,0)
logo.BackgroundTransparency = 1
logo.Image = "http://www.roblox.com/asset/?id=133060444314687"
logo.ImageTransparency = 1

-- Zoom + fade in
TweenService:Create(logo, TweenInfo.new(1.5, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out), { Size = UDim2.new(0,200,0,200), ImageTransparency = 0 }):Play()

-- Xoay logo
task.spawn(function()
	while logo.Parent do
		logo.Rotation = logo.Rotation + 0.5
		task.wait(0.01)
	end
end)

-- Chữ bên dưới logo
local msg = Instance.new("TextLabel")
msg.Parent = gui
msg.AnchorPoint = Vector2.new(0.5,0)
msg.Position = UDim2.new(0.5,0,0.75,0)
msg.Size = UDim2.new(0,600,0,80)
msg.BackgroundTransparency = 1
msg.Text = "DUCZ Hub" -- original
msg.TextColor3 = Color3.fromRGB(0,255,255)
msg.Font = Enum.Font.GothamBlack
msg.TextScaled = true
msg.TextStrokeTransparency = 0
msg.TextStrokeColor3 = Color3.fromRGB(0,0,0)
msg.TextTransparency = 1

-- THÊM: đổi tên intro thành DUCZ HUB
msg.Text = "DUCZ HUB"

-- Chữ fade in
TweenService:Create(msg, TweenInfo.new(1.2), {TextTransparency=0}):Play()

-- Giữ intro 4s
task.wait(4)

-- Fade out tất cả
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
ImageButton.Image = "http://www.roblox.com/asset/?id=133060444314687"
local UICorner = Instance.new("UICorner")
UICorner.Parent = ImageButton
UICorner.CornerRadius = UDim.new(1,10)

-- Ghi chú: giữ nguyên script cũ, nhưng mình sẽ thêm toggle UI bên dưới

------------------------------------------------------------
-- 🔄 LOAD FLUENT
repeat task.wait() until game:IsLoaded()
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local Window = Fluent:CreateWindow({
	Title="DUCZ HUB",
	SubTitle="by realducz",
	TabWidth=157,
	Size=UDim2.fromOffset(450,300),
	Acrylic=true,
	Theme="Dark",
	MinimizeKey=Enum.KeyCode.End
})

-- THÊM: đổi tên window thành DUCZ HUB
Window.Title = "DUCZ HUB"

-- Tabs
local Tabs = {
	Main0=Window:AddTab({Title="Thông Tin"}),
	Main1=Window:AddTab({Title="Script Main"}),
	Main2=Window:AddTab({Title="Script Hop Sever"}),
	Main3=Window:AddTab({Title="Script PVP"})
}

-- Tab 0: Thông Tin
Tabs.Main0:AddButton({ Title="Youtuber", Description="Ducz ROBLOX", Callback=function() setclipboard("https://youtube.com/@DUCZGAMERNE") end })

-- Tab 1: Blox Fruits

Tabs.Main1:AddButton({
    Title="Tumadam Hub",
    Callback=function()
        loadstring(game:HttpGet("https://github.com/Tumadam/cwertyur/raw/refs/heads/main/TumadamEng.lua"))()
    end
})
Tabs.Main1:AddButton({
    Title="w-azure premium Hub",
    Callback=function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LuaAnarchist/YeuEmNhieuLam/refs/heads/main/w-azure.luau"))()
    end
})
Tabs.Main1:AddButton({
    Title="NatAov HUB",
    Callback=function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Dev-AnhTuansitink/NatAov-Hub/refs/heads/main/ILoveYou.lua"))()
    end
})
Tabs.Main1:AddButton({
    Title="Apple Hub",
    Callback=function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AlexHerrySeek/AppleHub/refs/heads/main/loader/main.lua"))()
    end
})
Tabs.Main1:AddButton({
    Title="Speed Hub X",
    Callback=function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()
    end
})
Tabs.Main1:AddButton({
    Title="XETER Hub v1",
    Callback=function()
         getgenv().Version = "V1"
         getgenv().Team = "Marines"
         loadstring(game:HttpGet("https://raw.githubusercontent.com/TlDinhKhoi/Xeter/refs/heads/main/Main.lua"))()
    end
})
Tabs.Main1:AddButton({
    Title="Xete HUb V2",
    Callback=function()
        getgenv().Version = "V2"
        getgenv().Team = "Marines"
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TlDinhKhoi/Xeter/refs/heads/main/Main.lua"))()
    end
})
Tabs.Main1:AddButton({
    Title="Xeter Hub V3",
    Callback=function()
        getgenv().Version = "V3"
        getgenv().Team = "Marines"
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TlDinhKhoi/Xeter/refs/heads/main/Main.lua"))()
    end
})
Tabs.Main1:AddButton({
    Title="Teddy HUB MAIN",
    Callback=function()
        loadstring(game:HttpGet("https://api.luarmor.net/files/v4/loaders/e86ed284a22672d29e906214e7bbf8b9.lua"))()
    end
})
Tabs.Main1:AddButton({
    Title="HOHO Hub",
    Callback=function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HOHO_H/main/Loading_UI'))()
    end
})

Tabs.Main1:AddButton({
    Title="Tày hub premium",
    Callback=function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/VTDROBLOX/Animehub/refs/heads/main/Tayhub-PREMIUM.lua"))()
    end
})
Tabs.Main1:AddButton({
    Title="Xeter Hub V4",
    Callback=function()
        getgenv().Version = "V4"
        getgenv().Team = "Marines"
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TlDinhKhoi/Xeter/refs/heads/main/Main.lua"))()
    end
})

-- Tab 2: Grow A Garden
Tabs.Main2:AddButton({
    Title="Teddy Hub",
    Callback=function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Teddyseetink/Haidepzai/refs/heads/main/TEDDYHUB-FREEMIUM"))()
    end
})


-- Tab 3: 99 Nights In The Forest


------------------------------------------------------------
-- THÊM TOGGLE UI BẰNG BUTTON VÀ PHÍM END (KHÔNG XÓA TAB Blox Fruits)
local UIS = game:GetService("UserInputService")
local DuczUIVisible = true

local function DuczToggleUI()
	DuczUIVisible = not DuczUIVisible
	if Window and Window.Root then
		Window.Root.Visible = DuczUIVisible
	end
end

-- Button tròn toggle UI
ImageButton.MouseButton1Click:Connect(function()
	DuczToggleUI()
end)

-- Phím End toggle UI
UIS.InputBegan:Connect(function(input, gp)
	if gp then return end
	if input.KeyCode == Enum.KeyCode.End then
		DuczToggleUI()
	end
end)
