Config = {}

----------------------------------------------------
-------- Intervalles en secondes -------------------
----------------------------------------------------

-- Temps d'attente Antispam / Waiting time for antispam
Config.AntiSpamTimer = 5

-- Vérification et attribution d'une place libre / Verification and allocation of a free place
Config.TimerCheckPlaces = 6

-- Mise à jour du message (emojis) et accès à la place libérée pour l'heureux élu / Update of the message (emojis) and access to the free place for the lucky one
Config.TimerRefreshClient = 7

-- Mise à jour du nombre de points / Number of points updating
Config.TimerUpdatePoints = 6

----------------------------------------------------
------------ Nombres de points ---------------------
----------------------------------------------------

-- Nombre de points gagnés pour ceux qui attendent / Number of points earned for those who are waiting
Config.AddPoints = 1

-- Nombre de points perdus pour ceux qui sont entrés dans le serveur / Number of points lost for those who entered the server
Config.RemovePoints = 1

-- Nombre de points gagnés pour ceux qui ont 3 emojis identiques (loterie) / Number of points earned for those who have 3 identical emojis (lottery)
Config.LoterieBonusPoints = 300

-- Accès prioritaires / Priority access
Config.Points = {
	-- {'steamID', points},
	
	{'steam:110000110e92bb8', 1000}, -- Hugo
	{'steam:110000105b9099c', 1000}, -- Barsi
	{'steam:110000106feeb5c', 1000}, -- Walasman
	{'steam:11000013edad31b', 800}, -- GG
--	{'steam:110000114bb1d67', 800}, -- Buggy
	{'steam:11000013562f8ca', 800},  -- Zeraik
	{'steam:110000107442cc9', 800}, -- Ri
	{'steam:11000014162ac48', 800}, -- Lia
	{'steam:11000010e1b645e', 800}, -- Wagner
	{'steam:11000010b3feb24', 800}, -- Charles
	{'steam:11000011651ef6d', 800}, -- Jonh Miller
	{'steam:11000010c4af7a9', 800}, -- Miojo
	{'steam:11000011c943ab1', 800}, -- Gobbo
	{'steam:110000137f7721c', 800}, -- Clint
	{'steam:11000013cedcb94', 800}, -- Lyncon
	{'steam:110000101659163', 800}, -- Lulu
	{'steam:1100001425363c8', 800}, -- Olivia
	-------------------------------------  Platina
--	{'steam:11000010c54f205', 750},
--	{'steam:11000011182c03f', 750},
--	{'steam:11000013bcd5ef9', 750},
--	{'steam:1100001407f7c7d', 750},
--	{'steam:110000144aa99db', 750},
--	{'steam:1100001477674ec', 750},
--	{'steam:110000139c06855', 750},
	{'steam:11000010274b6c8', 750},
--	{'steam:11000014615fc16', 750},
--	{'steam:11000013bcd5ef9', 750},
--	{'steam:110000111ff459e', 750},
--	{'steam:110000112a7235f', 750},
--	{'steam:11000013eed4bed', 750},
--	{'steam:11000010223112d', 750},
--	{'steam:1100001053d2b94', 750},
--	{'steam:11000013d3deed6', 750},
--	{'steam:110000101fc537f', 750},
--	{'steam:1100001406c485f', 750},
--	{'steam:11000013bcd5ef9', 750},
--	{'steam:11000010c0117ff', 750},
	{'steam:110000109bedb76', 750},
	{'steam:11000010f24dc1b', 750},
	{'steam:11000010bfda50c', 750},
	-------------------------------------  Diamante
--	{'steam:110000109718ac9', 700},
--	{'steam:11000010b183457', 700},
--	{'steam:110000141588085', 700},
--	{'steam:11000014158881d', 700},
--	{'steam:11000014a0a2bda', 700},
--	{'steam:110000116443c5f', 700},
--	{'steam:110000107a5d6d0', 700},
--	{'steam:1100001437ee064', 700},
--	{'steam:1100001020f2e24', 700},
--	{'steam:11000011a00aa83', 700},
--	{'steam:110000101659163', 700},
--	{'steam:1100001137b9643', 700},
--	{'steam:110000140ff0fb7', 700},
--	{'steam:110000109bedb76', 700},
--	{'steam:11000013eb9ed48', 700},
--	{'steam:11000010d016c5d', 700},
--	{'steam:110000143cba92b', 700},
--	{'steam:11000014c461575', 700},
--	{'steam:11000011ae9f268', 700},
--	{'steam:1100001082490d2', 700},
--	{'steam:11000010720fb11', 700},
--	{'steam:110000104cb5cf0', 700},
--	{'steam:11000013bda8fe1', 700},
	{'steam:11000011bb6dfb2', 700},
--	{'steam:110000104cf5886', 700},
--	{'steam:110000103fa260b', 700},
--	{'steam:110000100741db8', 700},
--	{'steam:11000013d4c36ce', 700},
--	{'steam:11000010c416629', 700},
--	{'steam:11000010874c721', 700},
--	{'steam:11000010e109ccf', 700},
--	{'steam:110000106c914ce', 700},
--	{'steam:110000117f1fc79', 700},
	{'steam:11000010c75b2c4', 700},
	{'steam:110000111ff459e', 700},
	{'steam:11000010522de83', 700},
	{'steam:11000013a82355d', 700},
	-------------------------------------  Ouro
--	{'steam:110000102a372bd', 500},
--	{'steam:11000010563567f', 500},
--	{'steam:110000105f8f2f9', 500},
--	{'steam:11000011a78d699', 500},
--	{'steam:110000106cd7026', 500},
--	{'steam:11000010863f4cd', 500},
--	{'steam:1100001088e6d63', 500},
--	{'steam:1100001091452c5', 500},
--	{'steam:11000010a7a1417', 500},
--	{'steam:11000010b95f68c', 500},
--	{'steam:11000010b96da4e', 500},
--	{'steam:11000010bcc385c', 500},
--	{'steam:11000010e89a137', 500},
--	{'steam:11000010f35b4e8', 500},
--	{'steam:11000010f80494b', 500},
--	{'steam:11000011497d9a2', 500},
--	{'steam:110000114e366ba', 500},
--	{'steam:110000117a2b591', 500},
--	{'steam:1100001190d765c', 500},
--	{'steam:110000132802b77', 500},
--	{'steam:110000132b03b3f', 500},
--	{'steam:1100001348719cd', 500},
--	{'steam:110000134aeea1d', 500},
--	{'steam:11000013a71987b', 500},
--	{'steam:11000013bca2578', 500},
--	{'steam:11000013e8385d6', 500},
--	{'steam:11000013fbb9cad', 500},
--	{'steam:110000143f8a7b6', 500},
--	{'steam:1100001476c8ac8', 500},
--	{'steam:1100001489e1ae2', 500},
--	{'steam:110000148aac00e', 500},
--	{'steam:110000153b327cb', 500},
--	{'steam:11000010c577c07', 500},
--	{'steam:1100001050ec835', 500},
--	{'steam:11000010c75b2c4', 500},
--	{'steam:11000010f24dc1b', 500},
--	{'steam:11000015a1f5732', 500},
--	{'steam:11000013bcb8392', 500},
--	{'steam:1100001202afaed', 500},
--	{'steam:1100001410676c5', 500},
--	{'steam:1100001048afb75', 500},
--	{'steam:11000010a736c5d', 500},
--	{'steam:110000144d71291', 500},
--	{'steam:110000106dca28f', 500},
--	{'steam:110000104a420ad', 500},
--	{'steam:11000010dc7334d', 500},
--	{'steam:1100001003a112a', 500},
--	{'steam:11000011476e833', 500},
--	{'steam:11000010583bdda', 500},
--	{'steam:110000105ccfb75', 500},
--	{'steam:110000107c97248', 500},
--	{'steam:11000010e8ff6cb', 500},
--	{'steam:1100001498a4477', 500},
--	{'steam:11000010baf8820', 500},
--	{'steam:11000010e508327', 500},
--	{'steam:11000014c0614b6', 500},
--	{'steam:110000107766353', 500},
--	{'steam:110000108e60bd0', 500},
--	{'steam:110000136208c11', 500},
--	{'steam:1100001422d8b2c', 500},
--	{'steam:110000107ba7667', 500},
--	{'steam:1100001551b2272', 500},
--	{'steam:110000116467c53', 500},
--	{'steam:110000111cd2540', 500},
--	{'steam:1100001408c6f36', 500},
--	{'steam:1100001067e5fb3', 500},
--	{'steam:11000010bef76d5', 500},
--	{'steam:110000112d46aed', 500},
--	{'steam:110000140e07b33', 500},
--	{'steam:1100001060abe7e', 500},
	{'steam:110000104cf5886', 500},
--	{'steam:110000132c8e619', 500},
--	{'steam:110000107683881', 500},
--	{'steam:11000013389cbcd', 500},
--	{'steam:11000011bb72961', 500},
--	{'steam:110000113df72e2', 500},
--	{'steam:11000010c7a8193', 500},
--	{'steam:11000014220b749', 500},
--	{'steam:11000010e401ec9', 500},
--	{'steam:11000010bfd24ef', 500},
--	{'steam:11000011c098033', 500},
--	{'steam:110000149132295', 500},
--	{'steam:110000133fd224a', 500},
--	{'steam:11000013f33c662', 500},
--	{'steam:110000144aa99db', 500},
--	{'steam:11000010bfda50c', 500},
--	{'steam:1100001185d89d0', 500},
--	{'steam:11000010874c721', 500},
--	{'steam:11000015611a861', 500},
--	{'steam:110000106fe301d', 500},
--	{'steam:1100001337b90ee', 500},
--	{'steam:11000010b61dcfe', 500},
--	{'steam:11000010573468a', 500},
--	{'steam:11000014aeb3436', 500},
--	{'steam:11000010975e465', 500},
--	{'steam:11000010c188f3b', 500},
--	{'steam:110000110a62c72', 500},
--	{'steam:1100001322b9962', 500},
--	{'steam:11000013d455020', 500},
--	{'steam:110000109e3c64c', 500},
--	{'steam:110000116370be1', 500},
--	{'steam:1100001140b4a83', 500},
--	{'steam:11000013cef1c67', 500},
--	{'steam:11000014b2555bc', 500},
--	{'steam:1100001004b1ed2', 500},
--	{'steam:11000010522de83', 500},
--	{'steam:1100001114171a2', 500},
--	{'steam:11000010f47dba0', 500},
--	{'steam:11000013a82355d', 500},
--	{'steam:11000013f51d555', 500},
--	{'steam:110000135067478', 500},
--	{'steam:11000014aef7758', 500},
--	{'steam:11000013d52f800', 500},
--	{'steam:110000116443c5f', 500},
--	{'steam:110000106c8c39e', 500},
--	{'steam:110000106dca28f', 500},
--	{'steam:110000107d5a886', 500},
--	{'steam:1100001324a743f', 500},
--	{'steam:110000154e1e2b0', 500},
--	{'steam:1100001077be2f9', 500},
--	{'steam:1100001172cc3a3', 500},
	{'steam:1100001145db1dc', 500},
--	{'steam:110000144aa99db', 500},
	{'steam:110000103543baf', 500},
--	{'steam:1100001083e0cdb', 500},
--	{'steam:110000145d40712', 500},
	{'steam:11000011269afbf', 500},
--	{'steam:11000014cf805f8', 500},
--	{'steam:110000106355868', 500},
--	{'steam:1100001004b1ed2', 500},
	{'steam:110000137b747f8', 500},
--	{'steam:11000010b7eebfd', 500},
	{'steam:1100001344059b2', 500},
	{'steam:110000139cbd4d6', 500},
	{'steam:11000013c2a3f2b', 500},
	{'steam:110000106c914ce', 500}
----------------------------------------------  Streamers
	{'steam:11000011b3f3d64', 450},  -- NATASHA
	{'steam:110000148d414fa', 450},  -- Asgard Ravioly
	{'steam:1100001161472c7', 450},  -- Vittão
	{'steam:11000013407af86', 450},  -- Aleijatv
----------------------------------------------  Prata
--	{'steam:110000100a9d79b', 400},
--	{'steam:110000102331b00', 400},
--	{'steam:110000103e178e8', 400},
--	{'steam:110000139cf659c', 400},
--	{'steam:110000102ec53be', 400},
--	{'steam:110000105640470', 400},
--	{'steam:110000107b015b7', 400},
--	{'steam:1100001095b3a38', 400},
--	{'steam:11000010a9a9524', 400},
--	{'steam:11000010a9f2e49', 400},
--	{'steam:11000010aac7d04', 400},
--	{'steam:11000010b40e3be', 400},
--	{'steam:11000010c23de42', 400},
--	{'steam:11000010d091db7', 400},
--	{'steam:11000014fad7149', 400},
--	{'steam:11000010efc521d', 400},
--	{'steam:11000010f7a0675', 400},
--	{'steam:11000010fe2df94', 400},
--	{'steam:110000113e34e32', 400},
--	{'steam:11000011651ef6d', 400},
--	{'steam:1100001191f1bfb', 400},
--	{'steam:1100001195d49c6', 400},
--	{'steam:11000011a2fb97e', 400},
--	{'steam:11000011bc13ac3', 400},
--	{'steam:11000011c943ab1', 400},
--	{'steam:11000013389cbcd', 400},
--	{'steam:110000134507913', 400},
--	{'steam:11000013b4fd3c2', 400},
--	{'steam:11000013dd558b4', 400},
--	{'steam:110000140051087', 400},
--	{'steam:110000141a94b9b', 400},
--	{'steam:110000141d09bca', 400},
--	{'steam:1100001437f3e54', 400},
--	{'steam:1100001447b6730', 400},
--	{'steam:110000146e237c9', 400},
--	{'steam:110000147e107ef', 400},
--	{'steam:110000149c726a7', 400},
--	{'steam:11000014b93e5d4', 400},
--	{'steam:11000014c0db262', 400},
--	{'steam:110000154ebe5c3', 400},
--	{'steam:110000155258e58', 400},
--	{'steam:1100001037b36e5', 400},
--	{'steam:1100001022d9a7e', 400},
--	{'steam:1100001555d924c', 400},
--	{'steam:1100001098620ca', 400},
--	{'steam:11000014186c057', 400},
--	{'steam:110000101ff805d', 400},
--	{'steam:1100001322b9962', 400},
--	{'steam:110000114f3381e', 400},
--	{'steam:110000142df4507', 400},
--	{'steam:11000010a5cadab', 400},
--	{'steam:1100001425363c8', 400},
--	{'steam:11000013dcc847b', 400},
--	{'steam:1100001078f393f', 400},
--	{'steam:110000108656324', 400},
--	{'steam:110000137f7721c', 400},
--	{'steam:110000106f6b33b', 400},
--	{'steam:11000011824e245', 400},
--	{'steam:110000107a67529', 400},
--	{'steam:11000011477a6be', 400},
--	{'steam:11000014408113b', 400},
--	{'steam:11000010713854a', 400},
--	{'steam:110000141a51ffa', 400},
--	{'steam:110000101c0b8db', 400},
--	{'steam:110000106f16e51', 400},
--	{'steam:11000014c53cf81', 400},
--	{'steam:11000010e95d1cd', 400},
--	{'steam:11000011171723f', 400},
--	{'steam:110000148f66229', 400},
--	{'steam:110000131f1a360', 400},
--	{'steam:110000107db61dd', 400},
--	{'steam:110000139ab9055', 400},
--	{'steam:110000147f98c2a', 400},
--	{'steam:11000014ad8d814', 400},
--	{'steam:110000107248791', 400},
--	{'steam:1100001130bfee1', 400},
--	{'steam:11000013f90609f', 400},
--	{'steam:110000112bcde7a', 400},
--	{'steam:110000119563381', 400},
--	{'steam:110000106c8c39e', 400},
--	{'steam:11000013d3deed6', 400},
--	{'steam:11000010ec8f37b', 400},
--	{'steam:110000144670740', 400},
--	{'steam:11000010e5e1c95', 400},
--	{'steam:11000013701d4ea', 400},
--	{'steam:11000010945bd6f', 400},
--	{'steam:11000011649de59', 400},
--	{'steam:110000111d69d77', 400},
--	{'steam:110000134242fbe', 400},
--	{'steam:1100001099de7b7', 400},
--	{'steam:11000011922a4c2', 400},
--	{'steam:1100001191c0026', 400},
--	{'steam:11000013fcd8b24', 400},
--	{'steam:11000013f382a84', 400},
--	{'steam:11000013342f9ca', 400},
	{'steam:11000014ccd8539', 400},
--	{'steam:110000115be7502', 400},
--	{'steam:11000010b8d48c5', 400},
--	{'steam:110000131d847f9', 400},
--	{'steam:11000010ea1bb40', 400},
--	{'steam:110000131e00bf0', 400},
--	{'steam:11000010934d542', 400},
--	{'steam:11000010afc3144', 400},
--	{'steam:11000010e050fab', 400},
--	{'steam:1100001549f4fc2', 400},
	{'steam:1100001186b491c', 400},
--	{'steam:1100001585cbf59', 400},
--	{'steam:110000115fea05a', 400},
--	{'steam:110000157f0b6fc', 400},
--	{'steam:11000010ec3a8b8', 400},
--	{'steam:1100001077cccd4', 400},
--	{'steam:110000133ec1e0e', 400},
--	{'steam:11000015381b081', 400},
--	{'steam:110000116e68190', 400},
--	{'steam:11000013cd78a07', 400},
--	{'steam:110000132608050', 400},
--	{'steam:110000107103810', 400},
--	{'steam:11000010b5e2d5c', 400},
--	{'steam:11000011721a26c', 400},
--	{'steam:11000010ac8f48a', 400},
--	{'steam:1100001155a0a65', 400},
--	{'steam:110000144bc03d2', 400},
--	{'steam:11000014dbe0b66', 400},
--	{'steam:1100001066acb56', 400},
--	{'steam:110000132856f19', 400},
--	{'steam:110000106cc7099', 400},
--	{'steam:110000114c7477f', 400},
--	{'steam:110000106c914ce', 400},
--	{'steam:110000148f66229', 400},
--	{'steam:11000011d6d8bf2', 400},
--	{'steam:11000010c6fece6', 400},
--	{'steam:1100001140993ec', 400},
--	{'steam:1100001407e1f0f', 400},
--	{'steam:11000011c54662d', 400},
--	{'steam:11000011917cb70', 400},
--	{'steam:11000010655b302', 400},
--	{'steam:1100001120d5ab9', 400},
--	{'steam:11000014a7ff571', 400},
	{'steam:11000014999f157', 400},
--	{'steam:1100001347a4db4', 400},
--	{'steam:1100001070b8489', 400},
--	{'steam:1100001546269dc', 400},
--	{'steam:11000010a73a99b', 400},
--	{'steam:1100001365db284', 400},
--	{'steam:11000010628e5f4', 400},
--	{'steam:110000103e7f1e1', 400},
--	{'steam:11000010bfda50c', 400},
--	{'steam:11000013d0f0619', 400},
--	{'steam:110000131d847f9', 400},
--	{'steam:110000116b97fc5', 400},
--	{'steam:11000013fdb21b5', 400},
--	{'steam:110000136d273cb', 400},
--	{'steam:11000014be29ce9', 400},
--	{'steam:11000010e8ff6cb', 400},
	{'steam:1100001067ad7c0', 400},
--	{'steam:110000105970e61', 400},
--	{'steam:110000116d953d4', 400},
--	{'steam:110000109461de2', 400},
--	{'steam:110000142dab8f3', 400},
--	{'steam:1100001563eb578', 400},
--	{'steam:11000010afaed5b', 400},
--	{'steam:11000014b4b543d', 400},
	{'steam:11000013737c2f8', 400},
	{'steam:11000010841ff9a', 400},
	{'steam:11000010ab79a42', 400},
	{'steam:110000106fa4bc1', 400},
	{'steam:11000010cfc32b6', 400},
	
	------------------------------------------------  Bronze
--	{'steam:110000101d66586', 300},
--	{'steam:110000102699462', 300},
--	{'steam:1100001168e809f', 300},
--	{'steam:110000116ada167', 300},
--	{'steam:11000011761462e', 300},
--	{'steam:11000013e5400d1', 300},
--	{'steam:110000141e73d64', 300},
--	{'steam:1100001426d9258', 300},
--	{'steam:11000010aca618e', 300},
--	{'steam:1100001056d38a4', 300},
--	{'steam:110000107d75c1f', 300},
--	{'steam:11000010b0864d3', 300},
--	{'steam:11000010756751f', 300},
--	{'steam:110000145eab256', 300},
--	{'steam:110000140e3ca2a', 300},
	
	
}

