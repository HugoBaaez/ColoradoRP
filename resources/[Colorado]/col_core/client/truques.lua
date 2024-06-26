local TrickDoPrompt
local TrickEndPrompt
local TrickNext
local TrickPrev
local TrickPrompts = GetRandomIntInRange(0, 0xffffff)

local tricking = false
local index = 1

local StartKey = 0xAB62E997  -- NUM_5
local Prompts = {
    Do = 0x39336A4F,
    End = 0xD8F73058,
    Prev = 0x3C3DD371,
    Next = 0x446258B6,
}

local playingGunTrick = nil

local tricks = {
    {`KIT_EMOTE_TWIRL_GUN`, "Truque 1"},
    {`KIT_EMOTE_TWIRL_GUN_DUAL`,"Duas Armas"},
   {`KIT_EMOTE_TWIRL_GUN_VAR_A`,"Duas Armas A"},
   {`KIT_EMOTE_TWIRL_GUN_VAR_B`,"Duas Armas B"},
   {`KIT_EMOTE_TWIRL_GUN_VAR_C`,"Duas Armas C"},
   {`KIT_EMOTE_TWIRL_GUN_VAR_D`,"Duas Armas D"},
} 

function SetupTrickPrompt()
    Citizen.CreateThread(function()
        local str = 'Truque'
        TrickDoPrompt = PromptRegisterBegin()
        PromptSetControlAction(TrickDoPrompt, Prompts.Do)
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(TrickDoPrompt, str)
        PromptSetEnabled(TrickDoPrompt, 1)
        PromptSetVisible(TrickDoPrompt, 1)
        PromptSetStandardMode(TrickDoPrompt,1)
        PromptSetGroup(TrickDoPrompt, TrickPrompts)
        Citizen.InvokeNative(0xC5F428EE08FA7F2C,TrickDoPrompt,true)
        PromptRegisterEnd(TrickDoPrompt)

        local str2 = 'Terminar'
        TrickEndPrompt = PromptRegisterBegin()
        PromptSetControlAction(TrickEndPrompt, Prompts.End)
        str2 = CreateVarString(10, 'LITERAL_STRING', str2)
        PromptSetText(TrickEndPrompt, str2)
        PromptSetEnabled(TrickEndPrompt, 1)
        PromptSetVisible(TrickEndPrompt, 1)
        PromptSetStandardMode(TrickEndPrompt,1)
        PromptSetGroup(TrickEndPrompt, TrickPrompts)
        Citizen.InvokeNative(0xC5F428EE08FA7F2C,TrickEndPrompt,true)
        PromptRegisterEnd(TrickEndPrompt)

        local str3 = 'Próxima'
        TrickNext = PromptRegisterBegin()
        PromptSetControlAction(TrickNext, Prompts.Next)
        str3 = CreateVarString(10, 'LITERAL_STRING', str3)
        PromptSetText(TrickNext, str3)
        PromptSetEnabled(TrickNext, 1)
        PromptSetVisible(TrickNext, 1)
        PromptSetStandardMode(TrickNext,1)
        PromptSetGroup(TrickNext, TrickPrompts)
        Citizen.InvokeNative(0xC5F428EE08FA7F2C,TrickNext,true)
        PromptRegisterEnd(TrickNext)

        local str4 = 'Anterior'
        TrickPrev = PromptRegisterBegin()
        PromptSetControlAction(TrickPrev, Prompts.Prev)
        str4 = CreateVarString(10, 'LITERAL_STRING', str4)
        PromptSetText(TrickPrev, str4)
        PromptSetEnabled(TrickPrev, 1)
        PromptSetVisible(TrickPrev, 1)
        PromptSetStandardMode(TrickPrev,1)
        PromptSetGroup(TrickPrev, TrickPrompts)
        Citizen.InvokeNative(0xC5F428EE08FA7F2C,TrickPrev,true)
        PromptRegisterEnd(TrickPrev)
    end)
end

Citizen.CreateThread(function() --
    SetupTrickPrompt()
    while true do
        Citizen.Wait(4)
        if Citizen.InvokeNative(0x580417101DDB492F, 0, StartKey) then
            tricking = not tricking
         end
        if tricking == true and not IsEntityDead(PlayerPedId()) then
            local label  = CreateVarString(10, 'LITERAL_STRING', "Trick: "..tricks[index][2])
            PromptSetActiveGroupThisFrame(TrickPrompts, label)
            if Citizen.InvokeNative(0xC92AC953F0A982AE,TrickDoPrompt) then
                if index < 3 then
                    StartTrick(tricks[index][1])
                else
                    TrickVariation(index)
                end
            end
            if Citizen.InvokeNative(0xC92AC953F0A982AE,TrickEndPrompt) then
                tricking = false
                ClearPedTasksImmediately(PlayerPedId())
            end
            if Citizen.InvokeNative(0xC92AC953F0A982AE,TrickNext) then
                index = index + 1
                if index > #tricks then
                    index = 1
                end
            end
            if Citizen.InvokeNative(0xC92AC953F0A982AE,TrickPrev) then
                index = index - 1
                if index == 0 then
                    index = #tricks
                end
            end
        end
    end
end)

function CanTwirl(hash)
	if (IsWeaponRevolver(hash) or IsWeaponPistol(hash)) then
		return true
	else
		return false
	end
end

function IsWeaponRevolver(hash)
    return Citizen.InvokeNative(0xC212F1D05A8232BB, hash)
end

function IsWeaponPistol(hash)
    return Citizen.InvokeNative(0xDDC64F5E31EEDAB6, hash)
end

function StartTrick(trickhash)
local hasw, playerw = GetCurrentPedWeapon(PlayerPedId(),1)
    if CanTwirl(playerw) then
	playingGunTrick = trickhash
        Citizen.InvokeNative(0xB31A277C1AC7B7FF, PlayerPedId(), 4, 1, trickhash, 1, 1, 0, 0)  
    end
end

function TrickVariation(ind)
	local ped = PlayerPedId()
	local hasw, playerw = GetCurrentPedWeapon(ped,1)
	if CanTwirl(playerw) then
	    local emote = `KIT_EMOTE_TWIRL_GUN`
	    if playingGunTrick ~= nil then
		emote = playingGunTrick
	    end
	    Citizen.InvokeNative(0xCBCFFF805F1B4596, ped, emote)
	    Citizen.InvokeNative(0xB31A277C1AC7B7FF, ped, 4, 1, Citizen.InvokeNative(0x2C4FEC3D0EFA9FC0, ped), true, false, false, false, false)
	    Citizen.InvokeNative(0x01F661BB9C71B465, ped, 4, N_0xf4601c1203b1a78d(emote, ind))
	    Citizen.InvokeNative(0x408CF580C5E96D49, ped, 4)
	end
end

AddEventHandler('onResourceStop', function(resourceName)
	if (GetCurrentResourceName() ~= resourceName) then
	  return
	end
    tricking = false
    ClearPedTasksImmediately(PlayerPedId())
end)
