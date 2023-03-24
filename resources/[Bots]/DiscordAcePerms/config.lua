Config = {
	Server_Name = "Colorado Roleplay",
	Discord_Link = 'discord.gg/coloradorp', --DISCORD INVITE 1st button
	Website_Link = '', -- WEBSITE IF YOU HAVE ONE 2scnd button
	button = "button",
	IconLink = "",
	Linkbutton = "", -- 3rd button
	roleList = {
		--DISCORD ROLE ID ,  GROUP SET IN YOUR PERMS.CFG
		{960633364568744029, "group.member"}, 
		{960551388381868084, "group.owner"}, 
		{960551251974688819, "group.owner"}, 
		{960551464240054393, "group.owner"},
		{960551060739612734, "group.owner"}, 
		{1008909362544263219, "group.owner"},
	},
}

-- add this to your perms.cfg or server.cfg
-- add_ace resource.DiscordAcePerms command.add_principal allow
-- add_ace resource.DiscordAcePerms command.remove_principal allow

-- you dont need to add this #add_principal identifier.steam:xxxxxxxx group.admin 
-- this script replaces steam id with discord id 
