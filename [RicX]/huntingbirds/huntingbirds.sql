CREATE TABLE IF NOT EXISTS `birds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) NOT NULL,
  `charid` int(5) NOT NULL,
  `model` int(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `preset` int(2) NOT NULL DEFAULT 0,
  `xp`  int(6) NOT NULL DEFAULT 0,
  `price` int(8) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;
