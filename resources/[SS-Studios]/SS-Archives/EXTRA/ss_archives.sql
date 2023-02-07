
-- Dump della struttura di tabella s25664_sirecvorpsv.ss_archives
CREATE TABLE IF NOT EXISTS `ss_archives` (
  `offense` varchar(160) NOT NULL,
  `date` varchar(255) DEFAULT NULL,
  `institution` varchar(255) DEFAULT NULL,
  `charge` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `term` varchar(255) DEFAULT NULL,
  `classified` int(2) NOT NULL DEFAULT 0,
  `identifier` varchar(255) DEFAULT NULL,
  `dob` varchar(255) DEFAULT NULL,
  `warden` varchar(255) DEFAULT NULL,
  `fine` int(50) DEFAULT 0,
  `payed` varchar(50) DEFAULT NULL,
  `bounty` int(11) DEFAULT 0,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `city` varchar(500) DEFAULT NULL,
  `jail` int(11) DEFAULT NULL,
  `u_charid` int(11) DEFAULT NULL,
  PRIMARY KEY (`offense`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;