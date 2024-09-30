local PLUGIN = PLUGIN

local function StringMatch(a, b)
    if a and b then
              local a2, b2 = a:lower(), b:lower()
              if a == b then 
                        return true 
              end
              if a2 == b2 then 
                        return true 
              end
              if a:find(b) then 
                        return true 
              end
              if a2:find(b2) then 
                        return true 
              end
    end
    return false
end
local function FindCent(identifier)
    for _, v in ipairs(ents.GetAll()) do
            if IsValid(v) and v.combatEntity then 
				if StringMatch(v:Name(), identifier) then
					return v 
				end
            end
    end
end


ix.command.Add("CEntWhisper", {
    arguments = ix.type.text,
    alias = {"CEntW"},
    OnRun = function(self, client, text)
        local privilege = CAMI.PlayerHasAccess(client, "Helix - Manage CEnts", nil)

        local entity = client:GetEyeTrace().Entity

        if privilege then
            if (IsValid(entity) and entity.combatEntity) then
                ix.chat.Send(entity, "cent_w", text)
            else
                return "You are not looking at a valid entity!"
            end
        else
            return "You are not allowed to do this!"
        end
    end
})

ix.command.Add("CEntSay", {
    arguments = ix.type.text,
    alias = {"CEntTalk"},
    OnRun = function(self, client, text)
        local privilege = CAMI.PlayerHasAccess(client, "Helix - Manage CEnts", nil)

        local entity = client:GetEyeTrace().Entity

        if privilege then
            if (IsValid(entity) and entity.combatEntity) then
                ix.chat.Send(entity, "cent_ic", text)
            else
                return "You are not looking at a valid entity!"
            end
        else
            return "You are not allowed to do this!"
        end
    end
})

ix.command.Add("CEntYell", {
    arguments = ix.type.text,
    alias = {"CEntY"},
    OnRun = function(self, client, text)
        local privilege = CAMI.PlayerHasAccess(client, "Helix - Manage CEnts", nil)

        local entity = client:GetEyeTrace().Entity

        if privilege then
            if (IsValid(entity) and entity.combatEntity) then
                ix.chat.Send(entity, "cent_y", text)
            else
                return "You are not looking at a valid entity!"
            end
        else
            return "You are not allowed to do this!"
        end
    end
})

ix.command.Add("CEntScream", {
    arguments = ix.type.text,
    alias = {"CEntY"},
    OnRun = function(self, client, text)
        local privilege = CAMI.PlayerHasAccess(client, "Helix - Manage CEnts", nil)

        local entity = client:GetEyeTrace().Entity

        if privilege then
            if (IsValid(entity) and entity.combatEntity) then
                ix.chat.Send(entity, "cent_s", text)
            else
                return "You are not looking at a valid entity!"
            end
        else
            return "You are not allowed to do this!"
        end
    end
})

ix.command.Add("CEntMe", {
    arguments = ix.type.text,
    OnRun = function(self, client, text)
        local privilege = CAMI.PlayerHasAccess(client, "Helix - Manage CEnts", nil)

        local entity = client:GetEyeTrace().Entity

        if privilege then
            if (IsValid(entity) and entity.combatEntity) then
                ix.chat.Send(entity, "cent_me", text)
            else
                return "You are not looking at a valid entity!"
            end
        else
            return "You are not allowed to do this!"
        end
    end
})

ix.command.Add("CEntMeClose", {
    arguments = ix.type.text,
    OnRun = function(self, client, text)
        local privilege = CAMI.PlayerHasAccess(client, "Helix - Manage CEnts", nil)

        local entity = client:GetEyeTrace().Entity

        if privilege then
            if (IsValid(entity) and entity.combatEntity) then
                ix.chat.Send(entity, "cent_meclose", text)
            else
                return "You are not looking at a valid entity!"
            end
        else
            return "You are not allowed to do this!"
        end
    end
})

ix.command.Add("CEntMeFar", {
    arguments = ix.type.text,
    OnRun = function(self, client, text)
        local privilege = CAMI.PlayerHasAccess(client, "Helix - Manage CEnts", nil)

        local entity = client:GetEyeTrace().Entity

        if privilege then
            if (IsValid(entity) and entity.combatEntity) then
                ix.chat.Send(entity, "cent_mefar", text)
            else
                return "You are not looking at a valid entity!"
            end
        else
            return "You are not allowed to do this!"
        end
    end
})

ix.command.Add("CEntMeFarFar", {
    arguments = ix.type.text,
    OnRun = function(self, client, text)
        local privilege = CAMI.PlayerHasAccess(client, "Helix - Manage CEnts", nil)

        local entity = client:GetEyeTrace().Entity

        if privilege then
            if (IsValid(entity) and entity.combatEntity) then
                ix.chat.Send(entity, "cent_mefarfar", text)
            else
                return "You are not looking at a valid entity!"
            end
        else
            return "You are not allowed to do this!"
        end
    end
})

local wepmodelz = {
	"models/weapons/w_smg1.mdl";
	"models/weapons/w_357.mdl";
	"models/weapons/w_shotgun.mdl";
	"models/weapons/w_irifle.mdl";
	"models/weapons/w_pistol.mdl";
	"models/weapons/w_crossbow.mdl";
	"models/weapons/w_rocket_launcher.mdl";
}

ix.command.Add("centweapon", {
	--syntax = "OPTIONAL: <string Model>",
	adminOnly = true,
	description = "Add a random or specific weapon to a cent's hands.",
	arguments = {bit.bor(ix.type.string, ix.type.optional)},
    argumentNames = {"OPTIONAL - modelpath"},
	OnRun = function(self, client, modelpath)
		local entity = client:GetEyeTrace().Entity

		if (IsValid(entity) and entity.combatEntity) then
			entity:SetCEntWeaponModel(modelpath)	
		end
	end
})