----------------------------------------------------
------------- Textes des messages ------------------
----------------------------------------------------

-- Si steam n'est pas détecté / If steam is not detected
Config.NoSteam = "A steam não foi detectada. Por favor, (re)inicie o Steam e o RedM e tente novamente."
-- Config.NoSteam = "Steam was not detected. Please (re)launch Steam and FiveM, and try again."

-- Message d'attente / Waiting text
Config.EnRoute = "Você está na estrada. Você já viajou"
-- Config.EnRoute = "You are on the road. You have already traveled"

-- "points" traduits en langage RP / "points" for RP purpose
Config.PointsRP = "Quilômetros"
-- Config.PointsRP = "kilometers"

-- Position dans la file / position in the queue
Config.Position = "Você está na posição "
-- Config.Position = "You are in position "

-- Texte avant les emojis / Text before emojis
--Config.EmojiMsg = "If emotis , restartujte klienta: "
 Config.EmojiMsg = "Se os emojis estiverem congelados, reinicie seu cliente: "

-- Quand le type gagne à la loterie / When the player win the lottery
Config.EmojiBoost = "!!! Yippeeeeeeeeeeeee, " .. Config.LoterieBonusPoints .. "ganhou pontos na fila !!!"
-- Config.EmojiBoost = "!!! Yippee, " .. Config.LoterieBonusPoints .. " " .. Config.PointsRP .. " won !!!"

