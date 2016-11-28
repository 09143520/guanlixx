/*
Navicat MySQL Data Transfer

Source Server         : connection
Source Server Version : 50537
Source Host           : localhost:3306
Source Database       : zhiyuan

Target Server Type    : MYSQL
Target Server Version : 50537
File Encoding         : 65001

Date: 2016-11-28 14:21:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `application`
-- ----------------------------
DROP TABLE IF EXISTS `application`;
CREATE TABLE `application` (
  `arecordid` int(8) NOT NULL AUTO_INCREMENT,
  `userid` int(8) NOT NULL,
  `taskid` int(8) NOT NULL,
  `atime` datetime NOT NULL,
  `aresult` char(8) NOT NULL,
  PRIMARY KEY (`arecordid`),
  KEY `taskid` (`taskid`),
  KEY `userid` (`userid`),
  CONSTRAINT `application_ibfk_1` FOREIGN KEY (`taskid`) REFERENCES `task` (`taskid`) ON UPDATE CASCADE,
  CONSTRAINT `application_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of application
-- ----------------------------
INSERT INTO `application` VALUES ('1', '5', '1', '2016-11-06 18:29:02', '已通过');
INSERT INTO `application` VALUES ('2', '5', '2', '2016-11-07 18:29:37', '未通过');
INSERT INTO `application` VALUES ('3', '6', '1', '2016-11-06 18:29:59', '未通过');
INSERT INTO `application` VALUES ('4', '6', '2', '2016-11-07 18:30:21', '已通过');

-- ----------------------------
-- Table structure for `log`
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `logid` int(8) NOT NULL AUTO_INCREMENT,
  `arecordid` int(8) NOT NULL,
  `lcontent` text NOT NULL,
  `lpicture` varchar(255) DEFAULT NULL,
  `ltime` datetime NOT NULL,
  `lresult` char(8) NOT NULL,
  PRIMARY KEY (`logid`),
  KEY `arecordid` (`arecordid`),
  CONSTRAINT `log_ibfk_1` FOREIGN KEY (`arecordid`) REFERENCES `application` (`arecordid`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES ('1', '1', '12345684674', null, '2016-11-27 18:31:08', '合格');
INSERT INTO `log` VALUES ('2', '4', '12346545313', null, '2016-11-27 18:31:50', '不合格');

-- ----------------------------
-- Table structure for `news`
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `newsid` int(8) NOT NULL AUTO_INCREMENT,
  `userid` int(8) NOT NULL,
  `ntopic` text NOT NULL,
  `ncontent` text NOT NULL,
  `ntime` datetime NOT NULL,
  PRIMARY KEY (`newsid`),
  KEY `userid` (`userid`),
  CONSTRAINT `news_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('1', '2', '爱心送暖', '1568789675431', '2016-11-22 18:26:42');
INSERT INTO `news` VALUES ('2', '2', '6533134546', '6543441341', '2016-11-20 18:27:21');

-- ----------------------------
-- Table structure for `task`
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task` (
  `taskid` int(8) NOT NULL AUTO_INCREMENT,
  `taskname` text NOT NULL,
  `ttypeid` int(8) NOT NULL,
  `userid` int(8) NOT NULL,
  `tcontent` text NOT NULL,
  `requirement` text NOT NULL,
  `time` datetime NOT NULL,
  `place` text NOT NULL,
  `number` int(8) NOT NULL,
  `duration` decimal(10,0) NOT NULL,
  `publishtime` datetime NOT NULL,
  PRIMARY KEY (`taskid`),
  KEY `ttypeid` (`ttypeid`),
  KEY `userid` (`userid`),
  KEY `taskid` (`taskid`),
  CONSTRAINT `task_ibfk_1` FOREIGN KEY (`ttypeid`) REFERENCES `tasktype` (`ttypeid`) ON UPDATE CASCADE,
  CONSTRAINT `task_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of task
-- ----------------------------
INSERT INTO `task` VALUES ('1', '发传单', '1', '3', '发传单', '认真', '2016-11-15 18:21:46', '青春广场', '5', '1', '2016-11-01 18:22:19');
INSERT INTO `task` VALUES ('2', '设计海报', '2', '4', '设计海报', '会ps', '2016-11-16 18:23:49', '任何地点', '4', '2', '2016-11-01 18:24:14');

-- ----------------------------
-- Table structure for `tasktype`
-- ----------------------------
DROP TABLE IF EXISTS `tasktype`;
CREATE TABLE `tasktype` (
  `ttypeid` int(11) NOT NULL AUTO_INCREMENT,
  `ttypename` text NOT NULL,
  `maxduration` decimal(10,0) NOT NULL,
  PRIMARY KEY (`ttypeid`),
  KEY `ttypeid` (`ttypeid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tasktype
-- ----------------------------
INSERT INTO `tasktype` VALUES ('1', '宣传类', '2');
INSERT INTO `tasktype` VALUES ('2', '服务类', '3');
INSERT INTO `tasktype` VALUES ('3', '创作类', '2');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userid` int(8) NOT NULL AUTO_INCREMENT,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `email` text NOT NULL,
  `phonenumber` char(20) NOT NULL,
  `utypeid` int(8) NOT NULL,
  PRIMARY KEY (`userid`),
  KEY `utypeid` (`utypeid`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`utypeid`) REFERENCES `usertype` (`utypeid`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '校团委', '123456', '123@123.com', '1234567', '1');
INSERT INTO `user` VALUES ('2', 'admin', 'admin', '123@123.com', '1234567', '2');
INSERT INTO `user` VALUES ('3', '校青协', '123456', '123@123.com', '1234567', '3');
INSERT INTO `user` VALUES ('4', '诵读协会', '123456', '123@123.com', '123467', '3');
INSERT INTO `user` VALUES ('5', '张三', '123456', '123@123.com', '1234567', '4');
INSERT INTO `user` VALUES ('6', '李四', '123456', '123@123.com', '1234567', '4');

-- ----------------------------
-- Table structure for `usertype`
-- ----------------------------
DROP TABLE IF EXISTS `usertype`;
CREATE TABLE `usertype` (
  `utypeid` int(8) NOT NULL AUTO_INCREMENT,
  `utypename` char(8) NOT NULL,
  `illustration` text,
  PRIMARY KEY (`utypeid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of usertype
-- ----------------------------
INSERT INTO `usertype` VALUES ('1', '团委', null);
INSERT INTO `usertype` VALUES ('2', '管理员', null);
INSERT INTO `usertype` VALUES ('3', '社团组织', null);
INSERT INTO `usertype` VALUES ('4', '学生', null);
