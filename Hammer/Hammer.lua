local function Hammer()
    local repairAllCost, canRepair = GetRepairAllCost()
    local money = GetMoney()

    if canRepair == true then
        if repairAllCost <= money then
            RepairAllItems()
            DEFAULT_CHAT_FRAME:AddMessage(
                "Equipment was repaired for " ..
                    FormatMoney(repairAllCost))
        else
            DEFAULT_CHAT_FRAME:AddMessage("Insufficient funds to repair")
        end
    end
end

local function OnEvent(self, event)
    if event == "MERCHANT_SHOW" and CanMerchantRepair() then Hammer() end
end

local function FormatMoney(amount)
	local gold = floor(amount / 100 / 100)
	local silver = floor((amount / 100) % 100)
	local copper = amount % 100
	local text = ""
	if gold > 0   then text = "|cffffd700"..gold.."g|r"           end
	if silver > 0 then text = text .. "|cffc7c7cf"..silver.."s|r" end
	if copper > 0 then text = text .. "|cffeda55f"..copper.."c|r" end
	return text ~= "" and text or "none"
end

local f = CreateFrame("FRAME")
f:RegisterEvent("MERCHANT_SHOW")
f:SetScript("OnEvent", OnEvent)
