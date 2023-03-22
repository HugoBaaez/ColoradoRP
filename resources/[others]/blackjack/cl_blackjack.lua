local inTable = false
local playerCards = {}
local otherplayersCards = {}
local dealerCards = {}
local playerCount = 0
local dealerCount = 0
local textWinLosePush = ""
local gameFinished = false
local waiting = false
local alreadyPressed = false
local stopBet = false
local cardsGiven = false
local bet = 0
local maxbet = 0
local target_table
RegisterNUICallback('close', function(data, cb)
    SetNuiFocus(false, false)
end)

ESX	= nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(10)
	end
end)

function startPlay()
    resetGameVariables()
    inTable = true
    TriggerServerEvent('ak_blackjack:Request_Sit' , target_table)
    SendNUIMessage({type = 'show'})
end

function stopPlay()
    resetGameVariables()
    inTable = false
    TriggerServerEvent('ak_blackjack:Request_Leave', target_table)
    SendNUIMessage({type = 'hide'})
	target_table = nil
end

function resetGameVariables()
    playerCards = {}
    otherplayersCards = {}
    dealerCards = {}
    playerCount = 0
    dealerCount = 0
    textWinLosePush = ""
    gameFinished = false
    waiting = false
    alreadyPressed = false
    stopBet = false
    cardsGiven = false
    SendNUIMessage({type = 'clear'})
    maxbet = 0
    local str = Citizen.InvokeNative(0xFA925AC00EB830B9, 10, "LITERAL_STRING", " ", Citizen.ResultAsLong())
    Citizen.InvokeNative(0xFA233F8FE190514C, str)
    Citizen.InvokeNative(0xE9990552DEC71600)
end



-- PROMPT
local BlackJackGroup = GetRandomIntInRange(0, 0xffffff)

local StartBlackJackGroup = GetRandomIntInRange(0, 0xffffff)


local _StartPrompt
function StartPrompt()
    Citizen.CreateThread(function()
        local str = "Jogar Blackjack"
        _StartPrompt = Citizen.InvokeNative(0x04F97DE45A519419)
        PromptSetControlAction(_StartPrompt, 0xC7B5340A)
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(_StartPrompt, str)
        PromptSetEnabled(_StartPrompt, true)
        PromptSetVisible(_StartPrompt, true)
        PromptSetStandardMode(_StartPrompt, true)
        PromptSetGroup(_StartPrompt, StartBlackJackGroup)
        PromptRegisterEnd(_StartPrompt)
        PromptSetPriority(_StartPrompt , true)
    end)
end

local _BetPrompt
function BetPrompt()
    Citizen.CreateThread(function()
        local str = "Apostar"
        _BetPrompt = Citizen.InvokeNative(0x04F97DE45A519419)
        PromptSetControlAction(_BetPrompt, 0xC7B5340A)
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(_BetPrompt, str)
        PromptSetEnabled(_BetPrompt, false)
        PromptSetVisible(_BetPrompt, false)
        PromptSetStandardMode(_BetPrompt, true)
        PromptSetGroup(_BetPrompt, BlackJackGroup)
        PromptRegisterEnd(_BetPrompt)
        PromptSetPriority(_BetPrompt , true)
    end)
end

local _BetPromptAmmount
function BetPromptAmmount()
    Citizen.CreateThread(function()
        local str = "QUANTIA: " .. bet.."$"
        _BetPromptAmmount = Citizen.InvokeNative(0x04F97DE45A519419)
        PromptSetControlAction(_BetPromptAmmount, 0x6319DB71)
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(_BetPromptAmmount, str)
        PromptSetEnabled(_BetPromptAmmount, false)
        PromptSetVisible(_BetPromptAmmount, false)
        PromptSetStandardMode(_BetPromptAmmount, true)
        PromptSetGroup(_BetPromptAmmount, BlackJackGroup)
        PromptRegisterEnd(_BetPromptAmmount)
        PromptSetPriority(_BetPromptAmmount , true)
    end)
end

