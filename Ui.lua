local UI = {}

function UI:CreateFrame(parent, size, position, backgroundColor, draggable)
    local frame = Instance.new("Frame")
    frame.Size = size
    frame.Position = position
    frame.BackgroundColor3 = backgroundColor
    frame.Parent = parent
    frame.Active = true
    frame.Draggable = draggable

    return frame
end

function UI:CreateTextLabel(parent, text, size, position, textColor, backgroundColor)
    local label = Instance.new("TextLabel")
    label.Text = text
    label.Size = size
    label.Position = position
    label.TextColor3 = textColor
    label.BackgroundColor3 = backgroundColor
    label.Parent = parent

    return label
end

function UI:CreateButton(parent, text, size, position, textColor, backgroundColor, callback)
    local button = Instance.new("TextButton")
    button.Text = text
    button.Size = size
    button.Position = position
    button.TextColor3 = textColor
    button.BackgroundColor3 = backgroundColor
    button.Parent = parent

    button.MouseButton1Click:Connect(callback)

    return button
end

function UI:CreateSlider(parent, size, position, minValue, maxValue, initialValue, callback)
    local slider = Instance.new("Frame")
    slider.Size = size
    slider.Position = position
    slider.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    slider.Parent = parent

    local handle = Instance.new("Frame")
    handle.Size = UDim2.new(0, 10, 1, 0)
    handle.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    handle.Parent = slider

    handle.Position = UDim2.new((initialValue - minValue) / (maxValue - minValue), 0, 0, 0)

    handle.MouseDrag:Connect(function()
        local mouse = game.Players.LocalPlayer:GetMouse()
        local mouseX = mouse.X - slider.AbsolutePosition.X
        local newValue = math.clamp(minValue + ((mouseX / slider.AbsoluteSize.X) * (maxValue - minValue)), minValue, maxValue)

        handle.Position = UDim2.new((newValue - minValue) / (maxValue - minValue), 0, 0, 0)
        callback(newValue)
    end)

    return slider
end

return UI
