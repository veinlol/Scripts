local Players = game:GetService("Players")
local player = Players.LocalPlayer
local userId = player.UserId
local thumbType = Enum.ThumbnailType.HeadShot
local thumbSize = Enum.ThumbnailSize.Size420x420
local content, isReady = Players:GetUserThumbnailAsync(userId, thumbType, thumbSize)

game:GetService("StarterGui"):SetCore("SendNotification",{  
Title = "B Genesis | V 1.2",     
Text = player.Name,
Icon = content,
Duration = 10,
Color = Info
})
    repeat wait() until game:GetService("Players")
    
    if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then repeat wait() until game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") end
        
    wait(1)
    
    do
        local ui = game.CoreGui:FindFirstChild("UlLib")
        if ui then
            ui:Destroy()
        end
    end
	
	do
		local ui = game.CoreGui:FindFirstChild("ScreenGui")
		if ui then
            ui:Destroy()
		end
    end
	

    
    local UserInputService = game:GetService("UserInputService")
    local TweenService = game:GetService("TweenService")
    
    local function MakeDraggable(topbarobject, object)
        local Dragging = nil
        local DragInput = nil
        local DragStart = nil
        local StartPosition = nil
    
        local function Update(input)
            local Delta = input.Position - DragStart
            local pos =
                UDim2.new(
                    StartPosition.X.Scale,
                    StartPosition.X.Offset + Delta.X,
                    StartPosition.Y.Scale,
                    StartPosition.Y.Offset + Delta.Y
                )
            local Tween = TweenService:Create(object, TweenInfo.new(0.2), {Position = pos})
            Tween:Play()
        end
    
        topbarobject.InputBegan:Connect(
            function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    Dragging = true
                    DragStart = input.Position
                    StartPosition = object.Position
    
                    input.Changed:Connect(
                        function()
                            if input.UserInputState == Enum.UserInputState.End then
                                Dragging = false
                            end
                        end
                    )
                end
            end
        )
    
        topbarobject.InputChanged:Connect(
            function(input)
                if
                    input.UserInputType == Enum.UserInputType.MouseMovement or
                    input.UserInputType == Enum.UserInputType.Touch
                then
                    DragInput = input
                end
            end
        )
    
        UserInputService.InputChanged:Connect(
            function(input)
                if input == DragInput and Dragging then
                    Update(input)
                end
            end
        )
    end
    
    local library = {}
    
    function library:AddWindow(text,keybind)
        local bind = keybind or Enum.KeyCode.Insert
        local ff = false
        local currenttab = ""
    
        local DoctorShiba = Instance.new("ScreenGui")
        DoctorShiba.Name = "UlLib"
        DoctorShiba.Parent = game.CoreGui
        DoctorShiba.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
        local Main = Instance.new("Frame")
        Main.Name = "Main"
        Main.Parent = DoctorShiba
        Main.AnchorPoint = Vector2.new(0.5, 0.5)
        Main.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        Main.BackgroundTransparency = 0.100
		Main.BorderColor3 = Color3.fromRGB(255, 0, 0)
        Main.BorderSizePixel = 2
        Main.ClipsDescendants = true
        Main.Position = UDim2.new(0.49, 0, 0.45, 0)
        Main.Size = UDim2.new(0, 600, 0, 350)
		Main.Active = true
    
        local Top = Instance.new("Frame")
        Top.Name = "Top"
        Top.Parent = Main
        Top.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		Top.BorderColor3 = Color3.fromRGB(255, 0, 0)
        Top.BorderSizePixel = 2
        Top.BackgroundTransparency = 1.000
        Top.BorderSizePixel = 0
        Top.Size = UDim2.new(0, 600, 0, 20)
    
        local Page = Instance.new("Frame")
        Page.Name = "Page"
        Page.Parent = Main
        Page.BackgroundColor3 = Color3.fromRGB(1, 1, 1)
		Page.BorderColor3 = Color3.fromRGB(255, 0, 0)
        Page.BorderSizePixel = 2
        Page.BackgroundTransparency = 1.0
        Page.BorderSizePixel = 0
        Page.Size = UDim2.new(0, 125, 0, 350)
    
        local NameHub = Instance.new("TextLabel")
        NameHub.Name = "NameHub"
        NameHub.Parent = Page
        NameHub.BackgroundColor3 = Color3.fromRGB(1, 1, 1)
        NameHub.BackgroundTransparency = 0.4
        NameHub.Position = UDim2.new(0, 0, 0, 0)
        NameHub.Size = UDim2.new(0, 150, 0, 20)
        NameHub.Font = Enum.Font.GothamBlack
        NameHub.Text = text
        NameHub.TextColor3 = Color3.fromRGB(225, 255, 255)
        NameHub.TextSize = 11.000
        NameHub.TextXAlignment = Enum.TextXAlignment.Left
		 
        local User = Instance.new("Frame")
        User.Name = "User"
        User.Parent = Page
        User.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        User.BackgroundTransparency = 1.000
        User.Position = UDim2.new(0, 0, 0.8, 30)
        User.Size = UDim2.new(0, 125, 0, 40)
    
        local UserText = Instance.new("TextLabel")
        UserText.Name = "UserText"
        UserText.Parent = User
        UserText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        UserText.BackgroundTransparency = 1.000
        UserText.Position = UDim2.new(0.354999989, 0, 0, 11)
        UserText.Size = UDim2.new(0, 80, 0, 20)
        UserText.Font = Enum.Font.GothamBlack
        UserText.Text = tostring(game.Players.LocalPlayer.Name) 
        spawn(function()
            while wait() do
                pcall(function()
                    wait(0.1) 
                    game:GetService('TweenService'):Create(
                        UserText,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                        {TextColor3 = Color3.fromRGB(255, 0, 0)}
                    ):Play() 
                    wait(.5)            
                    game:GetService('TweenService'):Create(
                        UserText,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                        {TextColor3 = Color3.fromRGB(255, 155, 0)}
                    ):Play() 
                    wait(.5)            
                    game:GetService('TweenService'):Create(
                        UserText,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                        {TextColor3 = Color3.fromRGB(255, 255, 0)}
                    ):Play() 
                    wait(.5)            
                    game:GetService('TweenService'):Create(
                        UserText,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                        {TextColor3 = Color3.fromRGB(0, 255, 0)}
                    ):Play() 
                    wait(.5)            
                    game:GetService('TweenService'):Create(
                        UserText,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                        {TextColor3 = Color3.fromRGB(0, 255, 255)}
                    ):Play() 
                    wait(.5)            
                    game:GetService('TweenService'):Create(
                        UserText,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                        {TextColor3 = Color3.fromRGB(0, 155, 255)}
                    ):Play() 
                    wait(.5)            
                    game:GetService('TweenService'):Create(
                        UserText,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                        {TextColor3 = Color3.fromRGB(255, 0, 255)}
                    ):Play() 
                    wait(.5)            
                    game:GetService('TweenService'):Create(
                        UserText,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                        {TextColor3 = Color3.fromRGB(255, 0, 155)}
                    ):Play() 
                    wait(.5)
                end)
            end
        end)
        UserText.TextScaled = true
        UserText.TextSize = 11.000
        UserText.TextWrapped = true
        UserText.TextXAlignment = Enum.TextXAlignment.Left
    
        local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
        UITextSizeConstraint.Parent = UserText
        UITextSizeConstraint.MaxTextSize = 11
    
        local UserImage = Instance.new("ImageLabel")
        UserImage.Name = "UserImage"
        UserImage.Parent = User
        UserImage.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
        UserImage.Position = UDim2.new(0, 10, 0, 9)
        UserImage.Size = UDim2.new(0, 25, 0, 25)
        UserImage.Image = "https://www.roblox.com/headshot-thumbnail/image?userId="..game.Players.LocalPlayer.UserId.."&width=420&height=420&format=png"
    
        local UserImageCorner = Instance.new("UICorner")
        UserImageCorner.CornerRadius = UDim.new(0, 100)
        UserImageCorner.Name = "UserImageCorner"
        UserImageCorner.Parent = UserImage
    
        local ScrollPage = Instance.new("ScrollingFrame")
        ScrollPage.Name = "ScrollPage"
        ScrollPage.Parent = Page
        ScrollPage.Active = true
        ScrollPage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ScrollPage.BackgroundTransparency = 1.000
        ScrollPage.BorderSizePixel = 0
        ScrollPage.Position = UDim2.new(0, 0, 0.086, 0)
        ScrollPage.Size = UDim2.new(0, 125, 0, 290)
        ScrollPage.CanvasSize = UDim2.new(0, 0, 0, 0)
        ScrollPage.ScrollBarThickness = 0
        local PageList = Instance.new("UIListLayout")
        PageList.Name = "PageList"
        PageList.Parent = ScrollPage
        PageList.SortOrder = Enum.SortOrder.LayoutOrder
        PageList.Padding = UDim.new(0, 5)
    
        local PagePadding = Instance.new("UIPadding")
        PagePadding.Name = "PagePadding"
        PagePadding.Parent = ScrollPage
        PagePadding.PaddingTop = UDim.new(0, 5)
        PagePadding.PaddingLeft = UDim.new(0, 28)
    
        local TabFolder = Instance.new("Folder")
        TabFolder.Name = "TabFolder"
        TabFolder.Parent = Main
    
        MakeDraggable(Top,Main)
    
        local uihide = false
    
        UserInputService.InputBegan:Connect(function(input)
            if input.KeyCode == bind then
                if uihide == false then
                    uihide = true
                    Main:TweenSize(UDim2.new(0, 0, 0, 0),"In","Quad",0.2,true);
					Main.BorderSizePixel = 0
                else
                    uihide = false
                    Main:TweenSize(UDim2.new(0, 600, 0, 350),"Out","Quad",0.2,true)
					Main.BorderSizePixel = 2
                end
            end
        end)
    
        local uitab = {}
    
        function uitab:AddTab(text,image)
            local Image = image or 6023426915
    
            local PageButton = Instance.new("TextButton")
            PageButton.Name = "PageButton"
            PageButton.Parent = ScrollPage
            PageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            PageButton.BackgroundTransparency = 1.000
            PageButton.BorderSizePixel = 0
            PageButton.Position = UDim2.new(0.224000007, 0, 0.029787235, 0)
            PageButton.Size = UDim2.new(0, 97, 0, 20)
            PageButton.AutoButtonColor = false
            PageButton.Font = Enum.Font.GothamSemibold
            PageButton.Text = text
            PageButton.TextColor3 = Color3.fromRGB(150, 150, 150)
            PageButton.TextSize = 11.000
            PageButton.TextXAlignment = Enum.TextXAlignment.Left
            
            local PageImage = Instance.new("ImageLabel")
            PageImage.Name = "PageImage"
            PageImage.Parent = PageButton
            PageImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            PageImage.BackgroundTransparency = 1.000
            PageImage.Position = UDim2.new(0, -20, 0, 3)
            PageImage.Size = UDim2.new(0, 15, 0, 15)
            PageImage.Image = "rbxassetid://"..tostring(Image)
    
            local MainTab = Instance.new("Frame")
            MainTab.Name = "MainTab"
            MainTab.Parent = TabFolder
            MainTab.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
            MainTab.BorderSizePixel = 0
            MainTab.Position = UDim2.new(0.208333328, 0, 0, 0)
            MainTab.Size = UDim2.new(0, 475, 0, 350)
            MainTab.Visible = false
    
            local ScrollTab = Instance.new("ScrollingFrame")
            ScrollTab.Name = "ScrollTab"
            ScrollTab.Parent = MainTab
            ScrollTab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ScrollTab.BackgroundTransparency = 1.000
            ScrollTab.BorderSizePixel = 0
            ScrollTab.Position = UDim2.new(0, 0, 0.057, 0)
            ScrollTab.Size = UDim2.new(0, 475, 0, 330)
            ScrollTab.CanvasSize = UDim2.new(0, 0, 0, 0)
            ScrollTab.ScrollBarThickness = 3
    
            local TabList = Instance.new("UIListLayout")
            TabList.Name = "TabList"
            TabList.Parent = ScrollTab
            TabList.SortOrder = Enum.SortOrder.LayoutOrder
            TabList.Padding = UDim.new(0, 5)
    
            local TabPadding = Instance.new("UIPadding")
            TabPadding.Name = "TabPadding"
            TabPadding.Parent = ScrollTab
            TabPadding.PaddingLeft = UDim.new(0, 10)
            TabPadding.PaddingTop = UDim.new(0, 10)
    
            PageButton.MouseButton1Click:Connect(function()
                currenttab = MainTab.Name
                for i,v in next, TabFolder:GetChildren() do 
                    if v.Name == "MainTab" then
                        v.Visible = false
                    end
                end
                MainTab.Visible = true
    
                for i,v in next, ScrollPage:GetChildren() do 
                    if v:IsA("TextButton") then
                        TweenService:Create(
                            v,
                            TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                            {TextColor3 = Color3.fromRGB(150, 150, 150)}
                        ):Play()
                    end
                    TweenService:Create(
                        PageButton,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextColor3 = Color3.fromRGB(255,0,0)}
                    ):Play()
                end
            end)
    
            if ff == false then
                TweenService:Create(
                    PageButton,
                    TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {TextColor3 = Color3.fromRGB(255,0,0)}
                ):Play()
                for i,v in next, TabFolder:GetChildren() do 
                    if v.Name == "MainTab" then
                        v.Visible = false
                    end
                    MainTab.Visible = true
                end
                ff = true
            end
    
            game:GetService("RunService").Stepped:Connect(function()
                pcall(function()
                    ScrollPage.CanvasSize = UDim2.new(0,0,0,PageList.AbsoluteContentSize.Y + 10)
                    ScrollTab.CanvasSize = UDim2.new(0,0,0,TabList.AbsoluteContentSize.Y + 30)
                end)
            end)
            
            local main = {}
            
            function main:AddButton(text,callback)
                local Button = Instance.new("TextButton")
    
                Button.Name = "Button"
                Button.Parent = ScrollTab
                Button.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                Button.BackgroundTransparency = 0.1
                Button.BorderSizePixel = 0
                Button.Size = UDim2.new(0, 455, 0, 30)
                Button.AutoButtonColor = false
                Button.Font = Enum.Font.Gotham
                Button.Text = text
                Button.TextColor3 = Color3.fromRGB(225, 225, 225)
                Button.TextSize = 11.000
                Button.TextWrapped = true
                
                local ButtonCorner = Instance.new("UICorner")
                ButtonCorner.Name = "ButtonCorner"
                ButtonCorner.CornerRadius = UDim.new(0, 5)
                ButtonCorner.Parent = Button
                
                Button.MouseEnter:Connect(function()
                    TweenService:Create(
                        Button,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextColor3 = Color3.fromRGB(255,0,0)}
                    ):Play()
                end)
                
                Button.MouseLeave:Connect(function()
                    TweenService:Create(
                        Button,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextColor3 = Color3.fromRGB(225, 225, 225)}
                    ):Play()
                end)
                
                Button.MouseButton1Click:Connect(function()
                    callback()
                    Button.TextSize = 0
                    TweenService:Create(
                        Button,
                        TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
                        {TextSize = 11}
                    ):Play()
                end)
            end
            
            function main:AddToggle(text,config,callback)
                local ToggleImage = Instance.new("Frame")
                
                local Toggle = Instance.new("TextButton")
                Toggle.Name = "Toggle"
                Toggle.Parent = ScrollTab
                Toggle.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                Toggle.BackgroundTransparency = 0.1
                Toggle.BorderSizePixel = 0
                Toggle.AutoButtonColor = false
                Toggle.Size = UDim2.new(0, 455, 0, 30)
                Toggle.Font = Enum.Font.SourceSans
                Toggle.Text = ""
                Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
                Toggle.TextSize = 14.000
                
                local ToggleCorner = Instance.new("UICorner")
                ToggleCorner.Name = "ToggleCorner"
                ToggleCorner.CornerRadius = UDim.new(0, 5)
                ToggleCorner.Parent = Toggle
    
                local ToggleLabel = Instance.new("TextLabel")
                ToggleLabel.Name = "ToggleLabel"
                ToggleLabel.Parent = Toggle
                ToggleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ToggleLabel.BackgroundTransparency = 1.000
                ToggleLabel.Position = UDim2.new(0, 13, 0, 0)
                ToggleLabel.Size = UDim2.new(0, 410, 0, 30)
                ToggleLabel.Font = Enum.Font.Gotham
                ToggleLabel.Text = text
                ToggleLabel.TextColor3 = Color3.fromRGB(225, 225, 225)
                ToggleLabel.TextSize = 11.000
                ToggleLabel.TextXAlignment = Enum.TextXAlignment.Left
    
                ToggleImage.Name = "ToggleImage"
                ToggleImage.Parent = Toggle
                ToggleImage.BackgroundColor3 = Color3.fromRGB(70, 68, 79)
                ToggleImage.Position = UDim2.new(0, 425, 0, 5)
                ToggleImage.BorderSizePixel = 0
                ToggleImage.Size = UDim2.new(0, 20, 0, 20)
                local ToggleImageCorner = Instance.new("UICorner")
                ToggleImageCorner.Name = "ToggleImageCorner"
                ToggleImageCorner.CornerRadius = UDim.new(0, 5)
                ToggleImageCorner.Parent = ToggleImage
    
                local ToggleImage2 = Instance.new("Frame")
                ToggleImage2.Name = "ToggleImage2"
                ToggleImage2.Parent = ToggleImage
                ToggleImage2.AnchorPoint = Vector2.new(0.5, 0.5)
                ToggleImage2.BackgroundColor3 = Color3.fromRGB(255,0,0)
                ToggleImage2.Position = UDim2.new(0, 10, 0, 10)
                ToggleImage2.Visible = false
    
                local ToggleImage2Corner = Instance.new("UICorner")
                ToggleImage2Corner.Name = "ToggleImageCorner"
                ToggleImage2Corner.CornerRadius = UDim.new(0, 5)
                ToggleImage2Corner.Parent = ToggleImage2
                
                Toggle.MouseEnter:Connect(function()
                    TweenService:Create(
                        ToggleLabel,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextColor3 = Color3.fromRGB(255,0,0)}
                    ):Play()
                end)
    
                Toggle.MouseLeave:Connect(function()
                    TweenService:Create(
                        ToggleLabel,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextColor3 = Color3.fromRGB(225, 225, 225)}
                    ):Play()
                end)
                if config == nil then config = false end
                local toggled = config or false
                Toggle.MouseButton1Click:Connect(function()
                    if toggled == false then
                        toggled = true
                        ToggleImage2.Visible = true
						
                        ToggleImage2:TweenSize(UDim2.new(0, 21, 0, 21),"In","Quad",0.1,true)
						
                    else
                        toggled = false
						
                        ToggleImage2:TweenSize(UDim2.new(0, 0, 0, 0),"In","Quad",0.1,true)
                        wait(0.1)
						
                    end
                    callback(toggled)
                end)
                
                if config == true then
                    ToggleImage2.Visible = true
                    ToggleImage2:TweenSize(UDim2.new(0, 21, 0, 21),"In","Quad",0.1,true)
                    toggled = true
					
                    callback(toggled)
                end
            end
    
            function main:AddTextbox(text,holder,disappear,callback)
                local Textboxx = Instance.new("Frame")
                local TextboxxCorner = Instance.new("UICorner")
                local TextboxTitle = Instance.new("TextLabel")
                local Textbox = Instance.new("TextBox")
                local TextboxCorner = Instance.new("UICorner")
    
                Textboxx.Name = "Textboxx"
                Textboxx.Parent = ScrollTab
                Textboxx.BackgroundColor3 = Color3.fromRGB(50, 48, 59)
                Textboxx.Size = UDim2.new(0, 455, 0, 30)
    
                TextboxxCorner.CornerRadius = UDim.new(0, 5)
                TextboxxCorner.Name = "TextboxxCorner"
                TextboxxCorner.Parent = Textboxx
    
                TextboxTitle.Name = "TextboxTitle"
                TextboxTitle.Parent = Textboxx
                TextboxTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextboxTitle.BackgroundTransparency = 1.0
                TextboxTitle.Position = UDim2.new(0, 15, 0, 0)
                TextboxTitle.Size = UDim2.new(0, 300, 0, 30)
                TextboxTitle.Font = Enum.Font.Gotham
                TextboxTitle.Text = text
				TextboxTitle.TextWrapped = false
                TextboxTitle.TextColor3 = Color3.fromRGB(225, 225, 225)
                TextboxTitle.TextSize = 11.000
                TextboxTitle.TextXAlignment = Enum.TextXAlignment.Left
				
                Textbox.Name = "Textbox"
                Textbox.Parent = Textboxx
                Textbox.BackgroundColor3 = Color3.fromRGB(30, 28, 39)
                Textbox.Position = UDim2.new(0, 310, 0, 5)
                Textbox.Size = UDim2.new(0, 140, 0, 20)
                Textbox.Font = Enum.Font.Gotham
                Textbox.Text = holder
				Textbox.TextWrapped = true
                Textbox.TextColor3 = Color3.fromRGB(225, 225, 225)
                Textbox.TextSize = 11.000
    
                Textbox.FocusLost:Connect(function()
                    if #Textbox.Text > 0 then
                        callback(Textbox.Text)
                    end
                    if disappear then
                        Textbox.Text = ""
                    else
                        Textbox.Text = holder
                    end
                end)
    
                TextboxCorner.Name = "TextboxCorner"
                TextboxCorner.CornerRadius = UDim.new(0, 5)
                TextboxCorner.Parent = Textbox
            end
    
            function main:AddDropdown(text,table,callback)
                local Dropdown = Instance.new("Frame")
                local UICorner = Instance.new("UICorner")
                local DropButton = Instance.new("TextButton")
                local Droptitle = Instance.new("TextLabel")
                local DropScroll = Instance.new("ScrollingFrame")
                local DropdownList = Instance.new("UIListLayout")
                local DropdownPadding = Instance.new("UIPadding")
                local DropImage = Instance.new("ImageLabel")
                
                Dropdown.Name = "Dropdown"
                Dropdown.Parent = ScrollTab
                Dropdown.Active = true
                Dropdown.BackgroundColor3 = Color3.fromRGB(50, 48, 59)
                Dropdown.ClipsDescendants = true
                Dropdown.Size = UDim2.new(0, 455, 0, 30)
                
                UICorner.CornerRadius = UDim.new(0, 5)
                UICorner.Parent = Dropdown
                
                DropButton.Name = "DropButton"
                DropButton.Parent = Dropdown
                DropButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                DropButton.BackgroundTransparency = 1.000
                DropButton.Size = UDim2.new(0, 455, 0, 30)
                DropButton.Font = Enum.Font.SourceSans
                DropButton.Text = ""
                DropButton.TextColor3 = Color3.fromRGB(0, 0, 0)
                DropButton.TextSize = 14.000
                
                Droptitle.Name = "Droptitle"
                Droptitle.Parent = Dropdown
                Droptitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Droptitle.BackgroundTransparency = 1.000
                Droptitle.Position = UDim2.new(0.0281690136, 0, 0, 0)
                Droptitle.Size = UDim2.new(0, 410, 0, 30)
                Droptitle.Font = Enum.Font.Gotham
                Droptitle.Text = text.." : "
                Droptitle.TextColor3 = Color3.fromRGB(225, 225, 225)
                Droptitle.TextSize = 11.000
                Droptitle.TextXAlignment = Enum.TextXAlignment.Left
    
                DropImage.Name = "DropImage"
                DropImage.Parent = Dropdown
                DropImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                DropImage.BackgroundTransparency = 1.000
                DropImage.Position = UDim2.new(0, 425, 0, 5)
                DropImage.Rotation = 0
                DropImage.Size = UDim2.new(0, 20, 0, 20)
                DropImage.Image = "rbxassetid://5012539403"
                
                DropScroll.Name = "DropScroll"
                DropScroll.Parent = Droptitle
                DropScroll.Active = true
                DropScroll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                DropScroll.BackgroundTransparency = 1.000
                DropScroll.BorderSizePixel = 0
                DropScroll.Position = UDim2.new(-0.0317460336, 0, 1, 0)
                DropScroll.Size = UDim2.new(0, 455, 0, 70)
                DropScroll.CanvasSize = UDim2.new(0, 0, 0, 2)
                DropScroll.ScrollBarThickness = 2
                
                DropdownList.Name = "DropdownList"
                DropdownList.Parent = DropScroll
                DropdownList.SortOrder = Enum.SortOrder.LayoutOrder
                DropdownList.Padding = UDim.new(0, 5)
                
                DropdownPadding.Name = "DropdownPadding"
                DropdownPadding.Parent = DropScroll
                DropdownPadding.PaddingTop = UDim.new(0, 5)
    
                local isdropping = false
    
                for i,v in next,table do
                    local DropButton2 = Instance.new("TextButton")
    
                    DropButton2.Name = "DropButton2"
                    DropButton2.Parent = DropScroll
                    DropButton2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    DropButton2.BackgroundTransparency = 1.000
                    DropButton2.Size = UDim2.new(0, 455, 0, 30)
                    DropButton2.AutoButtonColor = false
                    DropButton2.Font = Enum.Font.Gotham
                    DropButton2.TextColor3 = Color3.fromRGB(225, 225, 225)
                    DropButton2.TextSize = 11.000
                    DropButton2.Text = tostring(v)
    
                    DropButton2.MouseEnter:Connect(function()
                        TweenService:Create(
                            DropButton2,
                            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {TextColor3 = Color3.fromRGB(255,0,0)}
                        ):Play()
                    end)
                    DropButton2.MouseLeave:Connect(function()
                        TweenService:Create(
                            DropButton2,
                            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {TextColor3 = Color3.fromRGB(225, 225, 225)}
                        ):Play()
                    end)
    
                    DropButton2.MouseButton1Click:Connect(function()
                        TweenService:Create(
                            Dropdown,
                            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {Size = UDim2.new(0, 455, 0, 30)}
                        ):Play()
                        TweenService:Create(
                            DropImage,
                            TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
                            {Rotation = 0}
                        ):Play()
                        Droptitle.Text =  text.." : "..tostring(v)
                        callback(v)
                        isdropping = not isdropping
                        DropScroll.CanvasSize = UDim2.new(0,0,0,DropdownList.AbsoluteContentSize.Y + 10)
                    end)
                end
    
                DropButton.MouseButton1Click:Connect(function()
                    if isdropping == false then
                        isdropping = true
                        TweenService:Create(
                            Dropdown,
                            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {Size = UDim2.new(0, 455, 0, 100)}
                        ):Play()
                        TweenService:Create(
                            DropImage,
                            TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {Rotation = -180}
                        ):Play()
                        DropScroll.CanvasSize = UDim2.new(0,0,0,DropdownList.AbsoluteContentSize.Y + 10)
                    else
                        isdropping = false
                        TweenService:Create(
                            Dropdown,
                            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {Size = UDim2.new(0, 455, 0, 30)}
                        ):Play()
                        TweenService:Create(
                            DropImage,
                            TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {Rotation = 0}
                        ):Play()
                        DropScroll.CanvasSize = UDim2.new(0,0,0,DropdownList.AbsoluteContentSize.Y + 10)
                    end
                end)
                DropScroll.CanvasSize = UDim2.new(0,0,0,DropdownList.AbsoluteContentSize.Y + 10)
    
                local drop = {}
    
                function drop:Clear()
                    Droptitle.Text = tostring(text).." :"
                    TweenService:Create(
                        Dropdown,
                        TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {Size = UDim2.new(0, 455, 0, 30)} 
                    ):Play()
                    isdropping = false
                    for i, v in next, DropScroll:GetChildren() do
                        if v:IsA("TextButton") then
                            v:Destroy()
                        end
                    end
                end
                function drop:Add(t)
                    local DropButton2 = Instance.new("TextButton")
    
                    DropButton2.Name = "DropButton2"
                    DropButton2.Parent = DropScroll
                    DropButton2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    DropButton2.BackgroundTransparency = 1.000
                    DropButton2.Size = UDim2.new(0, 455, 0, 30)
                    DropButton2.AutoButtonColor = false
                    DropButton2.Font = Enum.Font.Gotham
                    DropButton2.TextColor3 = Color3.fromRGB(225, 225, 225)
                    DropButton2.TextSize = 11.000
                    DropButton2.Text = tostring(t)
    
                    DropButton2.MouseButton1Click:Connect(function()
                        TweenService:Create(
                            Dropdown,
                            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {Size = UDim2.new(0, 455, 0, 30)}
                        ):Play()
                        TweenService:Create(
                            DropImage,
                            TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
                            {Rotation = 0}
                        ):Play()
                        Droptitle.Text =  text.." : "..tostring(t)
                        callback(t)
                        isdropping = not isdropping
                        DropScroll.CanvasSize = UDim2.new(0,0,0,DropdownList.AbsoluteContentSize.Y + 10)
                    end)
                end
                return drop
            end
    
            function main:AddSlider(text,min,max,set,callback)
                set = (math.clamp(set,min,max))
                if set > max then set = max end
    
                local Slider = Instance.new("Frame")
                local UICorner = Instance.new("UICorner")
                local SliderTitle = Instance.new("TextLabel")
                local SliderValue = Instance.new("TextLabel")
                local SliderButton = Instance.new("TextButton")
                local Bar1 = Instance.new("Frame")
                local Bar = Instance.new("Frame")
                local UICorner_2 = Instance.new("UICorner")
                local CircleBar = Instance.new("Frame")
                local UICorner_3 = Instance.new("UICorner")
                local UICorner_4 = Instance.new("UICorner")
    
                Slider.Name = "Slider"
                Slider.Parent = ScrollTab
                Slider.BackgroundColor3 = Color3.fromRGB(50, 48, 59)
                Slider.Size = UDim2.new(0, 455, 0, 40)
    
                UICorner.CornerRadius = UDim.new(0, 5)
                UICorner.Parent = Slider
    
                SliderTitle.Name = "SliderTitle"
                SliderTitle.Parent = Slider
                SliderTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SliderTitle.BackgroundTransparency = 1.000
                SliderTitle.Position = UDim2.new(0.0283286124, 0, 0, 0)
                SliderTitle.Size = UDim2.new(0, 290, 0, 20)
                SliderTitle.Font = Enum.Font.Gotham
                SliderTitle.Text = text
                SliderTitle.TextColor3 = Color3.fromRGB(225, 225, 225)
                SliderTitle.TextSize = 11.000
                SliderTitle.TextXAlignment = Enum.TextXAlignment.Left
    
                SliderValue.Name = "SliderValue"
                SliderValue.Parent = Slider
                SliderValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SliderValue.BackgroundTransparency = 1.000
                SliderValue.Position = UDim2.new(0.887778878, 0, 0, 0)
                SliderValue.Size = UDim2.new(0, 40, 0, 20)
                SliderValue.Font = Enum.Font.Gotham
                SliderValue.Text =  tostring(set and math.floor( (set / max) * (max - min) + min) or 0)
                SliderValue.TextColor3 = Color3.fromRGB(225, 225, 225)
                SliderValue.TextSize = 11.000
    
                SliderButton.Name = "SliderButton"
                SliderButton.Parent = Slider
                SliderButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SliderButton.BackgroundTransparency = 1.000
                SliderButton.Position = UDim2.new(0, 10, 0, 25)
                SliderButton.Size = UDim2.new(0, 435, 0, 5)
                SliderButton.AutoButtonColor = false
                SliderButton.Font = Enum.Font.SourceSans
                SliderButton.Text = ""
                SliderButton.TextColor3 = Color3.fromRGB(0, 0, 0)
                SliderButton.TextSize = 14.000
    
                Bar1.Name = "Bar1"
                Bar1.Parent = SliderButton
                Bar1.BackgroundColor3 = Color3.fromRGB(30, 28, 39)
                Bar1.Size = UDim2.new(0, 435, 0, 5)
    
                Bar.Name = "Bar"
                Bar.Parent = Bar1
                Bar.BackgroundColor3 = Color3.fromRGB(255,0,0)
                Bar.Size = UDim2.new(set/max, 0, 0, 5)
    
                UICorner_2.CornerRadius = UDim.new(0, 100)
                UICorner_2.Parent = Bar
    
                CircleBar.Name = "CircleBar"
                CircleBar.Parent = Bar
                CircleBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                CircleBar.Position = UDim2.new(1, -2, 0, -2)
                CircleBar.AnchorPoint = Vector2.new(0, 0.1)
                CircleBar.Size = UDim2.new(0, 10, 0, 10)
    
                UICorner_3.CornerRadius = UDim.new(0, 100)
                UICorner_3.Parent = CircleBar
    
                UICorner_4.CornerRadius = UDim.new(0, 100)
                UICorner_4.Parent = Bar1
                
                local mouse = game.Players.LocalPlayer:GetMouse()
                local uis = game:GetService("UserInputService")
    
                if Value == nil then
                    Value = set
                    pcall(function()
                        callback(Value)
                    end)
                end
                
                SliderButton.MouseButton1Down:Connect(function()
                    Value = math.floor((((tonumber(max) - tonumber(min)) / 435) * Bar.AbsoluteSize.X) + tonumber(min)) or 0
                    pcall(function()
                        callback(Value)
                    end)
                    Bar.Size = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X, 0, 435), 0, 5)
                    CircleBar.Position = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X - 2, 0, 425), 0, -2)
                    moveconnection = mouse.Move:Connect(function()
                        SliderValue.Text = Value
                        Value = math.floor((((tonumber(max) - tonumber(min)) / 435) * Bar.AbsoluteSize.X) + tonumber(min))
                        pcall(function()
                            callback(Value)
                        end)
                        Bar.Size = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X, 0, 435), 0, 5)
                        CircleBar.Position = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X - 2, 0, 425), 0, -2)
                    end)
                    releaseconnection = uis.InputEnded:Connect(function(Mouse)
                        if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
                            Value = math.floor((((tonumber(max) - tonumber(min)) / 435) * Bar.AbsoluteSize.X) + tonumber(min))
                            pcall(function()
                                callback(Value)
                            end)
                            Bar.Size = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X, 0, 435), 0, 5)
                            CircleBar.Position = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X - 2, 0, 425), 0, -2)
                            moveconnection:Disconnect()
                            releaseconnection:Disconnect()
                        end
                    end)
                end)
                releaseconnection = uis.InputEnded:Connect(function(Mouse)
                    if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
                        Value = math.floor((((tonumber(max) - tonumber(min)) / 435) * Bar.AbsoluteSize.X) + tonumber(min))
                        SliderValue.Text = Value
                    end
                end)
            end
            function main:AddSeperator(text)
                local Seperator = Instance.new("Frame")
                local Sep1 = Instance.new("Frame")
                local SepLabel = Instance.new("TextLabel")
                local Sep2 = Instance.new("Frame")
    
                Seperator.Name = "Seperator"
                Seperator.Parent = ScrollTab
                Seperator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Seperator.BackgroundTransparency = 1.000
                Seperator.ClipsDescendants = true
                Seperator.Size = UDim2.new(0, 455, 0, 20)
    
                Sep1.Name = "Sep1"
                Sep1.Parent = Seperator
                Sep1.BackgroundColor3 = Color3.fromRGB(255,0,0)
                Sep1.BorderSizePixel = 0
                Sep1.Position = UDim2.new(0, 0, 0, 10)
                Sep1.Size = UDim2.new(0, 150, 0, 1)
    
                SepLabel.Name = "SepLabel"
                SepLabel.Parent = Seperator
                SepLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SepLabel.BackgroundTransparency = 1.000
                SepLabel.Position = UDim2.new(0, 95, 0, 0)
                SepLabel.Size = UDim2.new(0, 255, 0, 20)
                SepLabel.Font = Enum.Font.Gotham
                SepLabel.Text = text
                SepLabel.TextColor3 = Color3.fromRGB(225,225,225)
                SepLabel.TextSize = 11.000
    
                Sep2.Name = "Sep2"
                Sep2.Parent = Seperator
                Sep2.BackgroundColor3 = Color3.fromRGB(255,0,0)
                Sep2.BorderSizePixel = 0
                Sep2.Position = UDim2.new(0, 305, 0, 10)
                Sep2.Size = UDim2.new(0, 150, 0, 1)
            end
            function main:AddLine()
                local Line = Instance.new("Frame")
                local Linee = Instance.new("Frame")
    
                Line.Name = "Line"
                Line.Parent = ScrollTab
                Line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Line.BackgroundTransparency = 1.000
                Line.ClipsDescendants = true
                Line.Size = UDim2.new(0, 455, 0, 20)
    
                Linee.Name = "Linee"
                Linee.Parent = Line
                Linee.BackgroundColor3 = Color3.fromRGB(255,0,0)
                Linee.BorderSizePixel = 0
                Linee.Position = UDim2.new(0, 0, 0, 10)
                Linee.Size = UDim2.new(0, 455, 0, 1)
            end
            function main:AddLabel(text)
                local Label = Instance.new("TextLabel")
                local PaddingLabel = Instance.new("UIPadding")
                local labell = {}
        
                Label.Name = "Label"
                Label.Parent = ScrollTab
                Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Label.BackgroundTransparency = 1.000
                Label.Size = UDim2.new(0, 455, 0, 20)
                Label.Font = Enum.Font.Gotham
                Label.TextColor3 = Color3.fromRGB(225, 225, 225)
                Label.TextSize = 11.000
                Label.Text = text
                Label.TextXAlignment = Enum.TextXAlignment.Left
    
                PaddingLabel.PaddingLeft = UDim.new(0,10)
                PaddingLabel.Parent = Label
                PaddingLabel.Name = "PaddingLabel"
        
                function labell:Set(newtext)
                    Label.Text = newtext
                end
    
                return labell
            end
            
            return main
        end
        return uitab
    end
    
    --------------------------------------------------------------------

    local ScreenGui = Instance.new("ScreenGui")
    local Toggle = Instance.new("TextButton")
    local UICornerT = Instance.new("UICorner")
	
    ScreenGui.Name = "ScreenGui"
    ScreenGui.Parent = game.CoreGui
    
    Toggle.Name = "Toggle"
    Toggle.Parent = ScreenGui
    Toggle.BackgroundColor3 = Color3.fromRGB(1, 1, 1)
    Toggle.Position = UDim2.new(0.015, 0, 0.03, 0)
    Toggle.Size = UDim2.new(0, 50, 0, 50)
    Toggle.Font = Enum.Font.GothamBlack
	Toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Toggle.BorderSizePixel = 0
	Toggle.BackgroundTransparency = 0.9
	Toggle.TextSize = 60.000
    Toggle.TextColor3 = Color3.fromRGB(999, 0, 0)
    Toggle.TextScaled = false
	Toggle.TextWrapped = true
	Toggle.Active = true
	Toggle.Draggable = true
    Toggle.MouseButton1Down:connect(function()
        game:GetService("VirtualInputManager"):SendKeyEvent(true,277,false,game)
        game:GetService("VirtualInputManager"):SendKeyEvent(false,277,false,game)

    end)
	
	
	
	Toggle.Text = "㊀" 
        spawn(function()
            while wait() do
                pcall(function()
                    wait(0.1) 
                    game:GetService('TweenService'):Create(
                        Toggle,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                        {TextColor3 = Color3.fromRGB(999, 0, 0)}					
                    ):Play() 
                    wait(.5)            
                    game:GetService('TweenService'):Create(
                        Toggle,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                        {TextColor3 = Color3.fromRGB(999, 855, 0)}
                    ):Play() 
                    wait(.5)            
                    game:GetService('TweenService'):Create(
                        Toggle,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                        {TextColor3 = Color3.fromRGB(999, 999, 0)}
                    ):Play() 
                    wait(.5)            
                    game:GetService('TweenService'):Create(
                        Toggle,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                        {TextColor3 = Color3.fromRGB(0, 999, 0)}
                    ):Play() 
                    wait(.5)            
                    game:GetService('TweenService'):Create(
                        Toggle,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                        {TextColor3 = Color3.fromRGB(0, 999, 999)}
                    ):Play() 
                    wait(.5)            
                    game:GetService('TweenService'):Create(
                        Toggle,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                        {TextColor3 = Color3.fromRGB(0, 855, 999)}
                    ):Play() 
                    wait(.5)            
                    game:GetService('TweenService'):Create(
                        Toggle,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                        {TextColor3 = Color3.fromRGB(999, 0, 855)}
                    ):Play() 
                    wait(.5)            
                    game:GetService('TweenService'):Create(
                        Toggle,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                        {TextColor3 = Color3.fromRGB(999, 0, 855)}
                    ):Play() 
                    wait(.5)
                end)
            end
        end)
		

	
	UICornerT.CornerRadius = UDim.new(0, 50)
	UICornerT.Parent = Toggle

	
	
    --------------------------------------------------------------------
    local RenUi = library:AddWindow("      B Genesis | V 1.2",Enum.KeyCode.Insert)
    --------------------------------------------------------------------
    local Main = RenUi:AddTab("Main","")
    local BloxFruit = RenUi:AddTab("Blox Fruit","")
	local PetSimX = RenUi:AddTab("Pet Simulator X","")
	local KingLegacy = RenUi:AddTab("King Legacy","")
	local ShindoLife = RenUi:AddTab("Shindo Life","")
	local Parkour = RenUi:AddTab("Parkour","")
	local Arsenal = RenUi:AddTab("Arsenal","")
	local DaHood = RenUi:AddTab("Da Hood","")
	local NinjaLegends = RenUi:AddTab("Ninja Legends","")
	local BedWars = RenUi:AddTab("Bed Wars","")
	local MM2 = RenUi:AddTab("Murder Mystery 2","")
	local TheRake = RenUi:AddTab("The Rake","")
	local PhantomForces = RenUi:AddTab("Phantom Forces","")
	local KAT = RenUi:AddTab("Knife Ability Test","")
	local TheMimic = RenUi:AddTab("The MIMIC","")
	local RoGhoul = RenUi:AddTab("Ro-Ghoul","")
	local Apeirophobia = RenUi:AddTab("Apeirophobia","")
	
    --------------------------------------------------------------------
	
	
    Main:AddSeperator("Main")
	
    
    Time = Main:AddLabel("Server Time")
    
    function UpdateTime()
        local GameTime = math.floor(workspace.DistributedGameTime+0.5)
        local Hour = math.floor(GameTime/(60^2))%24
        local Minute = math.floor(GameTime/(60^1))%60
        local Second = math.floor(GameTime/(60^0))%60
        Time:Set("Execute Timer: Hr(s) : "..Hour.." Min(s) : "..Minute.." Sec(s) : "..Second)
    end
    
    spawn(function()
        while task.wait() do
            pcall(function()
                UpdateTime()
            end)
        end
    end)
	
	Main:AddLabel("")
	local Current = Main:AddLabel("Crdts : MST")
	local Current = Main:AddLabel("Work by : Ainxy Tokisan")
	local Current = Main:AddLabel("Special Thanks For All Script SOURCE")
	Main:AddLabel("")
	
	--------------------------------------------------------------------	
	
	Main:AddSeperator("Other Script")
	
	Main:AddButton("Universal ESP wALLHACK",false,function(value)
		loadstring(game:HttpGet"https://raw.githubusercontent.com/raw-scriptpastebin/FE/main/UNIVERSAL_ESP")();
	end)
	--------------------------------------------------------------------
	Main:AddButton("ESP + Auto Aim + Hud Button: [P]",false,function(value)
		loadstring(game:HttpGet"https://raw.githubusercontent.com/raw-scriptpastebin/FE/main/Wallhack_Aim_Esp_Hud",false)()
	end)
	
	Main:AddButton("Bone ESP Universal", function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/TheNuggetEater05/ekaMiffutSmodnaR/main/GlobalR6SkeletonESP.lua"))()

shared.BoneESP_Settings = {
    Circle_Visible = false,
    Circle_Radius = 3,
    BoneESP_Color = Color3.fromRGB(255,255,255)
};	
	end)
	--------------------------------------------------------------------
	Main:AddButton("Walk Speed 80%",function()
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 80;
    end)
	--------------------------------------------------------------------
	Main:AddButton("Infinite Jump",false,function(value)
		loadstring(game:HttpGet"https://raw.githubusercontent.com/raw-scriptpastebin/FE/main/Infinite_Jump")();
	end)
	--------------------------------------------------------------------
	spawn(function()
        pcall(function()
            game:GetService("RunService").Stepped:Connect(function()
                if _G.NoClip then
                    for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                        if v:IsA("BasePart") then
                            v.CanCollide = false    
                        end
                    end
                end
            end)
        end)
    end)
	
	
	Main:AddToggle("No Clip",false,function(value)
        _G.NoClip = value
    end)
	
	--------------------------------------------------------------------
	function fly()
        local mouse=game:GetService("Players").LocalPlayer:GetMouse''
        localplayer=game:GetService("Players").LocalPlayer
        game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart")
        local torso = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
        local speedSET=25
        local keys={a=false,d=false,w=false,s=false}
        local e1
        local e2
        local function start()
            local pos = Instance.new("BodyPosition",torso)
            local gyro = Instance.new("BodyGyro",torso)
            pos.Name="EPIXPOS"
            pos.maxForce = Vector3.new(math.huge, math.huge, math.huge)
            pos.position = torso.Position
            gyro.maxTorque = Vector3.new(9e9, 9e9, 9e9)
            gyro.CFrame = torso.CFrame
            repeat
                    wait()
                    localplayer.Character.Humanoid.PlatformStand=true
                    local new=gyro.CFrame - gyro.CFrame.p + pos.position
                    if not keys.w and not keys.s and not keys.a and not keys.d then
                    speed=1
                    end
                    if keys.w then
                    new = new + workspace.CurrentCamera.CoordinateFrame.lookVector * speed
                    speed=speed+speedSET
                    end
                    if keys.s then
                    new = new - workspace.CurrentCamera.CoordinateFrame.lookVector * speed
                    speed=speed+speedSET
                    end
                    if keys.d then
                    new = new * CFrame.new(speed,0,0)
                    speed=speed+speedSET
                    end
                    if keys.a then
                    new = new * CFrame.new(-speed,0,0)
                    speed=speed+speedSET
                    end
                    if speed>speedSET then
                    speed=speedSET
                    end
                    pos.position=new.p
                    if keys.w then
                    gyro.CFrame = workspace.CurrentCamera.CoordinateFrame*CFrame.Angles(-math.rad(speed*15),0,0)
                    elseif keys.s then
                    gyro.CFrame = workspace.CurrentCamera.CoordinateFrame*CFrame.Angles(math.rad(speed*15),0,0)
                    else
                    gyro.CFrame = workspace.CurrentCamera.CoordinateFrame
                    end
            until not Fly
            if gyro then 
                    gyro:Destroy() 
            end
            if pos then 
                    pos:Destroy() 
            end
            flying=false
            localplayer.Character.Humanoid.PlatformStand=false
            speed=0
        end
        e1=mouse.KeyDown:connect(function(key)
            if not torso or not torso.Parent then 
                    flying=false e1:disconnect() e2:disconnect() return 
            end
            if key=="w" then
                keys.w=true
            elseif key=="s" then
                keys.s=true
            elseif key=="a" then
                keys.a=true
            elseif key=="d" then
                keys.d=true
            end
        end)
        e2=mouse.KeyUp:connect(function(key)
            if key=="w" then
                keys.w=false
            elseif key=="s" then
                keys.s=false
            elseif key=="a" then
                keys.a=false
            elseif key=="d" then
                keys.d=false
            end
        end)
        start()
    end
	
	Main:AddToggle("Fly",false,function(value)
        Fly = value
    end)
    
    spawn(function()
        while wait() do
            pcall(function()
                if Fly then
                    fly()
                end
            end)
        end
    end)
	--------------------------------------------------------------------
	
	Main:AddButton("[COPY] Discord Server",function()
        setclipboard("https://discord.gg/BGTc7A7YyE") ;
    end)
	Main:AddButton("[COPY] Facebook Group",function()
        setclipboard("https://www.facebook.com/groups/5093376977421920") ;
    end)
	
	Main:AddButton("FPS Boost",function()
		loadstring(game:HttpGet"https://raw.githubusercontent.com/raw-scriptpastebin/FE/main/FPS_BOOST")();
    end)
	
	Main:AddButton("Rejoin Server",function()
		loadstring(game:HttpGet"https://raw.githubusercontent.com/raw-scriptpastebin/FE/main/Rejoin_Server")();
    end)
	
	Main:AddButton("Low Server Hop",function()
        local module = loadstring(game:HttpGet"https://raw.githubusercontent.com/raw-scriptpastebin/FE/main/Server_Hop_Settings")()
		module:Teleport(game.PlaceId) ;
    end)
	
	Main:AddButton("Lazium Hub", function()
		loadstring(game:HttpGet"https://raw.githubusercontent.com/CheapeeWastaken/Lazium/main/TheMain")();	
	end)
	
	Main:AddLabel("")
	Main:AddSeperator("Settings")
	Main:AddLabel("")
	local Current = Main:AddLabel("Hide GUI: Press [INSERT]")
	local Current = Main:AddLabel("")
	
	Main:AddButton("Destroy | Delete GUI", function()
        local ui = game.CoreGui:FindFirstChild("UlLib")
        if ui then
            ui:Destroy()
			Toggle.Visible = false
        end
    end)
	
	
	--------------------------------------------------------------------
	BloxFruit:AddSeperator("Scripts")
	
	BloxFruit:AddButton("Auto Farm Chest", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Cesare0328/my-scripts/main/fxss%20bf.lua"))();
end)