local _CallPrompt
function CallPrompt()
    Citizen.CreateThread(function()
        local str = "Pedir Carta"
        _CallPrompt = Citizen.InvokeNative(0x04F97DE45A519419)
        PromptSetControlAction(_CallPrompt, 0xC7B5340A)
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(_CallPrompt, str)
        PromptSetEnabled(_CallPrompt, false)
        PromptSetVisible(_CallPrompt, false)
        PromptSetStandardMode(_CallPrompt, true)
        PromptSetGroup(_CallPrompt, BlackJackGroup)
        PromptRegisterEnd(_CallPrompt)
        PromptSetPriority(_CallPrompt , true)
    end)
end


Citizen.CreateThread(function()
    while true do
        Wait(0)
        local pos = GetEntityCoords(PlayerPedId())

        if (Vdist(pos.x, pos.y, pos.z, -3649.76, -2555.16, -14.98) < 2.2) then -- Rhodes
			DrawText3Ds(-3649.76, -2555.16, -14.98, "Pressione [G] para jogar")
            if IsControlJustPressed(0, 0x760A9C6F) then
				stopPlay()
				Citizen.Wait(2000)
				local player = PlayerPedId()
                StartBlackJack()
            end
            
		else
			Citizen.Wait(1000)
        end
	end
end)
Citizen.CreateThread(function()
    while true do
        Wait(0)
        local pos = GetEntityCoords(PlayerPedId())

        if (Vdist(pos.x, pos.y, pos.z, -3657.12, -2553.67, -14.98) < 2.2) then --BlackWater
			DrawText3Ds(-3657.12, -2553.67, -14.98, "Pressione [G] para jogar")
            if IsControlJustPressed(0, 0x760A9C6F) then
				-- stopPlay()
				Citizen.Wait(2000)
				local player = PlayerPedId()
                StartBlackJack()
            end
            
		else
			Citizen.Wait(1000)
        end
	end
end)

function DrawText3Ds(x, y, z, text)
    local onScreen,_x,_y=GetScreenCoordFromWorldCoord(x, y, z)
    local px,py,pz=table.unpack(GetGameplayCamCoord())  
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
    local str = CreateVarString(10, "LITERAL_STRING", text, Citizen.ResultAsLong())
    if onScreen then
    	SetTextScale(0.30, 0.30)
  		SetTextFontForCurrentCommand(1)
    	SetTextColor(255, 255, 255, 215)
    	SetTextCentre(1)
    	DisplayText(str,_x,_y)
    	local factor = (string.len(text)) / 225
    	DrawSprite("feeds", "hud_menu_4a", _x, _y+0.0125,0.015+ factor, 0.03, 0.1, 35, 35, 35, 190, 0)
    	--DrawSprite("feeds", "toast_bg", _x, _y+0.0125,0.015+ factor, 0.03, 0.1, 100, 1, 1, 190, 0)
    end
end

