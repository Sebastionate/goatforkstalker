local PLUGIN = PLUGIN

AddCSLuaFile()

SWEP.PrintName = "Combat Entity Mover"
SWEP.Slot = 0
SWEP.SlotPos = 1
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = false

SWEP.Author = ""
SWEP.ViewModelFOV = 45
SWEP.ViewModelFlip = false
SWEP.AnimPrefix	 = "rpg"

SWEP.ViewTranslation = 4

SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = ""
SWEP.Primary.Damage = 5
SWEP.Primary.Delay = 0.25

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = 0
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = ""

SWEP.UseHands = false
SWEP.LowerAngles = Angle(15, -10, -20)

SWEP.IsAlwaysLowered = true
SWEP.FireWhenLowered = true
SWEP.HoldType = "normal"

ALWAYS_RAISED["ix_combatmover"] = true

SWEP.ViewModel = ""
SWEP.WorldModel = ""

SWEP.Spawnable = true
SWEP.AdminSpawnable = true
SWEP.Category = "Helix - Combat"

SWEP.CEntMovementSwep = true

function SWEP:Initialize()
	self:SetHoldType(self.HoldType)
end

function SWEP:SelectTarget(entity)
    if (IsValid(entity) and entity.combatEntity) then
        if (SERVER) then
            self:SetNetVar("selected", entity)
            self:SetNetVar("selectedName", entity:Name())

            self.Owner:Notify("Selected " .. entity:Name() .. ".")
        end
    else
        if self:GetNetVar("selected") then
            if (SERVER) then
                self:SetNetVar("selected", nil)
                self.Owner:SetNetVar("selectedPreviousLocation", nil)

                self.Owner:Notify("Deselected.")
            end
        end
    end
end

function SWEP:PrimaryAttack()
    self:SetNextPrimaryFire(CurTime() + self.Primary.Delay)

    local trData = {}
        trData.start = self.Owner:GetShootPos()
        trData.endpos = trData.start + self.Owner:GetAimVector()*4096
        trData.filter = {self.Owner, self}
    local tr = util.TraceLine(trData)

    if tr.Hit then
        local selected = self:GetNetVar("selected")

        if (selected and IsValid(selected)) then
            if self.Owner:KeyDown(IN_SPEED) then
                selected:TurnTowards(tr.HitPos)
            else         
                selected:MovementStart(tr.HitPos)
            end
        end
    end
end

function SWEP:SecondaryAttack()
    local trData = {}
        trData.start = self.Owner:GetShootPos()
        trData.endpos = trData.start + self.Owner:GetAimVector()*4096
        trData.filter = {self.Owner, self}
    local tr = util.TraceLine(trData)

    if tr.Hit then
        local entity = tr.Entity

        self:SelectTarget(entity)

        if (SERVER) then
            self.Owner:SetNetVar("selectedPreviousLocation", entity:GetPos())
        end
    end
end

function SWEP:Reload()
end

