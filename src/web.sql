DROP DATABASE IF EXISTS `web`;
CREATE DATABASE web DEFAULT CHARACTER SET utf8;

USE web;

DROP TABLE IF EXISTS `flag`;
CREATE TABLE `flag` (
  `fffffflllag__2333333` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `flag` VALUES ('flag_here');

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '',
  `username` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
