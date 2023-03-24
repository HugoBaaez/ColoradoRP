-- Dump della struttura di tabella s25664_sirecvorpsv.ss_identitycard
CREATE TABLE IF NOT EXISTS `ss_identitycard` (
  `identifier` varchar(160) NOT NULL,
  `u_charid` int(50) NOT NULL,
  `aliases` varchar(255) DEFAULT NULL,
  `recordid` varchar(255) DEFAULT NULL,
  `weight` varchar(255) DEFAULT NULL,
  `eyecolor` varchar(255) DEFAULT NULL,
  `haircolor` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `dob` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `height` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `regdate` varchar(50) DEFAULT NULL,
  `isfake` int(11) DEFAULT NULL,
  PRIMARY KEY (`u_charid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- L’esportazione dei dati non era selezionata.

-- Dump della struttura di tabella s25664_sirecvorpsv.ss_identitycardfake
CREATE TABLE IF NOT EXISTS `ss_identitycardfake` (
  `identifier` varchar(160) NOT NULL,
  `u_charid` int(50) NOT NULL,
  `aliases` varchar(255) DEFAULT NULL,
  `recordid` varchar(255) DEFAULT NULL,
  `weight` varchar(255) DEFAULT NULL,
  `eyecolor` varchar(255) DEFAULT NULL,
  `haircolor` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `dob` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `height` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `regdate` varchar(50) DEFAULT NULL,
  `isfake` int(11) DEFAULT NULL,
  PRIMARY KEY (`u_charid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;