BloxFruit:AddButton("HoHo Hub", function()
loadstring(game:HttpGet"https://raw.githubusercontent.com/acsu1234/HOHO_H/main/Loading_UI")();
end)

BloxFruit:AddButton("Mukuro Hub", function()
    loadstring(game:HttpGet"https://raw.githubusercontent.com/xQuartyx/DonateMe/main/ScriptLoader")();
end)

BloxFruit:AddButton("Maru X Hub", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/joi-droid/MaruHubBF/main/GOHANSSJ3'))();
end)

BloxFruit:AddButton("Ripper Free", function()
    _G.Color = Color3.fromRGB(52, 190, 255)
loadstring(game:HttpGet("https://raw.githubusercontent.com/hajibeza/RIPPER-HUB/main/NEWBF.lua"))();
end)

BloxFruit:AddButton("Ripper Hub", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/hajibeza/RIPPER-HUB/main/BFMobile.lua'))();
end)

BloxFruit:AddButton("LoL Hub", function()
    spawn(function()     pcall(function() loadstring(game:HttpGet('https://raw.githubusercontent.com/kickTh/Cake/main/Ren_Hub_mobile_edit_Me.txt'))() end) end);
end)

BloxFruit:AddButton("Power X Hub", function()
	_G.Color = Color3.fromRGB(255,255,255)
loadstring(game:HttpGet("https://raw.githubusercontent.com/PowerxCANDYYY/NaMo/main/BFPOWERXHUBv2.lua"))();
end)

