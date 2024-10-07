-- NightlyLib Module Script
local NightlyLib = {}
local Library = {}

-- Create a function to make a window
function Library:MakeWindow(options)
    local window = Instance.new("ScreenGui")
    window.Name = options.Name
    window.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    -- Additional setup for the window goes here
    return window
end

-- Create a function to make a tab
function Library:MakeTab(options)
    local tab = Instance.new("Frame")
    tab.Name = options.Name
    tab.Parent = Library.Window -- Reference to the window created earlier

    -- Additional setup for the tab goes here
    return tab
end

-- Create a function to add a section
function Library:AddSection(options)
    local section = Instance.new("Frame")
    section.Name = options.Name
    section.Parent = Library.Tab -- Reference to the tab created earlier

    -- Additional setup for the section goes here
    return section
end

-- Create a function to make a notification
function Library:MakeNotification(options)
    local notification = Instance.new("Frame")
    notification.Name = options.Name
    notification.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    -- Additional setup for the notification goes here
end

-- Create a function to add a button
function Library:AddButton(options)
    local button = Instance.new("TextButton")
    button.Text = options.Name
    button.Parent = Library.Tab -- Reference to the tab created earlier

    button.MouseButton1Click:Connect(function()
        options.Callback()
    end)
end

-- This allows the library to be used with the syntax you provided
function NightlyLib:MakeWindow(options)
    return Library:MakeWindow(options)
end

function NightlyLib:MakeTab(options)
    return Library:MakeTab(options)
end

function NightlyLib:AddSection(options)
    return Library:AddSection(options)
end

function NightlyLib:MakeNotification(options)
    return Library:MakeNotification(options)
end

function NightlyLib:AddButton(options)
    return Library:AddButton(options)
end

return NightlyLib
