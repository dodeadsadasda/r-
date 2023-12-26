local itemName = "Money"
local AmountA = 1000
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

if LocalPlayer and LocalPlayer:FindFirstChild("Inventory") then
    local item = LocalPlayer.Inventory:FindFirstChild(itemName)

    if item then
        local AmountC = item.Value
        item.Value = AmountC + AmountA

        local NNH = {
            [1] = "Success",
            [2] = "Give Item !",
            [3] = "เพิ่ม [" .. itemName .. "] จำนวน: " .. AmountA .. " จำนวน [" .. itemName .. "] คงเหลือ: " .. item.Value
        }

        game:GetService("ReplicatedStorage").pNotifyStorage.pNotifyEvent:FireServer(unpack(NNH))
    else
        local NNH = {
            [1] = "Error",
            [2] = "Give Item !",
            [3] = "ไม่พบค่า " .. itemName .. " ในกระเป๋า"
        }

        game:GetService("ReplicatedStorage").pNotifyStorage.pNotifyEvent:FireServer(unpack(NNH))
    end
else
    local NNH = {
        [1] = "Error",
        [2] = "Give Item !",
        [3] = "ไม่พบค่า LocalPlayer หรือ Inventory"
    }

    game:GetService("ReplicatedStorage").pNotifyStorage.pNotifyEvent:FireServer(unpack(NNH))
end