BloxFruit:AddButton("Some Hub", function()
	_G.Color = Color3.fromRGB(255,255,255) 
loadstring(game:HttpGet"https://raw.githubusercontent.com/kickTh/SCRIPT-SOME-X-HUB/main/README.md")();
end)

BloxFruit:AddButton("Lunar Hub", function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/Cve-Hub/LnHub/main/README.md'))();
end)

BloxFruit:AddButton("SMZ Hub", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Frerfgzz/free-script/main/SMZHUBv2BETA"))();
end)

BloxFruit:AddButton("Thunder Hub", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ThunderZ-HUB/HUB/main/Script"))();
end)

BloxFruit:AddButton("Lazer Hub", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Lazerxl/overlazerxkaito-nahee/main/README.md"))();
end)

BloxFruit:AddButton("Ren Hub Mobile", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/SHAREHACK/bloxfruit/main/free'))();
end)

BloxFruit:AddButton("Ren Hub PC/Mobile", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/SHAREHACK/script/main/renhuball'))();
end)

BloxFruit:AddButton("NetNa Hub", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/NinoGod/NetnaYay/8d21ce23346c500c93bb8b4a71f7791e4058a70b/startload.lua'))();
end)

BloxFruit:AddButton("ATR Hub PC/Mobile", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/scriptpastebin/raw/main/ATR",true))();
end)

