--######################### edit for VORP by: outsider ########################
local VORPcore = {}
TriggerEvent("getCore", function(core)
    VORPcore = core
end)


-------------------- GetJOB --------------------
RegisterServerEvent('get:PlayerJob')
AddEventHandler('get:PlayerJob', function()
    local _source = source
    local User = VORPcore.getUser(_source)
	if User ~= nil then
		local Character = User.getUsedCharacter
		local CharacterJob = Character.job
		TriggerClientEvent('send:PlayerJob', _source, CharacterJob)
	else
		return
	end
end)