-- Anti-spam message / anti-spam text
Config.PleaseWait_1 = "Espere por favor "
Config.PleaseWait_2 = " segundos. A conexão será iniciada automaticamente!"
-- Config.PleaseWait_1 = "Please wait "
-- Config.PleaseWait_2 = " seconds. The connection will start automatically!"

-- Me devrait jamais s'afficher / Should never be displayed
Config.Accident = "Ops, um erro aconteceu... Se acontecer novamente, você pode informar ao suporte :)"
-- Config.Accident = "Oops, you just had an accident ... If it happens again, you can inform the support :)"

-- En cas de points négatifs / In case of negative points
Config.Error = " ERROR : RESTART THE QUEUE SYSTEM AND CONTACT THE SUPPORT "
-- Config.Error = " ERROR : RESTART THE QUEUE SYSTEM AND CONTACT THE SUPPORT "


Config.EmojiList = {
	'🐌', 
	'🐍',
	'🐎', 
	'🐑', 
	'🐒',
	'🐘', 
	'🐙', 
	'🐛',
	'🐜',
	'🐝',
	'🐞',
	'🐟',
	'🐠',
	'🐡',
	'🐢',
	'🐤',
	'🐦',
	'🐧',
	'🐩',
	'🐫',
	'🐬',
	'🐲',
	'🐳',
	'🐴',
	'🐅',
	'🐈',
	'🐉',
	'🐋',
	'🐀',
	'🐇',
	'🐏',
	'🐐',
	'🐓',
	'🐕',
	'🐖',
	'🐪',
	'🐆',
	'🐄',
	'🐃',
	'🐂',
	'🐁',
	'🔥'
}