BloxFruit:AddButton("Zerex Hub", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/sasaff94/Zerex-HUB-BF/main/README.md"))();
end)

BloxFruit:AddButton("META WARE", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/x2FIWz/SCRIPT/main/MOBILE/METAWARE.lua'))();
end)

BloxFruit:AddButton("SG 195", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/SG1975/main/hohoPJ.lua'))();
end)

BloxFruit:AddButton("Aaryn's Hub", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/jE85VHx8", true))();	
end)
	
	--------------------------------------------------------------------
	PetSimX:AddSeperator("Scripts")
	
	PetSimX:AddButton("SaZa Hub", function()
    loadstring(game:HttpGet"https://rawscripts.net/raw/SAZA-HUB_496")();
end)

PetSimX:AddButton("HoHo Hub", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HOHO_H/main/Loading_UI'))();
end)

PetSimX:AddButton("BlackTrap Hub", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/BdvUGb2q"))();
end)

PetSimX:AddButton("Void Hub", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Wind596/VoidHub/main/WiningDediy", true))();
end)

PetSimX:AddButton("BlackGamer Hub", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/BLACKGAMER1221/Pet-Simulator-X/main/BK%20Pet.lua"))()
end)

PetSimX:AddButton("Project Meow Hub", function()
    loadstring(game:HttpGet"https://rawscripts.net/raw/Project-Meow_421")();
end)
PetSimX:AddButton("Nexus Hub", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/GwnStefano/NexusHub/main/Main", true))();
end)