if (CLIENT) then
    function SWEP:DrawHUD()
        local alpha = 255

        local selected = self:GetNetVar("selected")
        if selected and IsValid(selected) then
			local trData = {}
				trData.start = self.Owner:GetShootPos()
				trData.endpos = trData.start + self.Owner:GetAimVector()*4096
				trData.filter = {self.Owner, self}
			local tr = util.TraceLine(trData)

            local name = self:GetNetVar("selectedName", "Unnamed")
            ix.util.DrawText("Selected: " .. name, ScrW() * 0.5, ScrH() * 0.3, ColorAlpha(Color(50, 50, 255), alpha), 1, 1, "ixSmallFont", alpha * 1)
            ix.util.DrawText("Primary Fire to move to a selected location.", ScrW() * 0.5, ScrH() * 0.3 + 16, ColorAlpha(Color(50, 255, 50), alpha), 1, 1, "ixSmallFont", alpha * 1)
            ix.util.DrawText("Hold RUN and Primary Fire to turn towards a selected location.", ScrW() * 0.5, ScrH() * 0.3 + 32, ColorAlpha(Color(50, 255, 50), alpha), 1, 1, "ixSmallFont", alpha * 1)

            local distance = math.Round(math.ToMeters(selected:GetPos():Distance(tr.HitPos)), 0)
            ix.util.DrawText(distance .. "m", ScrW() * 0.52, ScrH() * 0.5, Color(255, 255, 255), 1, 1, nil, 255)
        end

        if ((self.nextCEntTrace or 0) < CurTime()) then
			local trData = {}
				trData.start = self.Owner:GetShootPos()
				trData.endpos = trData.start + self.Owner:GetAimVector()*4096
				trData.filter = {self.Owner, self}
			local tr = util.TraceLine(trData)

            if tr.Hit then
                local entity = tr.Entity

                if entity.combatEntity then
                    self.viewed = entity:Name()

                    self.nextCEntTrace = CurTime() + 1
                else
                    self.viewed = nil
                end
            end
        end

        if self.viewed then
            local name = self.viewed

            ix.util.DrawText("Looking at: " .. name, ScrW() * 0.5, ScrH() * 0.7, ColorAlpha(Color(255, 50, 50), alpha), 1, 1, "ixMediumFont", alpha * 1)
        end

        surface.SetDrawColor(0, 0, 0, 255)
        surface.DrawLine(ScrW() * 0.5 + 1, ScrH() * 0.49, ScrW() * 0.5 + 1, ScrH() * 0.51)
        surface.DrawLine(ScrW() * 0.49, ScrH() * 0.5 + 1, ScrW() * 0.51, ScrH() * 0.5 + 1)
        surface.SetDrawColor(255, 255, 255, 150)
        surface.DrawLine(ScrW() * 0.5, ScrH() * 0.49, ScrW() * 0.5, ScrH() * 0.51)
        surface.DrawLine(ScrW() * 0.49, ScrH() * 0.5, ScrW() * 0.51, ScrH() * 0.5)

        hook.Add("PreDrawHalos", "drawselectedhalos", function()
            local entities = {self:GetNetVar("selected")}
    
            if LocalPlayer():GetMoveType() == MOVETYPE_NOCLIP and !LocalPlayer():InVehicle() and LocalPlayer():GetActiveWeapon() == self then
                halo.Add(entities, Color(255, 255, 255), 2, 2, 4, true, true)
            end
        end)

        ix.util.DrawText("COMBAT ENTITY MOVER", ScrW() * 0.5, ScrH() * 0.15, Color(255, 255, 255), 1, 1, "ixBigFont", 255)
    end


    function PLUGIN:PostDrawOpaqueRenderables()
        local client = LocalPlayer()

        if client:GetMoveType() == MOVETYPE_NOCLIP and !client:InVehicle() then 
            local weapon = client:GetActiveWeapon()

            if weapon and (weapon.CEntCombatSwep or weapon.CEntMovementSwep) then
                local trData = {}
                    trData.start = client:GetShootPos()
                    trData.endpos = trData.start + client:GetAimVector()*4096
                    trData.filter = {client, weapon}
                local tr = util.TraceLine(trData)

                local selected = weapon:GetNetVar("selected", nil)
                if !IsValid(selected) then return end

                local shootPos = selected:GetPos()

                if weapon.CEntCombatSwep then
                    shootPos = selected:GetShootPos()
                end

                local pos = selected:GetNetVar("previousLocation", Vector(0, 0, 0))
                if pos and pos != Vector(0, 0, 0) then
                    render.DrawWireframeSphere(pos, math.ToSU(selected:GetNetVar("maxMovement", 15)), 32, 16, Color(255, 255, 255, 50), true)
                end

                local desiredPos = selected:GetNetVar("desiredPos", nil)
                if desiredPos and desiredPos != Vector() then
                    render.DrawLine(shootPos, desiredPos, Color(55, 55, 255), true)
                    render.DrawWireframeSphere(desiredPos, 4, 16, 16, Color(255, 255, 255))
                end

                render.DrawLine(shootPos, tr.HitPos + Vector(0, 0, 5), Color(255, 255, 255, 150), true)
            end
        end
    end
end


