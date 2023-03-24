local pause = false
local time = 0
RegisterNetEvent("awaria-deadeye:use")
AddEventHandler("awaria-deadeye:use", function()
    if pause then
        TriggerEvent("vorp:TipRight", "Você tem que esperar "..time.." segundos antes de usar novamente", 5000)
    print(time)
    else
        pause = true
		Citizen.InvokeNative(0xA63FCAD3A6FEC6D2, PlayerId(), true)
        TriggerServerEvent('awaria-deadeye:takeitem')
		TriggerEvent("vorp:TipRight", "Press [ CAPS ] Para começar a rastrear", 5000)
        time = 600
        Citizen.Wait(math.random(Config.Time.a *1000, Config.Time.b *1000))
		Citizen.InvokeNative(0xA63FCAD3A6FEC6D2, PlayerId(), false)
        wait()
    end

end)

Citizen.CreateThread(function()
    while true do 
        Wait(1000)
            if time > 0 then 
                time = time - 1
          --      time = math.floor(time)
            end
    end
end)

wait = function()
    if pause then
        Citizen.Wait(600 * 1000)
        pause = false
    end

end