PetSimX:AddButton("FullHover Board", function()
    local tbl = require(game.ReplicatedStorage.Framework.Modules.Client["4 | Save"]).Get()
tbl.Hoverboards = {}
for i,v in pairs(game.ReplicatedStorage.Game.Hoverboards:GetChildren())do
table.insert(tbl.Hoverboards, v.Name)
end
getsenv(game.Players.LocalPlayer.PlayerScripts.Scripts.GUIs.Hoverboards).Update()
getsenv(game.Players.LocalPlayer.PlayerScripts.Scripts.GUIs.Hoverboards).Equip = function(board)
tbl.EquippedHoverboard = board
getsenv(game.Players.LocalPlayer.PlayerScripts.Scripts.GUIs.Hoverboards).Update()
end;
end)

PetSimX:AddButton("SG 195", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/SG1975/main/hohoPJ.lua'))();
end)

	--------------------------------------------------------------------
	KingLegacy:AddSeperator("Scripts")
	
	KingLegacy:AddButton("King Legacy Script", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/xDepressionx/Free-Script/main/KingLegacy.lua"))();
end)

KingLegacy:AddButton("HoHo Hub", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HOHO_H/main/Loading_UI'))();
end)

KingLegacy:AddButton("Ripper Hub", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/hajibeza/RIPPER-HUB/main/King%20Leagacy"))();	
end)