function StartBlackJack()
    Wait(1000)
    CallPrompt()
    BetPromptAmmount()
    BetPrompt()
    StartPrompt()
    while true do
        Wait(0)
        local ped = PlayerPedId()
		 for i, v in ipairs(Config.Tables) do
		 local distance = Vdist(GetEntityCoords(ped) , v ) < 2.5
        while distance do
            Citizen.Wait(0)
			distance = Vdist(GetEntityCoords(ped) , v ) < 2.5
			target_table = i
            if not inTable then
				
				TriggerEvent("vorp:Tip", "Blackjack você não deve exceder 21. As cartas de rosto são 10 e ases são 10 ou 1. Quem chegar mais perto de 21 ganha!", 10000) -- from client side
                PlaySoundFrontend("show_info", "Study_Sounds", true, 0)
                startPlay()
            elseif inTable then
                local BlackJackGroupName  = CreateVarString(10, 'LITERAL_STRING', "BlackJack")
                PromptSetActiveGroupThisFrame(BlackJackGroup, BlackJackGroupName)

            elseif inTable and not distance then
                inTable = false
                textWinLosePush = ""
                stopPlay()
            end

            if inTable and waiting and not alreadyPressed then
                PromptSetEnabled(_CallPrompt, true)
                PromptSetVisible(_CallPrompt, true)
                local str = Citizen.InvokeNative(0xFA925AC00EB830B9, 10, "LITERAL_STRING", " ", Citizen.ResultAsLong())
                Citizen.InvokeNative(0xFA233F8FE190514C, str)
                Citizen.InvokeNative(0xE9990552DEC71600)
                if PromptHasStandardModeCompleted(_CallPrompt) and waiting then
                    TriggerServerEvent('ak_blackjack:Choice', true , i)
                    alreadyPressed = true
                    PromptSetEnabled(_CallPrompt, false)
                    PromptSetVisible(_CallPrompt, false)
                end
            elseif (inTable and not alreadyPressed and cardsGiven) then
                PromptSetEnabled(_CallPrompt, false)
                PromptSetVisible(_CallPrompt, false)
                local str = Citizen.InvokeNative(0xFA925AC00EB830B9, 10, "LITERAL_STRING", "Espere sua vez", Citizen.ResultAsLong())
                Citizen.InvokeNative(0xFA233F8FE190514C, str)
                Citizen.InvokeNative(0xE9990552DEC71600)
            end
            if maxbet ~= 0 and not stopBet then
                PromptSetEnabled(_BetPromptAmmount, true)
                PromptSetVisible(_BetPromptAmmount, true)
                PromptSetEnabled(_BetPrompt, true)
                PromptSetVisible(_BetPrompt, true)
            end
            if PromptHasStandardModeCompleted(_BetPromptAmmount) and not stopBet  then
                bet = bet + 0.50
                if bet > maxbet then
                    bet = 0
                    PlaySoundFrontend("BET_MIN_MAX", "HUD_POKER", true, 0)
                end
                if bet ~= 0 then
                    PlaySoundFrontend("BET_AMOUNT", "HUD_POKER", true, 0)
                end
                PromptDelete(_BetPromptAmmount)
                BetPromptAmmount()
            end
            if PromptHasStandardModeCompleted(_BetPrompt) and not stopBet then
                if not stopBet then
                    TriggerServerEvent("ak_blackjack:Get_Bet", bet , i)
                    PlaySoundFrontend("menu_select_bet", "RDRO_Poker_Sounds", true, 0)
                    PromptSetEnabled(_BetPromptAmmount, false)
                    PromptSetVisible(_BetPromptAmmount, false)
                    PromptSetEnabled(_BetPrompt, false)
                    PromptSetVisible(_BetPrompt, false)
                end
                stopBet = true
            end



            if not distance then
                stopPlay()
            end
        end
		end
		break
    end
end

