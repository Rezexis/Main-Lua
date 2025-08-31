local p=game:GetService("Players")
local t=game:GetService("TweenService")
local l=p.LocalPlayer
local g=Instance.new("ScreenGui")
g.Name="u"
g.ResetOnSpawn=false
g.Parent=l:WaitForChild("PlayerGui")

local f=Instance.new("Frame")
f.Size=UDim2.new(0,0,0,0)
f.Position=UDim2.new(0.5,0,0.5,0)
f.AnchorPoint=Vector2.new(0.5,0.5)
f.BackgroundColor3=Color3.fromRGB(25,25,25)
f.BorderSizePixel=0
f.Parent=g

local c=Instance.new("UICorner")
c.CornerRadius=UDim.new(0,15)
c.Parent=f

local tt=Instance.new("TextLabel")
tt.Text="New Version!"
tt.Size=UDim2.new(1,0,0,40)
tt.Position=UDim2.new(0,0,0,10)
tt.BackgroundTransparency=1
tt.Font=Enum.Font.GothamBold
tt.TextColor3=Color3.fromRGB(255,255,255)
tt.TextScaled=true
tt.TextTransparency=1
tt.Parent=f

local i=Instance.new("TextLabel")
i.Text="Please join discord for new version\n(very fast and op)"
i.Size=UDim2.new(1,-20,0,60)
i.Position=UDim2.new(0,10,0,60)
i.BackgroundTransparency=1
i.Font=Enum.Font.Gotham
i.TextColor3=Color3.fromRGB(200,200,200)
i.TextWrapped=true
i.TextScaled=true
i.TextTransparency=1
i.Parent=f

local b=Instance.new("TextButton")
b.Text="Copy Discord Link"
b.Size=UDim2.new(0.8,0,0,40)
b.Position=UDim2.new(0.1,0,1,-50)
b.BackgroundColor3=Color3.fromRGB(50,50,255)
b.TextColor3=Color3.fromRGB(255,255,255)
b.Font=Enum.Font.GothamBold
b.TextScaled=true
b.TextTransparency=1
b.Parent=f

local bc=Instance.new("UICorner")
bc.CornerRadius=UDim.new(0,10)
bc.Parent=b

b.MouseButton1Click:Connect(function()
setclipboard("https://discord.gg/KFgBTpUnuH")
b.Text="Copied!"
t:Create(b,TweenInfo.new(0.3),{BackgroundColor3=Color3.fromRGB(40,200,40)}):Play()
task.wait(1.5)
b.Text="Copy Discord Link"
t:Create(b,TweenInfo.new(0.3),{BackgroundColor3=Color3.fromRGB(50,50,255)}):Play()
end)

t:Create(f,TweenInfo.new(1,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Size=UDim2.new(0,400,0,240)}):Play()
task.wait(1)
t:Create(tt,TweenInfo.new(0.8),{TextTransparency=0}):Play()
t:Create(i,TweenInfo.new(0.8),{TextTransparency=0}):Play()
t:Create(b,TweenInfo.new(0.8),{TextTransparency=0}):Play()
