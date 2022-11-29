/*
Navicat MySQL Data Transfer

Source Server         : Local
Source Server Version : 80019
Source Host           : localhost:3306
Source Database       : mz_node10

Target Server Type    : MYSQL
Target Server Version : 80019
File Encoding         : 65001

Date: 2021-01-14 15:26:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for alarm
-- ----------------------------
DROP TABLE IF EXISTS `alarm`;
CREATE TABLE `alarm` (
  `time` int NOT NULL,
  `id` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `name` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`time`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of alarm
-- ----------------------------
INSERT INTO `alarm` VALUES ('50', '0x24000900', 'flow_alarm', '0');
INSERT INTO `alarm` VALUES ('50', '0x24000901', 'temp_alarm', '0');
INSERT INTO `alarm` VALUES ('50', '0x24000902', 'pressure_alarm', '0');
INSERT INTO `alarm` VALUES ('50', '0x24000903', 'head_alarm', '0');

-- ----------------------------
-- Table structure for alarm_his
-- ----------------------------
DROP TABLE IF EXISTS `alarm_his`;
CREATE TABLE `alarm_his` (
  `time` int NOT NULL,
  `id` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `name` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`time`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of alarm_his
-- ----------------------------
INSERT INTO `alarm_his` VALUES ('0', '0x24000900', 'flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('0', '0x24000901', 'temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('0', '0x24000902', 'pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('0', '0x24000903', 'head_alarm', '0');
INSERT INTO `alarm_his` VALUES ('1', '0x24000900', 'flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('1', '0x24000901', 'temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('1', '0x24000902', 'pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('1', '0x24000903', 'head_alarm', '0');
INSERT INTO `alarm_his` VALUES ('2', '0x24000900', 'flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('2', '0x24000901', 'temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('2', '0x24000902', 'pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('2', '0x24000903', 'head_alarm', '0');
INSERT INTO `alarm_his` VALUES ('3', '0x24000900', 'flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('3', '0x24000901', 'temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('3', '0x24000902', 'pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('3', '0x24000903', 'head_alarm', '0');
INSERT INTO `alarm_his` VALUES ('4', '0x24000900', 'flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('4', '0x24000901', 'temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('4', '0x24000902', 'pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('4', '0x24000903', 'head_alarm', '0');
INSERT INTO `alarm_his` VALUES ('5', '0x24000900', 'flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('5', '0x24000901', 'temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('5', '0x24000902', 'pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('5', '0x24000903', 'head_alarm', '0');
INSERT INTO `alarm_his` VALUES ('6', '0x24000900', 'flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('6', '0x24000901', 'temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('6', '0x24000902', 'pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('6', '0x24000903', 'head_alarm', '0');
INSERT INTO `alarm_his` VALUES ('7', '0x24000900', 'flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('7', '0x24000901', 'temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('7', '0x24000902', 'pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('7', '0x24000903', 'head_alarm', '0');
INSERT INTO `alarm_his` VALUES ('8', '0x24000900', 'flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('8', '0x24000901', 'temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('8', '0x24000902', 'pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('8', '0x24000903', 'head_alarm', '0');
INSERT INTO `alarm_his` VALUES ('9', '0x24000900', 'flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('9', '0x24000901', 'temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('9', '0x24000902', 'pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('9', '0x24000903', 'head_alarm', '0');
INSERT INTO `alarm_his` VALUES ('10', '0x24000900', 'flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('10', '0x24000901', 'temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('10', '0x24000902', 'pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('10', '0x24000903', 'head_alarm', '0');
INSERT INTO `alarm_his` VALUES ('11', '0x24000900', 'flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('11', '0x24000901', 'temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('11', '0x24000902', 'pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('11', '0x24000903', 'head_alarm', '0');
INSERT INTO `alarm_his` VALUES ('12', '0x24000900', 'flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('12', '0x24000901', 'temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('12', '0x24000902', 'pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('12', '0x24000903', 'head_alarm', '0');
INSERT INTO `alarm_his` VALUES ('13', '0x24000900', 'flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('13', '0x24000901', 'temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('13', '0x24000902', 'pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('13', '0x24000903', 'head_alarm', '0');
INSERT INTO `alarm_his` VALUES ('14', '0x24000900', 'flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('14', '0x24000901', 'temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('14', '0x24000902', 'pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('14', '0x24000903', 'head_alarm', '0');
INSERT INTO `alarm_his` VALUES ('15', '0x24000900', 'flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('15', '0x24000901', 'temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('15', '0x24000902', 'pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('15', '0x24000903', 'head_alarm', '0');
INSERT INTO `alarm_his` VALUES ('16', '0x24000900', 'flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('16', '0x24000901', 'temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('16', '0x24000902', 'pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('16', '0x24000903', 'head_alarm', '0');
INSERT INTO `alarm_his` VALUES ('17', '0x24000900', 'flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('17', '0x24000901', 'temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('17', '0x24000902', 'pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('17', '0x24000903', 'head_alarm', '0');
INSERT INTO `alarm_his` VALUES ('18', '0x24000900', 'flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('18', '0x24000901', 'temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('18', '0x24000902', 'pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('18', '0x24000903', 'head_alarm', '0');
INSERT INTO `alarm_his` VALUES ('19', '0x24000900', 'flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('19', '0x24000901', 'temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('19', '0x24000902', 'pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('19', '0x24000903', 'head_alarm', '0');
INSERT INTO `alarm_his` VALUES ('20', '0x24000900', 'flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('20', '0x24000901', 'temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('20', '0x24000902', 'pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('20', '0x24000903', 'head_alarm', '0');
INSERT INTO `alarm_his` VALUES ('21', '0x24000900', 'flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('21', '0x24000901', 'temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('21', '0x24000902', 'pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('21', '0x24000903', 'head_alarm', '0');
INSERT INTO `alarm_his` VALUES ('22', '0x24000900', 'flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('22', '0x24000901', 'temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('22', '0x24000902', 'pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('22', '0x24000903', 'head_alarm', '0');
INSERT INTO `alarm_his` VALUES ('23', '0x24000900', 'flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('23', '0x24000901', 'temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('23', '0x24000902', 'pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('23', '0x24000903', 'head_alarm', '0');
INSERT INTO `alarm_his` VALUES ('24', '0x24000900', 'flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('24', '0x24000901', 'temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('24', '0x24000902', 'pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('24', '0x24000903', 'head_alarm', '0');
INSERT INTO `alarm_his` VALUES ('25', '0x24000900', 'flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('25', '0x24000901', 'temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('25', '0x24000902', 'pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('25', '0x24000903', 'head_alarm', '0');
INSERT INTO `alarm_his` VALUES ('26', '0x24000900', 'flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('26', '0x24000901', 'temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('26', '0x24000902', 'pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('26', '0x24000903', 'head_alarm', '0');
INSERT INTO `alarm_his` VALUES ('27', '0x24000900', 'flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('27', '0x24000901', 'temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('27', '0x24000902', 'pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('27', '0x24000903', 'head_alarm', '0');
INSERT INTO `alarm_his` VALUES ('28', '0x24000900', 'flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('28', '0x24000901', 'temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('28', '0x24000902', 'pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('28', '0x24000903', 'head_alarm', '0');
INSERT INTO `alarm_his` VALUES ('29', '0x24000900', 'flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('29', '0x24000901', 'temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('29', '0x24000902', 'pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('29', '0x24000903', 'head_alarm', '0');
INSERT INTO `alarm_his` VALUES ('30', '0x24000900', 'flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('30', '0x24000901', 'temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('30', '0x24000902', 'pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('30', '0x24000903', 'head_alarm', '0');
INSERT INTO `alarm_his` VALUES ('31', '0x24000900', 'flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('31', '0x24000901', 'temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('31', '0x24000902', 'pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('31', '0x24000903', 'head_alarm', '0');
INSERT INTO `alarm_his` VALUES ('32', '0x24000900', 'flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('32', '0x24000901', 'temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('32', '0x24000902', 'pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('32', '0x24000903', 'head_alarm', '0');
INSERT INTO `alarm_his` VALUES ('33', '0x24000900', 'flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('33', '0x24000901', 'temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('33', '0x24000902', 'pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('33', '0x24000903', 'head_alarm', '0');
INSERT INTO `alarm_his` VALUES ('34', '0x24000900', 'flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('34', '0x24000901', 'temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('34', '0x24000902', 'pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('34', '0x24000903', 'head_alarm', '0');
INSERT INTO `alarm_his` VALUES ('35', '0x24000900', 'flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('35', '0x24000901', 'temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('35', '0x24000902', 'pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('35', '0x24000903', 'head_alarm', '0');
INSERT INTO `alarm_his` VALUES ('36', '0x24000900', 'flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('36', '0x24000901', 'temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('36', '0x24000902', 'pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('36', '0x24000903', 'head_alarm', '0');
INSERT INTO `alarm_his` VALUES ('37', '0x24000900', 'flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('37', '0x24000901', 'temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('37', '0x24000902', 'pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('37', '0x24000903', 'head_alarm', '0');
INSERT INTO `alarm_his` VALUES ('38', '0x24000900', 'flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('38', '0x24000901', 'temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('38', '0x24000902', 'pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('38', '0x24000903', 'head_alarm', '0');
INSERT INTO `alarm_his` VALUES ('39', '0x24000900', 'flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('39', '0x24000901', 'temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('39', '0x24000902', 'pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('39', '0x24000903', 'head_alarm', '0');
INSERT INTO `alarm_his` VALUES ('40', '0x24000900', 'flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('40', '0x24000901', 'temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('40', '0x24000902', 'pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('40', '0x24000903', 'head_alarm', '0');
INSERT INTO `alarm_his` VALUES ('41', '0x24000900', 'flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('41', '0x24000901', 'temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('41', '0x24000902', 'pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('41', '0x24000903', 'head_alarm', '0');
INSERT INTO `alarm_his` VALUES ('42', '0x24000900', 'flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('42', '0x24000901', 'temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('42', '0x24000902', 'pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('42', '0x24000903', 'head_alarm', '0');
INSERT INTO `alarm_his` VALUES ('43', '0x24000900', 'flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('43', '0x24000901', 'temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('43', '0x24000902', 'pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('43', '0x24000903', 'head_alarm', '0');
INSERT INTO `alarm_his` VALUES ('44', '0x24000900', 'flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('44', '0x24000901', 'temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('44', '0x24000902', 'pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('44', '0x24000903', 'head_alarm', '0');
INSERT INTO `alarm_his` VALUES ('45', '0x24000900', 'flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('45', '0x24000901', 'temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('45', '0x24000902', 'pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('45', '0x24000903', 'head_alarm', '0');
INSERT INTO `alarm_his` VALUES ('46', '0x24000900', 'flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('46', '0x24000901', 'temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('46', '0x24000902', 'pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('46', '0x24000903', 'head_alarm', '0');
INSERT INTO `alarm_his` VALUES ('47', '0x24000900', 'flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('47', '0x24000901', 'temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('47', '0x24000902', 'pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('47', '0x24000903', 'head_alarm', '0');
INSERT INTO `alarm_his` VALUES ('48', '0x24000900', 'flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('48', '0x24000901', 'temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('48', '0x24000902', 'pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('48', '0x24000903', 'head_alarm', '0');
INSERT INTO `alarm_his` VALUES ('49', '0x24000900', 'flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('49', '0x24000901', 'temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('49', '0x24000902', 'pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('49', '0x24000903', 'head_alarm', '0');
INSERT INTO `alarm_his` VALUES ('50', '0x24000900', 'flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('50', '0x24000901', 'temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('50', '0x24000902', 'pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('50', '0x24000903', 'head_alarm', '0');

-- ----------------------------
-- Table structure for pump_valve
-- ----------------------------
DROP TABLE IF EXISTS `pump_valve`;
CREATE TABLE `pump_valve` (
  `time` int NOT NULL,
  `id` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `name` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`time`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of pump_valve
-- ----------------------------
INSERT INTO `pump_valve` VALUES ('50', '0x24000242', 'pump_valve_feedback', '100');

-- ----------------------------
-- Table structure for pump_valve_control
-- ----------------------------
DROP TABLE IF EXISTS `pump_valve_control`;
CREATE TABLE `pump_valve_control` (
  `time` int NOT NULL,
  `id` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `name` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`time`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of pump_valve_control
-- ----------------------------

-- ----------------------------
-- Table structure for pump_valve_control_his
-- ----------------------------
DROP TABLE IF EXISTS `pump_valve_control_his`;
CREATE TABLE `pump_valve_control_his` (
  `time` int NOT NULL,
  `id` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `name` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`time`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of pump_valve_control_his
-- ----------------------------

-- ----------------------------
-- Table structure for pump_valve_his
-- ----------------------------
DROP TABLE IF EXISTS `pump_valve_his`;
CREATE TABLE `pump_valve_his` (
  `time` int NOT NULL,
  `id` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `name` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`time`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of pump_valve_his
-- ----------------------------
INSERT INTO `pump_valve_his` VALUES ('0', '0x24000242', 'pump_valve_feedback', '1');
INSERT INTO `pump_valve_his` VALUES ('1', '0x24000242', 'pump_valve_feedback', '100');
INSERT INTO `pump_valve_his` VALUES ('2', '0x24000242', 'pump_valve_feedback', '100');
INSERT INTO `pump_valve_his` VALUES ('3', '0x24000242', 'pump_valve_feedback', '100');
INSERT INTO `pump_valve_his` VALUES ('4', '0x24000242', 'pump_valve_feedback', '100');
INSERT INTO `pump_valve_his` VALUES ('5', '0x24000242', 'pump_valve_feedback', '100');
INSERT INTO `pump_valve_his` VALUES ('6', '0x24000242', 'pump_valve_feedback', '100');
INSERT INTO `pump_valve_his` VALUES ('7', '0x24000242', 'pump_valve_feedback', '100');
INSERT INTO `pump_valve_his` VALUES ('8', '0x24000242', 'pump_valve_feedback', '100');
INSERT INTO `pump_valve_his` VALUES ('9', '0x24000242', 'pump_valve_feedback', '100');
INSERT INTO `pump_valve_his` VALUES ('10', '0x24000242', 'pump_valve_feedback', '100');
INSERT INTO `pump_valve_his` VALUES ('11', '0x24000242', 'pump_valve_feedback', '100');
INSERT INTO `pump_valve_his` VALUES ('12', '0x24000242', 'pump_valve_feedback', '100');
INSERT INTO `pump_valve_his` VALUES ('13', '0x24000242', 'pump_valve_feedback', '100');
INSERT INTO `pump_valve_his` VALUES ('14', '0x24000242', 'pump_valve_feedback', '100');
INSERT INTO `pump_valve_his` VALUES ('15', '0x24000242', 'pump_valve_feedback', '100');
INSERT INTO `pump_valve_his` VALUES ('16', '0x24000242', 'pump_valve_feedback', '100');
INSERT INTO `pump_valve_his` VALUES ('17', '0x24000242', 'pump_valve_feedback', '100');
INSERT INTO `pump_valve_his` VALUES ('18', '0x24000242', 'pump_valve_feedback', '100');
INSERT INTO `pump_valve_his` VALUES ('19', '0x24000242', 'pump_valve_feedback', '100');
INSERT INTO `pump_valve_his` VALUES ('20', '0x24000242', 'pump_valve_feedback', '100');
INSERT INTO `pump_valve_his` VALUES ('21', '0x24000242', 'pump_valve_feedback', '100');
INSERT INTO `pump_valve_his` VALUES ('22', '0x24000242', 'pump_valve_feedback', '100');
INSERT INTO `pump_valve_his` VALUES ('23', '0x24000242', 'pump_valve_feedback', '100');
INSERT INTO `pump_valve_his` VALUES ('24', '0x24000242', 'pump_valve_feedback', '100');
INSERT INTO `pump_valve_his` VALUES ('25', '0x24000242', 'pump_valve_feedback', '100');
INSERT INTO `pump_valve_his` VALUES ('26', '0x24000242', 'pump_valve_feedback', '100');
INSERT INTO `pump_valve_his` VALUES ('27', '0x24000242', 'pump_valve_feedback', '100');
INSERT INTO `pump_valve_his` VALUES ('28', '0x24000242', 'pump_valve_feedback', '100');
INSERT INTO `pump_valve_his` VALUES ('29', '0x24000242', 'pump_valve_feedback', '100');
INSERT INTO `pump_valve_his` VALUES ('30', '0x24000242', 'pump_valve_feedback', '100');
INSERT INTO `pump_valve_his` VALUES ('31', '0x24000242', 'pump_valve_feedback', '100');
INSERT INTO `pump_valve_his` VALUES ('32', '0x24000242', 'pump_valve_feedback', '100');
INSERT INTO `pump_valve_his` VALUES ('33', '0x24000242', 'pump_valve_feedback', '100');
INSERT INTO `pump_valve_his` VALUES ('34', '0x24000242', 'pump_valve_feedback', '100');
INSERT INTO `pump_valve_his` VALUES ('35', '0x24000242', 'pump_valve_feedback', '100');
INSERT INTO `pump_valve_his` VALUES ('36', '0x24000242', 'pump_valve_feedback', '100');
INSERT INTO `pump_valve_his` VALUES ('37', '0x24000242', 'pump_valve_feedback', '100');
INSERT INTO `pump_valve_his` VALUES ('38', '0x24000242', 'pump_valve_feedback', '100');
INSERT INTO `pump_valve_his` VALUES ('39', '0x24000242', 'pump_valve_feedback', '100');
INSERT INTO `pump_valve_his` VALUES ('40', '0x24000242', 'pump_valve_feedback', '100');
INSERT INTO `pump_valve_his` VALUES ('41', '0x24000242', 'pump_valve_feedback', '100');
INSERT INTO `pump_valve_his` VALUES ('42', '0x24000242', 'pump_valve_feedback', '100');
INSERT INTO `pump_valve_his` VALUES ('43', '0x24000242', 'pump_valve_feedback', '100');
INSERT INTO `pump_valve_his` VALUES ('44', '0x24000242', 'pump_valve_feedback', '100');
INSERT INTO `pump_valve_his` VALUES ('45', '0x24000242', 'pump_valve_feedback', '100');
INSERT INTO `pump_valve_his` VALUES ('46', '0x24000242', 'pump_valve_feedback', '100');
INSERT INTO `pump_valve_his` VALUES ('47', '0x24000242', 'pump_valve_feedback', '100');
INSERT INTO `pump_valve_his` VALUES ('48', '0x24000242', 'pump_valve_feedback', '100');
INSERT INTO `pump_valve_his` VALUES ('49', '0x24000242', 'pump_valve_feedback', '100');
INSERT INTO `pump_valve_his` VALUES ('50', '0x24000242', 'pump_valve_feedback', '100');

-- ----------------------------
-- Table structure for pump_vfd
-- ----------------------------
DROP TABLE IF EXISTS `pump_vfd`;
CREATE TABLE `pump_vfd` (
  `time` int NOT NULL,
  `id` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `name` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`time`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of pump_vfd
-- ----------------------------
INSERT INTO `pump_vfd` VALUES ('50', '0x24000200', 'pump_onoff_feedback', '1');
INSERT INTO `pump_vfd` VALUES ('50', '0x24000215', 'pump_frequency_feedback', '25');

-- ----------------------------
-- Table structure for pump_vfd_control
-- ----------------------------
DROP TABLE IF EXISTS `pump_vfd_control`;
CREATE TABLE `pump_vfd_control` (
  `time` int NOT NULL,
  `id` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `name` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`time`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of pump_vfd_control
-- ----------------------------

-- ----------------------------
-- Table structure for pump_vfd_control_his
-- ----------------------------
DROP TABLE IF EXISTS `pump_vfd_control_his`;
CREATE TABLE `pump_vfd_control_his` (
  `time` int NOT NULL,
  `id` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `name` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`time`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of pump_vfd_control_his
-- ----------------------------

-- ----------------------------
-- Table structure for pump_vfd_his
-- ----------------------------
DROP TABLE IF EXISTS `pump_vfd_his`;
CREATE TABLE `pump_vfd_his` (
  `time` int NOT NULL,
  `id` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `name` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`time`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of pump_vfd_his
-- ----------------------------
INSERT INTO `pump_vfd_his` VALUES ('0', '0x24000200', 'pump_onoff_feedback', '1');
INSERT INTO `pump_vfd_his` VALUES ('0', '0x24000215', 'pump_frequency_feedback', '25');
INSERT INTO `pump_vfd_his` VALUES ('1', '0x24000200', 'pump_onoff_feedback', '1');
INSERT INTO `pump_vfd_his` VALUES ('1', '0x24000215', 'pump_frequency_feedback', '25');
INSERT INTO `pump_vfd_his` VALUES ('2', '0x24000200', 'pump_onoff_feedback', '1');
INSERT INTO `pump_vfd_his` VALUES ('2', '0x24000215', 'pump_frequency_feedback', '25');
INSERT INTO `pump_vfd_his` VALUES ('3', '0x24000200', 'pump_onoff_feedback', '1');
INSERT INTO `pump_vfd_his` VALUES ('3', '0x24000215', 'pump_frequency_feedback', '25');
INSERT INTO `pump_vfd_his` VALUES ('4', '0x24000200', 'pump_onoff_feedback', '1');
INSERT INTO `pump_vfd_his` VALUES ('4', '0x24000215', 'pump_frequency_feedback', '25');
INSERT INTO `pump_vfd_his` VALUES ('5', '0x24000200', 'pump_onoff_feedback', '1');
INSERT INTO `pump_vfd_his` VALUES ('5', '0x24000215', 'pump_frequency_feedback', '25');
INSERT INTO `pump_vfd_his` VALUES ('6', '0x24000200', 'pump_onoff_feedback', '1');
INSERT INTO `pump_vfd_his` VALUES ('6', '0x24000215', 'pump_frequency_feedback', '25');
INSERT INTO `pump_vfd_his` VALUES ('7', '0x24000200', 'pump_onoff_feedback', '1');
INSERT INTO `pump_vfd_his` VALUES ('7', '0x24000215', 'pump_frequency_feedback', '25');
INSERT INTO `pump_vfd_his` VALUES ('8', '0x24000200', 'pump_onoff_feedback', '1');
INSERT INTO `pump_vfd_his` VALUES ('8', '0x24000215', 'pump_frequency_feedback', '25');
INSERT INTO `pump_vfd_his` VALUES ('9', '0x24000200', 'pump_onoff_feedback', '1');
INSERT INTO `pump_vfd_his` VALUES ('9', '0x24000215', 'pump_frequency_feedback', '25');
INSERT INTO `pump_vfd_his` VALUES ('10', '0x24000200', 'pump_onoff_feedback', '1');
INSERT INTO `pump_vfd_his` VALUES ('10', '0x24000215', 'pump_frequency_feedback', '25');
INSERT INTO `pump_vfd_his` VALUES ('11', '0x24000200', 'pump_onoff_feedback', '1');
INSERT INTO `pump_vfd_his` VALUES ('11', '0x24000215', 'pump_frequency_feedback', '25');
INSERT INTO `pump_vfd_his` VALUES ('12', '0x24000200', 'pump_onoff_feedback', '1');
INSERT INTO `pump_vfd_his` VALUES ('12', '0x24000215', 'pump_frequency_feedback', '25');
INSERT INTO `pump_vfd_his` VALUES ('13', '0x24000200', 'pump_onoff_feedback', '1');
INSERT INTO `pump_vfd_his` VALUES ('13', '0x24000215', 'pump_frequency_feedback', '25');
INSERT INTO `pump_vfd_his` VALUES ('14', '0x24000200', 'pump_onoff_feedback', '1');
INSERT INTO `pump_vfd_his` VALUES ('14', '0x24000215', 'pump_frequency_feedback', '25');
INSERT INTO `pump_vfd_his` VALUES ('15', '0x24000200', 'pump_onoff_feedback', '1');
INSERT INTO `pump_vfd_his` VALUES ('15', '0x24000215', 'pump_frequency_feedback', '25');
INSERT INTO `pump_vfd_his` VALUES ('16', '0x24000200', 'pump_onoff_feedback', '1');
INSERT INTO `pump_vfd_his` VALUES ('16', '0x24000215', 'pump_frequency_feedback', '25');
INSERT INTO `pump_vfd_his` VALUES ('17', '0x24000200', 'pump_onoff_feedback', '1');
INSERT INTO `pump_vfd_his` VALUES ('17', '0x24000215', 'pump_frequency_feedback', '25');
INSERT INTO `pump_vfd_his` VALUES ('18', '0x24000200', 'pump_onoff_feedback', '1');
INSERT INTO `pump_vfd_his` VALUES ('18', '0x24000215', 'pump_frequency_feedback', '25');
INSERT INTO `pump_vfd_his` VALUES ('19', '0x24000200', 'pump_onoff_feedback', '1');
INSERT INTO `pump_vfd_his` VALUES ('19', '0x24000215', 'pump_frequency_feedback', '25');
INSERT INTO `pump_vfd_his` VALUES ('20', '0x24000200', 'pump_onoff_feedback', '1');
INSERT INTO `pump_vfd_his` VALUES ('20', '0x24000215', 'pump_frequency_feedback', '25');
INSERT INTO `pump_vfd_his` VALUES ('21', '0x24000200', 'pump_onoff_feedback', '1');
INSERT INTO `pump_vfd_his` VALUES ('21', '0x24000215', 'pump_frequency_feedback', '25');
INSERT INTO `pump_vfd_his` VALUES ('22', '0x24000200', 'pump_onoff_feedback', '1');
INSERT INTO `pump_vfd_his` VALUES ('22', '0x24000215', 'pump_frequency_feedback', '25');
INSERT INTO `pump_vfd_his` VALUES ('23', '0x24000200', 'pump_onoff_feedback', '1');
INSERT INTO `pump_vfd_his` VALUES ('23', '0x24000215', 'pump_frequency_feedback', '25');
INSERT INTO `pump_vfd_his` VALUES ('24', '0x24000200', 'pump_onoff_feedback', '1');
INSERT INTO `pump_vfd_his` VALUES ('24', '0x24000215', 'pump_frequency_feedback', '25');
INSERT INTO `pump_vfd_his` VALUES ('25', '0x24000200', 'pump_onoff_feedback', '1');
INSERT INTO `pump_vfd_his` VALUES ('25', '0x24000215', 'pump_frequency_feedback', '25');
INSERT INTO `pump_vfd_his` VALUES ('26', '0x24000200', 'pump_onoff_feedback', '1');
INSERT INTO `pump_vfd_his` VALUES ('26', '0x24000215', 'pump_frequency_feedback', '25');
INSERT INTO `pump_vfd_his` VALUES ('27', '0x24000200', 'pump_onoff_feedback', '1');
INSERT INTO `pump_vfd_his` VALUES ('27', '0x24000215', 'pump_frequency_feedback', '25');
INSERT INTO `pump_vfd_his` VALUES ('28', '0x24000200', 'pump_onoff_feedback', '1');
INSERT INTO `pump_vfd_his` VALUES ('28', '0x24000215', 'pump_frequency_feedback', '25');
INSERT INTO `pump_vfd_his` VALUES ('29', '0x24000200', 'pump_onoff_feedback', '1');
INSERT INTO `pump_vfd_his` VALUES ('29', '0x24000215', 'pump_frequency_feedback', '25');
INSERT INTO `pump_vfd_his` VALUES ('30', '0x24000200', 'pump_onoff_feedback', '1');
INSERT INTO `pump_vfd_his` VALUES ('30', '0x24000215', 'pump_frequency_feedback', '25');
INSERT INTO `pump_vfd_his` VALUES ('31', '0x24000200', 'pump_onoff_feedback', '1');
INSERT INTO `pump_vfd_his` VALUES ('31', '0x24000215', 'pump_frequency_feedback', '25');
INSERT INTO `pump_vfd_his` VALUES ('32', '0x24000200', 'pump_onoff_feedback', '1');
INSERT INTO `pump_vfd_his` VALUES ('32', '0x24000215', 'pump_frequency_feedback', '25');
INSERT INTO `pump_vfd_his` VALUES ('33', '0x24000200', 'pump_onoff_feedback', '1');
INSERT INTO `pump_vfd_his` VALUES ('33', '0x24000215', 'pump_frequency_feedback', '25');
INSERT INTO `pump_vfd_his` VALUES ('34', '0x24000200', 'pump_onoff_feedback', '1');
INSERT INTO `pump_vfd_his` VALUES ('34', '0x24000215', 'pump_frequency_feedback', '25');
INSERT INTO `pump_vfd_his` VALUES ('35', '0x24000200', 'pump_onoff_feedback', '1');
INSERT INTO `pump_vfd_his` VALUES ('35', '0x24000215', 'pump_frequency_feedback', '25');
INSERT INTO `pump_vfd_his` VALUES ('36', '0x24000200', 'pump_onoff_feedback', '1');
INSERT INTO `pump_vfd_his` VALUES ('36', '0x24000215', 'pump_frequency_feedback', '25');
INSERT INTO `pump_vfd_his` VALUES ('37', '0x24000200', 'pump_onoff_feedback', '1');
INSERT INTO `pump_vfd_his` VALUES ('37', '0x24000215', 'pump_frequency_feedback', '25');
INSERT INTO `pump_vfd_his` VALUES ('38', '0x24000200', 'pump_onoff_feedback', '1');
INSERT INTO `pump_vfd_his` VALUES ('38', '0x24000215', 'pump_frequency_feedback', '25');
INSERT INTO `pump_vfd_his` VALUES ('39', '0x24000200', 'pump_onoff_feedback', '1');
INSERT INTO `pump_vfd_his` VALUES ('39', '0x24000215', 'pump_frequency_feedback', '25');
INSERT INTO `pump_vfd_his` VALUES ('40', '0x24000200', 'pump_onoff_feedback', '1');
INSERT INTO `pump_vfd_his` VALUES ('40', '0x24000215', 'pump_frequency_feedback', '25');
INSERT INTO `pump_vfd_his` VALUES ('41', '0x24000200', 'pump_onoff_feedback', '1');
INSERT INTO `pump_vfd_his` VALUES ('41', '0x24000215', 'pump_frequency_feedback', '25');
INSERT INTO `pump_vfd_his` VALUES ('42', '0x24000200', 'pump_onoff_feedback', '1');
INSERT INTO `pump_vfd_his` VALUES ('42', '0x24000215', 'pump_frequency_feedback', '25');
INSERT INTO `pump_vfd_his` VALUES ('43', '0x24000200', 'pump_onoff_feedback', '1');
INSERT INTO `pump_vfd_his` VALUES ('43', '0x24000215', 'pump_frequency_feedback', '25');
INSERT INTO `pump_vfd_his` VALUES ('44', '0x24000200', 'pump_onoff_feedback', '1');
INSERT INTO `pump_vfd_his` VALUES ('44', '0x24000215', 'pump_frequency_feedback', '25');
INSERT INTO `pump_vfd_his` VALUES ('45', '0x24000200', 'pump_onoff_feedback', '1');
INSERT INTO `pump_vfd_his` VALUES ('45', '0x24000215', 'pump_frequency_feedback', '25');
INSERT INTO `pump_vfd_his` VALUES ('46', '0x24000200', 'pump_onoff_feedback', '1');
INSERT INTO `pump_vfd_his` VALUES ('46', '0x24000215', 'pump_frequency_feedback', '25');
INSERT INTO `pump_vfd_his` VALUES ('47', '0x24000200', 'pump_onoff_feedback', '1');
INSERT INTO `pump_vfd_his` VALUES ('47', '0x24000215', 'pump_frequency_feedback', '25');
INSERT INTO `pump_vfd_his` VALUES ('48', '0x24000200', 'pump_onoff_feedback', '1');
INSERT INTO `pump_vfd_his` VALUES ('48', '0x24000215', 'pump_frequency_feedback', '25');
INSERT INTO `pump_vfd_his` VALUES ('49', '0x24000200', 'pump_onoff_feedback', '1');
INSERT INTO `pump_vfd_his` VALUES ('49', '0x24000215', 'pump_frequency_feedback', '25');
INSERT INTO `pump_vfd_his` VALUES ('50', '0x24000200', 'pump_onoff_feedback', '1');
INSERT INTO `pump_vfd_his` VALUES ('50', '0x24000215', 'pump_frequency_feedback', '25');

-- ----------------------------
-- Table structure for sensor_pressure
-- ----------------------------
DROP TABLE IF EXISTS `sensor_pressure`;
CREATE TABLE `sensor_pressure` (
  `time` int NOT NULL,
  `id` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `name` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`time`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of sensor_pressure
-- ----------------------------
INSERT INTO `sensor_pressure` VALUES ('50', '0x24000210', 'pump_supplypressure', '29400');
INSERT INTO `sensor_pressure` VALUES ('50', '0x24000211', 'pump_returnpressure', '29400');

-- ----------------------------
-- Table structure for sensor_pressure_his
-- ----------------------------
DROP TABLE IF EXISTS `sensor_pressure_his`;
CREATE TABLE `sensor_pressure_his` (
  `time` int NOT NULL,
  `id` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `name` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`time`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of sensor_pressure_his
-- ----------------------------
INSERT INTO `sensor_pressure_his` VALUES ('0', '0x24000210', 'pump_supplypressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('0', '0x24000211', 'pump_returnpressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('1', '0x24000210', 'pump_supplypressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('1', '0x24000211', 'pump_returnpressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('2', '0x24000210', 'pump_supplypressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('2', '0x24000211', 'pump_returnpressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('3', '0x24000210', 'pump_supplypressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('3', '0x24000211', 'pump_returnpressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('4', '0x24000210', 'pump_supplypressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('4', '0x24000211', 'pump_returnpressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('5', '0x24000210', 'pump_supplypressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('5', '0x24000211', 'pump_returnpressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('6', '0x24000210', 'pump_supplypressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('6', '0x24000211', 'pump_returnpressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('7', '0x24000210', 'pump_supplypressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('7', '0x24000211', 'pump_returnpressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('8', '0x24000210', 'pump_supplypressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('8', '0x24000211', 'pump_returnpressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('9', '0x24000210', 'pump_supplypressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('9', '0x24000211', 'pump_returnpressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('10', '0x24000210', 'pump_supplypressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('10', '0x24000211', 'pump_returnpressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('11', '0x24000210', 'pump_supplypressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('11', '0x24000211', 'pump_returnpressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('12', '0x24000210', 'pump_supplypressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('12', '0x24000211', 'pump_returnpressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('13', '0x24000210', 'pump_supplypressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('13', '0x24000211', 'pump_returnpressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('14', '0x24000210', 'pump_supplypressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('14', '0x24000211', 'pump_returnpressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('15', '0x24000210', 'pump_supplypressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('15', '0x24000211', 'pump_returnpressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('16', '0x24000210', 'pump_supplypressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('16', '0x24000211', 'pump_returnpressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('17', '0x24000210', 'pump_supplypressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('17', '0x24000211', 'pump_returnpressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('18', '0x24000210', 'pump_supplypressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('18', '0x24000211', 'pump_returnpressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('19', '0x24000210', 'pump_supplypressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('19', '0x24000211', 'pump_returnpressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('20', '0x24000210', 'pump_supplypressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('20', '0x24000211', 'pump_returnpressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('21', '0x24000210', 'pump_supplypressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('21', '0x24000211', 'pump_returnpressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('22', '0x24000210', 'pump_supplypressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('22', '0x24000211', 'pump_returnpressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('23', '0x24000210', 'pump_supplypressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('23', '0x24000211', 'pump_returnpressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('24', '0x24000210', 'pump_supplypressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('24', '0x24000211', 'pump_returnpressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('25', '0x24000210', 'pump_supplypressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('25', '0x24000211', 'pump_returnpressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('26', '0x24000210', 'pump_supplypressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('26', '0x24000211', 'pump_returnpressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('27', '0x24000210', 'pump_supplypressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('27', '0x24000211', 'pump_returnpressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('28', '0x24000210', 'pump_supplypressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('28', '0x24000211', 'pump_returnpressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('29', '0x24000210', 'pump_supplypressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('29', '0x24000211', 'pump_returnpressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('30', '0x24000210', 'pump_supplypressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('30', '0x24000211', 'pump_returnpressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('31', '0x24000210', 'pump_supplypressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('31', '0x24000211', 'pump_returnpressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('32', '0x24000210', 'pump_supplypressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('32', '0x24000211', 'pump_returnpressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('33', '0x24000210', 'pump_supplypressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('33', '0x24000211', 'pump_returnpressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('34', '0x24000210', 'pump_supplypressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('34', '0x24000211', 'pump_returnpressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('35', '0x24000210', 'pump_supplypressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('35', '0x24000211', 'pump_returnpressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('36', '0x24000210', 'pump_supplypressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('36', '0x24000211', 'pump_returnpressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('37', '0x24000210', 'pump_supplypressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('37', '0x24000211', 'pump_returnpressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('38', '0x24000210', 'pump_supplypressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('38', '0x24000211', 'pump_returnpressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('39', '0x24000210', 'pump_supplypressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('39', '0x24000211', 'pump_returnpressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('40', '0x24000210', 'pump_supplypressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('40', '0x24000211', 'pump_returnpressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('41', '0x24000210', 'pump_supplypressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('41', '0x24000211', 'pump_returnpressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('42', '0x24000210', 'pump_supplypressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('42', '0x24000211', 'pump_returnpressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('43', '0x24000210', 'pump_supplypressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('43', '0x24000211', 'pump_returnpressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('44', '0x24000210', 'pump_supplypressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('44', '0x24000211', 'pump_returnpressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('45', '0x24000210', 'pump_supplypressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('45', '0x24000211', 'pump_returnpressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('46', '0x24000210', 'pump_supplypressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('46', '0x24000211', 'pump_returnpressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('47', '0x24000210', 'pump_supplypressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('47', '0x24000211', 'pump_returnpressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('48', '0x24000210', 'pump_supplypressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('48', '0x24000211', 'pump_returnpressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('49', '0x24000210', 'pump_supplypressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('49', '0x24000211', 'pump_returnpressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('50', '0x24000210', 'pump_supplypressure', '29400');
INSERT INTO `sensor_pressure_his` VALUES ('50', '0x24000211', 'pump_returnpressure', '29400');

-- ----------------------------
-- Table structure for sensor_pumpflow
-- ----------------------------
DROP TABLE IF EXISTS `sensor_pumpflow`;
CREATE TABLE `sensor_pumpflow` (
  `time` int NOT NULL,
  `id` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `name` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`time`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of sensor_pumpflow
-- ----------------------------
INSERT INTO `sensor_pumpflow` VALUES ('50', '0x24000214', 'pump_flow', '11.9');

-- ----------------------------
-- Table structure for sensor_pumpflow_his
-- ----------------------------
DROP TABLE IF EXISTS `sensor_pumpflow_his`;
CREATE TABLE `sensor_pumpflow_his` (
  `time` int NOT NULL,
  `id` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `name` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`time`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of sensor_pumpflow_his
-- ----------------------------
INSERT INTO `sensor_pumpflow_his` VALUES ('0', '0x24000214', 'pump_flow', '11.9');
INSERT INTO `sensor_pumpflow_his` VALUES ('1', '0x24000214', 'pump_flow', '11.9');
INSERT INTO `sensor_pumpflow_his` VALUES ('2', '0x24000214', 'pump_flow', '11.9');
INSERT INTO `sensor_pumpflow_his` VALUES ('3', '0x24000214', 'pump_flow', '11.9');
INSERT INTO `sensor_pumpflow_his` VALUES ('4', '0x24000214', 'pump_flow', '11.9');
INSERT INTO `sensor_pumpflow_his` VALUES ('5', '0x24000214', 'pump_flow', '11.9');
INSERT INTO `sensor_pumpflow_his` VALUES ('6', '0x24000214', 'pump_flow', '11.9');
INSERT INTO `sensor_pumpflow_his` VALUES ('7', '0x24000214', 'pump_flow', '11.9');
INSERT INTO `sensor_pumpflow_his` VALUES ('8', '0x24000214', 'pump_flow', '11.9');
INSERT INTO `sensor_pumpflow_his` VALUES ('9', '0x24000214', 'pump_flow', '11.9');
INSERT INTO `sensor_pumpflow_his` VALUES ('10', '0x24000214', 'pump_flow', '11.9');
INSERT INTO `sensor_pumpflow_his` VALUES ('11', '0x24000214', 'pump_flow', '11.9');
INSERT INTO `sensor_pumpflow_his` VALUES ('12', '0x24000214', 'pump_flow', '11.9');
INSERT INTO `sensor_pumpflow_his` VALUES ('13', '0x24000214', 'pump_flow', '11.9');
INSERT INTO `sensor_pumpflow_his` VALUES ('14', '0x24000214', 'pump_flow', '11.9');
INSERT INTO `sensor_pumpflow_his` VALUES ('15', '0x24000214', 'pump_flow', '11.9');
INSERT INTO `sensor_pumpflow_his` VALUES ('16', '0x24000214', 'pump_flow', '11.9');
INSERT INTO `sensor_pumpflow_his` VALUES ('17', '0x24000214', 'pump_flow', '11.9');
INSERT INTO `sensor_pumpflow_his` VALUES ('18', '0x24000214', 'pump_flow', '11.9');
INSERT INTO `sensor_pumpflow_his` VALUES ('19', '0x24000214', 'pump_flow', '11.9');
INSERT INTO `sensor_pumpflow_his` VALUES ('20', '0x24000214', 'pump_flow', '11.9');
INSERT INTO `sensor_pumpflow_his` VALUES ('21', '0x24000214', 'pump_flow', '11.9');
INSERT INTO `sensor_pumpflow_his` VALUES ('22', '0x24000214', 'pump_flow', '11.9');
INSERT INTO `sensor_pumpflow_his` VALUES ('23', '0x24000214', 'pump_flow', '11.9');
INSERT INTO `sensor_pumpflow_his` VALUES ('24', '0x24000214', 'pump_flow', '11.9');
INSERT INTO `sensor_pumpflow_his` VALUES ('25', '0x24000214', 'pump_flow', '11.9');
INSERT INTO `sensor_pumpflow_his` VALUES ('26', '0x24000214', 'pump_flow', '11.9');
INSERT INTO `sensor_pumpflow_his` VALUES ('27', '0x24000214', 'pump_flow', '11.9');
INSERT INTO `sensor_pumpflow_his` VALUES ('28', '0x24000214', 'pump_flow', '11.9');
INSERT INTO `sensor_pumpflow_his` VALUES ('29', '0x24000214', 'pump_flow', '11.9');
INSERT INTO `sensor_pumpflow_his` VALUES ('30', '0x24000214', 'pump_flow', '11.9');
INSERT INTO `sensor_pumpflow_his` VALUES ('31', '0x24000214', 'pump_flow', '11.9');
INSERT INTO `sensor_pumpflow_his` VALUES ('32', '0x24000214', 'pump_flow', '11.9');
INSERT INTO `sensor_pumpflow_his` VALUES ('33', '0x24000214', 'pump_flow', '11.9');
INSERT INTO `sensor_pumpflow_his` VALUES ('34', '0x24000214', 'pump_flow', '11.9');
INSERT INTO `sensor_pumpflow_his` VALUES ('35', '0x24000214', 'pump_flow', '11.9');
INSERT INTO `sensor_pumpflow_his` VALUES ('36', '0x24000214', 'pump_flow', '11.9');
INSERT INTO `sensor_pumpflow_his` VALUES ('37', '0x24000214', 'pump_flow', '11.9');
INSERT INTO `sensor_pumpflow_his` VALUES ('38', '0x24000214', 'pump_flow', '11.9');
INSERT INTO `sensor_pumpflow_his` VALUES ('39', '0x24000214', 'pump_flow', '11.9');
INSERT INTO `sensor_pumpflow_his` VALUES ('40', '0x24000214', 'pump_flow', '11.9');
INSERT INTO `sensor_pumpflow_his` VALUES ('41', '0x24000214', 'pump_flow', '11.9');
INSERT INTO `sensor_pumpflow_his` VALUES ('42', '0x24000214', 'pump_flow', '11.9');
INSERT INTO `sensor_pumpflow_his` VALUES ('43', '0x24000214', 'pump_flow', '11.9');
INSERT INTO `sensor_pumpflow_his` VALUES ('44', '0x24000214', 'pump_flow', '11.9');
INSERT INTO `sensor_pumpflow_his` VALUES ('45', '0x24000214', 'pump_flow', '11.9');
INSERT INTO `sensor_pumpflow_his` VALUES ('46', '0x24000214', 'pump_flow', '11.9');
INSERT INTO `sensor_pumpflow_his` VALUES ('47', '0x24000214', 'pump_flow', '11.9');
INSERT INTO `sensor_pumpflow_his` VALUES ('48', '0x24000214', 'pump_flow', '11.9');
INSERT INTO `sensor_pumpflow_his` VALUES ('49', '0x24000214', 'pump_flow', '11.9');
INSERT INTO `sensor_pumpflow_his` VALUES ('50', '0x24000214', 'pump_flow', '11.9');

-- ----------------------------
-- Table structure for sensor_temp
-- ----------------------------
DROP TABLE IF EXISTS `sensor_temp`;
CREATE TABLE `sensor_temp` (
  `time` int NOT NULL,
  `id` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `name` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`time`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of sensor_temp
-- ----------------------------
INSERT INTO `sensor_temp` VALUES ('50', '0x24000240', 'pump_supplytemp', '60');
INSERT INTO `sensor_temp` VALUES ('50', '0x24000241', 'pump_returntemp', '55');

-- ----------------------------
-- Table structure for sensor_temp_his
-- ----------------------------
DROP TABLE IF EXISTS `sensor_temp_his`;
CREATE TABLE `sensor_temp_his` (
  `time` int NOT NULL,
  `id` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `name` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`time`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of sensor_temp_his
-- ----------------------------
INSERT INTO `sensor_temp_his` VALUES ('0', '0x24000240', 'pump_supplytemp', '60');
INSERT INTO `sensor_temp_his` VALUES ('0', '0x24000241', 'pump_returntemp', '55');
INSERT INTO `sensor_temp_his` VALUES ('1', '0x24000240', 'pump_supplytemp', '60');
INSERT INTO `sensor_temp_his` VALUES ('1', '0x24000241', 'pump_returntemp', '55');
INSERT INTO `sensor_temp_his` VALUES ('2', '0x24000240', 'pump_supplytemp', '60');
INSERT INTO `sensor_temp_his` VALUES ('2', '0x24000241', 'pump_returntemp', '55');
INSERT INTO `sensor_temp_his` VALUES ('3', '0x24000240', 'pump_supplytemp', '60');
INSERT INTO `sensor_temp_his` VALUES ('3', '0x24000241', 'pump_returntemp', '55');
INSERT INTO `sensor_temp_his` VALUES ('4', '0x24000240', 'pump_supplytemp', '60');
INSERT INTO `sensor_temp_his` VALUES ('4', '0x24000241', 'pump_returntemp', '55');
INSERT INTO `sensor_temp_his` VALUES ('5', '0x24000240', 'pump_supplytemp', '60');
INSERT INTO `sensor_temp_his` VALUES ('5', '0x24000241', 'pump_returntemp', '55');
INSERT INTO `sensor_temp_his` VALUES ('6', '0x24000240', 'pump_supplytemp', '60');
INSERT INTO `sensor_temp_his` VALUES ('6', '0x24000241', 'pump_returntemp', '55');
INSERT INTO `sensor_temp_his` VALUES ('7', '0x24000240', 'pump_supplytemp', '60');
INSERT INTO `sensor_temp_his` VALUES ('7', '0x24000241', 'pump_returntemp', '55');
INSERT INTO `sensor_temp_his` VALUES ('8', '0x24000240', 'pump_supplytemp', '60');
INSERT INTO `sensor_temp_his` VALUES ('8', '0x24000241', 'pump_returntemp', '55');
INSERT INTO `sensor_temp_his` VALUES ('9', '0x24000240', 'pump_supplytemp', '60');
INSERT INTO `sensor_temp_his` VALUES ('9', '0x24000241', 'pump_returntemp', '55');
INSERT INTO `sensor_temp_his` VALUES ('10', '0x24000240', 'pump_supplytemp', '60');
INSERT INTO `sensor_temp_his` VALUES ('10', '0x24000241', 'pump_returntemp', '55');
INSERT INTO `sensor_temp_his` VALUES ('11', '0x24000240', 'pump_supplytemp', '60');
INSERT INTO `sensor_temp_his` VALUES ('11', '0x24000241', 'pump_returntemp', '55');
INSERT INTO `sensor_temp_his` VALUES ('12', '0x24000240', 'pump_supplytemp', '60');
INSERT INTO `sensor_temp_his` VALUES ('12', '0x24000241', 'pump_returntemp', '55');
INSERT INTO `sensor_temp_his` VALUES ('13', '0x24000240', 'pump_supplytemp', '60');
INSERT INTO `sensor_temp_his` VALUES ('13', '0x24000241', 'pump_returntemp', '55');
INSERT INTO `sensor_temp_his` VALUES ('14', '0x24000240', 'pump_supplytemp', '60');
INSERT INTO `sensor_temp_his` VALUES ('14', '0x24000241', 'pump_returntemp', '55');
INSERT INTO `sensor_temp_his` VALUES ('15', '0x24000240', 'pump_supplytemp', '60');
INSERT INTO `sensor_temp_his` VALUES ('15', '0x24000241', 'pump_returntemp', '55');
INSERT INTO `sensor_temp_his` VALUES ('16', '0x24000240', 'pump_supplytemp', '60');
INSERT INTO `sensor_temp_his` VALUES ('16', '0x24000241', 'pump_returntemp', '55');
INSERT INTO `sensor_temp_his` VALUES ('17', '0x24000240', 'pump_supplytemp', '60');
INSERT INTO `sensor_temp_his` VALUES ('17', '0x24000241', 'pump_returntemp', '55');
INSERT INTO `sensor_temp_his` VALUES ('18', '0x24000240', 'pump_supplytemp', '60');
INSERT INTO `sensor_temp_his` VALUES ('18', '0x24000241', 'pump_returntemp', '55');
INSERT INTO `sensor_temp_his` VALUES ('19', '0x24000240', 'pump_supplytemp', '60');
INSERT INTO `sensor_temp_his` VALUES ('19', '0x24000241', 'pump_returntemp', '55');
INSERT INTO `sensor_temp_his` VALUES ('20', '0x24000240', 'pump_supplytemp', '60');
INSERT INTO `sensor_temp_his` VALUES ('20', '0x24000241', 'pump_returntemp', '55');
INSERT INTO `sensor_temp_his` VALUES ('21', '0x24000240', 'pump_supplytemp', '60');
INSERT INTO `sensor_temp_his` VALUES ('21', '0x24000241', 'pump_returntemp', '55');
INSERT INTO `sensor_temp_his` VALUES ('22', '0x24000240', 'pump_supplytemp', '60');
INSERT INTO `sensor_temp_his` VALUES ('22', '0x24000241', 'pump_returntemp', '55');
INSERT INTO `sensor_temp_his` VALUES ('23', '0x24000240', 'pump_supplytemp', '60');
INSERT INTO `sensor_temp_his` VALUES ('23', '0x24000241', 'pump_returntemp', '55');
INSERT INTO `sensor_temp_his` VALUES ('24', '0x24000240', 'pump_supplytemp', '60');
INSERT INTO `sensor_temp_his` VALUES ('24', '0x24000241', 'pump_returntemp', '55');
INSERT INTO `sensor_temp_his` VALUES ('25', '0x24000240', 'pump_supplytemp', '60');
INSERT INTO `sensor_temp_his` VALUES ('25', '0x24000241', 'pump_returntemp', '55');
INSERT INTO `sensor_temp_his` VALUES ('26', '0x24000240', 'pump_supplytemp', '60');
INSERT INTO `sensor_temp_his` VALUES ('26', '0x24000241', 'pump_returntemp', '55');
INSERT INTO `sensor_temp_his` VALUES ('27', '0x24000240', 'pump_supplytemp', '60');
INSERT INTO `sensor_temp_his` VALUES ('27', '0x24000241', 'pump_returntemp', '55');
INSERT INTO `sensor_temp_his` VALUES ('28', '0x24000240', 'pump_supplytemp', '60');
INSERT INTO `sensor_temp_his` VALUES ('28', '0x24000241', 'pump_returntemp', '55');
INSERT INTO `sensor_temp_his` VALUES ('29', '0x24000240', 'pump_supplytemp', '60');
INSERT INTO `sensor_temp_his` VALUES ('29', '0x24000241', 'pump_returntemp', '55');
INSERT INTO `sensor_temp_his` VALUES ('30', '0x24000240', 'pump_supplytemp', '60');
INSERT INTO `sensor_temp_his` VALUES ('30', '0x24000241', 'pump_returntemp', '55');
INSERT INTO `sensor_temp_his` VALUES ('31', '0x24000240', 'pump_supplytemp', '60');
INSERT INTO `sensor_temp_his` VALUES ('31', '0x24000241', 'pump_returntemp', '55');
INSERT INTO `sensor_temp_his` VALUES ('32', '0x24000240', 'pump_supplytemp', '60');
INSERT INTO `sensor_temp_his` VALUES ('32', '0x24000241', 'pump_returntemp', '55');
INSERT INTO `sensor_temp_his` VALUES ('33', '0x24000240', 'pump_supplytemp', '60');
INSERT INTO `sensor_temp_his` VALUES ('33', '0x24000241', 'pump_returntemp', '55');
INSERT INTO `sensor_temp_his` VALUES ('34', '0x24000240', 'pump_supplytemp', '60');
INSERT INTO `sensor_temp_his` VALUES ('34', '0x24000241', 'pump_returntemp', '55');
INSERT INTO `sensor_temp_his` VALUES ('35', '0x24000240', 'pump_supplytemp', '60');
INSERT INTO `sensor_temp_his` VALUES ('35', '0x24000241', 'pump_returntemp', '55');
INSERT INTO `sensor_temp_his` VALUES ('36', '0x24000240', 'pump_supplytemp', '60');
INSERT INTO `sensor_temp_his` VALUES ('36', '0x24000241', 'pump_returntemp', '55');
INSERT INTO `sensor_temp_his` VALUES ('37', '0x24000240', 'pump_supplytemp', '60');
INSERT INTO `sensor_temp_his` VALUES ('37', '0x24000241', 'pump_returntemp', '55');
INSERT INTO `sensor_temp_his` VALUES ('38', '0x24000240', 'pump_supplytemp', '60');
INSERT INTO `sensor_temp_his` VALUES ('38', '0x24000241', 'pump_returntemp', '55');
INSERT INTO `sensor_temp_his` VALUES ('39', '0x24000240', 'pump_supplytemp', '60');
INSERT INTO `sensor_temp_his` VALUES ('39', '0x24000241', 'pump_returntemp', '55');
INSERT INTO `sensor_temp_his` VALUES ('40', '0x24000240', 'pump_supplytemp', '60');
INSERT INTO `sensor_temp_his` VALUES ('40', '0x24000241', 'pump_returntemp', '55');
INSERT INTO `sensor_temp_his` VALUES ('41', '0x24000240', 'pump_supplytemp', '60');
INSERT INTO `sensor_temp_his` VALUES ('41', '0x24000241', 'pump_returntemp', '55');
INSERT INTO `sensor_temp_his` VALUES ('42', '0x24000240', 'pump_supplytemp', '60');
INSERT INTO `sensor_temp_his` VALUES ('42', '0x24000241', 'pump_returntemp', '55');
INSERT INTO `sensor_temp_his` VALUES ('43', '0x24000240', 'pump_supplytemp', '60');
INSERT INTO `sensor_temp_his` VALUES ('43', '0x24000241', 'pump_returntemp', '55');
INSERT INTO `sensor_temp_his` VALUES ('44', '0x24000240', 'pump_supplytemp', '60');
INSERT INTO `sensor_temp_his` VALUES ('44', '0x24000241', 'pump_returntemp', '55');
INSERT INTO `sensor_temp_his` VALUES ('45', '0x24000240', 'pump_supplytemp', '60');
INSERT INTO `sensor_temp_his` VALUES ('45', '0x24000241', 'pump_returntemp', '55');
INSERT INTO `sensor_temp_his` VALUES ('46', '0x24000240', 'pump_supplytemp', '60');
INSERT INTO `sensor_temp_his` VALUES ('46', '0x24000241', 'pump_returntemp', '55');
INSERT INTO `sensor_temp_his` VALUES ('47', '0x24000240', 'pump_supplytemp', '60');
INSERT INTO `sensor_temp_his` VALUES ('47', '0x24000241', 'pump_returntemp', '55');
INSERT INTO `sensor_temp_his` VALUES ('48', '0x24000240', 'pump_supplytemp', '60');
INSERT INTO `sensor_temp_his` VALUES ('48', '0x24000241', 'pump_returntemp', '55');
INSERT INTO `sensor_temp_his` VALUES ('49', '0x24000240', 'pump_supplytemp', '60');
INSERT INTO `sensor_temp_his` VALUES ('49', '0x24000241', 'pump_returntemp', '55');
INSERT INTO `sensor_temp_his` VALUES ('50', '0x24000240', 'pump_supplytemp', '60');
INSERT INTO `sensor_temp_his` VALUES ('50', '0x24000241', 'pump_returntemp', '55');
