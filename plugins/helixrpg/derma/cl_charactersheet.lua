local PLUGIN = PLUGIN
-- Create a new PANEL table
local PANEL = {}
-- Initialize the panel
function PANEL:Init()
	local client = LocalPlayer()
	local character = client:GetCharacter()
	self:SetSize(800, 600)
	self:SetTitle("")
	self:Center()
	self.Paint = function(_, w, h)
		draw.RoundedBox(8, 0, 0, w, h, Color(30, 30, 30, 255))
	end

	local moneyLabel = vgui.Create("DLabel", self)
	moneyLabel:SetPos(20, 50)
	moneyLabel:SetText("Caps: " .. character:GetMoney())
	moneyLabel:SetFont("CustomFontLarge")
	moneyLabel:SetTextColor( Color( 0, 153, 0) )
	moneyLabel:SizeToContents()
	local clientNameLabel = vgui.Create("DLabel", self)
	clientNameLabel:SetPos(20, 20)
	clientNameLabel:SetText("Player: " .. character:GetName())
	clientNameLabel:SetFont("CustomFontLarge")
	clientNameLabel:SetTextColor( Color( 0, 153, 0) )
	clientNameLabel:SizeToContents()
	
	local levelLabel = vgui.Create("DLabel", self)
	levelLabel:SetPos(295, 20)
	levelLabel:SetText("Level: " .. character:GetLevel())
	levelLabel:SetFont("CustomFontLarge")
	levelLabel:SetTextColor( Color( 0, 153, 0) )
	levelLabel:SizeToContents()

	local xpuntilLabel = vgui.Create("DLabel", self)
	xpuntilLabel:SetPos(295, 50)
	xpuntilLabel:SetText("Next Level In: " .. character:GetXPToNextLevel() - character:GetXP())
	xpuntilLabel:SetFont("CustomFontLarge")
	xpuntilLabel:SetTextColor( Color( 0, 153, 0) )
	xpuntilLabel:SizeToContents()


	local lifetimeXP = vgui.Create("DLabel", self)
	lifetimeXP:SetPos(295, 80)
	lifetimeXP:SetText("Lifetime XP: " .. character:GetLifetimeXP())
	lifetimeXP:SetFont("CustomFontLarge")
	lifetimeXP:SetTextColor( Color( 0, 153, 0) )
	lifetimeXP:SizeToContents()

	local DT = vgui.Create("DLabel", self)
	DT:SetPos(565, 20)
	DT:SetText("Damage Threshold: " .. client:GetTotalCharDt())
	DT:SetFont("CustomFontLarge")
	DT:SetTextColor( Color( 0, 153, 0) )
	DT:SizeToContents()

	local ET = vgui.Create("DLabel", self)
	ET:SetPos(565, 50)
	ET:SetText("Energy Threshold: " .. client:GetTotalCharEt())
	ET:SetFont("CustomFontLarge")
	ET:SetTextColor( Color( 0, 153, 0) )
	ET:SizeToContents()

	local DR = vgui.Create("DLabel", self)
	DR:SetPos(565, 80)
	DR:SetText("Damage Resistance: " .. client:GetTotalCharDr() .. "%")
	DR:SetFont("CustomFontLarge")
	DR:SetTextColor( Color( 0, 153, 0) )
	DR:SizeToContents()

	local skillPoints = vgui.Create("DLabel", self)
	skillPoints:SetPos(295, 120)
	skillPoints:SetText("Skill Points: " .. character:GetSkillPoints())
	skillPoints:SetFont("CustomFontLarge")
	skillPoints:SetTextColor( Color( 0, 153, 0) )
	skillPoints:SizeToContents()



	
	local health = vgui.Create("DLabel", self)
	health:SetPos(295, 160)
	health:SetText("Health: " .. character:GetCharcurrenthp() .. "/" .. client:GetTotalCharHp())
	health:SetFont("CustomFontLarge")
	health:SetTextColor( Color( 0, 153, 0) )
	health:SizeToContents()

	local AP = vgui.Create("DLabel", self)
	AP:SetPos(295, 190)
	AP:SetText("Action Points: " .. client:GetTotalCharAp())
	AP:SetFont("CustomFontLarge")
	AP:SetTextColor( Color( 0, 153, 0) )
	AP:SizeToContents()

	local radResist = vgui.Create("DLabel", self)
	radResist:SetPos(295, 220)
	radResist:SetText("Radiation Resistance: " .. client:GetTotalCharRadResist().. "%")
	radResist:SetFont("CustomFontLarge")
	radResist:SetTextColor( Color( 0, 153, 0) )
	radResist:SizeToContents()



	local attributesLabel = vgui.Create("DLabel", self)
	attributesLabel:SetPos(10, 120)
	attributesLabel:SetText("Attributes")
	attributesLabel:SetFont("CustomFontLarge")
	attributesLabel:SetTextColor( Color( 0, 153, 0) )
	attributesLabel:SizeToContents()
	local attributesPanel = vgui.Create("DPanel", self)
	attributesPanel:SetPos(10, attributesLabel:GetTall() + attributesLabel:GetY() + 5)
	attributesPanel:SetSize(200, 400)
	local yOffset = 10
	for uniqueID, attribute in pairs(ix.attributes.list) do
		local label = vgui.Create("DLabel", attributesPanel)
		label:SetText(attribute.name .. ": " .. character:GetAttribute(uniqueID, 0))
		label:SetFont("CustomFontDefault")
		label:SetTextColor( Color( 0, 153, 0) )
		label:SizeToContents()
		label:SetPos(5, yOffset)
		yOffset = yOffset + label:GetTall() + 10
	end

	-- Skills panel
	local skillsLabel = vgui.Create("DLabel", self)
	skillsLabel:SetPos(self:GetWide() - 220, 120)
	skillsLabel:SetText("Skills")
	skillsLabel:SetFont("CustomFontLarge")
	skillsLabel:SetTextColor( Color( 0, 153, 0) )
	skillsLabel:SizeToContents()
	local skillsPanel = vgui.Create("DPanel", self)
	skillsPanel:SetPos(self:GetWide() - 220, skillsLabel:GetTall() + skillsLabel:GetY() + 5)
	skillsPanel:SetSize(200, 400)
	local yOffsetSkills = 10
	-- Iterate through skills and create labels
	for id, skill in pairs(ix.skills.list) do
		local label = vgui.Create("DLabel", skillsPanel)
		label:SetText(skill.name .. ": " .. character:GetSkill(id, 0) .. "/50")
		label:SetFont("CustomFontDefault")
		label:SetTextColor( Color( 0, 153, 0) )
		label:SizeToContents()
		label:SetPos(5, yOffsetSkills)
		yOffsetSkills = yOffsetSkills + label:GetTall() + 10
	end



end

vgui.Register("ixcharsheet", PANEL, "DFrame")
hook.Add(
	"CreateMenuButtons",
	"Sheet",
	function(tabs)
		tabs["character sheet"] = function(container)
			container:Add("ixcharsheet")
		end
	end
)