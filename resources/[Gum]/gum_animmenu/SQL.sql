CREATE TABLE `animationsfavorite` (
  `charid` int(255) NOT NULL,
  `favorite` longtext NOT NULL DEFAULT '{}',
  PRIMARY KEY (`charid`),
  KEY `FK_animationsFavorite_characters` (`charid`)
) ENGINE=InnoDB;

CREATE TABLE `animations` (
  `charid` int(255) NOT NULL,
  `animations` longtext NOT NULL DEFAULT '{}',
  PRIMARY KEY (`charid`),
  KEY `FK_animations_characters` (`charid`)
) ENGINE=InnoDB;