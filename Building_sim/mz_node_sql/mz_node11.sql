/*
Navicat MySQL Data Transfer

Source Server         : Local
Source Server Version : 80019
Source Host           : localhost:3306
Source Database       : mz_node11

Target Server Type    : MYSQL
Target Server Version : 80019
File Encoding         : 65001

Date: 2021-01-14 15:27:02
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
INSERT INTO `alarm` VALUES ('50', '0x35000900', 'heatpump_flow_alarm', '0');
INSERT INTO `alarm` VALUES ('50', '0x35000901', 'heatpump_temp_alarm', '0');
INSERT INTO `alarm` VALUES ('50', '0x35000902', 'heatpump_pressure_alarm', '0');

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
INSERT INTO `alarm_his` VALUES ('0', '0x35000900', 'heatpump_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('0', '0x35000901', 'heatpump_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('0', '0x35000902', 'heatpump_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('1', '0x35000900', 'heatpump_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('1', '0x35000901', 'heatpump_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('1', '0x35000902', 'heatpump_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('2', '0x35000900', 'heatpump_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('2', '0x35000901', 'heatpump_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('2', '0x35000902', 'heatpump_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('3', '0x35000900', 'heatpump_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('3', '0x35000901', 'heatpump_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('3', '0x35000902', 'heatpump_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('4', '0x35000900', 'heatpump_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('4', '0x35000901', 'heatpump_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('4', '0x35000902', 'heatpump_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('5', '0x35000900', 'heatpump_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('5', '0x35000901', 'heatpump_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('5', '0x35000902', 'heatpump_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('6', '0x35000900', 'heatpump_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('6', '0x35000901', 'heatpump_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('6', '0x35000902', 'heatpump_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('7', '0x35000900', 'heatpump_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('7', '0x35000901', 'heatpump_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('7', '0x35000902', 'heatpump_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('8', '0x35000900', 'heatpump_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('8', '0x35000901', 'heatpump_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('8', '0x35000902', 'heatpump_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('9', '0x35000900', 'heatpump_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('9', '0x35000901', 'heatpump_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('9', '0x35000902', 'heatpump_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('10', '0x35000900', 'heatpump_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('10', '0x35000901', 'heatpump_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('10', '0x35000902', 'heatpump_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('11', '0x35000900', 'heatpump_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('11', '0x35000901', 'heatpump_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('11', '0x35000902', 'heatpump_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('12', '0x35000900', 'heatpump_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('12', '0x35000901', 'heatpump_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('12', '0x35000902', 'heatpump_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('13', '0x35000900', 'heatpump_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('13', '0x35000901', 'heatpump_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('13', '0x35000902', 'heatpump_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('14', '0x35000900', 'heatpump_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('14', '0x35000901', 'heatpump_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('14', '0x35000902', 'heatpump_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('15', '0x35000900', 'heatpump_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('15', '0x35000901', 'heatpump_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('15', '0x35000902', 'heatpump_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('16', '0x35000900', 'heatpump_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('16', '0x35000901', 'heatpump_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('16', '0x35000902', 'heatpump_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('17', '0x35000900', 'heatpump_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('17', '0x35000901', 'heatpump_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('17', '0x35000902', 'heatpump_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('18', '0x35000900', 'heatpump_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('18', '0x35000901', 'heatpump_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('18', '0x35000902', 'heatpump_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('19', '0x35000900', 'heatpump_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('19', '0x35000901', 'heatpump_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('19', '0x35000902', 'heatpump_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('20', '0x35000900', 'heatpump_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('20', '0x35000901', 'heatpump_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('20', '0x35000902', 'heatpump_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('21', '0x35000900', 'heatpump_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('21', '0x35000901', 'heatpump_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('21', '0x35000902', 'heatpump_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('22', '0x35000900', 'heatpump_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('22', '0x35000901', 'heatpump_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('22', '0x35000902', 'heatpump_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('23', '0x35000900', 'heatpump_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('23', '0x35000901', 'heatpump_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('23', '0x35000902', 'heatpump_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('24', '0x35000900', 'heatpump_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('24', '0x35000901', 'heatpump_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('24', '0x35000902', 'heatpump_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('25', '0x35000900', 'heatpump_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('25', '0x35000901', 'heatpump_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('25', '0x35000902', 'heatpump_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('26', '0x35000900', 'heatpump_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('26', '0x35000901', 'heatpump_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('26', '0x35000902', 'heatpump_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('27', '0x35000900', 'heatpump_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('27', '0x35000901', 'heatpump_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('27', '0x35000902', 'heatpump_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('28', '0x35000900', 'heatpump_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('28', '0x35000901', 'heatpump_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('28', '0x35000902', 'heatpump_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('29', '0x35000900', 'heatpump_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('29', '0x35000901', 'heatpump_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('29', '0x35000902', 'heatpump_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('30', '0x35000900', 'heatpump_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('30', '0x35000901', 'heatpump_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('30', '0x35000902', 'heatpump_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('31', '0x35000900', 'heatpump_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('31', '0x35000901', 'heatpump_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('31', '0x35000902', 'heatpump_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('32', '0x35000900', 'heatpump_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('32', '0x35000901', 'heatpump_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('32', '0x35000902', 'heatpump_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('33', '0x35000900', 'heatpump_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('33', '0x35000901', 'heatpump_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('33', '0x35000902', 'heatpump_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('34', '0x35000900', 'heatpump_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('34', '0x35000901', 'heatpump_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('34', '0x35000902', 'heatpump_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('35', '0x35000900', 'heatpump_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('35', '0x35000901', 'heatpump_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('35', '0x35000902', 'heatpump_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('36', '0x35000900', 'heatpump_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('36', '0x35000901', 'heatpump_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('36', '0x35000902', 'heatpump_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('37', '0x35000900', 'heatpump_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('37', '0x35000901', 'heatpump_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('37', '0x35000902', 'heatpump_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('38', '0x35000900', 'heatpump_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('38', '0x35000901', 'heatpump_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('38', '0x35000902', 'heatpump_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('39', '0x35000900', 'heatpump_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('39', '0x35000901', 'heatpump_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('39', '0x35000902', 'heatpump_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('40', '0x35000900', 'heatpump_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('40', '0x35000901', 'heatpump_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('40', '0x35000902', 'heatpump_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('41', '0x35000900', 'heatpump_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('41', '0x35000901', 'heatpump_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('41', '0x35000902', 'heatpump_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('42', '0x35000900', 'heatpump_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('42', '0x35000901', 'heatpump_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('42', '0x35000902', 'heatpump_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('43', '0x35000900', 'heatpump_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('43', '0x35000901', 'heatpump_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('43', '0x35000902', 'heatpump_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('44', '0x35000900', 'heatpump_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('44', '0x35000901', 'heatpump_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('44', '0x35000902', 'heatpump_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('45', '0x35000900', 'heatpump_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('45', '0x35000901', 'heatpump_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('45', '0x35000902', 'heatpump_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('46', '0x35000900', 'heatpump_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('46', '0x35000901', 'heatpump_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('46', '0x35000902', 'heatpump_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('47', '0x35000900', 'heatpump_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('47', '0x35000901', 'heatpump_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('47', '0x35000902', 'heatpump_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('48', '0x35000900', 'heatpump_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('48', '0x35000901', 'heatpump_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('48', '0x35000902', 'heatpump_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('49', '0x35000900', 'heatpump_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('49', '0x35000901', 'heatpump_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('49', '0x35000902', 'heatpump_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('50', '0x35000900', 'heatpump_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('50', '0x35000901', 'heatpump_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('50', '0x35000902', 'heatpump_pressure_alarm', '0');

-- ----------------------------
-- Table structure for heatpump_panel
-- ----------------------------
DROP TABLE IF EXISTS `heatpump_panel`;
CREATE TABLE `heatpump_panel` (
  `time` int NOT NULL,
  `id` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `name` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`time`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of heatpump_panel
-- ----------------------------
INSERT INTO `heatpump_panel` VALUES ('50', '0x35000200', 'heatpump_onoff_feedback', '0');
INSERT INTO `heatpump_panel` VALUES ('50', '0x35000202', 'heatpump_supplytemp_feedback', '40');
INSERT INTO `heatpump_panel` VALUES ('50', '0x35000204', 'heatpump_workingmode_feedback', '2');

-- ----------------------------
-- Table structure for heatpump_panel_control
-- ----------------------------
DROP TABLE IF EXISTS `heatpump_panel_control`;
CREATE TABLE `heatpump_panel_control` (
  `time` int NOT NULL,
  `id` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `name` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`time`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of heatpump_panel_control
-- ----------------------------

-- ----------------------------
-- Table structure for heatpump_panel_control_his
-- ----------------------------
DROP TABLE IF EXISTS `heatpump_panel_control_his`;
CREATE TABLE `heatpump_panel_control_his` (
  `time` int NOT NULL,
  `id` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `name` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`time`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of heatpump_panel_control_his
-- ----------------------------

-- ----------------------------
-- Table structure for heatpump_panel_his
-- ----------------------------
DROP TABLE IF EXISTS `heatpump_panel_his`;
CREATE TABLE `heatpump_panel_his` (
  `time` int NOT NULL,
  `id` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `name` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`time`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of heatpump_panel_his
-- ----------------------------
INSERT INTO `heatpump_panel_his` VALUES ('0', '0x35000200', 'heatpump_onoff_feedback', '0');
INSERT INTO `heatpump_panel_his` VALUES ('0', '0x35000202', 'heatpump_supplytemp_feedback', '40');
INSERT INTO `heatpump_panel_his` VALUES ('0', '0x35000204', 'heatpump_workingmode_feedback', '2');
INSERT INTO `heatpump_panel_his` VALUES ('1', '0x35000200', 'heatpump_onoff_feedback', '0');
INSERT INTO `heatpump_panel_his` VALUES ('1', '0x35000202', 'heatpump_supplytemp_feedback', '40');
INSERT INTO `heatpump_panel_his` VALUES ('1', '0x35000204', 'heatpump_workingmode_feedback', '2');
INSERT INTO `heatpump_panel_his` VALUES ('2', '0x35000200', 'heatpump_onoff_feedback', '0');
INSERT INTO `heatpump_panel_his` VALUES ('2', '0x35000202', 'heatpump_supplytemp_feedback', '40');
INSERT INTO `heatpump_panel_his` VALUES ('2', '0x35000204', 'heatpump_workingmode_feedback', '2');
INSERT INTO `heatpump_panel_his` VALUES ('3', '0x35000200', 'heatpump_onoff_feedback', '0');
INSERT INTO `heatpump_panel_his` VALUES ('3', '0x35000202', 'heatpump_supplytemp_feedback', '40');
INSERT INTO `heatpump_panel_his` VALUES ('3', '0x35000204', 'heatpump_workingmode_feedback', '2');
INSERT INTO `heatpump_panel_his` VALUES ('4', '0x35000200', 'heatpump_onoff_feedback', '0');
INSERT INTO `heatpump_panel_his` VALUES ('4', '0x35000202', 'heatpump_supplytemp_feedback', '40');
INSERT INTO `heatpump_panel_his` VALUES ('4', '0x35000204', 'heatpump_workingmode_feedback', '2');
INSERT INTO `heatpump_panel_his` VALUES ('5', '0x35000200', 'heatpump_onoff_feedback', '0');
INSERT INTO `heatpump_panel_his` VALUES ('5', '0x35000202', 'heatpump_supplytemp_feedback', '40');
INSERT INTO `heatpump_panel_his` VALUES ('5', '0x35000204', 'heatpump_workingmode_feedback', '2');
INSERT INTO `heatpump_panel_his` VALUES ('6', '0x35000200', 'heatpump_onoff_feedback', '0');
INSERT INTO `heatpump_panel_his` VALUES ('6', '0x35000202', 'heatpump_supplytemp_feedback', '40');
INSERT INTO `heatpump_panel_his` VALUES ('6', '0x35000204', 'heatpump_workingmode_feedback', '2');
INSERT INTO `heatpump_panel_his` VALUES ('7', '0x35000200', 'heatpump_onoff_feedback', '0');
INSERT INTO `heatpump_panel_his` VALUES ('7', '0x35000202', 'heatpump_supplytemp_feedback', '40');
INSERT INTO `heatpump_panel_his` VALUES ('7', '0x35000204', 'heatpump_workingmode_feedback', '2');
INSERT INTO `heatpump_panel_his` VALUES ('8', '0x35000200', 'heatpump_onoff_feedback', '0');
INSERT INTO `heatpump_panel_his` VALUES ('8', '0x35000202', 'heatpump_supplytemp_feedback', '40');
INSERT INTO `heatpump_panel_his` VALUES ('8', '0x35000204', 'heatpump_workingmode_feedback', '2');
INSERT INTO `heatpump_panel_his` VALUES ('9', '0x35000200', 'heatpump_onoff_feedback', '0');
INSERT INTO `heatpump_panel_his` VALUES ('9', '0x35000202', 'heatpump_supplytemp_feedback', '40');
INSERT INTO `heatpump_panel_his` VALUES ('9', '0x35000204', 'heatpump_workingmode_feedback', '2');
INSERT INTO `heatpump_panel_his` VALUES ('10', '0x35000200', 'heatpump_onoff_feedback', '0');
INSERT INTO `heatpump_panel_his` VALUES ('10', '0x35000202', 'heatpump_supplytemp_feedback', '40');
INSERT INTO `heatpump_panel_his` VALUES ('10', '0x35000204', 'heatpump_workingmode_feedback', '2');
INSERT INTO `heatpump_panel_his` VALUES ('11', '0x35000200', 'heatpump_onoff_feedback', '0');
INSERT INTO `heatpump_panel_his` VALUES ('11', '0x35000202', 'heatpump_supplytemp_feedback', '40');
INSERT INTO `heatpump_panel_his` VALUES ('11', '0x35000204', 'heatpump_workingmode_feedback', '2');
INSERT INTO `heatpump_panel_his` VALUES ('12', '0x35000200', 'heatpump_onoff_feedback', '0');
INSERT INTO `heatpump_panel_his` VALUES ('12', '0x35000202', 'heatpump_supplytemp_feedback', '40');
INSERT INTO `heatpump_panel_his` VALUES ('12', '0x35000204', 'heatpump_workingmode_feedback', '2');
INSERT INTO `heatpump_panel_his` VALUES ('13', '0x35000200', 'heatpump_onoff_feedback', '0');
INSERT INTO `heatpump_panel_his` VALUES ('13', '0x35000202', 'heatpump_supplytemp_feedback', '40');
INSERT INTO `heatpump_panel_his` VALUES ('13', '0x35000204', 'heatpump_workingmode_feedback', '2');
INSERT INTO `heatpump_panel_his` VALUES ('14', '0x35000200', 'heatpump_onoff_feedback', '0');
INSERT INTO `heatpump_panel_his` VALUES ('14', '0x35000202', 'heatpump_supplytemp_feedback', '40');
INSERT INTO `heatpump_panel_his` VALUES ('14', '0x35000204', 'heatpump_workingmode_feedback', '2');
INSERT INTO `heatpump_panel_his` VALUES ('15', '0x35000200', 'heatpump_onoff_feedback', '0');
INSERT INTO `heatpump_panel_his` VALUES ('15', '0x35000202', 'heatpump_supplytemp_feedback', '40');
INSERT INTO `heatpump_panel_his` VALUES ('15', '0x35000204', 'heatpump_workingmode_feedback', '2');
INSERT INTO `heatpump_panel_his` VALUES ('16', '0x35000200', 'heatpump_onoff_feedback', '0');
INSERT INTO `heatpump_panel_his` VALUES ('16', '0x35000202', 'heatpump_supplytemp_feedback', '40');
INSERT INTO `heatpump_panel_his` VALUES ('16', '0x35000204', 'heatpump_workingmode_feedback', '2');
INSERT INTO `heatpump_panel_his` VALUES ('17', '0x35000200', 'heatpump_onoff_feedback', '0');
INSERT INTO `heatpump_panel_his` VALUES ('17', '0x35000202', 'heatpump_supplytemp_feedback', '40');
INSERT INTO `heatpump_panel_his` VALUES ('17', '0x35000204', 'heatpump_workingmode_feedback', '2');
INSERT INTO `heatpump_panel_his` VALUES ('18', '0x35000200', 'heatpump_onoff_feedback', '0');
INSERT INTO `heatpump_panel_his` VALUES ('18', '0x35000202', 'heatpump_supplytemp_feedback', '40');
INSERT INTO `heatpump_panel_his` VALUES ('18', '0x35000204', 'heatpump_workingmode_feedback', '2');
INSERT INTO `heatpump_panel_his` VALUES ('19', '0x35000200', 'heatpump_onoff_feedback', '0');
INSERT INTO `heatpump_panel_his` VALUES ('19', '0x35000202', 'heatpump_supplytemp_feedback', '40');
INSERT INTO `heatpump_panel_his` VALUES ('19', '0x35000204', 'heatpump_workingmode_feedback', '2');
INSERT INTO `heatpump_panel_his` VALUES ('20', '0x35000200', 'heatpump_onoff_feedback', '0');
INSERT INTO `heatpump_panel_his` VALUES ('20', '0x35000202', 'heatpump_supplytemp_feedback', '40');
INSERT INTO `heatpump_panel_his` VALUES ('20', '0x35000204', 'heatpump_workingmode_feedback', '2');
INSERT INTO `heatpump_panel_his` VALUES ('21', '0x35000200', 'heatpump_onoff_feedback', '0');
INSERT INTO `heatpump_panel_his` VALUES ('21', '0x35000202', 'heatpump_supplytemp_feedback', '40');
INSERT INTO `heatpump_panel_his` VALUES ('21', '0x35000204', 'heatpump_workingmode_feedback', '2');
INSERT INTO `heatpump_panel_his` VALUES ('22', '0x35000200', 'heatpump_onoff_feedback', '0');
INSERT INTO `heatpump_panel_his` VALUES ('22', '0x35000202', 'heatpump_supplytemp_feedback', '40');
INSERT INTO `heatpump_panel_his` VALUES ('22', '0x35000204', 'heatpump_workingmode_feedback', '2');
INSERT INTO `heatpump_panel_his` VALUES ('23', '0x35000200', 'heatpump_onoff_feedback', '0');
INSERT INTO `heatpump_panel_his` VALUES ('23', '0x35000202', 'heatpump_supplytemp_feedback', '40');
INSERT INTO `heatpump_panel_his` VALUES ('23', '0x35000204', 'heatpump_workingmode_feedback', '2');
INSERT INTO `heatpump_panel_his` VALUES ('24', '0x35000200', 'heatpump_onoff_feedback', '0');
INSERT INTO `heatpump_panel_his` VALUES ('24', '0x35000202', 'heatpump_supplytemp_feedback', '40');
INSERT INTO `heatpump_panel_his` VALUES ('24', '0x35000204', 'heatpump_workingmode_feedback', '2');
INSERT INTO `heatpump_panel_his` VALUES ('25', '0x35000200', 'heatpump_onoff_feedback', '0');
INSERT INTO `heatpump_panel_his` VALUES ('25', '0x35000202', 'heatpump_supplytemp_feedback', '40');
INSERT INTO `heatpump_panel_his` VALUES ('25', '0x35000204', 'heatpump_workingmode_feedback', '2');
INSERT INTO `heatpump_panel_his` VALUES ('26', '0x35000200', 'heatpump_onoff_feedback', '0');
INSERT INTO `heatpump_panel_his` VALUES ('26', '0x35000202', 'heatpump_supplytemp_feedback', '40');
INSERT INTO `heatpump_panel_his` VALUES ('26', '0x35000204', 'heatpump_workingmode_feedback', '2');
INSERT INTO `heatpump_panel_his` VALUES ('27', '0x35000200', 'heatpump_onoff_feedback', '0');
INSERT INTO `heatpump_panel_his` VALUES ('27', '0x35000202', 'heatpump_supplytemp_feedback', '40');
INSERT INTO `heatpump_panel_his` VALUES ('27', '0x35000204', 'heatpump_workingmode_feedback', '2');
INSERT INTO `heatpump_panel_his` VALUES ('28', '0x35000200', 'heatpump_onoff_feedback', '0');
INSERT INTO `heatpump_panel_his` VALUES ('28', '0x35000202', 'heatpump_supplytemp_feedback', '40');
INSERT INTO `heatpump_panel_his` VALUES ('28', '0x35000204', 'heatpump_workingmode_feedback', '2');
INSERT INTO `heatpump_panel_his` VALUES ('29', '0x35000200', 'heatpump_onoff_feedback', '0');
INSERT INTO `heatpump_panel_his` VALUES ('29', '0x35000202', 'heatpump_supplytemp_feedback', '40');
INSERT INTO `heatpump_panel_his` VALUES ('29', '0x35000204', 'heatpump_workingmode_feedback', '2');
INSERT INTO `heatpump_panel_his` VALUES ('30', '0x35000200', 'heatpump_onoff_feedback', '0');
INSERT INTO `heatpump_panel_his` VALUES ('30', '0x35000202', 'heatpump_supplytemp_feedback', '40');
INSERT INTO `heatpump_panel_his` VALUES ('30', '0x35000204', 'heatpump_workingmode_feedback', '2');
INSERT INTO `heatpump_panel_his` VALUES ('31', '0x35000200', 'heatpump_onoff_feedback', '0');
INSERT INTO `heatpump_panel_his` VALUES ('31', '0x35000202', 'heatpump_supplytemp_feedback', '40');
INSERT INTO `heatpump_panel_his` VALUES ('31', '0x35000204', 'heatpump_workingmode_feedback', '2');
INSERT INTO `heatpump_panel_his` VALUES ('32', '0x35000200', 'heatpump_onoff_feedback', '0');
INSERT INTO `heatpump_panel_his` VALUES ('32', '0x35000202', 'heatpump_supplytemp_feedback', '40');
INSERT INTO `heatpump_panel_his` VALUES ('32', '0x35000204', 'heatpump_workingmode_feedback', '2');
INSERT INTO `heatpump_panel_his` VALUES ('33', '0x35000200', 'heatpump_onoff_feedback', '0');
INSERT INTO `heatpump_panel_his` VALUES ('33', '0x35000202', 'heatpump_supplytemp_feedback', '40');
INSERT INTO `heatpump_panel_his` VALUES ('33', '0x35000204', 'heatpump_workingmode_feedback', '2');
INSERT INTO `heatpump_panel_his` VALUES ('34', '0x35000200', 'heatpump_onoff_feedback', '0');
INSERT INTO `heatpump_panel_his` VALUES ('34', '0x35000202', 'heatpump_supplytemp_feedback', '40');
INSERT INTO `heatpump_panel_his` VALUES ('34', '0x35000204', 'heatpump_workingmode_feedback', '2');
INSERT INTO `heatpump_panel_his` VALUES ('35', '0x35000200', 'heatpump_onoff_feedback', '0');
INSERT INTO `heatpump_panel_his` VALUES ('35', '0x35000202', 'heatpump_supplytemp_feedback', '40');
INSERT INTO `heatpump_panel_his` VALUES ('35', '0x35000204', 'heatpump_workingmode_feedback', '2');
INSERT INTO `heatpump_panel_his` VALUES ('36', '0x35000200', 'heatpump_onoff_feedback', '0');
INSERT INTO `heatpump_panel_his` VALUES ('36', '0x35000202', 'heatpump_supplytemp_feedback', '40');
INSERT INTO `heatpump_panel_his` VALUES ('36', '0x35000204', 'heatpump_workingmode_feedback', '2');
INSERT INTO `heatpump_panel_his` VALUES ('37', '0x35000200', 'heatpump_onoff_feedback', '0');
INSERT INTO `heatpump_panel_his` VALUES ('37', '0x35000202', 'heatpump_supplytemp_feedback', '40');
INSERT INTO `heatpump_panel_his` VALUES ('37', '0x35000204', 'heatpump_workingmode_feedback', '2');
INSERT INTO `heatpump_panel_his` VALUES ('38', '0x35000200', 'heatpump_onoff_feedback', '0');
INSERT INTO `heatpump_panel_his` VALUES ('38', '0x35000202', 'heatpump_supplytemp_feedback', '40');
INSERT INTO `heatpump_panel_his` VALUES ('38', '0x35000204', 'heatpump_workingmode_feedback', '2');
INSERT INTO `heatpump_panel_his` VALUES ('39', '0x35000200', 'heatpump_onoff_feedback', '0');
INSERT INTO `heatpump_panel_his` VALUES ('39', '0x35000202', 'heatpump_supplytemp_feedback', '40');
INSERT INTO `heatpump_panel_his` VALUES ('39', '0x35000204', 'heatpump_workingmode_feedback', '2');
INSERT INTO `heatpump_panel_his` VALUES ('40', '0x35000200', 'heatpump_onoff_feedback', '0');
INSERT INTO `heatpump_panel_his` VALUES ('40', '0x35000202', 'heatpump_supplytemp_feedback', '40');
INSERT INTO `heatpump_panel_his` VALUES ('40', '0x35000204', 'heatpump_workingmode_feedback', '2');
INSERT INTO `heatpump_panel_his` VALUES ('41', '0x35000200', 'heatpump_onoff_feedback', '0');
INSERT INTO `heatpump_panel_his` VALUES ('41', '0x35000202', 'heatpump_supplytemp_feedback', '40');
INSERT INTO `heatpump_panel_his` VALUES ('41', '0x35000204', 'heatpump_workingmode_feedback', '2');
INSERT INTO `heatpump_panel_his` VALUES ('42', '0x35000200', 'heatpump_onoff_feedback', '0');
INSERT INTO `heatpump_panel_his` VALUES ('42', '0x35000202', 'heatpump_supplytemp_feedback', '40');
INSERT INTO `heatpump_panel_his` VALUES ('42', '0x35000204', 'heatpump_workingmode_feedback', '2');
INSERT INTO `heatpump_panel_his` VALUES ('43', '0x35000200', 'heatpump_onoff_feedback', '0');
INSERT INTO `heatpump_panel_his` VALUES ('43', '0x35000202', 'heatpump_supplytemp_feedback', '40');
INSERT INTO `heatpump_panel_his` VALUES ('43', '0x35000204', 'heatpump_workingmode_feedback', '2');
INSERT INTO `heatpump_panel_his` VALUES ('44', '0x35000200', 'heatpump_onoff_feedback', '0');
INSERT INTO `heatpump_panel_his` VALUES ('44', '0x35000202', 'heatpump_supplytemp_feedback', '40');
INSERT INTO `heatpump_panel_his` VALUES ('44', '0x35000204', 'heatpump_workingmode_feedback', '2');
INSERT INTO `heatpump_panel_his` VALUES ('45', '0x35000200', 'heatpump_onoff_feedback', '0');
INSERT INTO `heatpump_panel_his` VALUES ('45', '0x35000202', 'heatpump_supplytemp_feedback', '40');
INSERT INTO `heatpump_panel_his` VALUES ('45', '0x35000204', 'heatpump_workingmode_feedback', '2');
INSERT INTO `heatpump_panel_his` VALUES ('46', '0x35000200', 'heatpump_onoff_feedback', '0');
INSERT INTO `heatpump_panel_his` VALUES ('46', '0x35000202', 'heatpump_supplytemp_feedback', '40');
INSERT INTO `heatpump_panel_his` VALUES ('46', '0x35000204', 'heatpump_workingmode_feedback', '2');
INSERT INTO `heatpump_panel_his` VALUES ('47', '0x35000200', 'heatpump_onoff_feedback', '0');
INSERT INTO `heatpump_panel_his` VALUES ('47', '0x35000202', 'heatpump_supplytemp_feedback', '40');
INSERT INTO `heatpump_panel_his` VALUES ('47', '0x35000204', 'heatpump_workingmode_feedback', '2');
INSERT INTO `heatpump_panel_his` VALUES ('48', '0x35000200', 'heatpump_onoff_feedback', '0');
INSERT INTO `heatpump_panel_his` VALUES ('48', '0x35000202', 'heatpump_supplytemp_feedback', '40');
INSERT INTO `heatpump_panel_his` VALUES ('48', '0x35000204', 'heatpump_workingmode_feedback', '2');
INSERT INTO `heatpump_panel_his` VALUES ('49', '0x35000200', 'heatpump_onoff_feedback', '0');
INSERT INTO `heatpump_panel_his` VALUES ('49', '0x35000202', 'heatpump_supplytemp_feedback', '40');
INSERT INTO `heatpump_panel_his` VALUES ('49', '0x35000204', 'heatpump_workingmode_feedback', '2');
INSERT INTO `heatpump_panel_his` VALUES ('50', '0x35000200', 'heatpump_onoff_feedback', '0');
INSERT INTO `heatpump_panel_his` VALUES ('50', '0x35000202', 'heatpump_supplytemp_feedback', '40');
INSERT INTO `heatpump_panel_his` VALUES ('50', '0x35000204', 'heatpump_workingmode_feedback', '2');

-- ----------------------------
-- Table structure for sensor_outdoor
-- ----------------------------
DROP TABLE IF EXISTS `sensor_outdoor`;
CREATE TABLE `sensor_outdoor` (
  `time` int NOT NULL,
  `id` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `name` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`time`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of sensor_outdoor
-- ----------------------------
INSERT INTO `sensor_outdoor` VALUES ('50', '0x32000201', 'outdoor_temp', '3.5');
INSERT INTO `sensor_outdoor` VALUES ('50', '0x32000202', 'outdoor_damp', '2.4');

-- ----------------------------
-- Table structure for sensor_outdoor_his
-- ----------------------------
DROP TABLE IF EXISTS `sensor_outdoor_his`;
CREATE TABLE `sensor_outdoor_his` (
  `time` int NOT NULL,
  `id` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `name` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`time`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of sensor_outdoor_his
-- ----------------------------
INSERT INTO `sensor_outdoor_his` VALUES ('0', '0x32000201', 'outdoor_temp', '3.5');
INSERT INTO `sensor_outdoor_his` VALUES ('0', '0x32000202', 'outdoor_damp', '2.4');
INSERT INTO `sensor_outdoor_his` VALUES ('1', '0x32000201', 'outdoor_temp', '3.5');
INSERT INTO `sensor_outdoor_his` VALUES ('1', '0x32000202', 'outdoor_damp', '2.4');
INSERT INTO `sensor_outdoor_his` VALUES ('2', '0x32000201', 'outdoor_temp', '3.5');
INSERT INTO `sensor_outdoor_his` VALUES ('2', '0x32000202', 'outdoor_damp', '2.4');
INSERT INTO `sensor_outdoor_his` VALUES ('3', '0x32000201', 'outdoor_temp', '3.5');
INSERT INTO `sensor_outdoor_his` VALUES ('3', '0x32000202', 'outdoor_damp', '2.4');
INSERT INTO `sensor_outdoor_his` VALUES ('4', '0x32000201', 'outdoor_temp', '3.5');
INSERT INTO `sensor_outdoor_his` VALUES ('4', '0x32000202', 'outdoor_damp', '2.4');
INSERT INTO `sensor_outdoor_his` VALUES ('5', '0x32000201', 'outdoor_temp', '3.5');
INSERT INTO `sensor_outdoor_his` VALUES ('5', '0x32000202', 'outdoor_damp', '2.4');
INSERT INTO `sensor_outdoor_his` VALUES ('6', '0x32000201', 'outdoor_temp', '3.5');
INSERT INTO `sensor_outdoor_his` VALUES ('6', '0x32000202', 'outdoor_damp', '2.4');
INSERT INTO `sensor_outdoor_his` VALUES ('7', '0x32000201', 'outdoor_temp', '3.5');
INSERT INTO `sensor_outdoor_his` VALUES ('7', '0x32000202', 'outdoor_damp', '2.4');
INSERT INTO `sensor_outdoor_his` VALUES ('8', '0x32000201', 'outdoor_temp', '3.5');
INSERT INTO `sensor_outdoor_his` VALUES ('8', '0x32000202', 'outdoor_damp', '2.4');
INSERT INTO `sensor_outdoor_his` VALUES ('9', '0x32000201', 'outdoor_temp', '3.5');
INSERT INTO `sensor_outdoor_his` VALUES ('9', '0x32000202', 'outdoor_damp', '2.4');
INSERT INTO `sensor_outdoor_his` VALUES ('10', '0x32000201', 'outdoor_temp', '3.5');
INSERT INTO `sensor_outdoor_his` VALUES ('10', '0x32000202', 'outdoor_damp', '2.4');
INSERT INTO `sensor_outdoor_his` VALUES ('11', '0x32000201', 'outdoor_temp', '3.5');
INSERT INTO `sensor_outdoor_his` VALUES ('11', '0x32000202', 'outdoor_damp', '2.4');
INSERT INTO `sensor_outdoor_his` VALUES ('12', '0x32000201', 'outdoor_temp', '3.5');
INSERT INTO `sensor_outdoor_his` VALUES ('12', '0x32000202', 'outdoor_damp', '2.4');
INSERT INTO `sensor_outdoor_his` VALUES ('13', '0x32000201', 'outdoor_temp', '3.5');
INSERT INTO `sensor_outdoor_his` VALUES ('13', '0x32000202', 'outdoor_damp', '2.4');
INSERT INTO `sensor_outdoor_his` VALUES ('14', '0x32000201', 'outdoor_temp', '3.5');
INSERT INTO `sensor_outdoor_his` VALUES ('14', '0x32000202', 'outdoor_damp', '2.4');
INSERT INTO `sensor_outdoor_his` VALUES ('15', '0x32000201', 'outdoor_temp', '3.5');
INSERT INTO `sensor_outdoor_his` VALUES ('15', '0x32000202', 'outdoor_damp', '2.4');
INSERT INTO `sensor_outdoor_his` VALUES ('16', '0x32000201', 'outdoor_temp', '3.5');
INSERT INTO `sensor_outdoor_his` VALUES ('16', '0x32000202', 'outdoor_damp', '2.4');
INSERT INTO `sensor_outdoor_his` VALUES ('17', '0x32000201', 'outdoor_temp', '3.5');
INSERT INTO `sensor_outdoor_his` VALUES ('17', '0x32000202', 'outdoor_damp', '2.4');
INSERT INTO `sensor_outdoor_his` VALUES ('18', '0x32000201', 'outdoor_temp', '3.5');
INSERT INTO `sensor_outdoor_his` VALUES ('18', '0x32000202', 'outdoor_damp', '2.4');
INSERT INTO `sensor_outdoor_his` VALUES ('19', '0x32000201', 'outdoor_temp', '3.5');
INSERT INTO `sensor_outdoor_his` VALUES ('19', '0x32000202', 'outdoor_damp', '2.4');
INSERT INTO `sensor_outdoor_his` VALUES ('20', '0x32000201', 'outdoor_temp', '3.5');
INSERT INTO `sensor_outdoor_his` VALUES ('20', '0x32000202', 'outdoor_damp', '2.4');
INSERT INTO `sensor_outdoor_his` VALUES ('21', '0x32000201', 'outdoor_temp', '3.5');
INSERT INTO `sensor_outdoor_his` VALUES ('21', '0x32000202', 'outdoor_damp', '2.4');
INSERT INTO `sensor_outdoor_his` VALUES ('22', '0x32000201', 'outdoor_temp', '3.5');
INSERT INTO `sensor_outdoor_his` VALUES ('22', '0x32000202', 'outdoor_damp', '2.4');
INSERT INTO `sensor_outdoor_his` VALUES ('23', '0x32000201', 'outdoor_temp', '3.5');
INSERT INTO `sensor_outdoor_his` VALUES ('23', '0x32000202', 'outdoor_damp', '2.4');
INSERT INTO `sensor_outdoor_his` VALUES ('24', '0x32000201', 'outdoor_temp', '3.5');
INSERT INTO `sensor_outdoor_his` VALUES ('24', '0x32000202', 'outdoor_damp', '2.4');
INSERT INTO `sensor_outdoor_his` VALUES ('25', '0x32000201', 'outdoor_temp', '3.5');
INSERT INTO `sensor_outdoor_his` VALUES ('25', '0x32000202', 'outdoor_damp', '2.4');
INSERT INTO `sensor_outdoor_his` VALUES ('26', '0x32000201', 'outdoor_temp', '3.5');
INSERT INTO `sensor_outdoor_his` VALUES ('26', '0x32000202', 'outdoor_damp', '2.4');
INSERT INTO `sensor_outdoor_his` VALUES ('27', '0x32000201', 'outdoor_temp', '3.5');
INSERT INTO `sensor_outdoor_his` VALUES ('27', '0x32000202', 'outdoor_damp', '2.4');
INSERT INTO `sensor_outdoor_his` VALUES ('28', '0x32000201', 'outdoor_temp', '3.5');
INSERT INTO `sensor_outdoor_his` VALUES ('28', '0x32000202', 'outdoor_damp', '2.4');
INSERT INTO `sensor_outdoor_his` VALUES ('29', '0x32000201', 'outdoor_temp', '3.5');
INSERT INTO `sensor_outdoor_his` VALUES ('29', '0x32000202', 'outdoor_damp', '2.4');
INSERT INTO `sensor_outdoor_his` VALUES ('30', '0x32000201', 'outdoor_temp', '3.5');
INSERT INTO `sensor_outdoor_his` VALUES ('30', '0x32000202', 'outdoor_damp', '2.4');
INSERT INTO `sensor_outdoor_his` VALUES ('31', '0x32000201', 'outdoor_temp', '3.5');
INSERT INTO `sensor_outdoor_his` VALUES ('31', '0x32000202', 'outdoor_damp', '2.4');
INSERT INTO `sensor_outdoor_his` VALUES ('32', '0x32000201', 'outdoor_temp', '3.5');
INSERT INTO `sensor_outdoor_his` VALUES ('32', '0x32000202', 'outdoor_damp', '2.4');
INSERT INTO `sensor_outdoor_his` VALUES ('33', '0x32000201', 'outdoor_temp', '3.5');
INSERT INTO `sensor_outdoor_his` VALUES ('33', '0x32000202', 'outdoor_damp', '2.4');
INSERT INTO `sensor_outdoor_his` VALUES ('34', '0x32000201', 'outdoor_temp', '3.5');
INSERT INTO `sensor_outdoor_his` VALUES ('34', '0x32000202', 'outdoor_damp', '2.4');
INSERT INTO `sensor_outdoor_his` VALUES ('35', '0x32000201', 'outdoor_temp', '3.5');
INSERT INTO `sensor_outdoor_his` VALUES ('35', '0x32000202', 'outdoor_damp', '2.4');
INSERT INTO `sensor_outdoor_his` VALUES ('36', '0x32000201', 'outdoor_temp', '3.5');
INSERT INTO `sensor_outdoor_his` VALUES ('36', '0x32000202', 'outdoor_damp', '2.4');
INSERT INTO `sensor_outdoor_his` VALUES ('37', '0x32000201', 'outdoor_temp', '3.5');
INSERT INTO `sensor_outdoor_his` VALUES ('37', '0x32000202', 'outdoor_damp', '2.4');
INSERT INTO `sensor_outdoor_his` VALUES ('38', '0x32000201', 'outdoor_temp', '3.5');
INSERT INTO `sensor_outdoor_his` VALUES ('38', '0x32000202', 'outdoor_damp', '2.4');
INSERT INTO `sensor_outdoor_his` VALUES ('39', '0x32000201', 'outdoor_temp', '3.5');
INSERT INTO `sensor_outdoor_his` VALUES ('39', '0x32000202', 'outdoor_damp', '2.4');
INSERT INTO `sensor_outdoor_his` VALUES ('40', '0x32000201', 'outdoor_temp', '3.5');
INSERT INTO `sensor_outdoor_his` VALUES ('40', '0x32000202', 'outdoor_damp', '2.4');
INSERT INTO `sensor_outdoor_his` VALUES ('41', '0x32000201', 'outdoor_temp', '3.5');
INSERT INTO `sensor_outdoor_his` VALUES ('41', '0x32000202', 'outdoor_damp', '2.4');
INSERT INTO `sensor_outdoor_his` VALUES ('42', '0x32000201', 'outdoor_temp', '3.5');
INSERT INTO `sensor_outdoor_his` VALUES ('42', '0x32000202', 'outdoor_damp', '2.4');
INSERT INTO `sensor_outdoor_his` VALUES ('43', '0x32000201', 'outdoor_temp', '3.5');
INSERT INTO `sensor_outdoor_his` VALUES ('43', '0x32000202', 'outdoor_damp', '2.4');
INSERT INTO `sensor_outdoor_his` VALUES ('44', '0x32000201', 'outdoor_temp', '3.5');
INSERT INTO `sensor_outdoor_his` VALUES ('44', '0x32000202', 'outdoor_damp', '2.4');
INSERT INTO `sensor_outdoor_his` VALUES ('45', '0x32000201', 'outdoor_temp', '3.5');
INSERT INTO `sensor_outdoor_his` VALUES ('45', '0x32000202', 'outdoor_damp', '2.4');
INSERT INTO `sensor_outdoor_his` VALUES ('46', '0x32000201', 'outdoor_temp', '3.5');
INSERT INTO `sensor_outdoor_his` VALUES ('46', '0x32000202', 'outdoor_damp', '2.4');
INSERT INTO `sensor_outdoor_his` VALUES ('47', '0x32000201', 'outdoor_temp', '3.5');
INSERT INTO `sensor_outdoor_his` VALUES ('47', '0x32000202', 'outdoor_damp', '2.4');
INSERT INTO `sensor_outdoor_his` VALUES ('48', '0x32000201', 'outdoor_temp', '3.5');
INSERT INTO `sensor_outdoor_his` VALUES ('48', '0x32000202', 'outdoor_damp', '2.4');
INSERT INTO `sensor_outdoor_his` VALUES ('49', '0x32000201', 'outdoor_temp', '3.5');
INSERT INTO `sensor_outdoor_his` VALUES ('49', '0x32000202', 'outdoor_damp', '2.4');
INSERT INTO `sensor_outdoor_his` VALUES ('50', '0x32000201', 'outdoor_temp', '3.5');
INSERT INTO `sensor_outdoor_his` VALUES ('50', '0x32000202', 'outdoor_damp', '2.4');