KingLegacy:AddButton("Maru Hub", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Marux-Script/MaruHub/main/KingLegzy.lua"))();	
end)
KingLegacy:AddButton("River Hub", function()	
    pcall(function()
loadstring(game:HttpGet("http://riverhub.xyz/" .. tostring(game.PlaceId) .. ".lua"))()
end);	
end)

KingLegacy:AddButton("Nexus Hub [BUGGY]", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/GwnStefano/NexusHub/main/Main", true))();
end)

	--------------------------------------------------------------------
	ShindoLife:AddSeperator("Scripts")
	
	ShindoLife:AddButton("Spy Hub", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/6Wumpus6/SpyHub/main/ShindoLife", true))();	
end)

ShindoLife:AddButton("Project Meow", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/L1ZOT/Project-PJM/main/shinido"))();	
end)

ShindoLife:AddButton("Premiere Hub", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/PremierHub/Data/main/code.lua"))();	
end)
	
	--------------------------------------------------------------------
	Parkour:AddSeperator("Scripts")
	Parkour:AddButton("Parkour Hub", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/LegoHacks/Parkour/main/Main.lua"))();	
end)

Parkour:AddButton("Auto Grab Bag", function()
    for i,v in pairs(workspace:GetChildren()) do
    if v:FindFirstChild("Rarity") then
        if v.Dropped.Value == false then
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.Main.CFrame
            print("BAG!!! POGGERS")
            wait(1)
        end
    end
end;	
end)

	--------------------------------------------------------------------
	Arsenal:AddSeperator("Scripts")
	
	Arsenal:AddButton("Unknown Script", function()
    function getplrsname() for i,v in pairs(game:GetChildren()) do if v.ClassName == "Players" then return v.Name end end end local players = getplrsname() local plr = game[players].LocalPlayer coroutine.resume(coroutine.create(function() while wait(1) do coroutine.resume(coroutine.create(function() for _,v in pairs(game[players]:GetPlayers()) do if v.Name ~= plr.Name and v.Character then v.Character.RightUpperLeg.CanCollide = false v.Character.RightUpperLeg.Transparency = 10 v.Character.RightUpperLeg.Size = Vector3.new(21,21,21) v.Character.LeftUpperLeg.CanCollide = false v.Character.LeftUpperLeg.Transparency = 10 v.Character.LeftUpperLeg.Size = Vector3.new(21,21,21) v.Character.HeadHB.CanCollide = false v.Character.HeadHB.Transparency = 10 v.Character.HeadHB.Size = Vector3.new(21,21,21) v.Character.HumanoidRootPart.CanCollide = false v.Character.HumanoidRootPart.Transparency = 10 v.Character.HumanoidRootPart.Size = Vector3.new(21,21,21) end end end)) end end));	
end)