ix.command.Add("CEntMove", {
	syntax = "<string centname> <string character>",
	adminOnly = true,
	description = "Teleport a cent to a character's location.",
	arguments = {ix.type.string, ix.type.character},
	OnRun = function(self, client, string, character)
		local centtarget = FindCent(string)
		--print(centtarget.name.." has been moved to "..character:GetName())
		centtarget:SetPos(character.player:GetPos())
	end
})

ix.command.Add("CentMovetome", {
	syntax = "<string centname>",
	adminOnly = true,
	description = "Teleport a cent to your location.",
	arguments = {ix.type.string},
	OnRun = function(self, client, string)
		local centtarget = FindCent(string)
		--print(centtarget.name.." has been moved to "..client:GetName())
		centtarget:SetPos(client:GetPos())
	end
})

ix.command.Add("CEntfollow", {

	adminOnly = true,

	syntax = "<string target>",

	OnRun = function(self, client, arguments)	

		local entity = client:GetEyeTrace().Entity

		if !(IsValid(entity) and entity.combatEntity) then

			client:Notify("You must be looking at a combat entity.")

			return false

		end

	

		if(!arguments[1]) then 

			entity.follow = nil

			client:Notify(entity:Name().. " no longer following.")

			return

		end

	

		local target = ix.command.FindPlayer(client, arguments[1])

		if(IsValid(target)) then

			entity.follow = target

			client:Notify(entity:Name().. " is now following " ..target:Name().. ".")

		end

	end

})



ix.command.Add("CEntfollowstop", {

	adminOnly = true,

	OnRun = function(self, client, arguments)	

		local entity = client:GetEyeTrace().Entity

		if (IsValid(entity) and entity.combatEntity) then

			entity.follow = nil

			client:Notify(entity:Name().. " no longer following.")

		else

			client:Notify("You must be looking at a combat entity.")

		end

	end

})

ix.command.Add("CEntclone", {

	adminOnly = true,

	OnRun = function(self, client, arguments)

		local entity = client:GetEyeTrace().Entity --entity that we're looking at

		

		if (IsValid(entity) and entity.combatEntity) then --makes sure it's a CEnt (Combat Entity)

			local clone = ents.Create(entity:GetClass()) --the new clone entity

			clone:SetPos(entity:GetPos()) --set its position

			clone:SetAngles(entity:GetAngles()) --set its angles

			

			clone:Spawn() --spawn it

			

			clone:SetModel(entity:GetModel()) --set its model

			clone:SetMaterial(entity:GetMaterial() or "") --set its material

			clone:SetColor(entity:GetColor() or Color(255,255,255))

			

			clone:SetNetVar("name", entity:Name()) --set its custom name

			clone:SetNetVar("desc", entity:GetDescription()) --set its description



			clone:SetCEntWeaponModel(entity:GetWeaponModel())

			

			--set its attributes

			--clone.attribs = entity.attribs

			

			--combat stats

			--clone.armor = entity.armor

			

			clone:SetCombatHealth(entity:GetCombatHealth())
			clone:SetCombatHealthMax(entity:GetCombatHealthMax())

			clone:SetAP(entity:GetAP())
			clone:SetAttackBoost(entity:GetAttackBoost())
			clone:SetDodgeBoost(entity:GetDodgeBoost())

			clone:SetDT(entity:GetDT())
			clone:SetET(entity:GetET())
			clone:SetDR(entity:GetDR())



			

			--clone:SetNetVar("mp", entity:getMP())

			--clone:SetNetVar("mpMax", entity:getMaxMP())

			

			--clone.actions = entity.actions

			

			--clone.dmg = entity.dmg

			--clone.res = entity:GetNetVar("res")

			--clone.amp = entity:GetNetVar("amp")

			

			clone:SetCreator(client) --prop protection

			

			--sets its animation

			timer.Simple(1, function()

				if IsValid(clone) then

					clone:ResetSequence(entity:GetSequence())

				end

			end)

			if entity.curbonegun then 

				local ent = ents.Create("prop_physics")
				ent:SetPos(clone:GetPos() + Vector(0,0,60))
				ent:SetModel(entity.curbonegun)
				ent:Spawn()
				ent:Activate()

				clone.curbonegun = entity.curbonegun

				--local ent = self:GetSelectedEntity()
				timer.Simple(0.01, function()
					local newEntity = rb655_ApplyBonemerge( ent, clone )

					undo.Create( "bonemerge" )
						undo.AddEntity( newEntity )
						undo.SetPlayer( client )
					undo.Finish()
				end)

			end



			local name = entity:GetNetVar("name", entity.PrintName)

			client:Notify(name.. " has been cloned.") --Notify the player

		else --called if they aren't looking at the right thing

			client:Notify("You must be looking at a combat entity.")

		end

	end

})

ix.command.Add("CEntidlepose", {

	adminOnly = true,

	syntax = "<string name>",

	OnRun = function(self, client, arguments)

		if(!arguments) then

			client:Notify("Specify an idle animation for the entity.")

			return false

		end

		

		local IdleAnim = table.concat(arguments, " ")

		

		local entity = client:GetEyeTrace().Entity

		if (IsValid(entity) and entity.combatEntity) then

			entity:SetNetVar("IdleAnim", IdleAnim)

			timer.Simple(1, function()

				entity:ResetSequence(entity:LookupSequence(IdleAnim))

			end)

			client:Notify("Entity's idle animation has been changed to " ..IdleAnim.. ".")

		else

			client:Notify("You must be looking at a combat entity.")

		end

	end

})

ix.command.Add("CEntattack", {

	adminOnly = true,

	syntax = "<string name>",

	OnRun = function(self, client)

		local entity = client:GetEyeTrace().Entity

		if (IsValid(entity) and entity.combatEntity) then

			entity:AttackAnimStart(false)

		else

			client:Notify("You must be looking at a combat entity.")

		end

	end

})

