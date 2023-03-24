1. To use it in another scripts to open vault, or boxes use:

EXAMPLE:

local ifSuccess = exports['SS-Lockpick']:Lockpick()
		if ifSuccess then     
    			print("SUCCESS")
		else      
			print("FAILED")
		end

2. If you have Bulgar DoorLocks add this in client where you want !

RegisterNetEvent('bulgar_doorlocks_vorp:SS-Lockpick')
AddEventHandler('bulgar_doorlocks_vorp:SS-Lockpick', function(door, state)
    for k,doorID in ipairs(Config.DoorList) do
    	if doorID.object == door then
			doorID.locked = state   
        end        
	end
end)   