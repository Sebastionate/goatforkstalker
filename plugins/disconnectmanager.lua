local PLUGIN = PLUGIN
PLUGIN.name = "Disconnect Manager"
PLUGIN.author = "Scrat Knapp"
PLUGIN.desc = "Handles disconnections to ensure stat changes are not kept between sessions, breaking some buffs."


function PLUGIN:OnCharacterDisconnect(client, character)

	local inventory = character:GetInventory()
	local equippedItems = {} 

	character:SetData("usingCocaine", false)
	character:SetData("usingHercules", false)
	character:SetData("usingRadioprotectant", false)
	character:SetData("usingAntidote", false)
	character:SetData("usingVinca", false)
	character:SetData("usingPsyblock", false)
	character:SetData("usingStim", nil)
	character:SetData("usingSciStim", false)
	character:SetData("timertable", {})


	local boosts = character:GetBoosts()

	for attribID, v in pairs(boosts) do
		for boostID, _ in pairs(v) do
			character:RemoveBoost(boostID, attribID)
		end
	end
	
end 


