local TEXTS = Config.Texts
local TEXTURES = Config.Textures
local notifSettings = {}
-----------------------------------------------------------------------------------------------------
local notifSettings = {
	[1] = {
		TEXTS.MissionStarted, TEXTS.Follow1, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[2] = {
		TEXTS.MissionStarted, TEXTS.Follow2, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[3] = {
		TEXTS.Ambush, TEXTS.ClearBandits, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[4] = {
		TEXTS.Robbery, TEXTS.ClearArea, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[5] = {
		TEXTS.Robbery, TEXTS.AlreadyRobbed, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[6] = {
		TEXTS.Robbery, TEXTS.Started, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[7] = {
		TEXTS.Robbery, "", TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[8] = {
		TEXTS.Robbery, TEXTS.NoJob, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[9] = {
		TEXTS.Robbery, TEXTS.NotPossible, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[10] = {
		TEXTS.Robbery, TEXTS.DeadBandits, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[11] = {
		TEXTS.Robbery, TEXTS.TrainComes, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[12] = {
		TEXTS.Robbery, TEXTS.Abandoned, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[13] = {
		TEXTS.Robbery, TEXTS.GoCloser, TEXTURES.alert[1], TEXTURES.alert[2], 1500,
	},
	[14] = {
		TEXTS.Robbery, TEXTS.TrainAlert, TEXTURES.alert[1], TEXTURES.alert[2], 1500,
	},
	--[[
	[] = {
		TEXTS.TEXT, TEXTS.Saved, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
]]
}

-----------------------------------------------------------------------------------------------------
function CallTrainRobberyNotif(id, extra)
	local _id = tonumber(id)
	local title = notifSettings[_id][1]
	local text = notifSettings[_id][2]
	local dict = notifSettings[_id][3]
	local texture = notifSettings[_id][4]
	local timer = notifSettings[_id][5]

------------------EXTRA CODE START------------------
	if extra ~= nil then 						 --|
		if extra.title ~= nil then 				 --|
			title = extra.title					 --|
		end									 	 --|
		if extra.text ~= nil then 				 --|
			text = extra.text					 --|
		end										 --|
		if extra.dict ~= nil then 				 --|
			dict = extra.dict					 --|
		end										 --|
		if extra.texture ~= nil then 			 --|
			texture = extra.texture				 --|
		end										 --|
		if extra.timer ~= nil then 				 --|
			timer = extra.timer					 --|
		end										 --|
	end											 --|
------------------EXTRA CODE END------------------
	TriggerEvent("Notification:train_robbery", title, text, dict, texture, timer)--change this to a different notification logic if you want
end
-----------------------------------------------------------------------------------------------------
RegisterNetEvent("ricx_train_robbery:call_notif", function(id, extra)
	local _id = tonumber(id)
	CallTrainRobberyNotif(_id, extra)
end)