ix.command.Add("CEntMakeSound", {

	adminOnly = true,

	syntax = "<string bandit>", "<int volume>",

	OnRun = function(self, client, arguments)

		local entity = client:GetEyeTrace().Entity

		if (IsValid(entity) and entity.combatEntity) then

			entity:EmitSound(arguments[1], arguments[2])

		else

			client:Notify("You must be looking at a combat entity.")

		end

	end

})

ix.command.Add("CEntChatter", {

	adminOnly = true,


	OnRun = function(self, client)

		local entity = client:GetEyeTrace().Entity

		if (IsValid(entity) and entity.combatEntity) then

			local classname = entity:GetClass()

			if not PLUGIN:GetChatterVoiceline(entity) then return "No chatter voice lines are set for this CENT." end 
	
			entity:EmitSound(PLUGIN:GetChatterVoiceline(entity))

		else

			client:Notify("You must be looking at a combat entity.")

		end

	end

})

ix.command.Add("CEntCombatBark", {

	adminOnly = true,


	OnRun = function(self, client)

		local entity = client:GetEyeTrace().Entity

		if (IsValid(entity) and entity.combatEntity) then

			local classname = entity:GetClass()

			if not PLUGIN:GetCombatVoiceline(entity) then return "No combat voice lines are set for this CENT." end 
	

			entity:EmitSound(PLUGIN:GetCombatVoiceline(entity))

		else

			client:Notify("You must be looking at a combat entity.")

		end

	end

})

