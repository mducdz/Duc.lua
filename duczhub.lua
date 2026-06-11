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

local TextBox = Instance.new("TextBox")
TextBox.Parent = Frame
TextBox.Size = UDim2.new(0,250,0,40)
TextBox.Position = UDim2.new(0,25,0,20)
TextBox.PlaceholderText = "Input Key"

local GetKey = Instance.new("TextButton")
GetKey.Parent = Frame
GetKey.Size = UDim2.new(0,120,0,35)
GetKey.Position = UDim2.new(0,25,0,80)
GetKey.Text = "Get Key"

local CheckKey = Instance.new("TextButton")
CheckKey.Parent = Frame
CheckKey.Size = UDim2.new(0,120,0,35)
CheckKey.Position = UDim2.new(0,155,0,80)
CheckKey.Text = "Check Key"

GetKey.MouseButton1Click:Connect(function()
    setclipboard(GetKeyLink)
end)

CheckKey.MouseButton1Click:Connect(function()
    if TextBox.Text == CorrectKey then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/mducdz/mducsitink/refs/heads/main/mducdev.lua"))()
        ScreenGui:Destroy()
    end
end)
