local Library = loadstring(game:GetObjects("rbxassetid://7657867786")[1].Source)("Pepsi's UI Library")

local Window = Library:CreateWindow({
    Name = 'Combat Warriors Spinbot',
    Themeable = {
        Info = 'Discord Server: VzYTJ7Y',
        Credit = true,
    },
    DefaultTheme = shared.themename or '{"__Designer.Colors.main":"4dbed9"}'
})

local GeneralTab = Window:CreateTab({
    Name = 'General'
})

local Section = GeneralTab:CreateSection({
    Name = 'Spinbot Controls',
    Side = 'Right'
})

-- Spinbot Control Variables
local SpinbotEnabled = false
local UserInputService = game:GetService("UserInputService")
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")

-- Default Keybind
local keybindKey = Enum.KeyCode.F  -- Default key for spinbot

-- Spin Function
local function spin()
    while SpinbotEnabled do
        hrp.CFrame = hrp.CFrame * CFrame.Angles(0, math.rad(40), 0)  -- Adjust spin speed here
        wait(0.01)  -- Adjust wait time for smoother spinning
    end
end

-- Keybind Input Handling
UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
    if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == keybindKey then
        if not SpinbotEnabled then
            SpinbotEnabled = true
            coroutine.wrap(spin)()  -- Start spinning in a coroutine to allow movement
        end
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == keybindKey then
        SpinbotEnabled = false
    end
end)

-- UI for changing keybind
local TextBox = Section:AddTextbox({
    Name = 'Set Spinbot Keybind',
    Flag = 'keybindTextbox',
    Value = keybindKey.Name,
    Callback = function(newKey)
        -- Change the keybind based on user input
        local keyEnum = Enum.KeyCode[newKey]
        if keyEnum then
            keybindKey = keyEnum
            Library.Notify({
                Text = "Spinbot Keybind set to: " .. newKey,
                Duration = 2
            })
        else
            Library.Notify({
                Text = "Invalid key! Please enter a valid key.",
                Duration = 2
            })
        end
    end
})

-- Notify on startup
Library.Notify({
    Text = "Spinbot Activated! Hold the '" .. keybindKey.Name .. "' key to spin.",
    Duration = 3
})