Arsenal:AddButton("Bolts Hub", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/fusiongreg/BoltsHubV5/main/Main", true))();
end)

Arsenal:AddButton("Arsenal Mods", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/YJmkfmeN" ,true))();
end)

Arsenal:AddButton("Nexus Hub", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/GwnStefano/NexusHub/main/Main", true))();
end)

Arsenal:AddButton("Aaryn's Hub", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/jE85VHx8", true))();	
end)

Arsenal:AddButton("Unfair Hub", function()
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/rblxscriptsnet/unfair/main/rblxhub.lua'),true))();	
end)

	--------------------------------------------------------------------
	DaHood:AddSeperator("Scripts")
	
	DaHood:AddButton("Faded Script", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/NighterEpic/Faded/main/YesEpic", true))();
end)
DaHood:AddButton("Noob Hub", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/NOOBHUBX/Da-hood/main/NOOB%20HUB.Lua'))();
end)

DaHood:AddButton("Ray X Gui", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/SpaceYes/Lua/Main/DaHood.Lua'))();	
end)

DaHood:AddButton("ChariotsWare", function()
    loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Rippeed/DaHoodinary/main/chariotsware"))();	
end)

DaHood:AddButton("Enclosed Hub", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Pvpahh/enclosed/main/enclosed'))();	
end)

