-- local ragdoll = true
-- CreateThread(function()
--     while true do
--         Wait(2)
--         if IsControlJustPressed(0, 0xCEE12B50) then -- mouse3
--             if ragdoll then
--                 ragdoll = false
--                 ClearPedSecondaryTask(PlayerPedId())
--                 ClearPedTasks(PlayerPedId())
--                 ExecuteCommand('annullere')
--             else 
--                 ragdoll = true
--                 local myPed = PlayerPedId()
--                 SetPedToRagdoll(myPed, 1000, 1000, 0, 0, 0, 0)
--             end
--             Wait(500)
--         end
--     end
-- end)

local ragdoll = false;

function toggleRagdoll()
	ragdoll = not ragdoll;
	if not ragdoll then
	end
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
       if IsControlJustPressed(0, 0xCEE12B50) then
			toggleRagdoll();
		end
		if ragdoll then
			
		end
    end
end)