function PLUGIN:GetChatterVoiceline(entity)

	local classname = entity:GetClass()
	local voiceline


	-- Humans --


	if string.find(classname, "loner_") or string.find(classname, "eco_") then 
		if entity.voicevariant == 1 then voiceline = table.Random(PLUGIN.LonerVoice1) end 
		if entity.voicevariant == 2 then voiceline = table.Random(PLUGIN.LonerVoice2) end 
		if entity.voicevariant == 3 then voiceline = table.Random(PLUGIN.LonerVoice3) end 
	end 

	if string.find(classname, "bandit_") then 
		if entity.voicevariant == 1 then voiceline = table.Random(PLUGIN.BanditVoice1) end 
		if entity.voicevariant == 2 then voiceline = table.Random(PLUGIN.BanditVoice2) end 
		if entity.voicevariant == 3 then voiceline = table.Random(PLUGIN.BanditVoice3) end 
	end 

	if string.find(classname, "duty_") then 
		if entity.voicevariant == 1 then voiceline = table.Random(PLUGIN.DutyVoice1) end 
		if entity.voicevariant == 2 then voiceline = table.Random(PLUGIN.DutyVoice2) end 
		if entity.voicevariant == 3 then voiceline = table.Random(PLUGIN.DutytVoice3) end 
	end 

	if string.find(classname, "army_") then 
		if entity.voicevariant == 1 then voiceline = table.Random(PLUGIN.ArmyVoice1) end 
		if entity.voicevariant == 2 then voiceline = table.Random(PLUGIN.ArmyVoice2) end 
	end 

	if string.find(classname, "freedom_") then 
		if entity.voicevariant == 1 then voiceline = table.Random(PLUGIN.FreedomVoice1) end 
		if entity.voicevariant == 2 then voiceline = table.Random(PLUGIN.FreedomVoice2) end 
	end 

	if string.find(classname, "merc_") then 
		if entity.voicevariant == 1 then voiceline = table.Random(PLUGIN.MercVoice1) end 
		if entity.voicevariant == 2 then voiceline = table.Random(PLUGIN.MercVoice2) end 
		if entity.voicevariant == 3 then voiceline = table.Random(PLUGIN.MercVoice2) end 
	end 

	
	if string.find(classname, "mono_") then 
		voiceline = table.Random(PLUGIN.MonoVoice1)
	end 


	-- Mutants --

	if string.find(classname, "mutant_dog") then 
		local idles = {
			"hgn/stalker/creature/dog/bdog_idle_1.wav",
			"hgn/stalker/creature/dog/bdog_idle_2.wav",
			"hgn/stalker/creature/dog/bdog_idle_3.wav"
		}
		voiceline = table.Random(idles)
	end 

	if string.find(classname, "mutant_tushkano") then 
		local idles = {
			"hgn/stalker/creature/rodent/tushkano_idle_0.wav",
			"hgn/stalker/creature/rodent/tushkano_idle_1.wav",
			"hgn/stalker/creature/rodent/tushkano_idle_2.wav",
			"hgn/stalker/creature/rodent/tushkano_idle_3.wav"
		}
		voiceline = table.Random(idles)
	end 

	if string.find(classname, "mutant_flesh") then 
		local idles = {
			"hgn/stalker/creature/flesh/flesh_idle_1.wav",
			"hgn/stalker/creature/flesh/flesh_idle_2.wav",
			"hgn/stalker/creature/flesh/flesh_idle_3.wav",
			"hgn/stalker/creature/flesh/flesh_idle_4.wav",
			"hgn/stalker/creature/flesh/flesh_idle_5.wav",
		}
		voiceline = table.Random(idles)
	end 

	if string.find(classname, "mutant_boar") then 
		local idles = {
			"hgn/stalker/creature/boar/boar_idle_0.mp3",
			"hgn/stalker/creature/boar/boar_idle_1.mp3",
			"hgn/stalker/creature/boar/boar_idle_2.mp3",
			"hgn/stalker/creature/boar/boar_idle_3.mp3",
		}
		voiceline = table.Random(idles)
	end

	if string.find(classname, "mutant_pseudodog") or string.find(classname, "mutant_psydog") then 
		local idles = {
			"hgn/stalker/creature/pseudodog/pdog_idle_0.mp3",
			"hgn/stalker/creature/pseudodog/pdog_idle_1.mp3",
			"hgn/stalker/creature/pseudodog/pdog_idle_2.mp3",
		}
		voiceline = table.Random(idles)
	end 

	if string.find(classname, "mutant_cat") then 
		local idles = {
			"hgn/stalker/creature/cat/cat_idle.wav",
			"hgn/stalker/creature/cat/9.wav",
			"hgn/stalker/creature/cat/3.wav",
		}
		voiceline = table.Random(idles)
	end 

	if string.find(classname, "mutant_zombie") then 
		local idles = {
			"hgn/stalker/creature/zombie/zombie_idle_1.wav",
			"hgn/stalker/creature/zombie/zombie_idle_2.wav",
			"hgn/stalker/creature/zombie/zombie_idle_3.wav",
			"hgn/stalker/creature/zombie/zombie_idle_4.wav",
			"hgn/stalker/creature/zombie/zombie_idle_5.wav",
			"hgn/stalker/creature/zombie/zombie_idle_6.wav",
		}
		voiceline = table.Random(idles)
	end 

	if string.find(classname, "mutant_snork") then 
		local idles = {
			"hgn/stalker/creature/snork/snork_idle_0.wav",
			"hgn/stalker/creature/snork/snork_idle_1.wav",
			"hgn/stalker/creature/snork/snork_idle_2.wav",
			"hgn/stalker/creature/snork/snork_idle_3.wav",
		}
		voiceline = table.Random(idles)
	end 

	if string.find(classname, "mutant_izlom") then 
		local idles = {
			"hgn/stalker/creature/izlom/idle1.wav",
			"hgn/stalker/creature/izlom/idle2.wav",
			"hgn/stalker/creature/izlom/idle3.wav",
			"hgn/stalker/creature/izlom/idle4.wav",
		}
		voiceline = table.Random(idles)
	end 

	if string.find(classname, "mutant_bloodsucker") then 
		local idles = {
			"hgn/stalker/creature/bs/idle_1.wav",
			"hgn/stalker/creature/bs/idle_2.wav",
			"hgn/stalker/creature/bs/idle_3.wav",
			"hgn/stalker/creature/bs/idle_4.wav",
		}
		voiceline = table.Random(idles)
	end 

	if string.find(classname, "mutant_burer") then 
		local idles = {
			"hgn/stalker/creature/burer/burer_idle_0.mp3",
			"hgn/stalker/creature/burer/burer_idle_1.mp3",
			"hgn/stalker/creature/burer/burer_idle_2.mp3",
		}
		voiceline = table.Random(idles)
	end 

	if string.find(classname, "mutant_controller") then 
		local idles = {
			"gsc/s.t.a.l.k.e.r/monsters/controller/controller_presence_1.wav",
			"gsc/s.t.a.l.k.e.r/monsters/controller/controller_presence_2.wav",
			"gsc/s.t.a.l.k.e.r/monsters/controller/controller_presence_3.wav",
		}
		voiceline = table.Random(idles)
	end 

	
	if string.find(classname, "mutant_chimera") then 
		local idles = {
			"hgn/stalker/creature/chimera/chimera_idle_1.wav",
			"hgn/stalker/creature/chimera/chimera_idle_2.wav",
		}
		voiceline = table.Random(idles)
	end 

	if string.find(classname, "mutant_pseudogiant") then 
		local idles = {
			"hgn/stalker/creature/giant/idle_1.wav",
			"hgn/stalker/creature/giant/idle_2.wav",
		}
		voiceline = table.Random(idles)
	end 

	if string.find(classname, "mutant_amoeba") then 
		local idles = {
			"senator/psy_1.ogg",
			"senator/psy_2.ogg",
			"senator/psy_3.ogg",
			"senator/psy_4.ogg",
			"senator/psy_5.ogg",
			"senator/psy_6.ogg",
		}
		voiceline = table.Random(idles)
	end 

	if string.find(classname, "mutant_biomass") then 
		local idles = {
			"npc/corpus/org_moan_1.ogg",
			"npc/corpus/org_moan_2.ogg",
			"npc/corpus/org_moan_3.ogg",
			"npc/corpus/org_moan_4.ogg",
			"npc/corpus/org_moan_5.ogg",
			"npc/corpus/org_moan_6.ogg",
		}
		voiceline = table.Random(idles)
	end 


	if string.find(classname, "mutant_lost") then 
		local idles = {
			"npc/psevdohuman/idle_0.ogg",
			"npc/psevdohuman/idle_1.ogg",
			"npc/psevdohuman/idle_2.ogg",
			"npc/psevdohuman/idle_3.ogg",
			"npc/psevdohuman/idle_4.ogg",
			"npc/psevdohuman/idle_5.ogg",
			"npc/psevdohuman/idle_6.ogg",
			"npc/psevdohuman/idle_7.ogg",
		}
		voiceline = table.Random(idles)
	end 




	return voiceline 



end 