RegisterNetEvent('ak_blackjack:ReceiveCard')
AddEventHandler('ak_blackjack:ReceiveCard', function(card, type , target)
    cardsGiven = true
	if inTable then
		PlaySoundFrontend("enter", "RDRO_Winners_Screen_Sounds", true, 0)
	end
    if type == "player" then
        if target == GetPlayerServerId(PlayerId()) then
            table.insert(playerCards, card)
            SendNUIMessage({type = 'player' , cards = playerCards})
        else
            local test = false
            for k ,v in pairs (otherplayersCards) do
                if v.source == target then
                    test = true
                    table.insert(v.card , card)
                end
            end
            if not test then
                local test2 = {}
                table.insert(test2 , card)
                otherplayersCards[#otherplayersCards + 1] = {source = target,  card = test2}
            end
            SendNUIMessage({type = 'other' , cards = otherplayersCards})
        end
    else
        table.insert(dealerCards, card)
        SendNUIMessage({type = 'dealer' , cards = dealerCards})

    end
end)

RegisterNetEvent('ak_blackjack:ReceiveWin')
AddEventHandler('ak_blackjack:ReceiveWin', function(gameResolution)
    textWinLosePush = gameResolution
    PlaySoundFrontend("show_info", "Study_Sounds", true, 0)
	TriggerEvent("vorp:TipRight", textWinLosePush..' !', 3000) -- from client side
end)

RegisterNetEvent('ak_blackjack:ReceiveCountedCards')
AddEventHandler('ak_blackjack:ReceiveCountedCards', function(count,type)
    if type == "player" then
        playerCount=count
    else
        dealerCount=count
    end
end)

RegisterNetEvent('ak_blackjack:GameFinished')
AddEventHandler('ak_blackjack:GameFinished', function(status)
    gameFinished = status
end)

RegisterNetEvent('ak_blackjack:WaitingForResponse')
AddEventHandler('ak_blackjack:WaitingForResponse', function(status)
    alreadyPressed = false
    waiting = status
end)

RegisterNetEvent('ak_blackjack:Reset_Game_Var')
AddEventHandler('ak_blackjack:Reset_Game_Var', function()
    resetGameVariables()
end)

RegisterNetEvent('ak_blackjack:Bet')
AddEventHandler('ak_blackjack:Bet', function(max)
    maxbet = max
end)

RegisterNetEvent("ak_blackjack:Stop_Bet")
AddEventHandler("ak_blackjack:Stop_Bet", function()
    if not stopBet then
        stopBet = true
        PromptSetEnabled(_BetPromptAmmount, false)
        PromptSetVisible(_BetPromptAmmount, false)
        PromptSetEnabled(_BetPrompt, false)
        PromptSetVisible(_BetPrompt, false)
        TriggerServerEvent("ak_blackjack:Get_Bet", 0 , target_table)
    end
end)

Citizen.CreateThread(function()	
	while not HasModelLoaded( GetHashKey("mp_fm_stakeout_poker_males_01") ) do
    Wait(500)
    RequestModel( GetHashKey("mp_fm_stakeout_poker_males_01") )
    end
    local Dealer = CreatePed(GetHashKey("mp_fm_stakeout_poker_males_01"), -3657.12, -2553.67, -14.98, 293.37, false, false, 0, 0) -- VALENTINE
    while not DoesEntityExist(Dealer) do
    Wait(300)
    end
    Citizen.InvokeNative(0x283978A15512B2FE, Dealer, true)
    FreezeEntityPosition(Dealer, true)
    SetEntityInvincible(Dealer, true)
    TaskStandStill(Dealer, -1)
    SetEntityCanBeDamagedByRelationshipGroup(Dealer, false, `PLAYER`)
    SetEntityAsMissionEntity(Dealer, true, true)
	SetBlockingOfNonTemporaryEvents(Dealer, true)
    SetModelAsNoLongerNeeded(GetHashKey("mp_fm_stakeout_poker_males_01"))
	
	while not HasModelLoaded( GetHashKey("mp_fm_stakeout_poker_males_01") ) do
    Wait(500)
    RequestModel( GetHashKey("mp_fm_stakeout_poker_males_01") )
    end
    local Dealer = CreatePed(GetHashKey("mp_fm_stakeout_poker_males_01"), -3649.76, -2555.16, -14.98, 33.84, false, false, 0, 0) -- RHODES
    while not DoesEntityExist(Dealer) do
    Wait(300)
    end
    Citizen.InvokeNative(0x283978A15512B2FE, Dealer, true)
    FreezeEntityPosition(Dealer, true)
    SetEntityInvincible(Dealer, true)
    TaskStandStill(Dealer, -1)
    SetEntityCanBeDamagedByRelationshipGroup(Dealer, false, `PLAYER`)
    SetEntityAsMissionEntity(Dealer, true, true)
	SetBlockingOfNonTemporaryEvents(Dealer, true)
    SetModelAsNoLongerNeeded(GetHashKey("mp_fm_stakeout_poker_males_01"))
end)

function DrawTxt(str, x, y, w, h, enableShadow, col1, col2, col3, a, centre)
    local str = CreateVarString(10, "LITERAL_STRING", str)
    SetTextScale(w, h)
    SetTextColor(math.floor(col1), math.floor(col2), math.floor(col3), math.floor(a))
	SetTextCentre(centre)
    if enableShadow then SetTextDropshadow(1, 0, 0, 0, 255) end
	Citizen.InvokeNative(0xADA9255D, 1);
    DisplayText(str, x, y)
end

