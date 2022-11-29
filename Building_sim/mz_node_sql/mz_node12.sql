/*
Navicat MySQL Data Transfer

Source Server         : Mysql8.0
Source Server Version : 80021
Source Host           : localhost:3306
Source Database       : mz_node12

Target Server Type    : MYSQL
Target Server Version : 80021
File Encoding         : 65001

Date: 2020-12-11 15:06:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `controldata`
-- ----------------------------
DROP TABLE IF EXISTS `controldata`;
CREATE TABLE `controldata` (
  `node_id` varchar(100) NOT NULL,
  `table_name` varchar(100) NOT NULL,
  `var_id` varchar(100) NOT NULL,
  `var_name` varchar(100) NOT NULL,
  `var_value` varchar(100) NOT NULL,
  PRIMARY KEY (`var_id`,`node_id`,`table_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of controldata
-- ----------------------------

-- ----------------------------
-- Table structure for `database_to_node`
-- ----------------------------
DROP TABLE IF EXISTS `database_to_node`;
CREATE TABLE `database_to_node` (
  `id` int NOT NULL AUTO_INCREMENT,
  `database_name` varchar(100) DEFAULT NULL,
  `node_id` varchar(100) DEFAULT NULL,
  `node_type` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of database_to_node
-- ----------------------------
INSERT INTO `database_to_node` VALUES ('1', 'node_1', 'device-1', '1');
INSERT INTO `database_to_node` VALUES ('2', 'node_2', 'device-2', '1');
INSERT INTO `database_to_node` VALUES ('3', 'node_3', 'device-3', '1');
INSERT INTO `database_to_node` VALUES ('4', 'node_4', 'device-4', '1');
INSERT INTO `database_to_node` VALUES ('5', 'node_5', 'device-5', '1');
INSERT INTO `database_to_node` VALUES ('6', 'node_6', '1-1', '0');
INSERT INTO `database_to_node` VALUES ('7', 'node_7', '1-2', '0');
INSERT INTO `database_to_node` VALUES ('8', 'node_8', '1-3', '0');
INSERT INTO `database_to_node` VALUES ('9', 'node_9', '2-1', '0');
INSERT INTO `database_to_node` VALUES ('10', 'node_10', '2-2', '0');
INSERT INTO `database_to_node` VALUES ('11', 'node_11', '2-3', '0');
INSERT INTO `database_to_node` VALUES ('12', 'node_12', '3-1', '0');
INSERT INTO `database_to_node` VALUES ('13', 'node_13', '3-2', '0');
INSERT INTO `database_to_node` VALUES ('14', 'node_14', '3-3', '0');

-- ----------------------------
-- Table structure for `ip_list`
-- ----------------------------
DROP TABLE IF EXISTS `ip_list`;
CREATE TABLE `ip_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `node_id` varchar(100) DEFAULT NULL,
  `ip` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ip_list
-- ----------------------------
INSERT INTO `ip_list` VALUES ('1', 'room1', 'localhost');
INSERT INTO `ip_list` VALUES ('2', 'room2', 'localhost');
INSERT INTO `ip_list` VALUES ('3', 'room3', 'localhost');
INSERT INTO `ip_list` VALUES ('4', 'room4', 'localhost');
INSERT INTO `ip_list` VALUES ('5', 'room5', 'localhost');
INSERT INTO `ip_list` VALUES ('6', 'room6', 'localhost');
INSERT INTO `ip_list` VALUES ('7', 'room7', 'localhost');
INSERT INTO `ip_list` VALUES ('8', 'room8', 'localhost');
INSERT INTO `ip_list` VALUES ('9', 'pump1', 'localhost');
INSERT INTO `ip_list` VALUES ('10', 'pump2', 'localhost');
INSERT INTO `ip_list` VALUES ('11', 'heatpump', 'localhost');
INSERT INTO `ip_list` VALUES ('12', 'communication', 'localhost');

-- ----------------------------
-- Table structure for `parameters`
-- ----------------------------
DROP TABLE IF EXISTS `parameters`;
CREATE TABLE `parameters` (
  `data_name` varchar(100) NOT NULL,
  `value` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`data_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of parameters
-- ----------------------------
INSERT INTO `parameters` VALUES ('com_node_id', 'device-1');
INSERT INTO `parameters` VALUES ('totalCost', '0');
INSERT INTO `parameters` VALUES ('totalPeopleNum', '0');