function PLUGIN:GetCombatVoiceline(entity)

	local classname = entity:GetClass()
	local voiceline

	if string.find(classname, "loner_") or string.find(classname, "eco_") then 
		if entity.voicevariant == 1 then voiceline = table.Random(PLUGIN.LonerVoiceCombat1) end 
		if entity.voicevariant == 2 then voiceline = table.Random(PLUGIN.LonerVoiceCombat2) end 
		if entity.voicevariant == 3 then voiceline = table.Random(PLUGIN.LonerVoiceCombat3) end 
	end 

	
	if string.find(classname, "bandit_") then 
		if entity.voicevariant == 1 then voiceline = table.Random(PLUGIN.BanditVoiceCombat1) end 
		if entity.voicevariant == 2 then voiceline = table.Random(PLUGIN.BanditVoiceCombat2) end 
		if entity.voicevariant == 3 then voiceline = table.Random(PLUGIN.BanditVoiceCombat3) end 
	end 

	if string.find(classname, "duty_") then 
		if entity.voicevariant == 1 then voiceline = table.Random(PLUGIN.DutyVoiceCombat1) end 
		if entity.voicevariant == 2 then voiceline = table.Random(PLUGIN.DutyVoiceCombat2) end 
		if entity.voicevariant == 3 then voiceline = table.Random(PLUGIN.DutytVoiceCombat3) end 
	end 

	if string.find(classname, "army_") then 
		if entity.voicevariant == 1 then voiceline = table.Random(PLUGIN.ArmyVoiceCombat1) end 
		if entity.voicevariant == 2 then voiceline = table.Random(PLUGIN.ArmyVoiceCombat2) end 
	end 

	if string.find(classname, "freedom_") then 
		if entity.voicevariant == 1 then voiceline = table.Random(PLUGIN.FreedomVoiceCombat1) end 
		if entity.voicevariant == 2 then voiceline = table.Random(PLUGIN.FreedomVoiceCombat2) end 
	end

	if string.find(classname, "merc_") then 
		if entity.voicevariant == 1 then voiceline = table.Random(PLUGIN.MercVoiceCombat1) end 
		if entity.voicevariant == 2 then voiceline = table.Random(PLUGIN.MercVoiceCombat2) end 
		if entity.voicevariant == 3 then voiceline = table.Random(PLUGIN.MercVoiceCombat3) end 
	end 
	
	if string.find(classname, "mono_") then 
		voiceline = table.Random(PLUGIN.MonoVoiceCombat1)
	end 


	-- Mutants --

	if string.find(classname, "mutant_dog") then 
		local idles = {
			"hgn/stalker/creature/dog/bdog_attack_1.wav",
			"hgn/stalker/creature/dog/bdog_attack_2.wav",
			"hgn/stalker/creature/dog/bdog_attack_3.wav",
			"hgn/stalker/creature/dog/bdog_attack_4.wav",
		}
		voiceline = table.Random(idles)
	end 

	if string.find(classname, "mutant_tushkano") then 
		local idles = {
			"hgn/stalker/creature/rodent/tushkano_aggressive_0.wav",
			"hgn/stalker/creature/rodent/tushkano_aggressive_1.wav",
			"hgn/stalker/creature/rodent/tushkano_aggressive_2.wav",
			"hgn/stalker/creature/rodent/tushkano_aggressive_3.wav",
		}
		voiceline = table.Random(idles)
	end 

	if string.find(classname, "mutant_flesh") then 
		local idles = {
			"hgn/stalker/creature/flesh/flesh_aggressive_0.mp3",
			"hgn/stalker/creature/flesh/flesh_aggressive_1.mp3",
			"hgn/stalker/creature/flesh/flesh_aggressive_2.mp3",
			"hgn/stalker/creature/flesh/flesh_aggressive_3.mp3",
			"hgn/stalker/creature/flesh/flesh_aggressive_4.mp3",
		}
		voiceline = table.Random(idles)
	end 

	if string.find(classname, "mutant_boar") then 
		local idles = {
			"hgn/stalker/creature/boar/boar_aggressive_1.wav",
			"hgn/stalker/creature/boar/boar_aggressive_2.wav",
			"hgn/stalker/creature/boar/boar_aggressive_3.wav",
			"hgn/stalker/creature/boar/boar_aggressive_4.wav",
		}
		voiceline = table.Random(idles)
	end

	if string.find(classname, "mutant_pseudodog") or string.find(classname, "mutant_psydog") then 
		local idles = {
			"hgn/stalker/creature/pseudodog/pdog_aggression_0.mp3",
			"hgn/stalker/creature/pseudodog/pdog_aggression_1.mp3",
			"hgn/stalker/creature/pseudodog/pdog_aggression_2.mp3",
		}
		voiceline = table.Random(idles)
	end 

	if string.find(classname, "mutant_cat") then 
		local idles = {
			"hgn/stalker/creature/cat/cat_agr.wav",
			"hgn/stalker/creature/cat/cat_threat.wav",
		}
		voiceline = table.Random(idles)
	end 

	if string.find(classname, "mutant_zombie") then 
		local idles = {
			"hgn/stalker/creature/zombie/zombie_attack_1.wav",
			"hgn/stalker/creature/zombie/zombie_attack_2.wav",
			"hgn/stalker/creature/zombie/zombie_attack_3.wav",
			"hgn/stalker/creature/zombie/zombie_attack_4.wav",
			"hgn/stalker/creature/zombie/zombie_attack_5.wav",
			"hgn/stalker/creature/zombie/zombie_attack_6.wav",
		}
		voiceline = table.Random(idles)
	end 

	if string.find(classname, "mutant_snork") then 
		local idles = {
			"hgn/stalker/creature/snork/snork_attack_0.wav",
			"hgn/stalker/creature/snork/snork_attack_1.wav",
			"hgn/stalker/creature/snork/snork_attack_2.wav",
		}
		voiceline = table.Random(idles)
	end 

	if string.find(classname, "mutant_izlom") then 
		local idles = {
			"hgn/stalker/creature/izlom/attack1.wav",
			"hgn/stalker/creature/izlom/attack2.wav",
			"hgn/stalker/creature/izlom/attack3.wav",
			"hgn/stalker/creature/izlom/attack4.wav",
		}
		voiceline = table.Random(idles)
	end 

	if string.find(classname, "mutant_bloodsucker") then 
		local idles = {
			"hgn/stalker/creature/bs/attack_0.mp3",
			"hgn/stalker/creature/bs/attack_1.mp3",
			"hgn/stalker/creature/bs/attack_2.mp3",
		}
		voiceline = table.Random(idles)
	end 

	if string.find(classname, "mutant_burer") then 
		local idles = {
			"hgn/stalker/creature/burer/burer_attack_0.mp3",
			"hgn/stalker/creature/burer/burer_attacking_0.mp3",
			"hgn/stalker/creature/burer/burer_telekinetic_0.mp3",
		}
		voiceline = table.Random(idles)
	end 

	if string.find(classname, "mutant_controller") then 
		local idles = {
			"gsc/s.t.a.l.k.e.r/monsters/controller/controller_attack_hit.wav",
		}
		voiceline = table.Random(idles)
	end 

	
	if string.find(classname, "mutant_chimera") then 
		local idles = {
			"hgn/stalker/creature/chimera/chimera_attack_1.wav",
			"hgn/stalker/creature/chimera/chimera_attack_2.wav",
		}
		voiceline = table.Random(idles)
	end 

	if string.find(classname, "mutant_pseudogiant") then 
		local idles = {
			"hgn/stalker/creature/giant/attack_0.wav",
			"hgn/stalker/creature/giant/attack_1.wav",
		}
		voiceline = table.Random(idles)
	end 

	if string.find(classname, "mutant_amoeba") then 
		local idles = {
			"senator/psy_1.ogg",
			"senator/psy_2.ogg",
			"senator/psy_3.ogg",
			"senator/psy_4.ogg",
			"senator/psy_5.ogg",
			"senator/psy_6.ogg",
		}
		voiceline = table.Random(idles)
	end 

	if string.find(classname, "mutant_biomass") then 
		local idles = {
			"npc/corpus/org_moan_1.ogg",
			"npc/corpus/org_moan_2.ogg",
			"npc/corpus/org_moan_3.ogg",
			"npc/corpus/org_moan_4.ogg",
			"npc/corpus/org_moan_5.ogg",
			"npc/corpus/org_moan_6.ogg",
		}
		voiceline = table.Random(idles)
	end 

	if string.find(classname, "mutant_lost") then 
		local idles = {
			"npc/psevdohuman/attack_0.ogg",
			"npc/psevdohuman/attack_1.ogg",
			"npc/psevdohuman/attack_2.ogg",
			"npc/psevdohuman/attack_3.ogg",
		}
		voiceline = table.Random(idles)
	end 



	return voiceline 

