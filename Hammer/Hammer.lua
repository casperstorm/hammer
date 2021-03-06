local function Hammer()
    local repairAllCost, canRepair = GetRepairAllCost()
    local money = GetMoney()

    if canRepair == true then
        if repairAllCost <= money then
            RepairAllItems()
            DEFAULT_CHAT_FRAME:AddMessage(
                "Equipment was repaired for " ..
                    GetCoinTextureString(repairAllCost))
        else
            DEFAULT_CHAT_FRAME:AddMessage("Insufficient funds to repair")
        end
    end
end

local function OnEvent(self, event)
    if event == "MERCHANT_SHOW" and CanMerchantRepair() then Hammer() end
end

local f = CreateFrame("FRAME")
f:RegisterEvent("MERCHANT_SHOW")
f:SetScript("OnEvent", OnEvent)
