/*
  `poolid` int(10) unsigned NOT NULL,
  `name` varchar(24) DEFAULT NULL,
  `packet_name` varchar(24) DEFAULT NULL,
  `familyid` smallint(4) unsigned NOT NULL DEFAULT '0',
  `modelid` binary(20) NOT NULL,
  `mJob` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sJob` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `cmbSkill` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `cmbDelay` smallint(3) unsigned NOT NULL DEFAULT '240',
  `cmbDmgMult` smallint(4) unsigned NOT NULL DEFAULT '100',
  `behavior` smallint(5) unsigned NOT NULL DEFAULT '0',
  `aggro` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `true_detection` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `links` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `mobType` smallint(5) unsigned NOT NULL DEFAULT '0',
  `immunity` int(10) NOT NULL DEFAULT '0',
  `name_prefix` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `flag` int(11) unsigned NOT NULL DEFAULT '0',
  `entityFlags` int(11) unsigned NOT NULL DEFAULT '0',
  `animationsub` tinyint(1) NOT NULL DEFAULT '0',
  `hasSpellScript` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `spellList` smallint(4) NOT NULL DEFAULT '0',
  `namevis` tinyint(4) NOT NULL DEFAULT '1',
  `roamflag` smallint(3) unsigned NOT NULL DEFAULT '0',
  `skill_list_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `resist_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `modelSize` tinyint(1) unsigned DEFAULT NULL,
  `modelHitboxSize` tinyint(1) unsigned DEFAULT NULL,
*/

LOCK TABLES `mob_pools` WRITE;

INSERT INTO `mob_pools` VALUES (23001,'warrior','Warrior',149,0x01000D0200000000000000000000000000000000,1,2,1,240,100,0,0,0,0,0,0,32,0,3,0,0,0,0,0,23006,149,NULL,NULL);
INSERT INTO `mob_pools` VALUES (23002,'monk','Monk',146,0x01000F0800000000000000000000000000000000,2,1,1,480,80,0,0,0,0,0,0,32,0,3,0,0,0,0,0,23001,149,NULL,NULL);
INSERT INTO `mob_pools` VALUES (23003,'whitemage','WhiteMage',146,0x01000C0700000000000000000000000000000000,3,4,1,240,100,0,0,0,0,0,0,32,0,3,0,0,2003,0,0,23011,149,NULL,NULL);
INSERT INTO `mob_pools` VALUES (23004,'blackmage','BlackMage',146,0x0100040400000000000000000000000000000000,4,3,1,240,100,0,0,0,0,0,0,32,0,3,0,0,2004,0,0,23011,149,NULL,NULL);
INSERT INTO `mob_pools` VALUES (23005,'redmage','RedMage',146,0x0100090300000000000000000000000000000000,5,4,1,240,100,0,0,0,0,0,0,32,0,3,0,0,2005,0,0,23003,149,NULL,NULL);
INSERT INTO `mob_pools` VALUES (23006,'thief','Thief',146,0x0100020000000000000000000000000000000000,6,1,1,240,100,0,0,0,0,0,0,32,0,3,0,0,0,0,0,23002,149,NULL,NULL);
INSERT INTO `mob_pools` VALUES (23007,'paladin','Paladin',145,0x01000E0300000000000000000000000000000000,7,1,3,240,100,0,0,0,0,0,0,32,0,3,0,0,2007,0,0,23003,149,NULL,NULL);
INSERT INTO `mob_pools` VALUES (23008,'dark_knight','DarkKnight',149,0x0100080100000000000000000000000000000000,8,1,7,480,175,0,0,0,0,0,0,32,0,3,0,0,2008,0,0,23007,149,NULL,NULL);
/* beastmaster */
INSERT INTO `mob_pools` VALUES (23010,'bard','Bard',149,0x0100070100000000000000000000000000000000,10,3,7,480,175,0,0,0,0,0,0,32,0,3,0,0,2010,0,0,23002,149,NULL,NULL);
INSERT INTO `mob_pools` VALUES (23011,'ranger','Ranger',149,0x0100070100000000000000000000000000000000,11,1,7,480,175,0,0,0,0,0,0,32,0,3,0,0,0,0,0,23013,149,NULL,NULL);
INSERT INTO `mob_pools` VALUES (23012,'samurai','Samurai',149,0x0100070100000000000000000000000000000000,12,1,7,480,175,0,0,0,0,0,0,32,0,3,0,0,0,0,0,23010,149,NULL,NULL);
/* ninja */
INSERT INTO `mob_pools` VALUES (23014,'dragoon','Dragoon',149,0x0100070100000000000000000000000000000000,14,1,7,480,175,0,0,0,0,0,0,32,0,3,0,0,0,0,0,23008,149,NULL,NULL);
/* summoner */
/* blue mage */
/* corsair */
/* puppetmaster */
/* dancer */
INSERT INTO `mob_pools` VALUES (23020,'scholar','Scholar',149,0x0100010200000000000000000000000000000000,20,4,11,240,100,0,0,0,0,0,0,32,0,3,0,0,2020,0,0,23011,149,NULL,NULL);
/* geomancer */
/* rune fencer */

UNLOCK TABLES;