/*
Navicat MySQL Data Transfer

Source Server         : Local
Source Server Version : 80019
Source Host           : localhost:3306
Source Database       : mz_node5

Target Server Type    : MYSQL
Target Server Version : 80019
File Encoding         : 65001

Date: 2021-01-14 15:25:40
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
INSERT INTO `alarm` VALUES ('50', '0x00000900', 'room_temp_alarm', '0');
INSERT INTO `alarm` VALUES ('50', '0x00000901', 'room_RH_alarm', '0');
INSERT INTO `alarm` VALUES ('50', '0x00000902', 'room_pandemic_alarm', '0');
INSERT INTO `alarm` VALUES ('50', '0x00000903', 'fcu_flow_alarm', '0');
INSERT INTO `alarm` VALUES ('50', '0x00000904', 'fcu_tw_alarm', '0');
INSERT INTO `alarm` VALUES ('50', '0x00000905', 'fcu_pressure_alarm', '0');

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
INSERT INTO `alarm_his` VALUES ('0', '0x00000900', 'room_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('0', '0x00000901', 'room_RH_alarm', '0');
INSERT INTO `alarm_his` VALUES ('0', '0x00000902', 'room_pandemic_alarm', '0');
INSERT INTO `alarm_his` VALUES ('0', '0x00000903', 'fcu_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('0', '0x00000904', 'fcu_tw_alarm', '0');
INSERT INTO `alarm_his` VALUES ('0', '0x00000905', 'fcu_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('1', '0x00000900', 'room_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('1', '0x00000901', 'room_RH_alarm', '0');
INSERT INTO `alarm_his` VALUES ('1', '0x00000902', 'room_pandemic_alarm', '0');
INSERT INTO `alarm_his` VALUES ('1', '0x00000903', 'fcu_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('1', '0x00000904', 'fcu_tw_alarm', '0');
INSERT INTO `alarm_his` VALUES ('1', '0x00000905', 'fcu_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('2', '0x00000900', 'room_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('2', '0x00000901', 'room_RH_alarm', '0');
INSERT INTO `alarm_his` VALUES ('2', '0x00000902', 'room_pandemic_alarm', '0');
INSERT INTO `alarm_his` VALUES ('2', '0x00000903', 'fcu_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('2', '0x00000904', 'fcu_tw_alarm', '0');
INSERT INTO `alarm_his` VALUES ('2', '0x00000905', 'fcu_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('3', '0x00000900', 'room_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('3', '0x00000901', 'room_RH_alarm', '0');
INSERT INTO `alarm_his` VALUES ('3', '0x00000902', 'room_pandemic_alarm', '0');
INSERT INTO `alarm_his` VALUES ('3', '0x00000903', 'fcu_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('3', '0x00000904', 'fcu_tw_alarm', '0');
INSERT INTO `alarm_his` VALUES ('3', '0x00000905', 'fcu_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('4', '0x00000900', 'room_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('4', '0x00000901', 'room_RH_alarm', '0');
INSERT INTO `alarm_his` VALUES ('4', '0x00000902', 'room_pandemic_alarm', '0');
INSERT INTO `alarm_his` VALUES ('4', '0x00000903', 'fcu_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('4', '0x00000904', 'fcu_tw_alarm', '0');
INSERT INTO `alarm_his` VALUES ('4', '0x00000905', 'fcu_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('5', '0x00000900', 'room_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('5', '0x00000901', 'room_RH_alarm', '0');
INSERT INTO `alarm_his` VALUES ('5', '0x00000902', 'room_pandemic_alarm', '0');
INSERT INTO `alarm_his` VALUES ('5', '0x00000903', 'fcu_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('5', '0x00000904', 'fcu_tw_alarm', '0');
INSERT INTO `alarm_his` VALUES ('5', '0x00000905', 'fcu_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('6', '0x00000900', 'room_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('6', '0x00000901', 'room_RH_alarm', '0');
INSERT INTO `alarm_his` VALUES ('6', '0x00000902', 'room_pandemic_alarm', '0');
INSERT INTO `alarm_his` VALUES ('6', '0x00000903', 'fcu_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('6', '0x00000904', 'fcu_tw_alarm', '0');
INSERT INTO `alarm_his` VALUES ('6', '0x00000905', 'fcu_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('7', '0x00000900', 'room_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('7', '0x00000901', 'room_RH_alarm', '0');
INSERT INTO `alarm_his` VALUES ('7', '0x00000902', 'room_pandemic_alarm', '0');
INSERT INTO `alarm_his` VALUES ('7', '0x00000903', 'fcu_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('7', '0x00000904', 'fcu_tw_alarm', '0');
INSERT INTO `alarm_his` VALUES ('7', '0x00000905', 'fcu_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('8', '0x00000900', 'room_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('8', '0x00000901', 'room_RH_alarm', '0');
INSERT INTO `alarm_his` VALUES ('8', '0x00000902', 'room_pandemic_alarm', '0');
INSERT INTO `alarm_his` VALUES ('8', '0x00000903', 'fcu_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('8', '0x00000904', 'fcu_tw_alarm', '0');
INSERT INTO `alarm_his` VALUES ('8', '0x00000905', 'fcu_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('9', '0x00000900', 'room_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('9', '0x00000901', 'room_RH_alarm', '0');
INSERT INTO `alarm_his` VALUES ('9', '0x00000902', 'room_pandemic_alarm', '0');
INSERT INTO `alarm_his` VALUES ('9', '0x00000903', 'fcu_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('9', '0x00000904', 'fcu_tw_alarm', '0');
INSERT INTO `alarm_his` VALUES ('9', '0x00000905', 'fcu_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('10', '0x00000900', 'room_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('10', '0x00000901', 'room_RH_alarm', '0');
INSERT INTO `alarm_his` VALUES ('10', '0x00000902', 'room_pandemic_alarm', '0');
INSERT INTO `alarm_his` VALUES ('10', '0x00000903', 'fcu_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('10', '0x00000904', 'fcu_tw_alarm', '0');
INSERT INTO `alarm_his` VALUES ('10', '0x00000905', 'fcu_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('11', '0x00000900', 'room_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('11', '0x00000901', 'room_RH_alarm', '0');
INSERT INTO `alarm_his` VALUES ('11', '0x00000902', 'room_pandemic_alarm', '0');
INSERT INTO `alarm_his` VALUES ('11', '0x00000903', 'fcu_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('11', '0x00000904', 'fcu_tw_alarm', '0');
INSERT INTO `alarm_his` VALUES ('11', '0x00000905', 'fcu_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('12', '0x00000900', 'room_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('12', '0x00000901', 'room_RH_alarm', '0');
INSERT INTO `alarm_his` VALUES ('12', '0x00000902', 'room_pandemic_alarm', '0');
INSERT INTO `alarm_his` VALUES ('12', '0x00000903', 'fcu_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('12', '0x00000904', 'fcu_tw_alarm', '0');
INSERT INTO `alarm_his` VALUES ('12', '0x00000905', 'fcu_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('13', '0x00000900', 'room_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('13', '0x00000901', 'room_RH_alarm', '0');
INSERT INTO `alarm_his` VALUES ('13', '0x00000902', 'room_pandemic_alarm', '0');
INSERT INTO `alarm_his` VALUES ('13', '0x00000903', 'fcu_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('13', '0x00000904', 'fcu_tw_alarm', '0');
INSERT INTO `alarm_his` VALUES ('13', '0x00000905', 'fcu_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('14', '0x00000900', 'room_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('14', '0x00000901', 'room_RH_alarm', '0');
INSERT INTO `alarm_his` VALUES ('14', '0x00000902', 'room_pandemic_alarm', '0');
INSERT INTO `alarm_his` VALUES ('14', '0x00000903', 'fcu_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('14', '0x00000904', 'fcu_tw_alarm', '0');
INSERT INTO `alarm_his` VALUES ('14', '0x00000905', 'fcu_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('15', '0x00000900', 'room_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('15', '0x00000901', 'room_RH_alarm', '0');
INSERT INTO `alarm_his` VALUES ('15', '0x00000902', 'room_pandemic_alarm', '0');
INSERT INTO `alarm_his` VALUES ('15', '0x00000903', 'fcu_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('15', '0x00000904', 'fcu_tw_alarm', '0');
INSERT INTO `alarm_his` VALUES ('15', '0x00000905', 'fcu_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('16', '0x00000900', 'room_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('16', '0x00000901', 'room_RH_alarm', '0');
INSERT INTO `alarm_his` VALUES ('16', '0x00000902', 'room_pandemic_alarm', '0');
INSERT INTO `alarm_his` VALUES ('16', '0x00000903', 'fcu_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('16', '0x00000904', 'fcu_tw_alarm', '0');
INSERT INTO `alarm_his` VALUES ('16', '0x00000905', 'fcu_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('17', '0x00000900', 'room_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('17', '0x00000901', 'room_RH_alarm', '0');
INSERT INTO `alarm_his` VALUES ('17', '0x00000902', 'room_pandemic_alarm', '0');
INSERT INTO `alarm_his` VALUES ('17', '0x00000903', 'fcu_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('17', '0x00000904', 'fcu_tw_alarm', '0');
INSERT INTO `alarm_his` VALUES ('17', '0x00000905', 'fcu_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('18', '0x00000900', 'room_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('18', '0x00000901', 'room_RH_alarm', '0');
INSERT INTO `alarm_his` VALUES ('18', '0x00000902', 'room_pandemic_alarm', '0');
INSERT INTO `alarm_his` VALUES ('18', '0x00000903', 'fcu_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('18', '0x00000904', 'fcu_tw_alarm', '0');
INSERT INTO `alarm_his` VALUES ('18', '0x00000905', 'fcu_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('19', '0x00000900', 'room_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('19', '0x00000901', 'room_RH_alarm', '0');
INSERT INTO `alarm_his` VALUES ('19', '0x00000902', 'room_pandemic_alarm', '0');
INSERT INTO `alarm_his` VALUES ('19', '0x00000903', 'fcu_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('19', '0x00000904', 'fcu_tw_alarm', '0');
INSERT INTO `alarm_his` VALUES ('19', '0x00000905', 'fcu_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('20', '0x00000900', 'room_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('20', '0x00000901', 'room_RH_alarm', '0');
INSERT INTO `alarm_his` VALUES ('20', '0x00000902', 'room_pandemic_alarm', '0');
INSERT INTO `alarm_his` VALUES ('20', '0x00000903', 'fcu_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('20', '0x00000904', 'fcu_tw_alarm', '0');
INSERT INTO `alarm_his` VALUES ('20', '0x00000905', 'fcu_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('21', '0x00000900', 'room_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('21', '0x00000901', 'room_RH_alarm', '0');
INSERT INTO `alarm_his` VALUES ('21', '0x00000902', 'room_pandemic_alarm', '0');
INSERT INTO `alarm_his` VALUES ('21', '0x00000903', 'fcu_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('21', '0x00000904', 'fcu_tw_alarm', '0');
INSERT INTO `alarm_his` VALUES ('21', '0x00000905', 'fcu_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('22', '0x00000900', 'room_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('22', '0x00000901', 'room_RH_alarm', '0');
INSERT INTO `alarm_his` VALUES ('22', '0x00000902', 'room_pandemic_alarm', '0');
INSERT INTO `alarm_his` VALUES ('22', '0x00000903', 'fcu_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('22', '0x00000904', 'fcu_tw_alarm', '0');
INSERT INTO `alarm_his` VALUES ('22', '0x00000905', 'fcu_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('23', '0x00000900', 'room_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('23', '0x00000901', 'room_RH_alarm', '0');
INSERT INTO `alarm_his` VALUES ('23', '0x00000902', 'room_pandemic_alarm', '0');
INSERT INTO `alarm_his` VALUES ('23', '0x00000903', 'fcu_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('23', '0x00000904', 'fcu_tw_alarm', '0');
INSERT INTO `alarm_his` VALUES ('23', '0x00000905', 'fcu_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('24', '0x00000900', 'room_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('24', '0x00000901', 'room_RH_alarm', '0');
INSERT INTO `alarm_his` VALUES ('24', '0x00000902', 'room_pandemic_alarm', '0');
INSERT INTO `alarm_his` VALUES ('24', '0x00000903', 'fcu_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('24', '0x00000904', 'fcu_tw_alarm', '0');
INSERT INTO `alarm_his` VALUES ('24', '0x00000905', 'fcu_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('25', '0x00000900', 'room_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('25', '0x00000901', 'room_RH_alarm', '0');
INSERT INTO `alarm_his` VALUES ('25', '0x00000902', 'room_pandemic_alarm', '0');
INSERT INTO `alarm_his` VALUES ('25', '0x00000903', 'fcu_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('25', '0x00000904', 'fcu_tw_alarm', '0');
INSERT INTO `alarm_his` VALUES ('25', '0x00000905', 'fcu_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('26', '0x00000900', 'room_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('26', '0x00000901', 'room_RH_alarm', '0');
INSERT INTO `alarm_his` VALUES ('26', '0x00000902', 'room_pandemic_alarm', '0');
INSERT INTO `alarm_his` VALUES ('26', '0x00000903', 'fcu_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('26', '0x00000904', 'fcu_tw_alarm', '0');
INSERT INTO `alarm_his` VALUES ('26', '0x00000905', 'fcu_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('27', '0x00000900', 'room_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('27', '0x00000901', 'room_RH_alarm', '0');
INSERT INTO `alarm_his` VALUES ('27', '0x00000902', 'room_pandemic_alarm', '0');
INSERT INTO `alarm_his` VALUES ('27', '0x00000903', 'fcu_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('27', '0x00000904', 'fcu_tw_alarm', '0');
INSERT INTO `alarm_his` VALUES ('27', '0x00000905', 'fcu_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('28', '0x00000900', 'room_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('28', '0x00000901', 'room_RH_alarm', '0');
INSERT INTO `alarm_his` VALUES ('28', '0x00000902', 'room_pandemic_alarm', '0');
INSERT INTO `alarm_his` VALUES ('28', '0x00000903', 'fcu_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('28', '0x00000904', 'fcu_tw_alarm', '0');
INSERT INTO `alarm_his` VALUES ('28', '0x00000905', 'fcu_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('29', '0x00000900', 'room_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('29', '0x00000901', 'room_RH_alarm', '0');
INSERT INTO `alarm_his` VALUES ('29', '0x00000902', 'room_pandemic_alarm', '0');
INSERT INTO `alarm_his` VALUES ('29', '0x00000903', 'fcu_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('29', '0x00000904', 'fcu_tw_alarm', '0');
INSERT INTO `alarm_his` VALUES ('29', '0x00000905', 'fcu_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('30', '0x00000900', 'room_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('30', '0x00000901', 'room_RH_alarm', '0');
INSERT INTO `alarm_his` VALUES ('30', '0x00000902', 'room_pandemic_alarm', '0');
INSERT INTO `alarm_his` VALUES ('30', '0x00000903', 'fcu_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('30', '0x00000904', 'fcu_tw_alarm', '0');
INSERT INTO `alarm_his` VALUES ('30', '0x00000905', 'fcu_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('31', '0x00000900', 'room_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('31', '0x00000901', 'room_RH_alarm', '0');
INSERT INTO `alarm_his` VALUES ('31', '0x00000902', 'room_pandemic_alarm', '0');
INSERT INTO `alarm_his` VALUES ('31', '0x00000903', 'fcu_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('31', '0x00000904', 'fcu_tw_alarm', '0');
INSERT INTO `alarm_his` VALUES ('31', '0x00000905', 'fcu_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('32', '0x00000900', 'room_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('32', '0x00000901', 'room_RH_alarm', '0');
INSERT INTO `alarm_his` VALUES ('32', '0x00000902', 'room_pandemic_alarm', '0');
INSERT INTO `alarm_his` VALUES ('32', '0x00000903', 'fcu_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('32', '0x00000904', 'fcu_tw_alarm', '0');
INSERT INTO `alarm_his` VALUES ('32', '0x00000905', 'fcu_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('33', '0x00000900', 'room_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('33', '0x00000901', 'room_RH_alarm', '0');
INSERT INTO `alarm_his` VALUES ('33', '0x00000902', 'room_pandemic_alarm', '0');
INSERT INTO `alarm_his` VALUES ('33', '0x00000903', 'fcu_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('33', '0x00000904', 'fcu_tw_alarm', '0');
INSERT INTO `alarm_his` VALUES ('33', '0x00000905', 'fcu_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('34', '0x00000900', 'room_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('34', '0x00000901', 'room_RH_alarm', '0');
INSERT INTO `alarm_his` VALUES ('34', '0x00000902', 'room_pandemic_alarm', '0');
INSERT INTO `alarm_his` VALUES ('34', '0x00000903', 'fcu_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('34', '0x00000904', 'fcu_tw_alarm', '0');
INSERT INTO `alarm_his` VALUES ('34', '0x00000905', 'fcu_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('35', '0x00000900', 'room_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('35', '0x00000901', 'room_RH_alarm', '0');
INSERT INTO `alarm_his` VALUES ('35', '0x00000902', 'room_pandemic_alarm', '0');
INSERT INTO `alarm_his` VALUES ('35', '0x00000903', 'fcu_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('35', '0x00000904', 'fcu_tw_alarm', '0');
INSERT INTO `alarm_his` VALUES ('35', '0x00000905', 'fcu_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('36', '0x00000900', 'room_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('36', '0x00000901', 'room_RH_alarm', '0');
INSERT INTO `alarm_his` VALUES ('36', '0x00000902', 'room_pandemic_alarm', '0');
INSERT INTO `alarm_his` VALUES ('36', '0x00000903', 'fcu_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('36', '0x00000904', 'fcu_tw_alarm', '0');
INSERT INTO `alarm_his` VALUES ('36', '0x00000905', 'fcu_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('37', '0x00000900', 'room_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('37', '0x00000901', 'room_RH_alarm', '0');
INSERT INTO `alarm_his` VALUES ('37', '0x00000902', 'room_pandemic_alarm', '0');
INSERT INTO `alarm_his` VALUES ('37', '0x00000903', 'fcu_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('37', '0x00000904', 'fcu_tw_alarm', '0');
INSERT INTO `alarm_his` VALUES ('37', '0x00000905', 'fcu_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('38', '0x00000900', 'room_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('38', '0x00000901', 'room_RH_alarm', '0');
INSERT INTO `alarm_his` VALUES ('38', '0x00000902', 'room_pandemic_alarm', '0');
INSERT INTO `alarm_his` VALUES ('38', '0x00000903', 'fcu_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('38', '0x00000904', 'fcu_tw_alarm', '0');
INSERT INTO `alarm_his` VALUES ('38', '0x00000905', 'fcu_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('39', '0x00000900', 'room_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('39', '0x00000901', 'room_RH_alarm', '0');
INSERT INTO `alarm_his` VALUES ('39', '0x00000902', 'room_pandemic_alarm', '0');
INSERT INTO `alarm_his` VALUES ('39', '0x00000903', 'fcu_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('39', '0x00000904', 'fcu_tw_alarm', '0');
INSERT INTO `alarm_his` VALUES ('39', '0x00000905', 'fcu_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('40', '0x00000900', 'room_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('40', '0x00000901', 'room_RH_alarm', '0');
INSERT INTO `alarm_his` VALUES ('40', '0x00000902', 'room_pandemic_alarm', '0');
INSERT INTO `alarm_his` VALUES ('40', '0x00000903', 'fcu_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('40', '0x00000904', 'fcu_tw_alarm', '0');
INSERT INTO `alarm_his` VALUES ('40', '0x00000905', 'fcu_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('41', '0x00000900', 'room_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('41', '0x00000901', 'room_RH_alarm', '0');
INSERT INTO `alarm_his` VALUES ('41', '0x00000902', 'room_pandemic_alarm', '0');
INSERT INTO `alarm_his` VALUES ('41', '0x00000903', 'fcu_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('41', '0x00000904', 'fcu_tw_alarm', '0');
INSERT INTO `alarm_his` VALUES ('41', '0x00000905', 'fcu_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('42', '0x00000900', 'room_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('42', '0x00000901', 'room_RH_alarm', '0');
INSERT INTO `alarm_his` VALUES ('42', '0x00000902', 'room_pandemic_alarm', '0');
INSERT INTO `alarm_his` VALUES ('42', '0x00000903', 'fcu_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('42', '0x00000904', 'fcu_tw_alarm', '0');
INSERT INTO `alarm_his` VALUES ('42', '0x00000905', 'fcu_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('43', '0x00000900', 'room_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('43', '0x00000901', 'room_RH_alarm', '0');
INSERT INTO `alarm_his` VALUES ('43', '0x00000902', 'room_pandemic_alarm', '0');
INSERT INTO `alarm_his` VALUES ('43', '0x00000903', 'fcu_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('43', '0x00000904', 'fcu_tw_alarm', '0');
INSERT INTO `alarm_his` VALUES ('43', '0x00000905', 'fcu_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('44', '0x00000900', 'room_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('44', '0x00000901', 'room_RH_alarm', '0');
INSERT INTO `alarm_his` VALUES ('44', '0x00000902', 'room_pandemic_alarm', '0');
INSERT INTO `alarm_his` VALUES ('44', '0x00000903', 'fcu_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('44', '0x00000904', 'fcu_tw_alarm', '0');
INSERT INTO `alarm_his` VALUES ('44', '0x00000905', 'fcu_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('45', '0x00000900', 'room_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('45', '0x00000901', 'room_RH_alarm', '0');
INSERT INTO `alarm_his` VALUES ('45', '0x00000902', 'room_pandemic_alarm', '0');
INSERT INTO `alarm_his` VALUES ('45', '0x00000903', 'fcu_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('45', '0x00000904', 'fcu_tw_alarm', '0');
INSERT INTO `alarm_his` VALUES ('45', '0x00000905', 'fcu_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('46', '0x00000900', 'room_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('46', '0x00000901', 'room_RH_alarm', '0');
INSERT INTO `alarm_his` VALUES ('46', '0x00000902', 'room_pandemic_alarm', '0');
INSERT INTO `alarm_his` VALUES ('46', '0x00000903', 'fcu_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('46', '0x00000904', 'fcu_tw_alarm', '0');
INSERT INTO `alarm_his` VALUES ('46', '0x00000905', 'fcu_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('47', '0x00000900', 'room_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('47', '0x00000901', 'room_RH_alarm', '0');
INSERT INTO `alarm_his` VALUES ('47', '0x00000902', 'room_pandemic_alarm', '0');
INSERT INTO `alarm_his` VALUES ('47', '0x00000903', 'fcu_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('47', '0x00000904', 'fcu_tw_alarm', '0');
INSERT INTO `alarm_his` VALUES ('47', '0x00000905', 'fcu_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('48', '0x00000900', 'room_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('48', '0x00000901', 'room_RH_alarm', '0');
INSERT INTO `alarm_his` VALUES ('48', '0x00000902', 'room_pandemic_alarm', '0');
INSERT INTO `alarm_his` VALUES ('48', '0x00000903', 'fcu_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('48', '0x00000904', 'fcu_tw_alarm', '0');
INSERT INTO `alarm_his` VALUES ('48', '0x00000905', 'fcu_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('49', '0x00000900', 'room_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('49', '0x00000901', 'room_RH_alarm', '0');
INSERT INTO `alarm_his` VALUES ('49', '0x00000902', 'room_pandemic_alarm', '0');
INSERT INTO `alarm_his` VALUES ('49', '0x00000903', 'fcu_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('49', '0x00000904', 'fcu_tw_alarm', '0');
INSERT INTO `alarm_his` VALUES ('49', '0x00000905', 'fcu_pressure_alarm', '0');
INSERT INTO `alarm_his` VALUES ('50', '0x00000900', 'room_temp_alarm', '0');
INSERT INTO `alarm_his` VALUES ('50', '0x00000901', 'room_RH_alarm', '0');
INSERT INTO `alarm_his` VALUES ('50', '0x00000902', 'room_pandemic_alarm', '0');
INSERT INTO `alarm_his` VALUES ('50', '0x00000903', 'fcu_flow_alarm', '0');
INSERT INTO `alarm_his` VALUES ('50', '0x00000904', 'fcu_tw_alarm', '0');
INSERT INTO `alarm_his` VALUES ('50', '0x00000905', 'fcu_pressure_alarm', '0');

-- ----------------------------
-- Table structure for fcu_control
-- ----------------------------
DROP TABLE IF EXISTS `fcu_control`;
CREATE TABLE `fcu_control` (
  `time` int NOT NULL,
  `id` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `name` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`time`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of fcu_control
-- ----------------------------

-- ----------------------------
-- Table structure for fcu_control_his
-- ----------------------------
DROP TABLE IF EXISTS `fcu_control_his`;
CREATE TABLE `fcu_control_his` (
  `time` int NOT NULL,
  `id` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `name` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`time`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of fcu_control_his
-- ----------------------------

-- ----------------------------
-- Table structure for fcu_panel
-- ----------------------------
DROP TABLE IF EXISTS `fcu_panel`;
CREATE TABLE `fcu_panel` (
  `time` int NOT NULL,
  `id` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `name` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`time`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of fcu_panel
-- ----------------------------
INSERT INTO `fcu_panel` VALUES ('50', '0x00000240', 'roomtemp_setpoint', '24');
INSERT INTO `fcu_panel` VALUES ('50', '0x00000241', 'roomRH_setpoint', '70');
INSERT INTO `fcu_panel` VALUES ('50', '0x0000024A', 'room_Q', '-170');
INSERT INTO `fcu_panel` VALUES ('50', '0x00000410', 'FCU_onoff_feedback', '1');
INSERT INTO `fcu_panel` VALUES ('50', '0x00000412', 'FCU_fan_feedback', '1');
INSERT INTO `fcu_panel` VALUES ('50', '0x00000418', 'FCU_workingmode_feedback', '2');

-- ----------------------------
-- Table structure for fcu_panel_his
-- ----------------------------
DROP TABLE IF EXISTS `fcu_panel_his`;
CREATE TABLE `fcu_panel_his` (
  `time` int NOT NULL,
  `id` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `name` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`time`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of fcu_panel_his
-- ----------------------------
INSERT INTO `fcu_panel_his` VALUES ('0', '0x00000240', 'roomtemp_setpoint', '24');
INSERT INTO `fcu_panel_his` VALUES ('0', '0x00000241', 'roomRH_setpoint', '70');
INSERT INTO `fcu_panel_his` VALUES ('0', '0x0000024A', 'room_Q', '0');
INSERT INTO `fcu_panel_his` VALUES ('0', '0x00000410', 'FCU_onoff_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('0', '0x00000412', 'FCU_fan_feedback', '2');
INSERT INTO `fcu_panel_his` VALUES ('0', '0x00000418', 'FCU_workingmode_feedback', '2');
INSERT INTO `fcu_panel_his` VALUES ('1', '0x00000240', 'roomtemp_setpoint', '24');
INSERT INTO `fcu_panel_his` VALUES ('1', '0x00000241', 'roomRH_setpoint', '70');
INSERT INTO `fcu_panel_his` VALUES ('1', '0x0000024A', 'room_Q', '-132.4');
INSERT INTO `fcu_panel_his` VALUES ('1', '0x00000410', 'FCU_onoff_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('1', '0x00000412', 'FCU_fan_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('1', '0x00000418', 'FCU_workingmode_feedback', '2');
INSERT INTO `fcu_panel_his` VALUES ('2', '0x00000240', 'roomtemp_setpoint', '24');
INSERT INTO `fcu_panel_his` VALUES ('2', '0x00000241', 'roomRH_setpoint', '70');
INSERT INTO `fcu_panel_his` VALUES ('2', '0x0000024A', 'room_Q', '-48.3');
INSERT INTO `fcu_panel_his` VALUES ('2', '0x00000410', 'FCU_onoff_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('2', '0x00000412', 'FCU_fan_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('2', '0x00000418', 'FCU_workingmode_feedback', '2');
INSERT INTO `fcu_panel_his` VALUES ('3', '0x00000240', 'roomtemp_setpoint', '24');
INSERT INTO `fcu_panel_his` VALUES ('3', '0x00000241', 'roomRH_setpoint', '70');
INSERT INTO `fcu_panel_his` VALUES ('3', '0x0000024A', 'room_Q', '-140.6');
INSERT INTO `fcu_panel_his` VALUES ('3', '0x00000410', 'FCU_onoff_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('3', '0x00000412', 'FCU_fan_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('3', '0x00000418', 'FCU_workingmode_feedback', '2');
INSERT INTO `fcu_panel_his` VALUES ('4', '0x00000240', 'roomtemp_setpoint', '24');
INSERT INTO `fcu_panel_his` VALUES ('4', '0x00000241', 'roomRH_setpoint', '70');
INSERT INTO `fcu_panel_his` VALUES ('4', '0x0000024A', 'room_Q', '-121.3');
INSERT INTO `fcu_panel_his` VALUES ('4', '0x00000410', 'FCU_onoff_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('4', '0x00000412', 'FCU_fan_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('4', '0x00000418', 'FCU_workingmode_feedback', '2');
INSERT INTO `fcu_panel_his` VALUES ('5', '0x00000240', 'roomtemp_setpoint', '24');
INSERT INTO `fcu_panel_his` VALUES ('5', '0x00000241', 'roomRH_setpoint', '70');
INSERT INTO `fcu_panel_his` VALUES ('5', '0x0000024A', 'room_Q', '-103.1');
INSERT INTO `fcu_panel_his` VALUES ('5', '0x00000410', 'FCU_onoff_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('5', '0x00000412', 'FCU_fan_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('5', '0x00000418', 'FCU_workingmode_feedback', '2');
INSERT INTO `fcu_panel_his` VALUES ('6', '0x00000240', 'roomtemp_setpoint', '24');
INSERT INTO `fcu_panel_his` VALUES ('6', '0x00000241', 'roomRH_setpoint', '70');
INSERT INTO `fcu_panel_his` VALUES ('6', '0x0000024A', 'room_Q', '-75.8');
INSERT INTO `fcu_panel_his` VALUES ('6', '0x00000410', 'FCU_onoff_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('6', '0x00000412', 'FCU_fan_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('6', '0x00000418', 'FCU_workingmode_feedback', '2');
INSERT INTO `fcu_panel_his` VALUES ('7', '0x00000240', 'roomtemp_setpoint', '24');
INSERT INTO `fcu_panel_his` VALUES ('7', '0x00000241', 'roomRH_setpoint', '70');
INSERT INTO `fcu_panel_his` VALUES ('7', '0x0000024A', 'room_Q', '-151.5');
INSERT INTO `fcu_panel_his` VALUES ('7', '0x00000410', 'FCU_onoff_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('7', '0x00000412', 'FCU_fan_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('7', '0x00000418', 'FCU_workingmode_feedback', '2');
INSERT INTO `fcu_panel_his` VALUES ('8', '0x00000240', 'roomtemp_setpoint', '24');
INSERT INTO `fcu_panel_his` VALUES ('8', '0x00000241', 'roomRH_setpoint', '70');
INSERT INTO `fcu_panel_his` VALUES ('8', '0x0000024A', 'room_Q', '-71.8');
INSERT INTO `fcu_panel_his` VALUES ('8', '0x00000410', 'FCU_onoff_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('8', '0x00000412', 'FCU_fan_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('8', '0x00000418', 'FCU_workingmode_feedback', '2');
INSERT INTO `fcu_panel_his` VALUES ('9', '0x00000240', 'roomtemp_setpoint', '24');
INSERT INTO `fcu_panel_his` VALUES ('9', '0x00000241', 'roomRH_setpoint', '70');
INSERT INTO `fcu_panel_his` VALUES ('9', '0x0000024A', 'room_Q', '-136.2');
INSERT INTO `fcu_panel_his` VALUES ('9', '0x00000410', 'FCU_onoff_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('9', '0x00000412', 'FCU_fan_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('9', '0x00000418', 'FCU_workingmode_feedback', '2');
INSERT INTO `fcu_panel_his` VALUES ('10', '0x00000240', 'roomtemp_setpoint', '24');
INSERT INTO `fcu_panel_his` VALUES ('10', '0x00000241', 'roomRH_setpoint', '70');
INSERT INTO `fcu_panel_his` VALUES ('10', '0x0000024A', 'room_Q', '-78.4');
INSERT INTO `fcu_panel_his` VALUES ('10', '0x00000410', 'FCU_onoff_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('10', '0x00000412', 'FCU_fan_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('10', '0x00000418', 'FCU_workingmode_feedback', '2');
INSERT INTO `fcu_panel_his` VALUES ('11', '0x00000240', 'roomtemp_setpoint', '24');
INSERT INTO `fcu_panel_his` VALUES ('11', '0x00000241', 'roomRH_setpoint', '70');
INSERT INTO `fcu_panel_his` VALUES ('11', '0x0000024A', 'room_Q', '-82.8');
INSERT INTO `fcu_panel_his` VALUES ('11', '0x00000410', 'FCU_onoff_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('11', '0x00000412', 'FCU_fan_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('11', '0x00000418', 'FCU_workingmode_feedback', '2');
INSERT INTO `fcu_panel_his` VALUES ('12', '0x00000240', 'roomtemp_setpoint', '24');
INSERT INTO `fcu_panel_his` VALUES ('12', '0x00000241', 'roomRH_setpoint', '70');
INSERT INTO `fcu_panel_his` VALUES ('12', '0x0000024A', 'room_Q', '-115.5');
INSERT INTO `fcu_panel_his` VALUES ('12', '0x00000410', 'FCU_onoff_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('12', '0x00000412', 'FCU_fan_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('12', '0x00000418', 'FCU_workingmode_feedback', '2');
INSERT INTO `fcu_panel_his` VALUES ('13', '0x00000240', 'roomtemp_setpoint', '24');
INSERT INTO `fcu_panel_his` VALUES ('13', '0x00000241', 'roomRH_setpoint', '70');
INSERT INTO `fcu_panel_his` VALUES ('13', '0x0000024A', 'room_Q', '-88.8');
INSERT INTO `fcu_panel_his` VALUES ('13', '0x00000410', 'FCU_onoff_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('13', '0x00000412', 'FCU_fan_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('13', '0x00000418', 'FCU_workingmode_feedback', '2');
INSERT INTO `fcu_panel_his` VALUES ('14', '0x00000240', 'roomtemp_setpoint', '24');
INSERT INTO `fcu_panel_his` VALUES ('14', '0x00000241', 'roomRH_setpoint', '70');
INSERT INTO `fcu_panel_his` VALUES ('14', '0x0000024A', 'room_Q', '-101.5');
INSERT INTO `fcu_panel_his` VALUES ('14', '0x00000410', 'FCU_onoff_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('14', '0x00000412', 'FCU_fan_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('14', '0x00000418', 'FCU_workingmode_feedback', '2');
INSERT INTO `fcu_panel_his` VALUES ('15', '0x00000240', 'roomtemp_setpoint', '24');
INSERT INTO `fcu_panel_his` VALUES ('15', '0x00000241', 'roomRH_setpoint', '70');
INSERT INTO `fcu_panel_his` VALUES ('15', '0x0000024A', 'room_Q', '-168.9');
INSERT INTO `fcu_panel_his` VALUES ('15', '0x00000410', 'FCU_onoff_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('15', '0x00000412', 'FCU_fan_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('15', '0x00000418', 'FCU_workingmode_feedback', '2');
INSERT INTO `fcu_panel_his` VALUES ('16', '0x00000240', 'roomtemp_setpoint', '24');
INSERT INTO `fcu_panel_his` VALUES ('16', '0x00000241', 'roomRH_setpoint', '70');
INSERT INTO `fcu_panel_his` VALUES ('16', '0x0000024A', 'room_Q', '-102.6');
INSERT INTO `fcu_panel_his` VALUES ('16', '0x00000410', 'FCU_onoff_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('16', '0x00000412', 'FCU_fan_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('16', '0x00000418', 'FCU_workingmode_feedback', '2');
INSERT INTO `fcu_panel_his` VALUES ('17', '0x00000240', 'roomtemp_setpoint', '24');
INSERT INTO `fcu_panel_his` VALUES ('17', '0x00000241', 'roomRH_setpoint', '70');
INSERT INTO `fcu_panel_his` VALUES ('17', '0x0000024A', 'room_Q', '-132.6');
INSERT INTO `fcu_panel_his` VALUES ('17', '0x00000410', 'FCU_onoff_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('17', '0x00000412', 'FCU_fan_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('17', '0x00000418', 'FCU_workingmode_feedback', '2');
INSERT INTO `fcu_panel_his` VALUES ('18', '0x00000240', 'roomtemp_setpoint', '24');
INSERT INTO `fcu_panel_his` VALUES ('18', '0x00000241', 'roomRH_setpoint', '70');
INSERT INTO `fcu_panel_his` VALUES ('18', '0x0000024A', 'room_Q', '-96.2');
INSERT INTO `fcu_panel_his` VALUES ('18', '0x00000410', 'FCU_onoff_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('18', '0x00000412', 'FCU_fan_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('18', '0x00000418', 'FCU_workingmode_feedback', '2');
INSERT INTO `fcu_panel_his` VALUES ('19', '0x00000240', 'roomtemp_setpoint', '24');
INSERT INTO `fcu_panel_his` VALUES ('19', '0x00000241', 'roomRH_setpoint', '70');
INSERT INTO `fcu_panel_his` VALUES ('19', '0x0000024A', 'room_Q', '-153.6');
INSERT INTO `fcu_panel_his` VALUES ('19', '0x00000410', 'FCU_onoff_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('19', '0x00000412', 'FCU_fan_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('19', '0x00000418', 'FCU_workingmode_feedback', '2');
INSERT INTO `fcu_panel_his` VALUES ('20', '0x00000240', 'roomtemp_setpoint', '24');
INSERT INTO `fcu_panel_his` VALUES ('20', '0x00000241', 'roomRH_setpoint', '70');
INSERT INTO `fcu_panel_his` VALUES ('20', '0x0000024A', 'room_Q', '-98');
INSERT INTO `fcu_panel_his` VALUES ('20', '0x00000410', 'FCU_onoff_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('20', '0x00000412', 'FCU_fan_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('20', '0x00000418', 'FCU_workingmode_feedback', '2');
INSERT INTO `fcu_panel_his` VALUES ('21', '0x00000240', 'roomtemp_setpoint', '24');
INSERT INTO `fcu_panel_his` VALUES ('21', '0x00000241', 'roomRH_setpoint', '70');
INSERT INTO `fcu_panel_his` VALUES ('21', '0x0000024A', 'room_Q', '-173.1');
INSERT INTO `fcu_panel_his` VALUES ('21', '0x00000410', 'FCU_onoff_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('21', '0x00000412', 'FCU_fan_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('21', '0x00000418', 'FCU_workingmode_feedback', '2');
INSERT INTO `fcu_panel_his` VALUES ('22', '0x00000240', 'roomtemp_setpoint', '24');
INSERT INTO `fcu_panel_his` VALUES ('22', '0x00000241', 'roomRH_setpoint', '70');
INSERT INTO `fcu_panel_his` VALUES ('22', '0x0000024A', 'room_Q', '-144.3');
INSERT INTO `fcu_panel_his` VALUES ('22', '0x00000410', 'FCU_onoff_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('22', '0x00000412', 'FCU_fan_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('22', '0x00000418', 'FCU_workingmode_feedback', '2');
INSERT INTO `fcu_panel_his` VALUES ('23', '0x00000240', 'roomtemp_setpoint', '24');
INSERT INTO `fcu_panel_his` VALUES ('23', '0x00000241', 'roomRH_setpoint', '70');
INSERT INTO `fcu_panel_his` VALUES ('23', '0x0000024A', 'room_Q', '-171.6');
INSERT INTO `fcu_panel_his` VALUES ('23', '0x00000410', 'FCU_onoff_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('23', '0x00000412', 'FCU_fan_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('23', '0x00000418', 'FCU_workingmode_feedback', '2');
INSERT INTO `fcu_panel_his` VALUES ('24', '0x00000240', 'roomtemp_setpoint', '24');
INSERT INTO `fcu_panel_his` VALUES ('24', '0x00000241', 'roomRH_setpoint', '70');
INSERT INTO `fcu_panel_his` VALUES ('24', '0x0000024A', 'room_Q', '-133.4');
INSERT INTO `fcu_panel_his` VALUES ('24', '0x00000410', 'FCU_onoff_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('24', '0x00000412', 'FCU_fan_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('24', '0x00000418', 'FCU_workingmode_feedback', '2');
INSERT INTO `fcu_panel_his` VALUES ('25', '0x00000240', 'roomtemp_setpoint', '24');
INSERT INTO `fcu_panel_his` VALUES ('25', '0x00000241', 'roomRH_setpoint', '70');
INSERT INTO `fcu_panel_his` VALUES ('25', '0x0000024A', 'room_Q', '-170.7');
INSERT INTO `fcu_panel_his` VALUES ('25', '0x00000410', 'FCU_onoff_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('25', '0x00000412', 'FCU_fan_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('25', '0x00000418', 'FCU_workingmode_feedback', '2');
INSERT INTO `fcu_panel_his` VALUES ('26', '0x00000240', 'roomtemp_setpoint', '24');
INSERT INTO `fcu_panel_his` VALUES ('26', '0x00000241', 'roomRH_setpoint', '70');
INSERT INTO `fcu_panel_his` VALUES ('26', '0x0000024A', 'room_Q', '-160.3');
INSERT INTO `fcu_panel_his` VALUES ('26', '0x00000410', 'FCU_onoff_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('26', '0x00000412', 'FCU_fan_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('26', '0x00000418', 'FCU_workingmode_feedback', '2');
INSERT INTO `fcu_panel_his` VALUES ('27', '0x00000240', 'roomtemp_setpoint', '24');
INSERT INTO `fcu_panel_his` VALUES ('27', '0x00000241', 'roomRH_setpoint', '70');
INSERT INTO `fcu_panel_his` VALUES ('27', '0x0000024A', 'room_Q', '-159.6');
INSERT INTO `fcu_panel_his` VALUES ('27', '0x00000410', 'FCU_onoff_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('27', '0x00000412', 'FCU_fan_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('27', '0x00000418', 'FCU_workingmode_feedback', '2');
INSERT INTO `fcu_panel_his` VALUES ('28', '0x00000240', 'roomtemp_setpoint', '24');
INSERT INTO `fcu_panel_his` VALUES ('28', '0x00000241', 'roomRH_setpoint', '70');
INSERT INTO `fcu_panel_his` VALUES ('28', '0x0000024A', 'room_Q', '-103');
INSERT INTO `fcu_panel_his` VALUES ('28', '0x00000410', 'FCU_onoff_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('28', '0x00000412', 'FCU_fan_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('28', '0x00000418', 'FCU_workingmode_feedback', '2');
INSERT INTO `fcu_panel_his` VALUES ('29', '0x00000240', 'roomtemp_setpoint', '24');
INSERT INTO `fcu_panel_his` VALUES ('29', '0x00000241', 'roomRH_setpoint', '70');
INSERT INTO `fcu_panel_his` VALUES ('29', '0x0000024A', 'room_Q', '-151.4');
INSERT INTO `fcu_panel_his` VALUES ('29', '0x00000410', 'FCU_onoff_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('29', '0x00000412', 'FCU_fan_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('29', '0x00000418', 'FCU_workingmode_feedback', '2');
INSERT INTO `fcu_panel_his` VALUES ('30', '0x00000240', 'roomtemp_setpoint', '24');
INSERT INTO `fcu_panel_his` VALUES ('30', '0x00000241', 'roomRH_setpoint', '70');
INSERT INTO `fcu_panel_his` VALUES ('30', '0x0000024A', 'room_Q', '-104.8');
INSERT INTO `fcu_panel_his` VALUES ('30', '0x00000410', 'FCU_onoff_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('30', '0x00000412', 'FCU_fan_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('30', '0x00000418', 'FCU_workingmode_feedback', '2');
INSERT INTO `fcu_panel_his` VALUES ('31', '0x00000240', 'roomtemp_setpoint', '24');
INSERT INTO `fcu_panel_his` VALUES ('31', '0x00000241', 'roomRH_setpoint', '70');
INSERT INTO `fcu_panel_his` VALUES ('31', '0x0000024A', 'room_Q', '-143.5');
INSERT INTO `fcu_panel_his` VALUES ('31', '0x00000410', 'FCU_onoff_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('31', '0x00000412', 'FCU_fan_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('31', '0x00000418', 'FCU_workingmode_feedback', '2');
INSERT INTO `fcu_panel_his` VALUES ('32', '0x00000240', 'roomtemp_setpoint', '24');
INSERT INTO `fcu_panel_his` VALUES ('32', '0x00000241', 'roomRH_setpoint', '70');
INSERT INTO `fcu_panel_his` VALUES ('32', '0x0000024A', 'room_Q', '-171');
INSERT INTO `fcu_panel_his` VALUES ('32', '0x00000410', 'FCU_onoff_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('32', '0x00000412', 'FCU_fan_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('32', '0x00000418', 'FCU_workingmode_feedback', '2');
INSERT INTO `fcu_panel_his` VALUES ('33', '0x00000240', 'roomtemp_setpoint', '24');
INSERT INTO `fcu_panel_his` VALUES ('33', '0x00000241', 'roomRH_setpoint', '70');
INSERT INTO `fcu_panel_his` VALUES ('33', '0x0000024A', 'room_Q', '-132.8');
INSERT INTO `fcu_panel_his` VALUES ('33', '0x00000410', 'FCU_onoff_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('33', '0x00000412', 'FCU_fan_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('33', '0x00000418', 'FCU_workingmode_feedback', '2');
INSERT INTO `fcu_panel_his` VALUES ('34', '0x00000240', 'roomtemp_setpoint', '24');
INSERT INTO `fcu_panel_his` VALUES ('34', '0x00000241', 'roomRH_setpoint', '70');
INSERT INTO `fcu_panel_his` VALUES ('34', '0x0000024A', 'room_Q', '-105.6');
INSERT INTO `fcu_panel_his` VALUES ('34', '0x00000410', 'FCU_onoff_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('34', '0x00000412', 'FCU_fan_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('34', '0x00000418', 'FCU_workingmode_feedback', '2');
INSERT INTO `fcu_panel_his` VALUES ('35', '0x00000240', 'roomtemp_setpoint', '24');
INSERT INTO `fcu_panel_his` VALUES ('35', '0x00000241', 'roomRH_setpoint', '70');
INSERT INTO `fcu_panel_his` VALUES ('35', '0x0000024A', 'room_Q', '-153.3');
INSERT INTO `fcu_panel_his` VALUES ('35', '0x00000410', 'FCU_onoff_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('35', '0x00000412', 'FCU_fan_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('35', '0x00000418', 'FCU_workingmode_feedback', '2');
INSERT INTO `fcu_panel_his` VALUES ('36', '0x00000240', 'roomtemp_setpoint', '24');
INSERT INTO `fcu_panel_his` VALUES ('36', '0x00000241', 'roomRH_setpoint', '70');
INSERT INTO `fcu_panel_his` VALUES ('36', '0x0000024A', 'room_Q', '-161.9');
INSERT INTO `fcu_panel_his` VALUES ('36', '0x00000410', 'FCU_onoff_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('36', '0x00000412', 'FCU_fan_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('36', '0x00000418', 'FCU_workingmode_feedback', '2');
INSERT INTO `fcu_panel_his` VALUES ('37', '0x00000240', 'roomtemp_setpoint', '24');
INSERT INTO `fcu_panel_his` VALUES ('37', '0x00000241', 'roomRH_setpoint', '70');
INSERT INTO `fcu_panel_his` VALUES ('37', '0x0000024A', 'room_Q', '-115');
INSERT INTO `fcu_panel_his` VALUES ('37', '0x00000410', 'FCU_onoff_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('37', '0x00000412', 'FCU_fan_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('37', '0x00000418', 'FCU_workingmode_feedback', '2');
INSERT INTO `fcu_panel_his` VALUES ('38', '0x00000240', 'roomtemp_setpoint', '24');
INSERT INTO `fcu_panel_his` VALUES ('38', '0x00000241', 'roomRH_setpoint', '70');
INSERT INTO `fcu_panel_his` VALUES ('38', '0x0000024A', 'room_Q', '-162.2');
INSERT INTO `fcu_panel_his` VALUES ('38', '0x00000410', 'FCU_onoff_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('38', '0x00000412', 'FCU_fan_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('38', '0x00000418', 'FCU_workingmode_feedback', '2');
INSERT INTO `fcu_panel_his` VALUES ('39', '0x00000240', 'roomtemp_setpoint', '24');
INSERT INTO `fcu_panel_his` VALUES ('39', '0x00000241', 'roomRH_setpoint', '70');
INSERT INTO `fcu_panel_his` VALUES ('39', '0x0000024A', 'room_Q', '-170.5');
INSERT INTO `fcu_panel_his` VALUES ('39', '0x00000410', 'FCU_onoff_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('39', '0x00000412', 'FCU_fan_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('39', '0x00000418', 'FCU_workingmode_feedback', '2');
INSERT INTO `fcu_panel_his` VALUES ('40', '0x00000240', 'roomtemp_setpoint', '24');
INSERT INTO `fcu_panel_his` VALUES ('40', '0x00000241', 'roomRH_setpoint', '70');
INSERT INTO `fcu_panel_his` VALUES ('40', '0x0000024A', 'room_Q', '-169.3');
INSERT INTO `fcu_panel_his` VALUES ('40', '0x00000410', 'FCU_onoff_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('40', '0x00000412', 'FCU_fan_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('40', '0x00000418', 'FCU_workingmode_feedback', '2');
INSERT INTO `fcu_panel_his` VALUES ('41', '0x00000240', 'roomtemp_setpoint', '24');
INSERT INTO `fcu_panel_his` VALUES ('41', '0x00000241', 'roomRH_setpoint', '70');
INSERT INTO `fcu_panel_his` VALUES ('41', '0x0000024A', 'room_Q', '-93.8');
INSERT INTO `fcu_panel_his` VALUES ('41', '0x00000410', 'FCU_onoff_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('41', '0x00000412', 'FCU_fan_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('41', '0x00000418', 'FCU_workingmode_feedback', '2');
INSERT INTO `fcu_panel_his` VALUES ('42', '0x00000240', 'roomtemp_setpoint', '24');
INSERT INTO `fcu_panel_his` VALUES ('42', '0x00000241', 'roomRH_setpoint', '70');
INSERT INTO `fcu_panel_his` VALUES ('42', '0x0000024A', 'room_Q', '-151.9');
INSERT INTO `fcu_panel_his` VALUES ('42', '0x00000410', 'FCU_onoff_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('42', '0x00000412', 'FCU_fan_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('42', '0x00000418', 'FCU_workingmode_feedback', '2');
INSERT INTO `fcu_panel_his` VALUES ('43', '0x00000240', 'roomtemp_setpoint', '24');
INSERT INTO `fcu_panel_his` VALUES ('43', '0x00000241', 'roomRH_setpoint', '70');
INSERT INTO `fcu_panel_his` VALUES ('43', '0x0000024A', 'room_Q', '-105.3');
INSERT INTO `fcu_panel_his` VALUES ('43', '0x00000410', 'FCU_onoff_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('43', '0x00000412', 'FCU_fan_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('43', '0x00000418', 'FCU_workingmode_feedback', '2');
INSERT INTO `fcu_panel_his` VALUES ('44', '0x00000240', 'roomtemp_setpoint', '24');
INSERT INTO `fcu_panel_his` VALUES ('44', '0x00000241', 'roomRH_setpoint', '70');
INSERT INTO `fcu_panel_his` VALUES ('44', '0x0000024A', 'room_Q', '-171.4');
INSERT INTO `fcu_panel_his` VALUES ('44', '0x00000410', 'FCU_onoff_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('44', '0x00000412', 'FCU_fan_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('44', '0x00000418', 'FCU_workingmode_feedback', '2');
INSERT INTO `fcu_panel_his` VALUES ('45', '0x00000240', 'roomtemp_setpoint', '24');
INSERT INTO `fcu_panel_his` VALUES ('45', '0x00000241', 'roomRH_setpoint', '70');
INSERT INTO `fcu_panel_his` VALUES ('45', '0x0000024A', 'room_Q', '-142.5');
INSERT INTO `fcu_panel_his` VALUES ('45', '0x00000410', 'FCU_onoff_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('45', '0x00000412', 'FCU_fan_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('45', '0x00000418', 'FCU_workingmode_feedback', '2');
INSERT INTO `fcu_panel_his` VALUES ('46', '0x00000240', 'roomtemp_setpoint', '24');
INSERT INTO `fcu_panel_his` VALUES ('46', '0x00000241', 'roomRH_setpoint', '70');
INSERT INTO `fcu_panel_his` VALUES ('46', '0x0000024A', 'room_Q', '-142.4');
INSERT INTO `fcu_panel_his` VALUES ('46', '0x00000410', 'FCU_onoff_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('46', '0x00000412', 'FCU_fan_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('46', '0x00000418', 'FCU_workingmode_feedback', '2');
INSERT INTO `fcu_panel_his` VALUES ('47', '0x00000240', 'roomtemp_setpoint', '24');
INSERT INTO `fcu_panel_his` VALUES ('47', '0x00000241', 'roomRH_setpoint', '70');
INSERT INTO `fcu_panel_his` VALUES ('47', '0x0000024A', 'room_Q', '-151.6');
INSERT INTO `fcu_panel_his` VALUES ('47', '0x00000410', 'FCU_onoff_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('47', '0x00000412', 'FCU_fan_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('47', '0x00000418', 'FCU_workingmode_feedback', '2');
INSERT INTO `fcu_panel_his` VALUES ('48', '0x00000240', 'roomtemp_setpoint', '24');
INSERT INTO `fcu_panel_his` VALUES ('48', '0x00000241', 'roomRH_setpoint', '70');
INSERT INTO `fcu_panel_his` VALUES ('48', '0x0000024A', 'room_Q', '-114.3');
INSERT INTO `fcu_panel_his` VALUES ('48', '0x00000410', 'FCU_onoff_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('48', '0x00000412', 'FCU_fan_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('48', '0x00000418', 'FCU_workingmode_feedback', '2');
INSERT INTO `fcu_panel_his` VALUES ('49', '0x00000240', 'roomtemp_setpoint', '24');
INSERT INTO `fcu_panel_his` VALUES ('49', '0x00000241', 'roomRH_setpoint', '70');
INSERT INTO `fcu_panel_his` VALUES ('49', '0x0000024A', 'room_Q', '-161.6');
INSERT INTO `fcu_panel_his` VALUES ('49', '0x00000410', 'FCU_onoff_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('49', '0x00000412', 'FCU_fan_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('49', '0x00000418', 'FCU_workingmode_feedback', '2');
INSERT INTO `fcu_panel_his` VALUES ('50', '0x00000240', 'roomtemp_setpoint', '24');
INSERT INTO `fcu_panel_his` VALUES ('50', '0x00000241', 'roomRH_setpoint', '70');
INSERT INTO `fcu_panel_his` VALUES ('50', '0x0000024A', 'room_Q', '-170');
INSERT INTO `fcu_panel_his` VALUES ('50', '0x00000410', 'FCU_onoff_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('50', '0x00000412', 'FCU_fan_feedback', '1');
INSERT INTO `fcu_panel_his` VALUES ('50', '0x00000418', 'FCU_workingmode_feedback', '2');

-- ----------------------------
-- Table structure for fcu_valve
-- ----------------------------
DROP TABLE IF EXISTS `fcu_valve`;
CREATE TABLE `fcu_valve` (
  `time` int NOT NULL,
  `id` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `name` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`time`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of fcu_valve
-- ----------------------------
INSERT INTO `fcu_valve` VALUES ('50', '0x00000426', 'valve_feedback', '100');

-- ----------------------------
-- Table structure for fcu_valve_control
-- ----------------------------
DROP TABLE IF EXISTS `fcu_valve_control`;
CREATE TABLE `fcu_valve_control` (
  `time` int NOT NULL,
  `id` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `name` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`time`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of fcu_valve_control
-- ----------------------------

-- ----------------------------
-- Table structure for fcu_valve_control_his
-- ----------------------------
DROP TABLE IF EXISTS `fcu_valve_control_his`;
CREATE TABLE `fcu_valve_control_his` (
  `time` int NOT NULL,
  `id` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `name` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`time`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of fcu_valve_control_his
-- ----------------------------

-- ----------------------------
-- Table structure for fcu_valve_his
-- ----------------------------
DROP TABLE IF EXISTS `fcu_valve_his`;
CREATE TABLE `fcu_valve_his` (
  `time` int NOT NULL,
  `id` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `name` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`time`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of fcu_valve_his
-- ----------------------------
INSERT INTO `fcu_valve_his` VALUES ('0', '0x00000426', 'valve_feedback', '100');
INSERT INTO `fcu_valve_his` VALUES ('1', '0x00000426', 'valve_feedback', '100');
INSERT INTO `fcu_valve_his` VALUES ('2', '0x00000426', 'valve_feedback', '100');
INSERT INTO `fcu_valve_his` VALUES ('3', '0x00000426', 'valve_feedback', '100');
INSERT INTO `fcu_valve_his` VALUES ('4', '0x00000426', 'valve_feedback', '100');
INSERT INTO `fcu_valve_his` VALUES ('5', '0x00000426', 'valve_feedback', '100');
INSERT INTO `fcu_valve_his` VALUES ('6', '0x00000426', 'valve_feedback', '100');
INSERT INTO `fcu_valve_his` VALUES ('7', '0x00000426', 'valve_feedback', '100');
INSERT INTO `fcu_valve_his` VALUES ('8', '0x00000426', 'valve_feedback', '100');
INSERT INTO `fcu_valve_his` VALUES ('9', '0x00000426', 'valve_feedback', '100');
INSERT INTO `fcu_valve_his` VALUES ('10', '0x00000426', 'valve_feedback', '100');
INSERT INTO `fcu_valve_his` VALUES ('11', '0x00000426', 'valve_feedback', '100');
INSERT INTO `fcu_valve_his` VALUES ('12', '0x00000426', 'valve_feedback', '100');
INSERT INTO `fcu_valve_his` VALUES ('13', '0x00000426', 'valve_feedback', '100');
INSERT INTO `fcu_valve_his` VALUES ('14', '0x00000426', 'valve_feedback', '100');
INSERT INTO `fcu_valve_his` VALUES ('15', '0x00000426', 'valve_feedback', '100');
INSERT INTO `fcu_valve_his` VALUES ('16', '0x00000426', 'valve_feedback', '100');
INSERT INTO `fcu_valve_his` VALUES ('17', '0x00000426', 'valve_feedback', '100');
INSERT INTO `fcu_valve_his` VALUES ('18', '0x00000426', 'valve_feedback', '100');
INSERT INTO `fcu_valve_his` VALUES ('19', '0x00000426', 'valve_feedback', '100');
INSERT INTO `fcu_valve_his` VALUES ('20', '0x00000426', 'valve_feedback', '100');
INSERT INTO `fcu_valve_his` VALUES ('21', '0x00000426', 'valve_feedback', '100');
INSERT INTO `fcu_valve_his` VALUES ('22', '0x00000426', 'valve_feedback', '100');
INSERT INTO `fcu_valve_his` VALUES ('23', '0x00000426', 'valve_feedback', '100');
INSERT INTO `fcu_valve_his` VALUES ('24', '0x00000426', 'valve_feedback', '100');
INSERT INTO `fcu_valve_his` VALUES ('25', '0x00000426', 'valve_feedback', '100');
INSERT INTO `fcu_valve_his` VALUES ('26', '0x00000426', 'valve_feedback', '100');
INSERT INTO `fcu_valve_his` VALUES ('27', '0x00000426', 'valve_feedback', '100');
INSERT INTO `fcu_valve_his` VALUES ('28', '0x00000426', 'valve_feedback', '100');
INSERT INTO `fcu_valve_his` VALUES ('29', '0x00000426', 'valve_feedback', '100');
INSERT INTO `fcu_valve_his` VALUES ('30', '0x00000426', 'valve_feedback', '100');
INSERT INTO `fcu_valve_his` VALUES ('31', '0x00000426', 'valve_feedback', '100');
INSERT INTO `fcu_valve_his` VALUES ('32', '0x00000426', 'valve_feedback', '100');
INSERT INTO `fcu_valve_his` VALUES ('33', '0x00000426', 'valve_feedback', '100');
INSERT INTO `fcu_valve_his` VALUES ('34', '0x00000426', 'valve_feedback', '100');
INSERT INTO `fcu_valve_his` VALUES ('35', '0x00000426', 'valve_feedback', '100');
INSERT INTO `fcu_valve_his` VALUES ('36', '0x00000426', 'valve_feedback', '100');
INSERT INTO `fcu_valve_his` VALUES ('37', '0x00000426', 'valve_feedback', '100');
INSERT INTO `fcu_valve_his` VALUES ('38', '0x00000426', 'valve_feedback', '100');
INSERT INTO `fcu_valve_his` VALUES ('39', '0x00000426', 'valve_feedback', '100');
INSERT INTO `fcu_valve_his` VALUES ('40', '0x00000426', 'valve_feedback', '100');
INSERT INTO `fcu_valve_his` VALUES ('41', '0x00000426', 'valve_feedback', '100');
INSERT INTO `fcu_valve_his` VALUES ('42', '0x00000426', 'valve_feedback', '100');
INSERT INTO `fcu_valve_his` VALUES ('43', '0x00000426', 'valve_feedback', '100');
INSERT INTO `fcu_valve_his` VALUES ('44', '0x00000426', 'valve_feedback', '100');
INSERT INTO `fcu_valve_his` VALUES ('45', '0x00000426', 'valve_feedback', '100');
INSERT INTO `fcu_valve_his` VALUES ('46', '0x00000426', 'valve_feedback', '100');
INSERT INTO `fcu_valve_his` VALUES ('47', '0x00000426', 'valve_feedback', '100');
INSERT INTO `fcu_valve_his` VALUES ('48', '0x00000426', 'valve_feedback', '100');
INSERT INTO `fcu_valve_his` VALUES ('49', '0x00000426', 'valve_feedback', '100');
INSERT INTO `fcu_valve_his` VALUES ('50', '0x00000426', 'valve_feedback', '100');

-- ----------------------------
-- Table structure for sensor_delta_pressure
-- ----------------------------
DROP TABLE IF EXISTS `sensor_delta_pressure`;
CREATE TABLE `sensor_delta_pressure` (
  `time` int NOT NULL,
  `id` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `name` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`time`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of sensor_delta_pressure
-- ----------------------------

-- ----------------------------
-- Table structure for sensor_delta_pressure_his
-- ----------------------------
DROP TABLE IF EXISTS `sensor_delta_pressure_his`;
CREATE TABLE `sensor_delta_pressure_his` (
  `time` int NOT NULL,
  `id` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `name` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`time`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of sensor_delta_pressure_his
-- ----------------------------

-- ----------------------------
-- Table structure for sensor_fcu_waterflow
-- ----------------------------
DROP TABLE IF EXISTS `sensor_fcu_waterflow`;
CREATE TABLE `sensor_fcu_waterflow` (
  `time` int NOT NULL,
  `id` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `name` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`time`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of sensor_fcu_waterflow
-- ----------------------------
INSERT INTO `sensor_fcu_waterflow` VALUES ('50', '0x00000424', 'waterflow', '0.8');

-- ----------------------------
-- Table structure for sensor_fcu_waterflow_his
-- ----------------------------
DROP TABLE IF EXISTS `sensor_fcu_waterflow_his`;
CREATE TABLE `sensor_fcu_waterflow_his` (
  `time` int NOT NULL,
  `id` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `name` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`time`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of sensor_fcu_waterflow_his
-- ----------------------------
INSERT INTO `sensor_fcu_waterflow_his` VALUES ('0', '0x00000424', 'waterflow', '0');
INSERT INTO `sensor_fcu_waterflow_his` VALUES ('1', '0x00000424', 'waterflow', '1');
INSERT INTO `sensor_fcu_waterflow_his` VALUES ('2', '0x00000424', 'waterflow', '0.8');
INSERT INTO `sensor_fcu_waterflow_his` VALUES ('3', '0x00000424', 'waterflow', '0.8');
INSERT INTO `sensor_fcu_waterflow_his` VALUES ('4', '0x00000424', 'waterflow', '0.8');
INSERT INTO `sensor_fcu_waterflow_his` VALUES ('5', '0x00000424', 'waterflow', '0.8');
INSERT INTO `sensor_fcu_waterflow_his` VALUES ('6', '0x00000424', 'waterflow', '0.8');
INSERT INTO `sensor_fcu_waterflow_his` VALUES ('7', '0x00000424', 'waterflow', '0.8');
INSERT INTO `sensor_fcu_waterflow_his` VALUES ('8', '0x00000424', 'waterflow', '0.8');
INSERT INTO `sensor_fcu_waterflow_his` VALUES ('9', '0x00000424', 'waterflow', '0.8');
INSERT INTO `sensor_fcu_waterflow_his` VALUES ('10', '0x00000424', 'waterflow', '0.8');
INSERT INTO `sensor_fcu_waterflow_his` VALUES ('11', '0x00000424', 'waterflow', '0.8');
INSERT INTO `sensor_fcu_waterflow_his` VALUES ('12', '0x00000424', 'waterflow', '0.8');
INSERT INTO `sensor_fcu_waterflow_his` VALUES ('13', '0x00000424', 'waterflow', '0.8');
INSERT INTO `sensor_fcu_waterflow_his` VALUES ('14', '0x00000424', 'waterflow', '0.8');
INSERT INTO `sensor_fcu_waterflow_his` VALUES ('15', '0x00000424', 'waterflow', '0.8');
INSERT INTO `sensor_fcu_waterflow_his` VALUES ('16', '0x00000424', 'waterflow', '0.8');
INSERT INTO `sensor_fcu_waterflow_his` VALUES ('17', '0x00000424', 'waterflow', '0.8');
INSERT INTO `sensor_fcu_waterflow_his` VALUES ('18', '0x00000424', 'waterflow', '0.8');
INSERT INTO `sensor_fcu_waterflow_his` VALUES ('19', '0x00000424', 'waterflow', '0.8');
INSERT INTO `sensor_fcu_waterflow_his` VALUES ('20', '0x00000424', 'waterflow', '0.8');
INSERT INTO `sensor_fcu_waterflow_his` VALUES ('21', '0x00000424', 'waterflow', '0.8');
INSERT INTO `sensor_fcu_waterflow_his` VALUES ('22', '0x00000424', 'waterflow', '0.8');
INSERT INTO `sensor_fcu_waterflow_his` VALUES ('23', '0x00000424', 'waterflow', '0.8');
INSERT INTO `sensor_fcu_waterflow_his` VALUES ('24', '0x00000424', 'waterflow', '0.8');
INSERT INTO `sensor_fcu_waterflow_his` VALUES ('25', '0x00000424', 'waterflow', '0.8');
INSERT INTO `sensor_fcu_waterflow_his` VALUES ('26', '0x00000424', 'waterflow', '0.8');
INSERT INTO `sensor_fcu_waterflow_his` VALUES ('27', '0x00000424', 'waterflow', '0.8');
INSERT INTO `sensor_fcu_waterflow_his` VALUES ('28', '0x00000424', 'waterflow', '0.8');
INSERT INTO `sensor_fcu_waterflow_his` VALUES ('29', '0x00000424', 'waterflow', '0.8');
INSERT INTO `sensor_fcu_waterflow_his` VALUES ('30', '0x00000424', 'waterflow', '0.8');
INSERT INTO `sensor_fcu_waterflow_his` VALUES ('31', '0x00000424', 'waterflow', '0.8');
INSERT INTO `sensor_fcu_waterflow_his` VALUES ('32', '0x00000424', 'waterflow', '0.8');
INSERT INTO `sensor_fcu_waterflow_his` VALUES ('33', '0x00000424', 'waterflow', '0.8');
INSERT INTO `sensor_fcu_waterflow_his` VALUES ('34', '0x00000424', 'waterflow', '0.8');
INSERT INTO `sensor_fcu_waterflow_his` VALUES ('35', '0x00000424', 'waterflow', '0.8');
INSERT INTO `sensor_fcu_waterflow_his` VALUES ('36', '0x00000424', 'waterflow', '0.8');
INSERT INTO `sensor_fcu_waterflow_his` VALUES ('37', '0x00000424', 'waterflow', '0.8');
INSERT INTO `sensor_fcu_waterflow_his` VALUES ('38', '0x00000424', 'waterflow', '0.8');
INSERT INTO `sensor_fcu_waterflow_his` VALUES ('39', '0x00000424', 'waterflow', '0.8');
INSERT INTO `sensor_fcu_waterflow_his` VALUES ('40', '0x00000424', 'waterflow', '0.8');
INSERT INTO `sensor_fcu_waterflow_his` VALUES ('41', '0x00000424', 'waterflow', '0.8');
INSERT INTO `sensor_fcu_waterflow_his` VALUES ('42', '0x00000424', 'waterflow', '0.8');
INSERT INTO `sensor_fcu_waterflow_his` VALUES ('43', '0x00000424', 'waterflow', '0.8');
INSERT INTO `sensor_fcu_waterflow_his` VALUES ('44', '0x00000424', 'waterflow', '0.8');
INSERT INTO `sensor_fcu_waterflow_his` VALUES ('45', '0x00000424', 'waterflow', '0.8');
INSERT INTO `sensor_fcu_waterflow_his` VALUES ('46', '0x00000424', 'waterflow', '0.8');
INSERT INTO `sensor_fcu_waterflow_his` VALUES ('47', '0x00000424', 'waterflow', '0.8');
INSERT INTO `sensor_fcu_waterflow_his` VALUES ('48', '0x00000424', 'waterflow', '0.8');
INSERT INTO `sensor_fcu_waterflow_his` VALUES ('49', '0x00000424', 'waterflow', '0.8');
INSERT INTO `sensor_fcu_waterflow_his` VALUES ('50', '0x00000424', 'waterflow', '0.8');

-- ----------------------------
-- Table structure for sensor_fcu_watertemp
-- ----------------------------
DROP TABLE IF EXISTS `sensor_fcu_watertemp`;
CREATE TABLE `sensor_fcu_watertemp` (
  `time` int NOT NULL,
  `id` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `name` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`time`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of sensor_fcu_watertemp
-- ----------------------------
INSERT INTO `sensor_fcu_watertemp` VALUES ('50', '0x00000420', 'supply_temp', '60');
INSERT INTO `sensor_fcu_watertemp` VALUES ('50', '0x00000421', 'return_temp', '57.4');

-- ----------------------------
-- Table structure for sensor_fcu_watertemp_his
-- ----------------------------
DROP TABLE IF EXISTS `sensor_fcu_watertemp_his`;
CREATE TABLE `sensor_fcu_watertemp_his` (
  `time` int NOT NULL,
  `id` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `name` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`time`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of sensor_fcu_watertemp_his
-- ----------------------------
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('0', '0x00000420', 'supply_temp', '60');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('0', '0x00000421', 'return_temp', '55');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('1', '0x00000420', 'supply_temp', '60');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('1', '0x00000421', 'return_temp', '57.3');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('2', '0x00000420', 'supply_temp', '60');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('2', '0x00000421', 'return_temp', '56.5');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('3', '0x00000420', 'supply_temp', '60');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('3', '0x00000421', 'return_temp', '56.6');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('4', '0x00000420', 'supply_temp', '60');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('4', '0x00000421', 'return_temp', '56.7');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('5', '0x00000420', 'supply_temp', '60');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('5', '0x00000421', 'return_temp', '56.7');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('6', '0x00000420', 'supply_temp', '60');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('6', '0x00000421', 'return_temp', '56.8');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('7', '0x00000420', 'supply_temp', '60');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('7', '0x00000421', 'return_temp', '56.9');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('8', '0x00000420', 'supply_temp', '60');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('8', '0x00000421', 'return_temp', '56.9');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('9', '0x00000420', 'supply_temp', '60');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('9', '0x00000421', 'return_temp', '57');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('10', '0x00000420', 'supply_temp', '60');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('10', '0x00000421', 'return_temp', '57');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('11', '0x00000420', 'supply_temp', '60');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('11', '0x00000421', 'return_temp', '57.1');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('12', '0x00000420', 'supply_temp', '60');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('12', '0x00000421', 'return_temp', '57.2');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('13', '0x00000420', 'supply_temp', '60');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('13', '0x00000421', 'return_temp', '57.2');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('14', '0x00000420', 'supply_temp', '60');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('14', '0x00000421', 'return_temp', '57.3');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('15', '0x00000420', 'supply_temp', '60');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('15', '0x00000421', 'return_temp', '57.3');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('16', '0x00000420', 'supply_temp', '60');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('16', '0x00000421', 'return_temp', '57.3');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('17', '0x00000420', 'supply_temp', '60');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('17', '0x00000421', 'return_temp', '57.4');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('18', '0x00000420', 'supply_temp', '60');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('18', '0x00000421', 'return_temp', '57.4');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('19', '0x00000420', 'supply_temp', '60');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('19', '0x00000421', 'return_temp', '57.4');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('20', '0x00000420', 'supply_temp', '60');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('20', '0x00000421', 'return_temp', '57.4');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('21', '0x00000420', 'supply_temp', '60');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('21', '0x00000421', 'return_temp', '57.5');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('22', '0x00000420', 'supply_temp', '60');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('22', '0x00000421', 'return_temp', '57.4');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('23', '0x00000420', 'supply_temp', '60');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('23', '0x00000421', 'return_temp', '57.4');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('24', '0x00000420', 'supply_temp', '60');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('24', '0x00000421', 'return_temp', '57.4');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('25', '0x00000420', 'supply_temp', '60');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('25', '0x00000421', 'return_temp', '57.4');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('26', '0x00000420', 'supply_temp', '60');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('26', '0x00000421', 'return_temp', '57.4');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('27', '0x00000420', 'supply_temp', '60');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('27', '0x00000421', 'return_temp', '57.3');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('28', '0x00000420', 'supply_temp', '60');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('28', '0x00000421', 'return_temp', '57.3');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('29', '0x00000420', 'supply_temp', '60');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('29', '0x00000421', 'return_temp', '57.4');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('30', '0x00000420', 'supply_temp', '60');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('30', '0x00000421', 'return_temp', '57.4');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('31', '0x00000420', 'supply_temp', '60');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('31', '0x00000421', 'return_temp', '57.4');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('32', '0x00000420', 'supply_temp', '60');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('32', '0x00000421', 'return_temp', '57.4');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('33', '0x00000420', 'supply_temp', '60');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('33', '0x00000421', 'return_temp', '57.4');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('34', '0x00000420', 'supply_temp', '60');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('34', '0x00000421', 'return_temp', '57.4');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('35', '0x00000420', 'supply_temp', '60');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('35', '0x00000421', 'return_temp', '57.4');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('36', '0x00000420', 'supply_temp', '60');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('36', '0x00000421', 'return_temp', '57.4');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('37', '0x00000420', 'supply_temp', '60');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('37', '0x00000421', 'return_temp', '57.4');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('38', '0x00000420', 'supply_temp', '60');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('38', '0x00000421', 'return_temp', '57.4');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('39', '0x00000420', 'supply_temp', '60');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('39', '0x00000421', 'return_temp', '57.4');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('40', '0x00000420', 'supply_temp', '60');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('40', '0x00000421', 'return_temp', '57.4');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('41', '0x00000420', 'supply_temp', '60');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('41', '0x00000421', 'return_temp', '57.3');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('42', '0x00000420', 'supply_temp', '60');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('42', '0x00000421', 'return_temp', '57.4');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('43', '0x00000420', 'supply_temp', '60');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('43', '0x00000421', 'return_temp', '57.4');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('44', '0x00000420', 'supply_temp', '60');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('44', '0x00000421', 'return_temp', '57.4');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('45', '0x00000420', 'supply_temp', '60');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('45', '0x00000421', 'return_temp', '57.4');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('46', '0x00000420', 'supply_temp', '60');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('46', '0x00000421', 'return_temp', '57.4');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('47', '0x00000420', 'supply_temp', '60');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('47', '0x00000421', 'return_temp', '57.4');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('48', '0x00000420', 'supply_temp', '60');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('48', '0x00000421', 'return_temp', '57.4');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('49', '0x00000420', 'supply_temp', '60');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('49', '0x00000421', 'return_temp', '57.4');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('50', '0x00000420', 'supply_temp', '60');
INSERT INTO `sensor_fcu_watertemp_his` VALUES ('50', '0x00000421', 'return_temp', '57.4');

-- ----------------------------
-- Table structure for sensor_occupant
-- ----------------------------
DROP TABLE IF EXISTS `sensor_occupant`;
CREATE TABLE `sensor_occupant` (
  `time` int NOT NULL,
  `id` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `name` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `value` int DEFAULT NULL,
  PRIMARY KEY (`time`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of sensor_occupant
-- ----------------------------
INSERT INTO `sensor_occupant` VALUES ('50', '0x00000810', 'occupant_num', '0');
INSERT INTO `sensor_occupant` VALUES ('50', '0x00000818', 'occupant_transform', '-1');

-- ----------------------------
-- Table structure for sensor_occupant_his
-- ----------------------------
DROP TABLE IF EXISTS `sensor_occupant_his`;
CREATE TABLE `sensor_occupant_his` (
  `time` int NOT NULL,
  `id` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `name` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `value` int DEFAULT NULL,
  PRIMARY KEY (`time`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of sensor_occupant_his
-- ----------------------------
INSERT INTO `sensor_occupant_his` VALUES ('0', '0x00000810', 'occupant_num', '0');
INSERT INTO `sensor_occupant_his` VALUES ('0', '0x00000818', 'occupant_transform', '0');
INSERT INTO `sensor_occupant_his` VALUES ('1', '0x00000810', 'occupant_num', '0');
INSERT INTO `sensor_occupant_his` VALUES ('1', '0x00000818', 'occupant_transform', '0');
INSERT INTO `sensor_occupant_his` VALUES ('2', '0x00000810', 'occupant_num', '8');
INSERT INTO `sensor_occupant_his` VALUES ('2', '0x00000818', 'occupant_transform', '8');
INSERT INTO `sensor_occupant_his` VALUES ('3', '0x00000810', 'occupant_num', '0');
INSERT INTO `sensor_occupant_his` VALUES ('3', '0x00000818', 'occupant_transform', '-8');
INSERT INTO `sensor_occupant_his` VALUES ('4', '0x00000810', 'occupant_num', '2');
INSERT INTO `sensor_occupant_his` VALUES ('4', '0x00000818', 'occupant_transform', '2');
INSERT INTO `sensor_occupant_his` VALUES ('5', '0x00000810', 'occupant_num', '4');
INSERT INTO `sensor_occupant_his` VALUES ('5', '0x00000818', 'occupant_transform', '2');
INSERT INTO `sensor_occupant_his` VALUES ('6', '0x00000810', 'occupant_num', '7');
INSERT INTO `sensor_occupant_his` VALUES ('6', '0x00000818', 'occupant_transform', '3');
INSERT INTO `sensor_occupant_his` VALUES ('7', '0x00000810', 'occupant_num', '0');
INSERT INTO `sensor_occupant_his` VALUES ('7', '0x00000818', 'occupant_transform', '-7');
INSERT INTO `sensor_occupant_his` VALUES ('8', '0x00000810', 'occupant_num', '8');
INSERT INTO `sensor_occupant_his` VALUES ('8', '0x00000818', 'occupant_transform', '8');
INSERT INTO `sensor_occupant_his` VALUES ('9', '0x00000810', 'occupant_num', '2');
INSERT INTO `sensor_occupant_his` VALUES ('9', '0x00000818', 'occupant_transform', '-6');
INSERT INTO `sensor_occupant_his` VALUES ('10', '0x00000810', 'occupant_num', '8');
INSERT INTO `sensor_occupant_his` VALUES ('10', '0x00000818', 'occupant_transform', '6');
INSERT INTO `sensor_occupant_his` VALUES ('11', '0x00000810', 'occupant_num', '8');
INSERT INTO `sensor_occupant_his` VALUES ('11', '0x00000818', 'occupant_transform', '0');
INSERT INTO `sensor_occupant_his` VALUES ('12', '0x00000810', 'occupant_num', '5');
INSERT INTO `sensor_occupant_his` VALUES ('12', '0x00000818', 'occupant_transform', '-3');
INSERT INTO `sensor_occupant_his` VALUES ('13', '0x00000810', 'occupant_num', '8');
INSERT INTO `sensor_occupant_his` VALUES ('13', '0x00000818', 'occupant_transform', '3');
INSERT INTO `sensor_occupant_his` VALUES ('14', '0x00000810', 'occupant_num', '7');
INSERT INTO `sensor_occupant_his` VALUES ('14', '0x00000818', 'occupant_transform', '-1');
INSERT INTO `sensor_occupant_his` VALUES ('15', '0x00000810', 'occupant_num', '0');
INSERT INTO `sensor_occupant_his` VALUES ('15', '0x00000818', 'occupant_transform', '-7');
INSERT INTO `sensor_occupant_his` VALUES ('16', '0x00000810', 'occupant_num', '7');
INSERT INTO `sensor_occupant_his` VALUES ('16', '0x00000818', 'occupant_transform', '7');
INSERT INTO `sensor_occupant_his` VALUES ('17', '0x00000810', 'occupant_num', '4');
INSERT INTO `sensor_occupant_his` VALUES ('17', '0x00000818', 'occupant_transform', '-3');
INSERT INTO `sensor_occupant_his` VALUES ('18', '0x00000810', 'occupant_num', '8');
INSERT INTO `sensor_occupant_his` VALUES ('18', '0x00000818', 'occupant_transform', '4');
INSERT INTO `sensor_occupant_his` VALUES ('19', '0x00000810', 'occupant_num', '2');
INSERT INTO `sensor_occupant_his` VALUES ('19', '0x00000818', 'occupant_transform', '-6');
INSERT INTO `sensor_occupant_his` VALUES ('20', '0x00000810', 'occupant_num', '8');
INSERT INTO `sensor_occupant_his` VALUES ('20', '0x00000818', 'occupant_transform', '6');
INSERT INTO `sensor_occupant_his` VALUES ('21', '0x00000810', 'occupant_num', '0');
INSERT INTO `sensor_occupant_his` VALUES ('21', '0x00000818', 'occupant_transform', '-8');
INSERT INTO `sensor_occupant_his` VALUES ('22', '0x00000810', 'occupant_num', '3');
INSERT INTO `sensor_occupant_his` VALUES ('22', '0x00000818', 'occupant_transform', '3');
INSERT INTO `sensor_occupant_his` VALUES ('23', '0x00000810', 'occupant_num', '0');
INSERT INTO `sensor_occupant_his` VALUES ('23', '0x00000818', 'occupant_transform', '-3');
INSERT INTO `sensor_occupant_his` VALUES ('24', '0x00000810', 'occupant_num', '4');
INSERT INTO `sensor_occupant_his` VALUES ('24', '0x00000818', 'occupant_transform', '4');
INSERT INTO `sensor_occupant_his` VALUES ('25', '0x00000810', 'occupant_num', '0');
INSERT INTO `sensor_occupant_his` VALUES ('25', '0x00000818', 'occupant_transform', '-4');
INSERT INTO `sensor_occupant_his` VALUES ('26', '0x00000810', 'occupant_num', '1');
INSERT INTO `sensor_occupant_his` VALUES ('26', '0x00000818', 'occupant_transform', '1');
INSERT INTO `sensor_occupant_his` VALUES ('27', '0x00000810', 'occupant_num', '1');
INSERT INTO `sensor_occupant_his` VALUES ('27', '0x00000818', 'occupant_transform', '0');
INSERT INTO `sensor_occupant_his` VALUES ('28', '0x00000810', 'occupant_num', '7');
INSERT INTO `sensor_occupant_his` VALUES ('28', '0x00000818', 'occupant_transform', '6');
INSERT INTO `sensor_occupant_his` VALUES ('29', '0x00000810', 'occupant_num', '2');
INSERT INTO `sensor_occupant_his` VALUES ('29', '0x00000818', 'occupant_transform', '-5');
INSERT INTO `sensor_occupant_his` VALUES ('30', '0x00000810', 'occupant_num', '7');
INSERT INTO `sensor_occupant_his` VALUES ('30', '0x00000818', 'occupant_transform', '5');
INSERT INTO `sensor_occupant_his` VALUES ('31', '0x00000810', 'occupant_num', '3');
INSERT INTO `sensor_occupant_his` VALUES ('31', '0x00000818', 'occupant_transform', '-4');
INSERT INTO `sensor_occupant_his` VALUES ('32', '0x00000810', 'occupant_num', '0');
INSERT INTO `sensor_occupant_his` VALUES ('32', '0x00000818', 'occupant_transform', '-3');
INSERT INTO `sensor_occupant_his` VALUES ('33', '0x00000810', 'occupant_num', '4');
INSERT INTO `sensor_occupant_his` VALUES ('33', '0x00000818', 'occupant_transform', '4');
INSERT INTO `sensor_occupant_his` VALUES ('34', '0x00000810', 'occupant_num', '7');
INSERT INTO `sensor_occupant_his` VALUES ('34', '0x00000818', 'occupant_transform', '3');
INSERT INTO `sensor_occupant_his` VALUES ('35', '0x00000810', 'occupant_num', '2');
INSERT INTO `sensor_occupant_his` VALUES ('35', '0x00000818', 'occupant_transform', '-5');
INSERT INTO `sensor_occupant_his` VALUES ('36', '0x00000810', 'occupant_num', '1');
INSERT INTO `sensor_occupant_his` VALUES ('36', '0x00000818', 'occupant_transform', '-1');
INSERT INTO `sensor_occupant_his` VALUES ('37', '0x00000810', 'occupant_num', '6');
INSERT INTO `sensor_occupant_his` VALUES ('37', '0x00000818', 'occupant_transform', '5');
INSERT INTO `sensor_occupant_his` VALUES ('38', '0x00000810', 'occupant_num', '1');
INSERT INTO `sensor_occupant_his` VALUES ('38', '0x00000818', 'occupant_transform', '-5');
INSERT INTO `sensor_occupant_his` VALUES ('39', '0x00000810', 'occupant_num', '0');
INSERT INTO `sensor_occupant_his` VALUES ('39', '0x00000818', 'occupant_transform', '-1');
INSERT INTO `sensor_occupant_his` VALUES ('40', '0x00000810', 'occupant_num', '0');
INSERT INTO `sensor_occupant_his` VALUES ('40', '0x00000818', 'occupant_transform', '0');
INSERT INTO `sensor_occupant_his` VALUES ('41', '0x00000810', 'occupant_num', '8');
INSERT INTO `sensor_occupant_his` VALUES ('41', '0x00000818', 'occupant_transform', '8');
INSERT INTO `sensor_occupant_his` VALUES ('42', '0x00000810', 'occupant_num', '2');
INSERT INTO `sensor_occupant_his` VALUES ('42', '0x00000818', 'occupant_transform', '-6');
INSERT INTO `sensor_occupant_his` VALUES ('43', '0x00000810', 'occupant_num', '7');
INSERT INTO `sensor_occupant_his` VALUES ('43', '0x00000818', 'occupant_transform', '5');
INSERT INTO `sensor_occupant_his` VALUES ('44', '0x00000810', 'occupant_num', '0');
INSERT INTO `sensor_occupant_his` VALUES ('44', '0x00000818', 'occupant_transform', '-7');
INSERT INTO `sensor_occupant_his` VALUES ('45', '0x00000810', 'occupant_num', '3');
INSERT INTO `sensor_occupant_his` VALUES ('45', '0x00000818', 'occupant_transform', '3');
INSERT INTO `sensor_occupant_his` VALUES ('46', '0x00000810', 'occupant_num', '3');
INSERT INTO `sensor_occupant_his` VALUES ('46', '0x00000818', 'occupant_transform', '0');
INSERT INTO `sensor_occupant_his` VALUES ('47', '0x00000810', 'occupant_num', '2');
INSERT INTO `sensor_occupant_his` VALUES ('47', '0x00000818', 'occupant_transform', '-1');
INSERT INTO `sensor_occupant_his` VALUES ('48', '0x00000810', 'occupant_num', '6');
INSERT INTO `sensor_occupant_his` VALUES ('48', '0x00000818', 'occupant_transform', '4');
INSERT INTO `sensor_occupant_his` VALUES ('49', '0x00000810', 'occupant_num', '1');
INSERT INTO `sensor_occupant_his` VALUES ('49', '0x00000818', 'occupant_transform', '-5');
INSERT INTO `sensor_occupant_his` VALUES ('50', '0x00000810', 'occupant_num', '0');
INSERT INTO `sensor_occupant_his` VALUES ('50', '0x00000818', 'occupant_transform', '-1');

-- ----------------------------
-- Table structure for sensor_room
-- ----------------------------
DROP TABLE IF EXISTS `sensor_room`;
CREATE TABLE `sensor_room` (
  `time` int NOT NULL,
  `id` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `name` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`time`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of sensor_room
-- ----------------------------
INSERT INTO `sensor_room` VALUES ('50', '0x00000220', 'room_temp', '23.2');
INSERT INTO `sensor_room` VALUES ('50', '0x00000221', 'room_RH', '40');

-- ----------------------------
-- Table structure for sensor_room_his
-- ----------------------------
DROP TABLE IF EXISTS `sensor_room_his`;
CREATE TABLE `sensor_room_his` (
  `time` int NOT NULL,
  `id` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `name` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`time`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of sensor_room_his
-- ----------------------------
INSERT INTO `sensor_room_his` VALUES ('0', '0x00000220', 'room_temp', '18');
INSERT INTO `sensor_room_his` VALUES ('0', '0x00000221', 'room_RH', '40');
INSERT INTO `sensor_room_his` VALUES ('1', '0x00000220', 'room_temp', '18.3');
INSERT INTO `sensor_room_his` VALUES ('1', '0x00000221', 'room_RH', '40');
INSERT INTO `sensor_room_his` VALUES ('2', '0x00000220', 'room_temp', '19.1');
INSERT INTO `sensor_room_his` VALUES ('2', '0x00000221', 'room_RH', '40');
INSERT INTO `sensor_room_his` VALUES ('3', '0x00000220', 'room_temp', '19.4');
INSERT INTO `sensor_room_his` VALUES ('3', '0x00000221', 'room_RH', '40');
INSERT INTO `sensor_room_his` VALUES ('4', '0x00000220', 'room_temp', '19.7');
INSERT INTO `sensor_room_his` VALUES ('4', '0x00000221', 'room_RH', '40');
INSERT INTO `sensor_room_his` VALUES ('5', '0x00000220', 'room_temp', '20.1');
INSERT INTO `sensor_room_his` VALUES ('5', '0x00000221', 'room_RH', '40');
INSERT INTO `sensor_room_his` VALUES ('6', '0x00000220', 'room_temp', '20.7');
INSERT INTO `sensor_room_his` VALUES ('6', '0x00000221', 'room_RH', '40');
INSERT INTO `sensor_room_his` VALUES ('7', '0x00000220', 'room_temp', '20.8');
INSERT INTO `sensor_room_his` VALUES ('7', '0x00000221', 'room_RH', '40');
INSERT INTO `sensor_room_his` VALUES ('8', '0x00000220', 'room_temp', '21.3');
INSERT INTO `sensor_room_his` VALUES ('8', '0x00000221', 'room_RH', '40');
INSERT INTO `sensor_room_his` VALUES ('9', '0x00000220', 'room_temp', '21.4');
INSERT INTO `sensor_room_his` VALUES ('9', '0x00000221', 'room_RH', '40');
INSERT INTO `sensor_room_his` VALUES ('10', '0x00000220', 'room_temp', '21.9');
INSERT INTO `sensor_room_his` VALUES ('10', '0x00000221', 'room_RH', '40');
INSERT INTO `sensor_room_his` VALUES ('11', '0x00000220', 'room_temp', '22.3');
INSERT INTO `sensor_room_his` VALUES ('11', '0x00000221', 'room_RH', '40');
INSERT INTO `sensor_room_his` VALUES ('12', '0x00000220', 'room_temp', '22.5');
INSERT INTO `sensor_room_his` VALUES ('12', '0x00000221', 'room_RH', '40');
INSERT INTO `sensor_room_his` VALUES ('13', '0x00000220', 'room_temp', '22.8');
INSERT INTO `sensor_room_his` VALUES ('13', '0x00000221', 'room_RH', '40');
INSERT INTO `sensor_room_his` VALUES ('14', '0x00000220', 'room_temp', '23.1');
INSERT INTO `sensor_room_his` VALUES ('14', '0x00000221', 'room_RH', '40');
INSERT INTO `sensor_room_his` VALUES ('15', '0x00000220', 'room_temp', '23');
INSERT INTO `sensor_room_his` VALUES ('15', '0x00000221', 'room_RH', '40');
INSERT INTO `sensor_room_his` VALUES ('16', '0x00000220', 'room_temp', '23.2');
INSERT INTO `sensor_room_his` VALUES ('16', '0x00000221', 'room_RH', '40');
INSERT INTO `sensor_room_his` VALUES ('17', '0x00000220', 'room_temp', '23.3');
INSERT INTO `sensor_room_his` VALUES ('17', '0x00000221', 'room_RH', '40');
INSERT INTO `sensor_room_his` VALUES ('18', '0x00000220', 'room_temp', '23.5');
INSERT INTO `sensor_room_his` VALUES ('18', '0x00000221', 'room_RH', '40');
INSERT INTO `sensor_room_his` VALUES ('19', '0x00000220', 'room_temp', '23.5');
INSERT INTO `sensor_room_his` VALUES ('19', '0x00000221', 'room_RH', '40');
INSERT INTO `sensor_room_his` VALUES ('20', '0x00000220', 'room_temp', '23.7');
INSERT INTO `sensor_room_his` VALUES ('20', '0x00000221', 'room_RH', '40');
INSERT INTO `sensor_room_his` VALUES ('21', '0x00000220', 'room_temp', '23.5');
INSERT INTO `sensor_room_his` VALUES ('21', '0x00000221', 'room_RH', '40');
INSERT INTO `sensor_room_his` VALUES ('22', '0x00000220', 'room_temp', '23.5');
INSERT INTO `sensor_room_his` VALUES ('22', '0x00000221', 'room_RH', '40');
INSERT INTO `sensor_room_his` VALUES ('23', '0x00000220', 'room_temp', '23.3');
INSERT INTO `sensor_room_his` VALUES ('23', '0x00000221', 'room_RH', '40');
INSERT INTO `sensor_room_his` VALUES ('24', '0x00000220', 'room_temp', '23.4');
INSERT INTO `sensor_room_his` VALUES ('24', '0x00000221', 'room_RH', '40');
INSERT INTO `sensor_room_his` VALUES ('25', '0x00000220', 'room_temp', '23.2');
INSERT INTO `sensor_room_his` VALUES ('25', '0x00000221', 'room_RH', '40');
INSERT INTO `sensor_room_his` VALUES ('26', '0x00000220', 'room_temp', '23.1');
INSERT INTO `sensor_room_his` VALUES ('26', '0x00000221', 'room_RH', '40');
INSERT INTO `sensor_room_his` VALUES ('27', '0x00000220', 'room_temp', '23');
INSERT INTO `sensor_room_his` VALUES ('27', '0x00000221', 'room_RH', '40');
INSERT INTO `sensor_room_his` VALUES ('28', '0x00000220', 'room_temp', '23.3');
INSERT INTO `sensor_room_his` VALUES ('28', '0x00000221', 'room_RH', '40');
INSERT INTO `sensor_room_his` VALUES ('29', '0x00000220', 'room_temp', '23.2');
INSERT INTO `sensor_room_his` VALUES ('29', '0x00000221', 'room_RH', '40');
INSERT INTO `sensor_room_his` VALUES ('30', '0x00000220', 'room_temp', '23.4');
INSERT INTO `sensor_room_his` VALUES ('30', '0x00000221', 'room_RH', '40');
INSERT INTO `sensor_room_his` VALUES ('31', '0x00000220', 'room_temp', '23.4');
INSERT INTO `sensor_room_his` VALUES ('31', '0x00000221', 'room_RH', '40');
INSERT INTO `sensor_room_his` VALUES ('32', '0x00000220', 'room_temp', '23.2');
INSERT INTO `sensor_room_his` VALUES ('32', '0x00000221', 'room_RH', '40');
INSERT INTO `sensor_room_his` VALUES ('33', '0x00000220', 'room_temp', '23.3');
INSERT INTO `sensor_room_his` VALUES ('33', '0x00000221', 'room_RH', '40');
INSERT INTO `sensor_room_his` VALUES ('34', '0x00000220', 'room_temp', '23.5');
INSERT INTO `sensor_room_his` VALUES ('34', '0x00000221', 'room_RH', '40');
INSERT INTO `sensor_room_his` VALUES ('35', '0x00000220', 'room_temp', '23.4');
INSERT INTO `sensor_room_his` VALUES ('35', '0x00000221', 'room_RH', '40');
INSERT INTO `sensor_room_his` VALUES ('36', '0x00000220', 'room_temp', '23.3');
INSERT INTO `sensor_room_his` VALUES ('36', '0x00000221', 'room_RH', '40');
INSERT INTO `sensor_room_his` VALUES ('37', '0x00000220', 'room_temp', '23.5');
INSERT INTO `sensor_room_his` VALUES ('37', '0x00000221', 'room_RH', '40');
INSERT INTO `sensor_room_his` VALUES ('38', '0x00000220', 'room_temp', '23.4');
INSERT INTO `sensor_room_his` VALUES ('38', '0x00000221', 'room_RH', '40');
INSERT INTO `sensor_room_his` VALUES ('39', '0x00000220', 'room_temp', '23.2');
INSERT INTO `sensor_room_his` VALUES ('39', '0x00000221', 'room_RH', '40');
INSERT INTO `sensor_room_his` VALUES ('40', '0x00000220', 'room_temp', '23.1');
INSERT INTO `sensor_room_his` VALUES ('40', '0x00000221', 'room_RH', '40');
INSERT INTO `sensor_room_his` VALUES ('41', '0x00000220', 'room_temp', '23.3');
INSERT INTO `sensor_room_his` VALUES ('41', '0x00000221', 'room_RH', '40');
INSERT INTO `sensor_room_his` VALUES ('42', '0x00000220', 'room_temp', '23.3');
INSERT INTO `sensor_room_his` VALUES ('42', '0x00000221', 'room_RH', '40');
INSERT INTO `sensor_room_his` VALUES ('43', '0x00000220', 'room_temp', '23.5');
INSERT INTO `sensor_room_his` VALUES ('43', '0x00000221', 'room_RH', '40');
INSERT INTO `sensor_room_his` VALUES ('44', '0x00000220', 'room_temp', '23.3');
INSERT INTO `sensor_room_his` VALUES ('44', '0x00000221', 'room_RH', '40');
INSERT INTO `sensor_room_his` VALUES ('45', '0x00000220', 'room_temp', '23.3');
INSERT INTO `sensor_room_his` VALUES ('45', '0x00000221', 'room_RH', '40');
INSERT INTO `sensor_room_his` VALUES ('46', '0x00000220', 'room_temp', '23.3');
INSERT INTO `sensor_room_his` VALUES ('46', '0x00000221', 'room_RH', '40');
INSERT INTO `sensor_room_his` VALUES ('47', '0x00000220', 'room_temp', '23.3');
INSERT INTO `sensor_room_his` VALUES ('47', '0x00000221', 'room_RH', '40');
INSERT INTO `sensor_room_his` VALUES ('48', '0x00000220', 'room_temp', '23.4');
INSERT INTO `sensor_room_his` VALUES ('48', '0x00000221', 'room_RH', '40');
INSERT INTO `sensor_room_his` VALUES ('49', '0x00000220', 'room_temp', '23.3');
INSERT INTO `sensor_room_his` VALUES ('49', '0x00000221', 'room_RH', '40');
INSERT INTO `sensor_room_his` VALUES ('50', '0x00000220', 'room_temp', '23.2');
INSERT INTO `sensor_room_his` VALUES ('50', '0x00000221', 'room_RH', '40');