end 

ix.command.Add("CEntaim", {

	adminOnly = true,

	syntax = "<string name>",

	OnRun = function(self, client)

		local entity = client:GetEyeTrace().Entity

		if (IsValid(entity) and entity.combatEntity) then

			entity:AttackAnimStart(true)

		else

			client:Notify("You must be looking at a combat entity.")

		end

	end

})

ix.command.Add("CEntidle", {

	adminOnly = true,

	syntax = "<string name>",

	OnRun = function(self, client)

		local entity = client:GetEyeTrace().Entity

		if (IsValid(entity) and entity.combatEntity) then

			entity:SetAnim()

		else

			client:Notify("You must be looking at a combat entity.")

		end

	end

})

ix.command.Add("CEntcrouchtoggle", {

	adminOnly = true,

	syntax = "<string name>",

	OnRun = function(self, client)

		local entity = client:GetEyeTrace().Entity

		if (IsValid(entity) and entity.combatEntity) then

			entity:Crouch()

		else

			client:Notify("You must be looking at a combat entity.")

		end

	end

})

ix.command.Add("CEntwalktoggle", {
	adminOnly = true,
	syntax = "<string name>",
	OnRun = function(self, client)
		local entity = client:GetEyeTrace().Entity

		if (IsValid(entity) and entity.combatEntity) then

			if entity:GetNetVar("walkToggle") == true then 
				client:Notify("Toggled off auto-walk. CEnt will now walk or run depending on distance")
				entity:SetNetVar("walkToggle", false)
				entity:SetNetVar("runToggle", false)
			else
				client:Notify("Toggled on auto-walk. CEnt will now always walk to destination.")
				entity:SetNetVar("walkToggle", true)
				entity:SetNetVar("runToggle", false)
			end 
		else

			client:Notify("You must be looking at a combat entity.")

		end

	end
})

ix.command.Add("CEntruntoggle", {
	adminOnly = true,
	syntax = "<string name>",
	OnRun = function(self, client)
		local entity = client:GetEyeTrace().Entity
		
		if (IsValid(entity) and entity.combatEntity) then

			if entity:GetNetVar("runToggle") == true then 
				client:Notify("Toggled off auto-run. CEnt will now walk or run depending on distance")
				entity:SetNetVar("runToggle", false)
				entity:SetNetVar("walkToggle", false)
			else
				client:Notify("Toggled on auto-run. CEnt will now always run to destination.")
				entity:SetNetVar("runToggle", true)
				entity:SetNetVar("walkToggle", false)
			end 
		else

			client:Notify("You must be looking at a combat entity.")

		end

	end
})

ix.command.Add("CEntmaxhp", {

	adminOnly = true,

	syntax = "<int maxhp>",

	OnRun = function(self, client, arguments)

		local entity = client:GetEyeTrace().Entity

		if (IsValid(entity) and entity.combatEntity) then

			entity:SetCombatHealthMax(arguments[1])
			client:Notify("Set max health of CEnt " .. entity:Name() .. " to " .. arguments[1])

		else

			client:Notify("You must be looking at a combat entity.")

		end

	end

})

ix.command.Add("CEnthp", {

	adminOnly = true,

	syntax = "<int hp>",

	OnRun = function(self, client, arguments)

		local entity = client:GetEyeTrace().Entity

		if (IsValid(entity) and entity.combatEntity) then

			entity:SetCombatHealth(arguments[1])
			client:Notify("Sethealth of CEnt " .. entity:Name() .. " to " .. arguments[1] .. "/" .. entity:GetCombatHealthMax())


		else

			client:Notify("You must be looking at a combat entity.")

		end

	end

})

ix.command.Add("CentSKill", {
	adminOnly = true,
	syntax = "<int skill>",
	OnRun = function(self, client, arguments)
		local entity = client:GetEyeTrace().Entity
		if (IsValid(entity) and entity.combatEntity) then

			entity:SetWeaponSkill(arguments[1])
			client:Notify("Set Weapon Skill of CEnt " .. entity:Name() .. " to " .. arguments[1])
		else
			client:Notify("You must be looking at a combat entity.")

		end
	end
})


