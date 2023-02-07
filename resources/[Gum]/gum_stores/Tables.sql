-- ----------------------------
-- Table structure for stores
-- ----------------------------
DROP TABLE IF EXISTS `stores`;
CREATE TABLE `stores` (
  `city_name` varchar(50) DEFAULT NULL,
  `tax_for_price` varchar(4) DEFAULT NULL
) ENGINE=InnoDB;

-- ----------------------------
-- Records of stores
-- ----------------------------
INSERT INTO `stores` VALUES ('Valentine store', '10.0');
INSERT INTO `stores` VALUES ('Blackwater store', '10.0');
INSERT INTO `stores` VALUES ('Valentine butcher', '10.0');
INSERT INTO `stores` VALUES ('Saint Denise butcher', '10.0');
INSERT INTO `stores` VALUES ('Saint Denis store', '10.0');
INSERT INTO `stores` VALUES ('Rhodes store', '10.0');
SET FOREIGN_KEY_CHECKS=1;