DaHood:AddButton("Vault Paste", function()
    loadstring(game:HttpGet('https://pastebin.com/raw/gxC0siL2'))();	
end)

DaHood:AddButton("Bolts Hub", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/fusiongreg/BoltsHubV5/main/Main", true))();	
end)

DaHood:AddButton("Aaryn's Hub", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/jE85VHx8", true))();	
end)

DaHood:AddButton("Unfair Hub", function()
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/rblxscriptsnet/unfair/main/rblxhub.lua'),true))();	
end)

	--------------------------------------------------------------------
	NinjaLegends:AddSeperator("Scripts")
	
	NinjaLegends:AddButton("Unknown Ninja Legends", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/scriptpastebin/raw/main/41"))();	
end)

NinjaLegends:AddButton("Strike Hub", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/StormSKz12/StirkeHub1/main/Gameincluded"))();	
end)

NinjaLegends:AddButton("ReaperX Hub", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/HydraVirgo/ninjalegendsfreegui/main/obfusc", true))();	
end)

NinjaLegends:AddButton("Ninja Legends", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Zepsyy2/asd/main/Ninja%20Legends.lua"))();	
end)

	--------------------------------------------------------------------
	BedWars:AddSeperator("Scripts")
	
	BedWars:AddButton("Bolts Hub", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/fusiongreg/BoltsHubV5/main/Main", true))();	
end)

BedWars:AddButton("Aaryn's Hub", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/jE85VHx8", true))();	
end)

BedWars:AddButton("BedWarsMonkey Hub", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/KuriWasTaken/MonkeyScripts/main/BedWarsMonkey.lua"))();	
end)

BedWars:AddButton("Unfair Hub", function()
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/rblxscriptsnet/unfair/main/rblxhub.lua'),true))();	
end)
	--------------------------------------------------------------------
	MM2:AddSeperator("Scripts")
	
	MM2:AddButton("Vynixus's MM2 OP SCRIPTS", function()
    loadstring(game:GetObjects("rbxassetid://4001118261")[1].Source)();	
end)

MM2:AddButton("Eclipse Hub", function()
    local a,b,c,d,e=loadstring,request or http_request or (http and http.request) or (syn and syn.request),assert,tostring,"https://api.eclipsehub.xyz/auth"c(a and b,"Executor not Supported")a(b({Url=e.."\?\107e\121\61"..d(mainKey),Headers={["User-Agent"]="Eclipse"}}).Body)()
;	
end)

MM2:AddButton("OP SCRIPTS", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Drifter0507/scripts/main/mm2", true))();	
end)

MM2:AddButton("Bolts Hub", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/fusiongreg/BoltsHubV5/main/Main", true))();	
end)

MM2:AddButton("Unfair Hub", function()
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/rblxscriptsnet/unfair/main/rblxhub.lua'),true))();	
end)
	--------------------------------------------------------------------
	TheRake:AddSeperator("Scripts")
	
	TheRake:AddButton("ADMIN COMMANDS", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/artas01/artas01/main/TheRakeRemastered_byHerades"))();	
end)

TheRake:AddButton("The Rake | Synapse Edition", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/TvaYiRxt"))();	
end)

TheRake:AddButton("OP Script", function()
	loadstring(game:HttpGet('https://gist.githubusercontent.com/nknownhacker/6e4486b679c9af96842c4fb4d62219cd/raw/ba5d3f614f5447615d5ed9780d3f4415ccfc4257/gistfile1.txt'))();	
end)
	--------------------------------------------------------------------
	PhantomForces:AddSeperator("Scripts")
	
	PhantomForces:AddButton("Bolts Hub", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/fusiongreg/BoltsHubV5/main/Main", true))();	
end)

PhantomForces:AddButton("Aaryn's Hub", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/jE85VHx8", true))();	
end)

PhantomForces:AddButton("Unfair Hub", function()
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/rblxscriptsnet/unfair/main/rblxhub.lua'),true))();	
end)
	--------------------------------------------------------------------
	KAT:AddSeperator("Scripts")
	
	KAT:AddButton("Dark Hub", function()
    loadstring(game:HttpGet("http://darkhub.xyz/remote-script.lua", true))();	
end)
KAT:AddButton("KAT | Sinister Gui", function()
    loadstring(Game:HttpGet("https://gist.githubusercontent.com/qp39rh421984y812/d59f1517d9ed447698dcdbf97bd91b02/raw/360823c8df903d52d2d089a90b3e6106191f8df8/Katmonke"))();	
end)
KAT:AddButton("KAT OP Gui", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/PPg2YJar", true))();	
end)

KAT:AddButton("Nexus Hub", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/GwnStefano/NexusHub/main/Main", true))();	
end)

KAT:AddButton("Bolts Hub", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/fusiongreg/BoltsHubV5/main/Main", true))();	
end)

KAT:AddButton("Unfair Hub", function()
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/rblxscriptsnet/unfair/main/rblxhub.lua'),true))();	
end)

KAT:AddButton("SoggyWare", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/SunkenMuch/Soggyware/main/Main',true))();	
end)

KAT:AddButton("V.G Hub", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/1201for/V.G-Hub/main/V.Ghub'))();	
end)
	--------------------------------------------------------------------
	--------------------------------------------------------------------
	TheMimic:AddSeperator("Scripts")
	
	TheMimic:AddButton("The Mimic (Use Inside the Game) [Monster Esp/Door Ecp/Full Bright]", function()
		loadstring(game:HttpGet("https://pastebin.com/raw/NCaKSm3N"))();	
	end)
	
	TheMimic:AddButton("NoWMoN x KTollT", function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/KTollT/NewGUI/main/README.md'))();	
	end)
	--------------------------------------------------------------------
	RoGhoul:AddSeperator("Scripts")
	
	RoGhoul:AddButton("Ro-Ghoul Script", function()
    loadstring(game:HttpGetAsync(("https://raw.githubusercontent.com/z4gs/scripts/master/Ro-Ghoul%20Auto%20Farm.lua")))();	
end)

RoGhoul:AddButton("Ro-Ghoul Main", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/JRL-lav/Main/main/Ro-Ghoul"))();	
end)
	--------------------------------------------------------------------
	Apeirophobia:AddSeperator("Scripts")
	
	Apeirophobia:AddButton("Apeirophobia 1 Script", function()
		loadstring(game:HttpGet("https://soggyhubv2.vercel.app"))();
	end)