ix.command.Add("CEntdodge", {
	adminOnly = true,
	syntax = "<int dodge>",
	OnRun = function(self, client, arguments)
		local entity = client:GetEyeTrace().Entity
		if (IsValid(entity) and entity.combatEntity) then

			entity:SetDodge(arguments[1])
			client:Notify("Set Dodge of CEnt " .. entity:Name() .. " to " .. entity:GetDodge())
		else
			client:Notify("You must be looking at a combat entity.")

		end
	end
})

ix.command.Add("CEntWeaponBodyGroup", {
	adminOnly = true,
	syntax = "<int index>",
	OnRun = function(self, client, arguments)
		local entity = client:GetEyeTrace().Entity
		if (IsValid(entity) and entity.combatEntity) then

			local weapon = entity.weapon

			weapon:SetBodygroup(1, arguments[1])
		else
			client:Notify("You must be looking at a combat entity.")

		end
	end
})

ix.command.Add("CEntTorsoStats", {
	adminOnly = true,
	syntax = "<int bodybr>" , "<int bodybullet>", "<int bodyimpact>", "<int bodyrupture>",
	OnRun = function(self, client, arguments)
		local entity = client:GetEyeTrace().Entity
		if (IsValid(entity) and entity.combatEntity) then

			entity:SetTorsoBR(arguments[1])
			entity:SetTorsoBullet(arguments[2])
			entity:SetTorsoImpact(arguments[3])
			entity:SetTorsoRupture(arguments[4])
	
			client:Notify("Set Body BR, Bullet, Impact, and Rupture of CEnt " .. entity:Name() .. " to " .. entity:GetTorsoBR() .. " , " .. entity:GetTorsoBullet() .. " , " .. entity:GetTorsoImpact() .. " , " .. entity:GetTorsoRupture())
		else
			client:Notify("You must be looking at a combat entity.")

		end
	end
})

ix.command.Add("CEntHeadStats", {
	adminOnly = true,
	syntax = "<int headbr>" , "<int headbullet>", "<int headimpact>", "<int headrupture>",
	OnRun = function(self, client, arguments)
		local entity = client:GetEyeTrace().Entity
		if (IsValid(entity) and entity.combatEntity) then

			entity:SetHeadBR(arguments[1])
			entity:SetHeadBullet(arguments[2])
			entity:SetHeadImpact(arguments[3])
			entity:SetHeadRupture(arguments[4])
	
			client:Notify("Set Head BR, Bullet, Impact, and Rupture of CEnt " .. entity:Name() .. " to " .. entity:GetHeadBR() .. " , " .. entity:GetHeadBullet() .. " , " .. entity:GetHeadImpact() .. " , " .. entity:GetHeadRupture())
		else
			client:Notify("You must be looking at a combat entity.")

		end
	end
})

ix.command.Add("CEntdr", {
	adminOnly = true,
	syntax = "<int dr>",
	OnRun = function(self, client, arguments)
		local entity = client:GetEyeTrace().Entity
		if (IsValid(entity) and entity.combatEntity) then

			entity:SetDR(arguments[1])
			client:Notify("Set DR of CEnt " .. entity:Name() .. " to " .. entity:GetDR())
		else
			client:Notify("You must be looking at a combat entity.")

		end
	end
})

ix.command.Add("CentDamage", {
	description = "Inflict non-bullet damage on a CEnt.",
	adminOnly = true,
	arguments = {
		ix.type.string,
    	ix.type.number,
    bit.bor(ix.type.string, ix.type.optional)},
	OnRun = function(self, client, damagetype, damage, area)

	local entity = client:GetEyeTrace().Entity
	if not (IsValid(entity) and entity.combatEntity) then return "You need to be looking at a CEnt." end

	local target = entity 

    damagetype = string.lower(damagetype)
    damagetype = damagetype:gsub("^%l", string.upper)


	if not area then area = "all" end 

    if area == "body" then
    elseif area ==  "all" then
    elseif area == "head" then
    else return "Area must be either 'body', 'head', or 'all'" end 
    

    local res = {
      ["Impact"] = 0,
      ["Rupture"] = 0,
    }

    local validtype = false

    for k, _ in pairs(res) do
      if damagetype == k then validtype = true end 
    end
    
    if not validtype then return "Invalid type. Must be: Impact, Rupture." end 

	local resistance

    if damagetype == "Impact" and area == "head" then resistance = entity:GetHeadImpact() end
	if damagetype == "Impact" and area == "body" then resistance = entity:GetTorsoImpact() end
	if damagetype == "Impact" and area == "all" then resistance = entity:GetHeadImpact() + entity:GetTorsoImpact() end

	if damagetype == "Rupture" and area == "head" then resistance = entity:GetHeadRupture() end
	if damagetype == "Rupture" and area == "body" then resistance = entity:GetTorsoRupture() end
	if damagetype == "Rupture" and area == "all" then resistance = entity:GetHeadRupture() + entity:GetTorsoRupture() end

	


	local resistance = resistance / 100
    
    damage = damage * (1 - resistance)
    damage = math.floor(damage)

	client:Notify(target:Name() .. " has resistance of " .. resistance*100 .. "% and takes " .. damage .. " damage!")


    target:SetCombatHealth(target:GetCombatHealth() - damage)
	if target:GetCombatHealth() <= 0 then target:Die() end


	end
})

