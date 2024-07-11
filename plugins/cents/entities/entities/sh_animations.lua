local PLUGIN = PLUGIN

function ENT:WalkAnimation(range)
    local run

    if range > 300 then
        run = true
    end

    local sequence
    local activity

    local runAnimations = {
        ACT_RUN,
        ACT_HL2MP_RUN_FAST
    }

    local walkAnimations = {
        ACT_WALK,
        ACT_HL2MP_WALK
    }

    if run then
        if self.RunAnim then
            sequence = self:LookupSequence(self.RunAnim)
        else
            for k, v in pairs(runAnims) do
                sequence = self:SelectWeightedSequence(v)
                activity = v

                if (sequence != -1) then break end
            end
        end
    else
        if self.WalkAnim then
            sequence = self:LookupSequence(self.WalkAnim)
        else
            for k, v in pairs(walkAnims) do
                sequence = self:SelectWeightedSequence(v)
                activity = v

                if (sequence != -1) then break end
            end
        end
    end

    local groundSpeed = 200

    if (sequence != -1) then
        local tempAnim = self:GetSequence()

        if (tempAnim != sequence and !self.PreviousAnimation) then
            self.PreviousAnimation = tempAnim
        end

        if activity then
            self:StartActivity(activity)
        end

        if sequence then
            self:ResetSequence(sequence)
        end

        groundSpeed = self:GetSequenceGroundSpeed(sequence)
        if (groundSpeed < 1) then
            if run then
                groundSpeed = 200
            else
                groundSpeed = 50
            end
        end
    end

    self.loco:SetDesiredSpeed(groundSpeed)
    self:SetPlaybackRate(1)
    self:SetPoseParameter("move_x", 1)
end

function ENT:ResetAnim()
    local prevAnim = self.PreviousAnimation or self.idle

    self:SetSequence(prevAnim)

    self.PreviousAnimation = nil
end

function ENT:SetAnim()
    if self.IdleAnim then
        self.idle = self:LookupSequence(self.IdleAnim)
        self:ResetSequence(self.IdleAnim)
    else
        for k, v in ipairs(self:GetSequenceList()) do
            if (v:lower():find("idle") and v != "idlenoise") then
                self.idle = k
                return self:ResetSequence(k)
            end
        end

        self.idle = 4
        self:ResetSequence(4)
    end
end

function ENT:Crouch(bInstant)
    if self.isCrouching then
        local standAnim = self:LookupSequence(self.StandAnim)

        if standAnim then
            if bInstant then
                self:SetAnim()
            else
                self:ResetSequence(standAnim)

                timer.Simple(self:SequenceDuration(standAnim), function()
                    self:SetAnim()
                end)
            end
        end

        self.isCrouching = false
    else
        local crouchAnim = self:LookupSequence(self.CrouchAnim)
        self:ResetSequence(crouchAnim)

        self.isCrouching = true
    end
end

function ENT:AttackAnimStart(hold, seq)
    local sequence = self:LookupSequence(self.AttackAnim)

    if (seq) then
        sequence = self:LookupSequence(seq)
    end

    self:ResetSequence(sequence)

    if (hold == false) then 
        timer.Simple(self:SequenceDuration(sequence), function()
            if IsValid(self) then
                self:SetAnim()
            end
        end)
    end 

end