ix.command.Add("CentDamageBullet", {
	description = "Inflict bullet damage on a CEnt by choosing a pre-configured caliber.",
	adminOnly = true,
	arguments = {
    ix.type.string,
    bit.bor(ix.type.bool, ix.type.optional)
	},
	OnRun = function(self, client, bullet, headshot)

	local entity = client:GetEyeTrace().Entity
	if not (IsValid(entity) and entity.combatEntity) then return "You need to be looking at a CEnt." end
	local target = entity 

	local bulletData = ix.item.Get(bullet)
	if not bulletData or not bulletData.stats then return "Cannot find bullet of type " .. bullet .. " !" end 
	local bulletname = bulletData.name
	local br = bulletData.stats["BR"]
	local pierce = bulletData.stats["Pierce"]
	local bluntforce = bulletData.stats["Blunt"]

    local area 
	local playerbr
	local bulletresist
	local bluntresist



	
    if headshot then area = "head" else area = "body" end 

	if area == "head" then 
		playerbr = target:GetHeadBR() 
		bulletresist = target:GetHeadBullet() / 100
		bluntresist = target:GetHeadImpact() / 100
	else 
		playerbr = target:GetTorsoBR()
		bulletresist = target:GetTorsoBullet() / 100
		bluntresist = target:GetTorsoImpact() / 100
	end 

	playerbr = tonumber(playerbr)

    if br > playerbr then 

      local bulletdamage = math.floor(pierce * (1 - bulletresist))
      local bluntdamage = math.floor(bluntforce * (1 - bluntresist))
      client:Notify(target:Name() .. " takes " .. bulletdamage .. " ballistic damage and " .. bluntdamage .. " blunt force trauma damage!")


	  target:SetCombatHealth(target:GetCombatHealth() - bulletdamage)
	  target:SetCombatHealth(target:GetCombatHealth() - bluntdamage)
	  if target:GetCombatHealth() <= 0 then target:Die() end

    else


      local bluntdamage = math.floor(bluntforce * (1 - bluntresist))
      client:Notify(target:Name() .. " takes " .. bluntdamage .. " blunt force trauma damage!")


	  target:SetCombatHealth(target:GetCombatHealth() - bluntdamage)
	  if target:GetCombatHealth() <= 0 then target:Die() end

    end 
		

	end
})

ix.command.Add("CentDamageBulletCustom", {
	description = "Inflict bullet damage on a CEnt, entering your own ballistic values.",
	adminOnly = true,
	arguments = {
    ix.type.number,
    ix.type.number,
    ix.type.number,
    bit.bor(ix.type.bool, ix.type.optional)
	},
	OnRun = function(self, client, br, pierce, bluntforce, headshot)

	local entity = client:GetEyeTrace().Entity
	if not (IsValid(entity) and entity.combatEntity) then return "You need to be looking at a CEnt." end
	local target = entity 

    local area 
	local playerbr
	local bulletresist
	local bluntresist

	
    if headshot then area = "head" else area = "body" end 

	if area == "head" then 
		playerbr = target:GetHeadBR() 
		bulletresist = target:GetHeadBullet() / 100
		bluntresist = target:GetHeadImpact() / 100
	else 
		playerbr = target:GetTorsoBR()
		bulletresist = target:GetTorsoBullet() / 100
		bluntresist = target:GetTorsoImpact() / 100
	end 

	playerbr = tonumber(playerbr)

    if br > playerbr then 

      local bulletdamage = math.floor(pierce * (1 - bulletresist))
      local bluntdamage = math.floor(bluntforce * (1 - bluntresist))
      client:Notify(target:Name() .. " takes " .. bulletdamage .. " ballistic damage and " .. bluntdamage .. " blunt force trauma damage!")


	  target:SetCombatHealth(target:GetCombatHealth() - bulletdamage)
	  target:SetCombatHealth(target:GetCombatHealth() - bluntdamage)
	  if target:GetCombatHealth() <= 0 then target:Die() end

    else


      local bluntdamage = math.floor(bluntforce * (1 - bluntresist))
      client:Notify(target:Name() .. " takes " .. bluntdamage .. " blunt force trauma damage!")


	  target:SetCombatHealth(target:GetCombatHealth() - bluntdamage)
	  if target:GetCombatHealth() <= 0 then target:Die() end

    end 
		

	end
})

ix.command.Add("CentEquipSuit", {
	description = "Equip a CENT with a given armor suit, and optionally change its model to fit.",
	adminOnly = true,
	arguments = {
    ix.type.string,
    bit.bor(ix.type.bool, ix.type.optional)
	},
	OnRun = function(self, client, suit, changemodel)

	local entity = client:GetEyeTrace().Entity
	if not (IsValid(entity) and entity.combatEntity) then return "You need to be looking at a CEnt." end
	local target = entity 

	local suitExists = ix.item.Get(suit)
	if not suitExists or not suitExists.isBodyArmor then return "Cannot find armor suit of type " .. suit .. " !" end 

	entity:EquipSuit(suit, changemodel)

	return "Equipped " .. entity:Name() .. " with " .. suitExists.name .. "."

	end
})

ix.command.Add("CentEquipHelmet", {
	description = "Equip a CENT with a given piece of headgear.",
	adminOnly = true,
	arguments = {
    ix.type.string,
	},
	OnRun = function(self, client, helmet)

	local entity = client:GetEyeTrace().Entity
	if not (IsValid(entity) and entity.combatEntity) then return "You need to be looking at a CEnt." end
	local target = entity 

	local helmetExists = ix.item.Get(helmet)
	if not helmetExists or not helmetExists.isHelmet then return "Cannot find headgear of type " .. helmet .. " !" end 

	entity:EquipHelmet(helmet)
	return "Equipped " .. entity:Name() .. " with " .. helmetExists.name .. "."

	end
})

ix.command.Add("CentEquipAccessory", {
	description = "Equip a CENT with a given accessory - artifact or belt slot item.",
	adminOnly = true,
	arguments = {
    ix.type.string,
	},
	OnRun = function(self, client, accessory)

	local entity = client:GetEyeTrace().Entity
	if not (IsValid(entity) and entity.combatEntity) then return "You need to be looking at a CEnt." end
	local target = entity 

	local accessoryExists = ix.item.Get(accessory)
	if not accessoryExists or not accessoryExists.isArtefact then return "Cannot find accessory of type " .. accessory .. " !" end 
	
	entity:EquipAccessory(accessory)
	return "Equipped " .. entity:Name() .. " with " .. accessoryExists.name .. "."

	end
})