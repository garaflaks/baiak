-- MySQL dump 10.14  Distrib 5.5.63-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: Global
-- ------------------------------------------------------
-- Server version	5.5.63-MariaDB-1ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account_bans`
--

DROP TABLE IF EXISTS `account_bans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_bans` (
  `account_id` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `banned_at` bigint(20) NOT NULL,
  `expires_at` bigint(20) NOT NULL,
  `banned_by` int(11) NOT NULL,
  PRIMARY KEY (`account_id`),
  KEY `banned_by` (`banned_by`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_bans`
--

LOCK TABLES `account_bans` WRITE;
/*!40000 ALTER TABLE `account_bans` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_bans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_viplist`
--

DROP TABLE IF EXISTS `account_viplist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_viplist` (
  `account_id` int(11) NOT NULL,
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `player_id` int(11) NOT NULL,
  UNIQUE KEY `account_id_2` (`account_id`,`player_id`),
  KEY `account_id` (`account_id`),
  KEY `player_id` (`player_id`),
  KEY `world_id` (`world_id`),
  CONSTRAINT `account_viplist_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `account_viplist_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_viplist`
--

LOCK TABLES `account_viplist` WRITE;
/*!40000 ALTER TABLE `account_viplist` DISABLE KEYS */;
INSERT INTO `account_viplist` VALUES (53,0,65),(53,0,67),(54,0,57),(54,0,59),(54,0,67);
/*!40000 ALTER TABLE `account_viplist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `premium_points` int(11) NOT NULL DEFAULT '0',
  `backup_points` int(11) NOT NULL DEFAULT '0',
  `event_points` int(11) NOT NULL DEFAULT '0',
  `guild_points_stats` int(11) NOT NULL DEFAULT '0',
  `password` varchar(255) NOT NULL,
  `salt` varchar(40) NOT NULL DEFAULT '',
  `premdays` int(11) NOT NULL DEFAULT '0',
  `lastday` int(10) unsigned NOT NULL DEFAULT '0',
  `key` varchar(20) NOT NULL DEFAULT '0',
  `blocked` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'internal usage',
  `warnings` int(11) NOT NULL DEFAULT '0',
  `group_id` int(11) NOT NULL DEFAULT '1',
  `vip_time` int(15) NOT NULL DEFAULT '0',
  `email_new` varchar(255) NOT NULL,
  `email_new_time` int(15) NOT NULL,
  `email_code` varchar(255) NOT NULL DEFAULT '0',
  `next_email` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL,
  `page_lastday` int(11) NOT NULL,
  `page_access` int(11) NOT NULL DEFAULT '0',
  `rlname` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `flag` varchar(255) NOT NULL,
  `last_post` int(11) NOT NULL DEFAULT '0',
  `create_date` int(11) NOT NULL DEFAULT '0',
  `create_ip` int(11) NOT NULL DEFAULT '0',
  `vote` int(11) NOT NULL,
  `guild_points` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (1,'1','',0,0,0,0,'356a192b7913b04c54574d18c28d46e6395428ab','',65535,0,'',0,0,1,0,'',0,'0',0,0,1299890479,3,'','','unknown',0,0,0,0,0),(2,'10','CAST@Wakeserv.com',0,0,0,0,'Android','',0,0,'WAKE3804255',0,0,1,0,'',0,'',0,0,0,0,'','','be',0,1513689023,2147483647,0,0),(3,'SAMPLES','SAMPLES@wakeserv.com',0,0,0,0,'94d26475271fe658cfd6046ee1f5e56cb462defd','',0,0,'',0,0,1,0,'',0,'',0,0,0,0,'','','br',0,1513691566,2147483647,0,0),(5,'81545467','claudiim.silva@gmail.com',0,0,0,0,'4c5f2714f94d3c0b17545e2761a7315a0b9eda4b','',0,0,'',0,0,1,0,'',0,'',0,0,0,9,'','','unknown',0,1556638294,2147483647,0,0),(31,'12murilo12','murilo.egito26@gmail.com',40,40,0,0,'43dbff23c5d99458259ff9ef612515f1bd84d553','',0,0,'6FN3XMRU9F',0,0,1,0,'',0,'',0,0,0,0,'','','unknown',0,1557076543,2147483647,0,0),(32,'hidro166','bradokMET@gmail.com',0,0,0,0,'3bc7dec587f5e574e5b6b5b6b566b03896ae67a7','',0,0,'',0,0,1,0,'',0,'',0,0,0,0,'','','mx',0,1557076574,2147483647,0,0),(33,'ratatuile','oasex@gmail.com',9999999,9999999,0,0,'e7e65bac0b683455484e7900c967583c8e14dbac','',0,0,'',0,0,1,0,'',0,'',0,0,0,0,'','','us',0,1557091781,2147483647,0,0),(34,'5064978','murilohenriquealmeida59@gmail.com',0,0,0,0,'0ebc09b1aa4c75557b18afa6ec4ee9c7855649ec','',0,0,'',0,0,1,0,'',0,'',0,0,0,0,'','','br',0,1557107376,2147483647,0,0),(35,'test123','ewoewje@gmail.com',0,0,0,0,'7288edd0fc3ffcbe93a0cf06e3568e28521687bc','',0,0,'',0,0,1,0,'',0,'',0,0,0,0,'','','pa',0,1557121253,2147483647,0,0),(36,'darkdaimonz','',0,0,0,0,'e9e0147a9e164266219c1c6589bbfb74dc6ca9b9','',0,0,'0',0,0,1,0,'',0,'0',0,0,0,0,'','','',0,0,0,0,0),(37,'ruan','',0,0,0,0,'4fd0653c4f2aef3b19a3c145bbdc5f4740715a09','',0,0,'0',0,0,1,0,'',0,'0',0,0,0,0,'','','',0,0,0,0,0),(38,'wa61025','ewae@hotmail.com',0,0,0,0,'b6eac3900d740e4ae04c343b2e077e6288d34156','',0,0,'',0,0,1,0,'',0,'',0,0,0,0,'','','mx',0,1557167148,2147483647,0,0),(39,'coca','',0,0,0,0,'3a76b84a2959179e3f27f82447f5492e15535783','',0,0,'0',0,0,1,0,'',0,'0',0,0,0,0,'','','',0,0,0,0,0),(40,'fredoo','netfred-1993@hotmail.com',0,0,0,0,'a527f45c4d359ddc0a14b8fd7ba6d4b9e5a271c5','',0,0,'',0,0,1,0,'',0,'',0,0,0,0,'','','pt',0,1557169508,1503335061,0,0),(41,'8780223','',0,0,0,0,'32fe635fb8a8eabdda91b266c011df509bafd973','',2,0,'0',0,0,1,0,'',0,'0',0,0,0,0,'','','',0,0,0,0,0),(42,'talles','',0,0,0,0,'f23d94b2a735b6193d3882ae31308d2e41e8282b','',0,0,'0',0,0,1,0,'',0,'0',0,0,0,0,'','','',0,0,0,0,0),(43,'syber','',0,0,0,0,'dc5ce39b8a55a1e6d18974f26d38ed8b02814608','',0,0,'0',0,0,1,0,'',0,'0',0,0,0,0,'','','',0,0,0,0,0),(44,'300404','',0,0,0,0,'69f71b73c8fcd067d86db57cb70c17ca8bf63edb','',0,0,'0',0,0,1,0,'',0,'0',0,0,0,0,'','','',0,0,0,0,0),(45,'comsenha','',0,0,0,0,'a412ddae3009cad4baf976de13e6e66bb2f284ba','',0,0,'0',0,0,1,0,'',0,'0',0,0,0,0,'','','',0,0,0,0,0),(46,'carlos','',0,0,0,0,'53a88aee73866043517e8b8fa0e6a178d2f317c3','',0,0,'0',0,0,1,0,'',0,'0',0,0,0,0,'','','',0,0,0,0,0),(47,'lordparrudo','',0,0,0,0,'49aca7973d7f26ca0e496e3b87846276375a6ce5','',0,0,'0',0,0,1,0,'',0,'0',0,0,0,0,'','','',0,0,0,0,0),(48,'costinhaa','',0,0,0,0,'2314b2e3a4a1f7db165be2aafbf1efd78f28cc97','',0,0,'0',0,0,1,0,'',0,'0',0,0,0,0,'','','',0,0,0,0,0),(49,'janaina','',0,0,0,0,'6440ac7bd4b75024b5db81338fc76f7c90dd11fe','',0,0,'0',0,0,1,0,'',0,'0',0,0,0,0,'','','',0,0,0,0,0),(50,'loha','',0,0,0,0,'011bfa3e3a49259293e198c81d3ce93d9debf70e','',0,0,'0',0,0,1,0,'',0,'0',0,0,0,0,'','','',0,0,0,0,0),(51,'Palanco','',0,0,0,0,'011bfa3e3a49259293e198c81d3ce93d9debf70e','',0,0,'0',0,0,1,0,'',0,'0',0,0,0,0,'','','',0,0,0,0,0),(52,'lohaa','',0,0,0,0,'011bfa3e3a49259293e198c81d3ce93d9debf70e','',0,0,'0',0,0,1,0,'',0,'0',0,0,0,0,'','','',0,0,0,0,0),(53,'rogerioo','',0,0,0,0,'3f23722d7c3235dab69b64327aa6acc354ddcba6','',0,0,'0',0,0,1,0,'',0,'0',0,0,0,0,'','','',0,0,0,0,0),(54,'rogeriooo','',0,0,0,0,'3f23722d7c3235dab69b64327aa6acc354ddcba6','',0,0,'0',0,0,1,0,'',0,'0',0,0,0,0,'','','',0,0,0,0,0),(55,'inhaaa','',0,0,0,0,'2a9974ae5d64179d984a5f8d799fd6cb9adbf04e','',0,0,'0',0,0,1,0,'',0,'0',0,0,0,0,'','','',0,0,0,0,0),(56,'4406840','lipesales@hotmail.com',0,0,0,0,'adc561467c857edb3035f29f1021b0c8bdc9a93e','',0,0,'',0,0,1,0,'',0,'',0,0,0,0,'','','br',0,1557195194,2147483647,0,0),(57,'Blasall','',0,0,0,0,'17ad67fe0351af86bdf95ae0edd9664b71a77c30','',0,0,'0',0,0,1,0,'',0,'0',0,0,0,0,'','','',0,0,0,0,0),(58,'qwerty','',0,0,0,0,'22837024f941f67c2ff80c49e6bccf110c062149','',0,0,'0',0,0,1,0,'',0,'0',0,0,0,0,'','','',0,0,0,0,0),(59,'88473097','lol.2019@gmail.com',0,0,0,0,'c9bbc4a28c1df75b4ed31863f61423a5e20f3df1','',0,0,'',0,0,1,0,'',0,'',0,0,0,0,'','','br',0,1557200271,2147483647,0,0),(60,'6339238','lol_2019@gmail.com',0,0,0,0,'c9bbc4a28c1df75b4ed31863f61423a5e20f3df1','',0,0,'',0,0,1,0,'',0,'',0,0,0,0,'','','br',0,1557200312,2147483647,0,0),(61,'taynham','',0,0,0,0,'55b0bbcf62946dedea1cae393fd040d85e5cca59','',0,0,'0',0,0,1,0,'',0,'0',0,0,0,0,'','','',0,0,0,0,0);
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ondelete_accounts` BEFORE DELETE ON `accounts`
 FOR EACH ROW BEGIN
        DELETE FROM `bans` WHERE `type` IN (3, 4) AND `value` = OLD.`id`;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `auction_system`
--

DROP TABLE IF EXISTS `auction_system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auction_system` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `item_name` varchar(255) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `cost` int(11) DEFAULT NULL,
  `date` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auction_system`
--

LOCK TABLES `auction_system` WRITE;
/*!40000 ALTER TABLE `auction_system` DISABLE KEYS */;
/*!40000 ALTER TABLE `auction_system` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bans`
--

DROP TABLE IF EXISTS `bans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL COMMENT '1 - ip banishment, 2 - namelock, 3 - account banishment, 4 - notation, 5 - deletion',
  `value` int(10) unsigned NOT NULL COMMENT 'ip address (integer), player guid or account number',
  `param` int(10) unsigned NOT NULL DEFAULT '4294967295' COMMENT 'used only for ip banishment mask (integer)',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `expires` int(11) NOT NULL,
  `added` int(10) unsigned NOT NULL,
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `reason` int(10) unsigned NOT NULL DEFAULT '0',
  `action` int(10) unsigned NOT NULL DEFAULT '0',
  `statement` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `type` (`type`,`value`),
  KEY `active` (`active`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bans`
--

LOCK TABLES `bans` WRITE;
/*!40000 ALTER TABLE `bans` DISABLE KEYS */;
/*!40000 ALTER TABLE `bans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `castle_dono`
--

DROP TABLE IF EXISTS `castle_dono`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `castle_dono` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guild_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `guild_id` (`guild_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `castle_dono`
--

LOCK TABLES `castle_dono` WRITE;
/*!40000 ALTER TABLE `castle_dono` DISABLE KEYS */;
/*!40000 ALTER TABLE `castle_dono` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `castle_war`
--

DROP TABLE IF EXISTS `castle_war`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `castle_war` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guild_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `guild_id` (`guild_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `castle_war`
--

LOCK TABLES `castle_war` WRITE;
/*!40000 ALTER TABLE `castle_war` DISABLE KEYS */;
/*!40000 ALTER TABLE `castle_war` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtt_players`
--

DROP TABLE IF EXISTS `dtt_players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dtt_players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) NOT NULL,
  `team` int(5) NOT NULL,
  `ip` bigint(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtt_players`
--

LOCK TABLES `dtt_players` WRITE;
/*!40000 ALTER TABLE `dtt_players` DISABLE KEYS */;
/*!40000 ALTER TABLE `dtt_players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtt_results`
--

DROP TABLE IF EXISTS `dtt_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dtt_results` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `frags_blue` int(11) NOT NULL,
  `frags_red` int(11) NOT NULL,
  `towers_blue` int(11) NOT NULL,
  `towers_red` int(11) NOT NULL,
  `data` varchar(255) NOT NULL,
  `hora` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtt_results`
--

LOCK TABLES `dtt_results` WRITE;
/*!40000 ALTER TABLE `dtt_results` DISABLE KEYS */;
/*!40000 ALTER TABLE `dtt_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `environment_killers`
--

DROP TABLE IF EXISTS `environment_killers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `environment_killers` (
  `kill_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  KEY `kill_id` (`kill_id`),
  CONSTRAINT `environment_killers_ibfk_1` FOREIGN KEY (`kill_id`) REFERENCES `killers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `environment_killers`
--

LOCK TABLES `environment_killers` WRITE;
/*!40000 ALTER TABLE `environment_killers` DISABLE KEYS */;
INSERT INTO `environment_killers` VALUES (5394,'a brimstone bug'),(5395,'a hydra'),(5396,'a brimstone bug'),(5397,'a hunter'),(5398,'a carrion worm'),(5399,'a ghoul'),(5400,'a minotaur'),(5401,'a rotworm'),(5402,'a fury'),(5403,'a crystalping'),(5404,'a Jester Clown'),(5405,'Ferumbras'),(5406,'a Protect Statue'),(5407,'a hunter'),(5408,'a juggernaut'),(5409,'a gold demon'),(5410,'Orshabaal'),(5411,'a ghoul'),(5412,'a carrion worm'),(5413,'a rotworm'),(5414,'a Demon'),(5415,'Ferumbras'),(5416,'a juggernaut'),(5417,'a hand of cursed fate'),(5418,'a dark torturer'),(5419,'Ghazbaran'),(5420,'a diabolic imp'),(5421,'a Demon'),(5422,'a behemoth'),(5423,'a fire elemental'),(5424,'a champion fury'),(5425,'Orshabaal'),(5426,'Ferumbras'),(5427,'a Demon'),(5428,'Morgaroth'),(5429,'Orshabaal'),(5430,'a gold demon'),(5431,'a magician mage'),(5432,'a magicthrower'),(5433,'a ghoul'),(5434,'a carrion worm'),(5435,'a minotaur'),(5436,'a hydra'),(5437,'a Demon'),(5438,'a brimstone bug'),(5439,'a hydra'),(5440,'the king of demons'),(5441,'a champion undead dragon'),(5442,'Ferumbras'),(5443,'a abobora demoniaca'),(5444,'a draken elite'),(5445,'a dedo gordo'),(5446,'a hydra'),(5447,'a magicthrower'),(5448,'a Lord Warlock'),(5449,'a lizard chosen'),(5450,'a dark torturer'),(5451,'a warlock'),(5452,'a stone golem'),(5453,'a hydra'),(5454,'a lizard chosen'),(5456,'a hydra'),(5457,'a brimstone bug'),(5458,'a hydra'),(5459,'a hellhound'),(5460,'a hellhound'),(5461,'a fire elemental'),(5462,'a fire elemental'),(5463,'a Demon'),(5464,'a fire elemental'),(5465,'a Demon'),(5466,'Morgaroth'),(5467,'a champion tower'),(5468,'Ferumbras'),(5469,'a hellhound'),(5470,'a fire elemental'),(5471,'a champion hellfire fighter'),(5472,'master fire demodras'),(5473,'a fire elemental'),(5474,'a fuck demon skeleton'),(5475,'a fire elemental'),(5476,'a fire elemental'),(5477,'Ferumbras'),(5478,'a Jester Clown'),(5479,'a crystalping'),(5480,'a Protect Statue'),(5481,'Orshabaal'),(5482,'a grim reaper'),(5483,'Orshabaal'),(5484,'a juggernaut'),(5485,'a gold demon'),(5486,'a grim reaper'),(5487,'a grim reaper'),(5488,'a grim reaper'),(5489,'a grim reaper'),(5490,'a grim reaper'),(5491,'a grim reaper'),(5492,'a frost dragon'),(5493,'master fire demodras'),(5494,'Ferumbras'),(5495,'a deathslicer'),(5496,'Ghazbaran'),(5497,'a medusa'),(5498,'a Lord Warlock'),(5499,'a Queen Shaman'),(5500,'a lost soul'),(5501,'a lost soul'),(5502,'a Queen Shaman'),(5503,'a Lord Warlock'),(5504,'Orshabaal'),(5505,'a medusa'),(5506,'a gold demon'),(5507,'a Demon'),(5508,'a fire elemental'),(5509,'a fire elemental'),(5510,'a gold demon'),(5511,'Orshabaal'),(5512,'the king of demons'),(5513,'a Pirate Jubiont'),(5514,'a dragao negro'),(5515,'a Hunter Chasseur'),(5516,'a hydra'),(5517,'a hero'),(5518,'a fire elemental'),(5519,'a hydra'),(5520,'a Demon'),(5521,'a fire elemental'),(5522,'a fire elemental'),(5523,'a fire elemental'),(5524,'a fire elemental'),(5525,'a phantasm'),(5526,'a juggernaut'),(5527,'a blightwalker'),(5528,'a hellfire fighter'),(5529,'a phantasm'),(5530,'a phantasm'),(5531,'a brimstone bug'),(5532,'a frost dragon'),(5533,'a Demon'),(5534,'a fire elemental'),(5535,'a fire elemental'),(5536,'a fire elemental'),(5537,'a Demon'),(5538,'a fire elemental'),(5539,'a Demon'),(5540,'a banshee'),(5541,'a fire elemental'),(5542,'a fire elemental'),(5543,'a fire elemental'),(5544,'a fire elemental'),(5545,'a hydra'),(5546,'a brimstone bug'),(5547,'a frost dragon'),(5548,'a frost dragon'),(5549,'Ferumbras'),(5550,'a banshee'),(5551,'a champion fury'),(5552,'a dedo gordo'),(5553,'Ferumbras'),(5554,'a undead dragon'),(5555,'a hellfire fighter'),(5556,'a dark torturer'),(5557,'a juggernaut'),(5558,'a Demon'),(5559,'a Demon'),(5560,'a champion tower'),(5561,'a Ice Ghaz'),(5562,'Ferumbras'),(5563,'a Ice Aracna'),(5564,'a Ice Evil'),(5565,'a spectre'),(5566,'a hand of cursed fate'),(5567,'a Demon'),(5568,'a Ice Evil'),(5569,'a champion tower'),(5570,'a Demon'),(5571,'a Ice Ghaz'),(5572,'a Ice Aracna'),(5573,'Ferumbras'),(5574,'a Demon'),(5575,'a spectre'),(5576,'a Demon'),(5577,'a hand of cursed fate'),(5578,'a Demon'),(5579,'a fire elemental'),(5580,'a fire elemental'),(5581,'a fire elemental'),(5582,'a Demon'),(5583,'a fire elemental'),(5584,'a frost dragon'),(5585,'a Demon'),(5586,'a fire elemental'),(5587,'a fire elemental'),(5588,'a fire elemental'),(5589,'a hydra'),(5590,'a Demon'),(5591,'a fire elemental'),(5592,'a fire elemental'),(5593,'a hydra'),(5594,'a Demon'),(5595,'a fire elemental'),(5596,'a fire elemental'),(5597,'a fire elemental'),(5598,'a fire elemental'),(5599,'a Demon'),(5600,'a fire elemental'),(5601,'a fury'),(5602,'a Demon'),(5603,'a fire elemental'),(5604,'a fire elemental'),(5605,'a Demon'),(5606,'a fire elemental'),(5607,'a fire elemental'),(5608,'a Demon'),(5609,'a fire elemental'),(5610,'a champion hellfire fighter'),(5611,'Ferumbras'),(5612,'a hellhound'),(5613,'Ferumbras'),(5614,'a fire elemental'),(5615,'a Demon'),(5616,'a champion hellhound'),(5617,'Morgaroth'),(5618,'Ferumbras'),(5619,'Ferumbras'),(5620,'a champion hellhound'),(5621,'Morgaroth'),(5622,'a hellhound'),(5623,'Ferumbras'),(5624,'a champion hellhound'),(5625,'a champion hellfire fighter'),(5626,'a Lord Warlock'),(5627,'a lost soul'),(5628,'a Queen Shaman'),(5629,'a lizard chosen'),(5630,'a Demon'),(5631,'a hellhound');
/*!40000 ALTER TABLE `environment_killers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `global_storage`
--

DROP TABLE IF EXISTS `global_storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `global_storage` (
  `key` varchar(32) NOT NULL DEFAULT '0',
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '0',
  UNIQUE KEY `key` (`key`,`world_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_storage`
--

LOCK TABLES `global_storage` WRITE;
/*!40000 ALTER TABLE `global_storage` DISABLE KEYS */;
/*!40000 ALTER TABLE `global_storage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guild_invites`
--

DROP TABLE IF EXISTS `guild_invites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guild_invites` (
  `player_id` int(11) NOT NULL DEFAULT '0',
  `guild_id` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `player_id` (`player_id`,`guild_id`),
  KEY `guild_id` (`guild_id`),
  CONSTRAINT `guild_invites_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE,
  CONSTRAINT `guild_invites_ibfk_2` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guild_invites`
--

LOCK TABLES `guild_invites` WRITE;
/*!40000 ALTER TABLE `guild_invites` DISABLE KEYS */;
/*!40000 ALTER TABLE `guild_invites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guild_kills`
--

DROP TABLE IF EXISTS `guild_kills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guild_kills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guild_id` int(11) NOT NULL,
  `war_id` int(11) NOT NULL,
  `death_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `guild_kills_ibfk_1` (`war_id`),
  KEY `guild_kills_ibfk_2` (`death_id`),
  KEY `guild_kills_ibfk_3` (`guild_id`),
  CONSTRAINT `guild_kills_ibfk_1` FOREIGN KEY (`war_id`) REFERENCES `guild_wars` (`id`) ON DELETE CASCADE,
  CONSTRAINT `guild_kills_ibfk_2` FOREIGN KEY (`death_id`) REFERENCES `player_deaths` (`id`) ON DELETE CASCADE,
  CONSTRAINT `guild_kills_ibfk_3` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guild_kills`
--

LOCK TABLES `guild_kills` WRITE;
/*!40000 ALTER TABLE `guild_kills` DISABLE KEYS */;
/*!40000 ALTER TABLE `guild_kills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guild_ranks`
--

DROP TABLE IF EXISTS `guild_ranks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guild_ranks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guild_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `level` int(11) NOT NULL COMMENT '1 - leader, 2 - vice leader, 3 - member',
  PRIMARY KEY (`id`),
  KEY `guild_id` (`guild_id`),
  CONSTRAINT `guild_ranks_ibfk_1` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guild_ranks`
--

LOCK TABLES `guild_ranks` WRITE;
/*!40000 ALTER TABLE `guild_ranks` DISABLE KEYS */;
INSERT INTO `guild_ranks` VALUES (110,36,'Leader',3),(111,36,'Vice-Leader',2),(112,36,'Member',1);
/*!40000 ALTER TABLE `guild_ranks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guild_wars`
--

DROP TABLE IF EXISTS `guild_wars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guild_wars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guild_id` int(11) NOT NULL,
  `enemy_id` int(11) NOT NULL,
  `begin` bigint(20) NOT NULL DEFAULT '0',
  `end` bigint(20) NOT NULL DEFAULT '0',
  `frags` int(10) unsigned NOT NULL DEFAULT '0',
  `payment` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guild_kills` int(10) unsigned NOT NULL DEFAULT '0',
  `enemy_kills` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `guild_id` (`guild_id`),
  KEY `enemy_id` (`enemy_id`),
  CONSTRAINT `guild_wars_ibfk_1` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE,
  CONSTRAINT `guild_wars_ibfk_2` FOREIGN KEY (`enemy_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guild_wars`
--

LOCK TABLES `guild_wars` WRITE;
/*!40000 ALTER TABLE `guild_wars` DISABLE KEYS */;
/*!40000 ALTER TABLE `guild_wars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guilds`
--

DROP TABLE IF EXISTS `guilds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guilds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `ownerid` int(11) NOT NULL,
  `creationdata` int(11) NOT NULL,
  `checkdata` int(11) NOT NULL,
  `motd` varchar(255) NOT NULL,
  `balance` bigint(20) unsigned NOT NULL,
  `description` text NOT NULL,
  `logo_gfx_name` varchar(255) NOT NULL,
  `last_execute_points` int(11) NOT NULL DEFAULT '0',
  `guild_logo` mediumblob,
  `create_ip` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`world_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guilds`
--

LOCK TABLES `guilds` WRITE;
/*!40000 ALTER TABLE `guilds` DISABLE KEYS */;
INSERT INTO `guilds` VALUES (36,0,'Teste',9,1557160699,0,'',0,'New guild. Leader must edit this text :)','',0,'1557160699;data:image/gif;base64,R0lGODlhQABAAPcAAAAAAAgAABAAABgAABgIACEIACkIADEIADkIADkQAEIQAEoQAFIQAFoQAFoYAGMYAGNjUmsYAGtKAGtjUmtjWmtrWnMYAHNSAHNrWnNrY3sYAHshAHtSAHtaAHtzY3tza4QhAIRaAIRaCIRjCIR7a4R7c4whAIxjCIyEc4yEe5QhAJRrCJSMe5wpAJxrCJxzCJyMe5yMhJyUhKUpAKVzCKV7CKWUhKWcjK0pAK17CK2cjLUpALV7CLWECLWllLWtlL0xAL2ECL2MCL21nMYxAMaMCMaUCMa1pc4xAM6UCM69rdYxANY5ANaUCNacCN45AO/exvfnzv///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////yH5BAEAAFEALAAAAABAAEAAAAj+AKNECQCgIMEACBMaNKjwIEIACR82XAhRosOCAjNqDICECJKPHkMyCYlkpEgiTEqq7IgSpMmSKVN+BNkxZQAbGjUCGFmyZcqWPUkyGYpy6JOiQHl6jElzJpGQAEjgzDlQJdGYQzu6rPkxa9aiVn3K5Nn1KcioU3MGYBqz6EilMJdyNQtTJkiUHruydEkEgIcYVKuaHAuz7tCYT8h6NVoT79XDkLMiAZCBRWAAM4mufIl3JRIgIBwYSJDAgQocMz0Xppl3JmXLVDH/3NEChIkWLXZk1rsjAcIDFm6rsJBAgAAFQGTiJdIiAoMECxQ42DDjKZMAlS8TYVAQgIADCxL+GCAgIEABC0+BGAAQAQgRHBEWjHZgAggQBwAIuN9QvuBxBc+t99AO2MGW004BnJBEEUk0mIQRRghRxAsHEAQACEy0QABBB0QAAggPbBjABupVZEEQCz7YIIMNBhFABAVelmEBD46gAGkXXFADiwUEAEQLEIFQV00pAQlRBD1IWIQRQbwwQgdQjlAEgwDs8Fpga03WQxHHmaDCAwwQ0J0CTCwQQAcAbCAZSQQG8ICEEl7wUAGlMaAAAAckUcNaV8aW0gMJOFGDbJkZ4AASvgXB4AH6FUaECQAk0EOEgx6UXF42iZDEAg9clx1VWRIRwKQFbJBZBAYgUYACCxDwYBH+KwRgAl5mKigEDQUAoICPChxgF3MATBkASjGCCtJzTvQAgFvDPrAWEb0BkIOEBThAhJg5JBHErip0ZMGwsn4VwApJMLCATZ8e6BQALxQhgQEjKbBBCz6qRIQKADQoxHoCSDjoAul5VJqVS4lWhLItFauuSvQmKYADQHAEwKxD9hVAEELQKcQJAYBARHIduedjAhZkCEAQRnS8lMI69TQSaUwWFAG+Lmv11K6K5hdAdVrZ+4ACOFQJAA1FRKAAV32q6xYTBHQgYQAOEPBATyyZBSkAQgRxYWpPLSc0ACvAylHVSbf800cR21oeanlZ9xkA3yZQRA7DOpWZqBvYKUT+rCCfle5Gv3oUsab7GoBD12WN10MPCSbxgAF0mQVtAQWYEMAIAFTXGhNlZ7QT1UQcFfEDD56AmXVPBZ2DEXeeLIQAM6Q2EpC5Bg2ACpq11LlAmKVGk7MG9ICyA1AD0RHlRgw6QwIKFCFC3U/NAIABKyBcJVtmsez5UkTltcD0AGiq7a5SBzBttR+bXwQAuT1QUAcMuiDAZFhpxvnfnn/FFBIOFABjAAaggRAkNIIAHEAIdJuBAgtggCIkJAE7ytqudrIslxxmMvgTSJYyYxIVyKoARAABQuAnBAC4IAl0Iw9CKHeCGqBMCD34XgFw4KNlYco9HdldFHbikSewJCX+EYtYVzbgn2AJYVRTSpKEMEYDZxlQNypIAL1a0zMMGkgnZlnTSIZVpcwAgYFzC0COLiCCCzCgRwRRgArctoAIOIABZEEcErTHu8QgwYeSUxUIEhCBljxFakWwgAGIIx4D7GoFg9ILSgAQMZ7FZSZ03GHkgAIEy00RdQKggREK4KiRAEB4w6KLByOGujh66oqeI5Jq5jiDAJSsa64L5SMLMIIkFEA3LNlZAhigFcbARIe9o1pYiCg99zwlX0fkydloua8WLMUCMxyWciJjRSz18iedmeMDiGefVjZoLV9BSQGMUIQDmCAlrQSCAEqmHLd9RIccIUlZVBK0FpQHCPj+ahABukaWcRbBARgCkgoYcAC6KKU1kbSh/rzyGYHmKgLBSoI0sUmEcZZrAx40gbPi4jYfwiShclFkFYkIAu5gLZlWSYk/fZO57xnvbkxZCjzt9ZKrtARIBmhBjxgwNsWMMwgE0A8BDtCVt9wlmzPlzP5288Xb3QciBFjVeAoCIfOozC4XlMxPQIopYbaTYRB5QG5a4IAFtLFh6zOAe7CylcK8BZ5Ysc5Sl7KUA5TVQgEggAESUgSURi4sQ/oIV0uCR+WAjiWoMkIOClCbDczLAvnqwLmAYq8fhrOafjrKT65iLz++bUGMVI4BLmDLGbzEKYiTXFbgmU3HdMWjqg3+QLsU0EcgBqAILhqLZOz2lt4m1W2QoWw2GWCAmIXkcUkQAQP+SsWiJiWSoTQq94BLUSAYMVxzfBrb7li1uJAlNSCtrFXu1raRFOBNLxiWdJKwggR85i2OyeNj3pnBHSoFvtc8DFA+dtLyXOx1OxiK8eJ4Nw4Ktr69Qx1fVhI6qjHBkNoSQNjslJSuOcYkF95ifcfWkaNMly1nI4q0FmSEF1RQqXIVb3cT6jvN7EZyKEnMowJghCSUcI3zPAlXckxfVPIucBecy3SB0j+gLtdl+lPkV1eG4K+o2HduSw4QE6CrKubYj+F0m6g2TKTp9pJ7Rt0tjrMYZgOzFSs63GH+YHsb18joVy5spSJkegm6AFDAAzIIjH3tVtTdsFkx9QOLR+f63S1SgAQ30LMkd4vkBdOEJ5qlM5Kz6paETaC+GVHCTnCoW0wt+Yc9GzCGdTsXm0AAA4hWtECGUJClxtWykpZnFS/Ytq4UZAKozrOqVy2DUE5SVBKpyLIkExGIGKTDYpkjBCiQARLoetervkGxGUIBCmAgA9jOdt2us+wKZDvb3VkIQihQgQ+kINHQ1ogSfCCDEnjg2xnwAAlQwIJ625sFEiO3B+h973qjgATv/rYHSiADH6Q7MEPQgQz6LQN0U8UHAQA4CRTtgxss/N4y0MHBNw7tIdwAMBwPucgLVe3wKEBh5IoOCAAAOw==',0);
/*!40000 ALTER TABLE `guilds` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `oncreate_guilds` AFTER INSERT ON `guilds`
 FOR EACH ROW BEGIN
        INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('Leader', 3, NEW.`id`);
        INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('Vice-Leader', 2, NEW.`id`);
        INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('Member', 1, NEW.`id`);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ondelete_guilds` BEFORE DELETE ON `guilds`
 FOR EACH ROW BEGIN
        UPDATE `players` SET `guildnick` = '', `rank_id` = 0 WHERE `rank_id` IN (SELECT `id` FROM `guild_ranks` WHERE `guild_id` = OLD.`id`);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `house_auctions`
--

DROP TABLE IF EXISTS `house_auctions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `house_auctions` (
  `house_id` int(10) unsigned NOT NULL,
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `player_id` int(11) NOT NULL,
  `bid` int(10) unsigned NOT NULL DEFAULT '0',
  `limit` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` bigint(20) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `house_id` (`house_id`,`world_id`),
  KEY `player_id` (`player_id`),
  CONSTRAINT `house_auctions_ibfk_1` FOREIGN KEY (`house_id`, `world_id`) REFERENCES `houses` (`id`, `world_id`) ON DELETE CASCADE,
  CONSTRAINT `house_auctions_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `house_auctions`
--

LOCK TABLES `house_auctions` WRITE;
/*!40000 ALTER TABLE `house_auctions` DISABLE KEYS */;
/*!40000 ALTER TABLE `house_auctions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `house_data`
--

DROP TABLE IF EXISTS `house_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `house_data` (
  `house_id` int(10) unsigned NOT NULL,
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `data` longblob NOT NULL,
  `serial` varchar(255) NOT NULL DEFAULT '',
  UNIQUE KEY `house_id` (`house_id`,`world_id`),
  CONSTRAINT `house_data_ibfk_1` FOREIGN KEY (`house_id`, `world_id`) REFERENCES `houses` (`id`, `world_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `house_data`
--

LOCK TABLES `house_data` WRITE;
/*!40000 ALTER TABLE `house_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `house_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `house_lists`
--

DROP TABLE IF EXISTS `house_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `house_lists` (
  `house_id` int(10) unsigned NOT NULL,
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `listid` int(11) NOT NULL,
  `list` text NOT NULL,
  UNIQUE KEY `house_id` (`house_id`,`world_id`,`listid`),
  CONSTRAINT `house_lists_ibfk_1` FOREIGN KEY (`house_id`, `world_id`) REFERENCES `houses` (`id`, `world_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `house_lists`
--

LOCK TABLES `house_lists` WRITE;
/*!40000 ALTER TABLE `house_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `house_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `houses`
--

DROP TABLE IF EXISTS `houses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `houses` (
  `id` int(10) unsigned NOT NULL,
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `owner` int(11) NOT NULL,
  `paid` int(10) unsigned NOT NULL DEFAULT '0',
  `warnings` int(11) NOT NULL DEFAULT '0',
  `lastwarning` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `town` int(10) unsigned NOT NULL DEFAULT '0',
  `size` int(10) unsigned NOT NULL DEFAULT '0',
  `price` int(10) unsigned NOT NULL DEFAULT '0',
  `rent` int(10) unsigned NOT NULL DEFAULT '0',
  `doors` int(10) unsigned NOT NULL DEFAULT '0',
  `beds` int(10) unsigned NOT NULL DEFAULT '0',
  `tiles` int(10) unsigned NOT NULL DEFAULT '0',
  `guild` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `clear` tinyint(1) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `id` (`id`,`world_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `houses`
--

LOCK TABLES `houses` WRITE;
/*!40000 ALTER TABLE `houses` DISABLE KEYS */;
INSERT INTO `houses` VALUES (1,0,0,0,0,0,'OTX headquarter (Flat 1, Area 42)',0,0,0,0,2,9,157,0,0),(2,0,0,0,0,0,'Market Street 4 (Shop)',1,384,5105,5105,12,9,536,0,0),(3,0,0,0,0,0,'OTX headquarter (Flat 1, Area 42)',0,0,0,0,2,2,36,0,0),(4,0,0,0,0,0,'Market Street 3',1,90,3475,3475,10,4,178,0,0),(5,0,0,0,0,0,'Market Street 2',1,132,4925,4925,13,7,251,0,0),(6,0,0,0,0,0,'Market Street 1',1,149,6680,6680,14,5,278,0,0),(7,0,0,0,0,0,'Old Lighthouse',1,113,3610,3610,8,3,221,0,0),(8,0,0,0,0,0,'Seagull Walk 1',1,222,5095,5095,11,4,332,0,0),(9,0,0,0,0,0,'Seagull Walk 2',1,50,2765,2765,10,3,132,0,0),(10,0,0,0,0,0,'Dream Street 4',1,68,3765,3765,12,4,168,0,0),(11,0,0,0,0,0,'Elm Street 2',1,51,2665,2665,7,2,112,0,0),(12,0,0,0,0,0,'Cemetery house 1',1,59,1200000,1200000,1,1,99,0,0),(13,0,0,0,0,0,'Cemetery house 2',1,76,1540000,1540000,2,1,131,0,0),(14,0,0,0,0,0,'Elm Street 4',1,51,3765,3765,6,2,120,0,0),(15,0,0,0,0,0,'Dream Street 3',1,53,2710,2710,8,2,117,0,0),(16,0,0,0,0,0,'Frozen Ville 1',2,16,360000,360000,1,2,42,0,0),(17,0,0,0,0,0,'Frozen Ville 2',2,24,500000,500000,1,1,56,0,0),(18,0,0,0,0,0,'Frozen Ville 3',2,14,300000,300000,2,1,30,0,0),(19,0,0,0,0,0,'Frozen Ville 4',2,16,360000,360000,1,2,42,0,0),(20,0,0,0,0,0,'Frozen Ville 5',2,21,440000,440000,1,1,48,0,0),(21,0,0,0,0,0,'Frozen Ville 6',2,69,1400000,1400000,3,1,126,0,0),(22,0,0,0,0,0,'Frozen Ville 7',2,68,1380000,1380000,1,1,126,0,0),(23,0,0,0,0,0,'Frozen Ville 8',2,66,1340000,1340000,1,1,126,0,0),(24,0,0,0,0,0,'Frozen Ville 9',2,40,800000,800000,3,0,84,0,0),(25,0,0,0,0,0,'Frozen Ville 10',2,58,1180000,1180000,1,1,112,0,0),(26,0,0,0,0,0,'Frozen Ville 11',2,76,1540000,1540000,3,1,141,0,0),(27,0,0,0,0,0,'Frozen Ville 12',2,28,580000,580000,3,1,56,0,0),(28,0,0,0,0,0,'Paupers Palace, Flat 01',1,6,405,405,2,1,24,0,0),(29,0,0,0,0,0,'Frozen First ville',2,56,1140000,1140000,3,1,114,0,0),(30,0,0,0,0,0,'North Ville 1',1,77,1540000,1540000,3,0,152,0,0),(31,0,0,0,0,0,'North Ville 2',1,23,480000,480000,2,1,53,0,0),(32,0,0,0,0,0,'North Ville 3',1,68,1400000,1400000,3,2,128,0,0),(33,0,0,0,0,0,'North Ville 4',1,26,540000,540000,1,1,50,0,0),(34,0,0,0,0,0,'Paupers Palace, Flat 07',1,8,685,685,1,2,23,0,0),(35,0,59,1557794694,0,0,'Principal Street 6',1,63,1260000,1260000,3,0,111,0,0),(36,0,0,0,0,0,'Principal Street 8',1,56,1200000,1200000,1,4,119,0,0),(37,0,0,0,0,0,'Demon Street 1',1,33,680000,680000,1,1,63,0,0),(38,0,0,0,0,0,'Demon Street 2',1,26,540000,540000,1,1,45,0,0),(39,0,0,0,0,0,'Demon Street 3',1,26,540000,540000,1,1,43,0,0),(40,0,0,0,0,0,'Demon Street 4',1,32,680000,680000,1,2,83,0,0),(41,0,0,0,0,0,'Demon Street 5',1,38,800000,800000,1,2,90,0,0),(42,0,0,0,0,0,'Demon Ville 1',1,10,220000,220000,1,1,24,0,0),(43,0,0,0,0,0,'Demon Ville 2',1,16,340000,340000,1,1,35,0,0),(44,0,0,0,0,0,'Demon Ville 3',1,28,580000,580000,1,1,49,0,0),(45,0,0,0,0,0,'Demon Ville 4',1,16,340000,340000,1,1,34,0,0),(46,0,0,0,0,0,'Demon Ville 5',1,28,580000,580000,1,1,48,0,0),(47,0,0,0,0,0,'Demon Street 6',1,30,640000,640000,1,2,77,0,0),(48,0,0,0,0,0,'Demon Street 7',1,27,560000,560000,1,1,58,0,0),(49,0,0,0,0,0,'HouseShop 1',1,14,300000,300000,1,1,36,0,0),(50,0,0,0,0,0,'Cemetery Village #1',1,117,2440000,2440000,3,5,184,0,0),(51,0,52,1557787109,0,0,'Principal Street 1',1,84,1720000,1720000,2,2,145,0,0),(52,0,14,1557273172,0,0,'Principal Street 2',1,87,1820000,1820000,2,4,134,0,0),(53,0,24,1557603898,0,0,'Principal Street 3',1,84,1720000,1720000,2,2,145,0,0),(54,0,0,0,0,0,'Sphere Gallery',1,10,220000,220000,1,1,30,0,0),(55,0,0,0,0,0,'Sphere Gallery 2',1,21,460000,460000,1,2,49,0,0),(56,0,0,0,0,0,'Sphere Gallery 3',1,46,960000,960000,2,2,90,0,0),(57,0,0,0,0,0,'Sphere Gallery 4',1,16,340000,340000,1,1,28,0,0),(58,0,0,0,0,0,'Principal Street 4',1,19,400000,400000,2,1,45,0,0),(59,0,0,0,0,0,'Principal Street 5',1,34,700000,700000,3,1,80,0,0),(60,0,0,0,0,0,'North Ville 5',1,77,1580000,1580000,4,2,130,0,0),(61,0,0,0,0,0,'North Ville 6',1,7,160000,160000,1,1,20,0,0),(62,0,0,0,0,0,'North Ville 7',1,14,300000,300000,3,1,38,0,0),(63,0,0,0,0,0,'North Ville 8',1,24,500000,500000,1,1,48,0,0),(64,0,0,0,0,0,'North Ville 9',1,83,1680000,1680000,8,1,189,0,0),(65,0,0,0,0,0,'Jungle #1',3,38,780000,780000,1,1,84,0,0),(66,0,0,0,0,0,'Jungle #2',3,38,780000,780000,1,1,84,0,0),(67,0,0,0,0,0,'Jungle #3',3,38,780000,780000,1,1,84,0,0),(68,0,0,0,0,0,'Desert Ville #1',1,37,760000,760000,1,1,71,0,0),(69,0,0,0,0,0,'Desert Ville #2',1,18,380000,380000,2,1,42,0,0),(70,0,0,0,0,0,'Desert Ville #3',1,47,960000,960000,2,1,76,0,0),(71,0,0,0,0,0,'Desert Ville #4',1,83,1700000,1700000,3,2,143,0,0),(72,0,0,0,0,0,'Desert Ville #5',1,70,1420000,1420000,2,1,98,0,0),(73,0,0,0,0,0,'Desert Ville #6',1,72,1460000,1460000,1,1,119,0,0),(74,0,0,0,0,0,'Desert Ville #7',1,67,1360000,1360000,2,1,99,0,0),(75,0,0,0,0,0,'Desert Ville #8',1,65,1320000,1320000,2,1,110,0,0),(76,0,0,0,0,0,'Desert Ville #9',1,98,1980000,1980000,1,1,163,0,0),(77,0,0,0,0,0,'Desert Ville #10',1,23,480000,480000,1,1,49,0,0),(78,0,0,0,0,0,'Desert Ville #11',1,47,960000,960000,3,1,72,0,0),(79,0,0,0,0,0,'Desert Ville #12',1,47,960000,960000,2,1,72,0,0),(80,0,0,0,0,0,'Desert Ville #13',1,47,960000,960000,3,1,72,0,0),(81,0,0,0,0,0,'Desert Ville #14',1,47,960000,960000,3,1,72,0,0),(82,0,0,0,0,0,'Desert Ville #15',1,47,960000,960000,3,1,72,0,0),(83,0,0,0,0,0,'Desert Ville #17',1,47,960000,960000,2,1,69,0,0),(84,0,0,0,0,0,'Desert Ville #16',1,23,480000,480000,1,1,49,0,0),(85,0,0,0,0,0,'Desert Ville #28',1,47,960000,960000,1,1,72,0,0),(86,0,0,0,0,0,'Desert Ville #29',1,47,960000,960000,1,1,72,0,0),(87,0,0,0,0,0,'Desert Ville #30',1,47,960000,960000,1,1,72,0,0),(88,0,0,0,0,0,'Desert Ville #31',1,47,960000,960000,1,1,72,0,0),(89,0,0,0,0,0,'Desert Ville #32',1,47,960000,960000,1,1,72,0,0),(90,0,0,0,0,0,'Desert Ville #33',1,47,960000,960000,1,1,81,0,0),(91,0,0,0,0,0,'Desert Ville #34',1,47,960000,960000,1,1,72,0,0),(92,0,0,0,0,0,'Desert Ville #35',1,47,960000,960000,1,1,72,0,0),(93,0,0,0,0,0,'Desert Ville #36',1,47,960000,960000,1,1,72,0,0),(94,0,0,0,0,0,'Desert Ville #37',1,10,220000,220000,2,1,28,0,0),(95,0,0,0,0,0,'Desert Ville #38',1,12,280000,280000,4,2,36,0,0),(96,0,0,0,0,0,'Desert Ville #39',1,10,220000,220000,2,1,32,0,0),(97,0,0,0,0,0,'Desert Ville #40',1,28,600000,600000,3,2,46,0,0),(98,0,0,0,0,0,'Desert Ville #41',1,10,220000,220000,2,1,26,0,0),(99,0,0,0,0,0,'Desert Ville #42',1,18,380000,380000,3,1,44,0,0),(100,0,0,0,0,0,'Desert Ville #18',1,18,380000,380000,3,1,48,0,0),(101,0,0,0,0,0,'Desert Ville #19',1,16,340000,340000,3,1,40,0,0),(102,0,0,0,0,0,'Desert Ville #20',1,10,200000,200000,3,0,28,0,0),(103,0,0,0,0,0,'Desert Ville #21',1,16,340000,340000,3,1,39,0,0),(104,0,0,0,0,0,'Desert Ville #22',1,10,200000,200000,3,0,28,0,0),(105,0,0,0,0,0,'Desert Ville #23',1,19,400000,400000,1,1,36,0,0),(106,0,0,0,0,0,'Desert Ville #24',1,19,400000,400000,1,1,45,0,0),(107,0,0,0,0,0,'Desert Ville #25',1,19,400000,400000,1,1,36,0,0),(108,0,0,0,0,0,'Desert Ville #26',1,19,400000,400000,1,1,36,0,0),(109,0,0,0,0,0,'Desert Ville #27',1,19,400000,400000,1,1,45,0,0),(110,0,0,0,0,0,'Biggest Guild Hall',1,104,2140000,2140000,12,3,256,0,0),(111,0,0,0,0,0,'Temple Ville #1',1,52,1040000,1040000,1,0,89,0,0),(112,0,0,0,0,0,'Temple Ville #2',1,13,260000,260000,1,0,33,0,0),(113,0,0,0,0,0,'Temple Ville #3',1,21,420000,420000,1,0,46,0,0),(114,0,0,0,0,0,'Temple Ville #4',1,34,680000,680000,1,0,66,0,0),(115,0,0,0,0,0,'Temple Ville #5',1,18,360000,360000,1,0,40,0,0),(116,0,0,0,0,0,'Temple Ville #6',1,25,500000,500000,1,0,42,0,0),(117,0,0,0,0,0,'Temple Ville #7',1,35,700000,700000,2,0,83,0,0),(118,0,0,0,0,0,'VIP #1',9,81,1680000,1680000,3,3,145,0,0),(119,0,0,0,0,0,'VIP #2',9,13,280000,280000,2,1,31,0,0),(120,0,0,0,0,0,'VIP #3',9,4,80000,80000,1,0,12,0,0),(121,0,0,0,0,0,'VIP #5',9,13,280000,280000,2,1,35,0,0),(122,0,0,0,0,0,'VIP #4',9,30,660000,660000,4,3,78,0,0),(123,0,0,0,0,0,'VIP #7',9,82,1700000,1700000,4,3,145,0,0),(124,0,0,0,0,0,'VIP #6',9,82,1700000,1700000,4,3,145,0,0),(125,0,0,0,0,0,'Depot Home 1',1,17,360000,360000,1,1,42,0,0),(126,0,0,0,0,0,'Rotworm Ville #126',1,46,940000,940000,1,1,56,0,0),(127,0,0,0,0,0,'Rotworm Ville #127',1,30,600000,600000,1,0,31,0,0),(128,0,0,0,0,0,'Rotworm Ville #128',1,39,800000,800000,1,1,43,0,0),(129,0,0,0,0,0,'Rotworm Ville #129',1,45,920000,920000,1,1,49,0,0),(130,0,0,0,0,0,'Rotworm Ville #130',1,38,780000,780000,1,1,41,0,0),(131,0,0,0,0,0,'Rotworm Ville #131',1,34,700000,700000,1,1,38,0,0),(132,0,0,0,0,0,'Rotworm Ville #132',1,38,780000,780000,2,1,46,0,0),(133,0,0,0,0,0,'Rotworm Ville #133',1,48,980000,980000,2,1,55,0,0),(134,0,0,0,0,0,'Rotworm Ville #134',1,22,460000,460000,1,1,28,0,0),(135,0,0,0,0,0,'Rotworm Ville #135',1,40,820000,820000,1,1,48,0,0),(136,0,0,0,0,0,'Rotworm Ville #136',1,32,660000,660000,1,1,48,0,0),(137,0,0,0,0,0,'Rotworm Ville #137',1,32,660000,660000,1,1,46,0,0),(138,0,0,0,0,0,'Rotworm Ville #138',1,22,460000,460000,2,1,31,0,0),(139,0,0,0,0,0,'Rotworm Ville #139',1,49,1000000,1000000,1,1,55,0,0),(140,0,0,0,0,0,'Rotworm Ville #140',1,26,540000,540000,1,1,31,0,0),(141,0,0,0,0,0,'Rotworm Ville #141',1,52,1060000,1060000,2,1,64,0,0),(142,0,0,0,0,0,'Rotworm Ville #142',1,28,580000,580000,2,1,34,0,0),(143,0,0,0,0,0,'Rotworm Ville #143',1,28,580000,580000,1,1,38,0,0),(144,0,0,0,0,0,'Rotworm Ville #144',1,40,820000,820000,1,1,51,0,0),(145,0,0,0,0,0,'Rotworm Ville #145',1,42,860000,860000,3,1,58,0,0),(146,0,0,0,0,0,'Rotworm Ville #146',1,54,1100000,1100000,1,1,60,0,0),(147,0,0,0,0,0,'Rotworm Ville #147',1,31,640000,640000,1,1,46,0,0),(148,0,0,0,0,0,'Rotworm Ville #148',1,28,580000,580000,1,1,38,0,0),(149,0,0,0,0,0,'Rotworm Ville #149',1,48,980000,980000,2,1,60,0,0),(150,0,0,0,0,0,'Rotworm Ville #150',1,58,1180000,1180000,3,1,71,0,0),(151,0,0,0,0,0,'Rotworm Ville #151',1,64,1300000,1300000,2,1,73,0,0),(152,0,0,0,0,0,'Rotworm Ville #152',1,27,560000,560000,1,1,34,0,0),(153,0,0,0,0,0,'Rotworm Ville #153',1,28,580000,580000,1,1,33,0,0),(154,0,0,0,0,0,'Rotworm Ville #154',1,28,580000,580000,2,1,45,0,0),(155,0,0,0,0,0,'Ville Depot 1',1,23,480000,480000,1,1,55,0,0),(156,0,0,0,0,0,'Ville Depot 2',1,19,420000,420000,1,2,48,0,0),(173,0,0,0,0,0,'Wood House #173',1,12,240000,240000,1,0,15,0,0),(174,0,0,0,0,0,'Wood House #174',1,12,240000,240000,1,0,13,0,0),(175,0,0,0,0,0,'Wood House #175',1,12,240000,240000,1,0,13,0,0),(176,0,0,0,0,0,'Wood House #176',1,12,240000,240000,1,0,14,0,0),(177,0,0,0,0,0,'Wood House #177',1,12,240000,240000,1,0,16,0,0),(178,0,0,0,0,0,'Wood House #178',1,31,620000,620000,2,0,39,0,0),(179,0,0,0,0,0,'Wood House #179',1,21,420000,420000,2,0,26,0,0),(180,0,0,0,0,0,'Wood House #180',1,12,240000,240000,1,0,14,0,0),(181,0,0,0,0,0,'GM House #181',1,108,2160000,2160000,3,0,168,0,0),(194,0,0,0,0,0,'Lucky Lane 1 (Shop)',1,132,6960,6960,14,4,270,0,0),(208,0,0,0,0,0,'Underwood 1',5,26,1495,1495,3,2,54,0,0),(209,0,0,0,0,0,'Underwood 2',5,27,1495,1495,4,2,55,0,0),(210,0,0,0,0,0,'Underwood 5',5,19,1370,1370,3,3,48,0,0),(211,0,0,0,0,0,'Underwood 3',5,26,1685,1685,3,3,57,0,0),(212,0,0,0,0,0,'Underwood 4',5,35,2235,2235,3,4,70,0,0),(213,0,0,0,0,0,'Underwood 10',5,10,585,585,2,1,23,0,0),(214,0,0,0,0,0,'Underwood 6',5,24,1595,1595,3,3,55,0,0),(215,0,0,0,0,0,'Great Willow 1a',5,7,500,500,1,1,25,0,0),(216,0,0,0,0,0,'Great Willow 1b',5,10,650,650,1,1,30,0,0),(217,0,0,0,0,0,'Great Willow 1c',5,10,650,650,1,1,20,0,0),(218,0,0,0,0,0,'Great Willow 2d',5,6,450,450,2,1,18,0,0),(219,0,0,0,0,0,'Great Willow 2c',5,10,650,650,1,1,24,0,0),(220,0,0,0,0,0,'Great Willow 2b',5,6,450,450,3,1,24,0,0),(221,0,0,0,0,0,'Great Willow 2a',5,11,650,650,3,1,30,0,0),(222,0,0,0,0,0,'Great Willow 3d',5,6,450,450,2,1,18,0,0),(223,0,0,0,0,0,'Great Willow 3c',5,10,650,650,1,1,24,0,0),(224,0,0,0,0,0,'Great Willow 3b',5,6,450,450,3,1,24,0,0),(225,0,0,0,0,0,'Great Willow 3a',5,10,650,650,2,1,30,0,0),(226,0,0,0,0,0,'Great Willow 4b',5,12,950,950,2,2,27,0,0),(227,0,0,0,0,0,'Great Willow 4c',5,12,950,950,2,2,31,0,0),(228,0,0,0,0,0,'Great Willow 4d',5,12,750,750,3,1,36,0,0),(229,0,0,0,0,0,'Great Willow 4a',5,12,950,950,3,2,36,0,0),(230,0,0,0,0,0,'Underwood 7',5,21,1460,1460,3,3,49,0,0),(231,0,0,0,0,0,'Shadow Caves 3',5,7,300,300,1,1,20,0,0),(232,0,0,0,0,0,'Shadow Caves 4',5,7,300,300,1,1,20,0,0),(233,0,0,0,0,0,'Shadow Caves 2',5,7,300,300,1,1,16,0,0),(234,0,0,0,0,0,'Shadow Caves 1',5,7,300,300,1,1,19,0,0),(235,0,0,0,0,0,'Shadow Caves 17',5,7,300,300,1,1,25,0,0),(236,0,0,0,0,0,'Shadow Caves 18',5,7,300,300,1,1,25,0,0),(237,0,0,0,0,0,'Shadow Caves 15',5,7,300,300,1,1,20,0,0),(238,0,0,0,0,0,'Shadow Caves 16',5,7,300,300,1,1,19,0,0),(239,0,0,0,0,0,'Shadow Caves 13',5,7,300,300,1,1,19,0,0),(240,0,0,0,0,0,'Shadow Caves 14',5,7,300,300,1,1,20,0,0),(241,0,0,0,0,0,'Shadow Caves 11',5,7,300,300,1,1,19,0,0),(242,0,0,0,0,0,'Shadow Caves 12',5,7,300,300,1,1,20,0,0),(243,0,0,0,0,0,'Shadow Caves 27',5,7,300,300,1,1,20,0,0),(244,0,0,0,0,0,'Shadow Caves 28',5,7,300,300,1,1,20,0,0),(245,0,0,0,0,0,'Shadow Caves 25',5,7,300,300,1,1,20,0,0),(246,0,0,0,0,0,'Shadow Caves 26',5,7,300,300,1,1,16,0,0),(247,0,0,0,0,0,'Shadow Caves 23',5,7,300,300,1,1,20,0,0),(248,0,0,0,0,0,'Shadow Caves 24',5,7,300,300,1,1,20,0,0),(249,0,0,0,0,0,'Shadow Caves 21',5,7,300,300,1,1,19,0,0),(250,0,0,0,0,0,'Shadow Caves 22',5,7,300,300,1,1,20,0,0),(251,0,0,0,0,0,'Underwood 9',5,10,585,585,1,1,28,0,0),(252,0,0,0,0,0,'Treetop 13',5,21,1400,1400,3,2,48,0,0),(254,0,0,0,0,0,'Underwood 8',5,13,865,865,3,2,34,0,0),(255,0,0,0,0,0,'Mangrove 4',5,13,950,950,2,2,36,0,0),(256,0,0,0,0,0,'Coastwood 10',5,19,1630,1630,3,3,48,0,0),(257,0,0,0,0,0,'Mangrove 1',5,24,1750,1750,2,3,54,0,0),(258,0,0,0,0,0,'Coastwood 1',5,11,980,980,3,2,34,0,0),(259,0,0,0,0,0,'Coastwood 2',5,11,980,980,2,2,28,0,0),(260,0,0,0,0,0,'Mangrove 2',5,20,1350,1350,1,2,54,0,0),(262,0,0,0,0,0,'Mangrove 3',5,16,1150,1150,2,2,41,0,0),(263,0,0,0,0,0,'Coastwood 9',5,14,935,935,3,1,34,0,0),(264,0,0,0,0,0,'Coastwood 8',5,17,1255,1255,4,2,41,0,0),(265,0,0,0,0,0,'Coastwood 6 (Shop)',5,36,1595,1595,7,1,64,0,0),(266,0,0,0,0,0,'Coastwood 7',5,21,660,660,4,1,42,0,0),(267,0,0,0,0,0,'Coastwood 5',5,34,1530,1530,5,2,62,0,0),(268,0,0,0,0,0,'Coastwood 4',5,14,1145,1145,3,2,42,0,0),(269,0,0,0,0,0,'Coastwood 3',5,17,1310,1310,3,2,36,0,0),(270,0,0,0,0,0,'Treetop 11',5,11,900,900,3,2,34,0,0),(271,0,0,0,0,0,'Treetop 5 (Shop)',5,34,1350,1350,6,1,70,0,0),(272,0,0,0,0,0,'Treetop 7',5,27,800,800,3,1,41,0,0),(273,0,0,0,0,0,'Treetop 6',5,23,450,450,4,1,40,0,0),(274,0,0,0,0,0,'Treetop 8',5,27,800,800,4,1,48,0,0),(275,0,0,0,0,0,'Treetop 9',5,16,1150,1150,2,2,34,0,0),(276,0,0,0,0,0,'Treetop 10',5,16,1150,1150,3,2,42,0,0),(277,0,0,0,0,0,'Treetop 4 (Shop)',5,20,1250,1250,4,1,48,0,0),(278,0,0,0,0,0,'Treetop 3 (Shop)',5,20,1250,1250,6,1,60,0,0),(279,0,0,0,0,0,'Treetop 2',5,10,650,650,2,1,29,0,0),(280,0,0,0,0,0,'Treetop 1',5,10,650,650,2,1,24,0,0),(281,0,0,0,0,0,'Treetop 12 (Shop)',5,20,1350,1350,6,1,53,0,0),(452,0,0,0,0,0,'Gengia House 1',0,10,220000,220000,0,1,15,0,0),(453,0,0,0,0,0,'Gengia House 2',0,13,280000,280000,0,1,19,0,0),(454,0,0,0,0,0,'Gengia House 4',0,10,220000,220000,0,1,15,0,0),(455,0,0,0,0,0,'Gengia House 5',0,8,180000,180000,0,1,10,0,0),(456,0,0,0,0,0,'Gengia House 6',0,8,180000,180000,0,1,10,0,0),(457,0,0,0,0,0,'Gengia House 7',0,30,620000,620000,1,1,34,0,0),(458,0,0,0,0,0,'Gengia House 8',0,65,1400000,1400000,5,5,104,0,0),(459,0,0,0,0,0,'Gengia House 9',0,16,320000,320000,1,0,31,0,0),(460,0,0,0,0,0,'Gengia House 10',0,33,700000,700000,1,2,48,0,0),(461,0,0,0,0,0,'Gengia House 11',0,52,1120000,1120000,3,4,71,0,0),(462,0,0,0,0,0,'Gengia House 12',0,48,1040000,1040000,3,4,69,0,0),(463,0,0,0,0,0,'Gengia House 13',0,45,980000,980000,2,4,61,0,0),(464,0,0,0,0,0,'Gengia House 14',0,42,880000,880000,2,2,51,0,0),(465,0,0,0,0,0,'Gengia House 15',0,17,380000,380000,0,2,23,0,0),(466,0,0,0,0,0,'Gengia House 16',0,21,460000,460000,1,2,31,0,0),(467,0,0,0,0,0,'Gengia House 17',0,16,360000,360000,0,2,22,0,0),(468,0,0,0,0,0,'Gengia House 18',0,43,900000,900000,2,2,54,0,0),(469,0,0,0,0,0,'Darashia 2, Flat 07',10,66,1000,1000,1,3,97,0,0),(470,0,0,0,0,0,'Darashia 2, Flat 01',10,39,1000,1000,1,2,67,0,0),(471,0,0,0,0,0,'Darashia 2, Flat 02',10,37,1000,1000,1,2,59,0,0),(472,0,0,0,0,0,'Darashia 2, Flat 06',10,103,520,520,3,5,144,0,0),(473,0,0,0,0,0,'Darashia 2, Flat 05',10,37,1260,1260,1,3,65,0,0),(474,0,0,0,0,0,'Darashia 2, Flat 04',10,44,520,520,1,3,67,0,0),(475,0,0,0,0,0,'Darashia 2, Flat 03',10,43,1160,1160,1,2,65,0,0),(476,0,0,0,0,0,'Darashia 2, Flat 13',10,49,1160,1160,3,3,77,0,0),(477,0,0,0,0,0,'Darashia 2, Flat 12',10,20,520,520,1,2,40,0,0),(478,0,0,0,0,0,'Darashia 2, Flat 11',10,31,1000,1000,1,2,53,0,0),(479,0,0,0,0,0,'Darashia 2, Flat 14',10,114,520,520,6,9,165,0,0),(480,0,0,0,0,0,'Darashia 2, Flat 15',10,32,1260,1260,1,3,58,0,0),(481,0,0,0,0,0,'Darashia 2, Flat 16',10,15,680,680,1,1,30,0,0),(482,0,0,0,0,0,'Darashia 2, Flat 17',10,34,1000,1000,1,2,63,0,0),(483,0,0,0,0,0,'Darashia 2, Flat 18',10,24,680,680,1,2,42,0,0),(484,0,0,0,0,0,'Darashia 1, Flat 05',10,36,1100,1100,1,3,69,0,0),(485,0,0,0,0,0,'Darashia 1, Flat 01',10,40,1100,1100,1,3,72,0,0),(486,0,0,0,0,0,'Darashia 1, Flat 04',10,48,1000,1000,1,2,72,0,0),(487,0,0,0,0,0,'Darashia 1, Flat 03',10,60,2660,2660,3,5,111,0,0),(488,0,0,0,0,0,'Darashia 1, Flat 02',10,45,1000,1000,1,3,70,0,0),(489,0,0,0,0,0,'',0,19,380000,380000,0,0,21,0,0),(490,0,0,0,0,0,'Darashia 1, Flat 12',10,52,1780,1780,2,3,85,0,0),(491,0,0,0,0,0,'Darashia 1, Flat 11',10,34,1100,1100,1,3,58,0,0),(492,0,0,0,0,0,'Darashia 1, Flat 13',10,49,1780,1780,2,3,86,0,0),(493,0,0,0,0,0,'Darashia 1, Flat 14',10,57,2760,2760,3,6,119,0,0),(494,0,0,0,0,0,'Darashia 4, Flat 01',10,86,1000,1000,4,4,146,0,0),(495,0,0,0,0,0,'Darashia 4, Flat 05',10,28,1100,1100,2,3,60,0,0),(496,0,0,0,0,0,'Darashia 4, Flat 04',10,62,1780,1780,2,2,99,0,0),(497,0,0,0,0,0,'Darashia 4, Flat 03',10,42,1000,1000,1,3,69,0,0),(498,0,0,0,0,0,'Darashia 4, Flat 02',10,48,1780,1780,2,3,81,0,0),(499,0,0,0,0,0,'Darashia 4, Flat 13',10,37,1780,1780,2,2,78,0,0),(500,0,0,0,0,0,'Darashia 4, Flat 14',10,37,1780,1780,2,2,72,0,0),(501,0,0,0,0,0,'Darashia 4, Flat 11',10,22,1000,1000,1,1,41,0,0),(502,0,0,0,0,0,'Darashia 4, Flat 12',10,52,2560,2560,3,3,96,0,0),(503,0,0,0,0,0,'Darashia 7, Flat 05',10,20,1225,1225,1,2,35,0,0),(504,0,0,0,0,0,'Darashia 7, Flat 01',10,22,1125,1125,1,1,40,0,0),(505,0,0,0,0,0,'Darashia 7, Flat 02',10,22,1125,1125,1,1,41,0,0),(506,0,0,0,0,0,'Darashia 7, Flat 03',10,50,2955,2955,3,4,102,0,0),(507,0,0,0,0,0,'Darashia 7, Flat 04',10,23,1125,1125,1,1,35,0,0),(508,0,0,0,0,0,'Darashia 7, Flat 14',10,48,2955,2955,3,4,108,0,0),(509,0,0,0,0,0,'Darashia 7, Flat 13',10,22,1125,1125,1,1,42,0,0),(510,0,0,0,0,0,'Darashia 7, Flat 11',10,22,1125,1125,1,1,41,0,0),(511,0,0,0,0,0,'Darashia 7, Flat 12',10,49,2955,2955,3,4,95,0,0),(512,0,0,0,0,0,'Darashia 5, Flat 01',10,22,1000,1000,1,1,48,0,0),(513,0,0,0,0,0,'Darashia 5, Flat 05',10,22,1000,1000,1,1,48,0,0),(514,0,0,0,0,0,'Darashia 5, Flat 02',10,32,1620,1620,2,2,61,0,0),(515,0,0,0,0,0,'Darashia 5, Flat 03',10,22,1000,1000,1,1,41,0,0),(516,0,0,0,0,0,'Darashia 5, Flat 04',10,32,1620,1620,2,2,66,0,0),(517,0,0,0,0,0,'Darashia 5, Flat 11',10,37,1780,1780,2,2,66,0,0),(518,0,0,0,0,0,'Darashia 5, Flat 12',10,34,1620,1620,2,2,65,0,0),(519,0,0,0,0,0,'Darashia 5, Flat 13',10,37,1780,1780,2,2,78,0,0),(520,0,0,0,0,0,'Darashia 5, Flat 14',10,33,1620,1620,2,2,66,0,0),(521,0,0,0,0,0,'Darashia 6a',10,62,3115,3115,3,2,117,0,0),(522,0,0,0,0,0,'Darashia 6b',10,69,3430,3430,2,2,139,0,0),(523,0,0,0,0,0,'Darashia, Villa',10,90,5385,5385,11,2,207,0,0),(525,0,0,0,0,0,'Darashia, Western Guildhall',10,154,10435,10435,16,14,376,0,0),(526,0,0,0,0,0,'Darashia 3, Flat 01',10,22,1100,1100,1,1,40,0,0),(527,0,0,0,0,0,'Darashia 3, Flat 05',10,22,1000,1000,1,1,40,0,0),(529,0,0,0,0,0,'Darashia 3, Flat 02',10,32,1620,1620,2,2,65,0,0),(530,0,0,0,0,0,'Darashia 3, Flat 03',10,20,1100,1100,1,2,42,0,0),(531,0,0,0,0,0,'Darashia 3, Flat 04',10,35,1620,1620,2,1,72,0,0),(532,0,0,0,0,0,'Darashia 3, Flat 13',10,20,1100,1100,1,2,42,0,0),(533,0,0,0,0,0,'Darashia 3, Flat 14',10,46,2400,2400,3,3,102,0,0),(534,0,0,0,0,0,'Darashia 3, Flat 11',10,22,1000,1000,1,1,41,0,0),(535,0,0,0,0,0,'Darashia 3, Flat 12',10,42,2600,2600,3,5,90,0,0),(541,0,0,0,0,0,'Darashia 8, Flat 11',10,37,1990,1990,2,2,66,0,0),(542,0,0,0,0,0,'Darashia 8, Flat 12',10,32,1810,1810,2,2,65,0,0),(544,0,0,0,0,0,'Darashia 8, Flat 14',10,0,1810,1810,0,0,10,0,0),(545,0,0,0,0,0,'Darashia 8, Flat 13',10,36,1990,1990,2,2,78,0,0),(574,0,0,0,0,0,'Oskahl I j',9,14,680,680,1,1,25,0,0),(575,0,0,0,0,0,'Oskahl I f',9,18,840,840,1,1,34,0,0),(576,0,0,0,0,0,'Oskahl I i',9,18,840,840,1,1,30,0,0),(577,0,0,0,0,0,'Oskahl I g',9,21,1140,1140,1,2,42,0,0),(578,0,0,0,0,0,'Oskahl I h',9,32,1760,1760,3,3,63,0,0),(579,0,0,0,0,0,'Oskahl I d',9,21,1140,1140,1,2,36,0,0),(580,0,0,0,0,0,'Oskahl I b',9,18,840,840,1,1,30,0,0),(581,0,0,0,0,0,'Oskahl I c',9,14,680,680,1,1,29,0,0),(582,0,0,0,0,0,'Oskahl I e',9,18,840,840,1,1,33,0,0),(583,0,0,0,0,0,'Oskahl I a',9,32,1580,1580,1,2,52,0,0),(584,0,0,0,0,0,'Chameken I',9,17,850,850,1,1,33,0,0),(585,0,0,0,0,0,'Charsirakh III',9,14,680,680,1,1,30,0,0),(586,0,0,0,0,0,'Murkhol I d',9,8,440,440,1,1,21,0,0),(587,0,0,0,0,0,'Murkhol I c',9,8,440,440,1,1,18,0,0),(588,0,0,0,0,0,'Murkhol I b',9,8,440,440,1,1,18,0,0),(589,0,0,0,0,0,'Murkhol I a',9,8,440,440,1,1,20,0,0),(590,0,0,0,0,0,'Charsirakh II',9,21,1140,1140,1,2,39,0,0),(591,0,0,0,0,0,'Thanah II h',9,21,1400,1400,2,2,40,0,0),(592,0,0,0,0,0,'Thanah II g',9,26,1650,1650,1,2,45,0,0),(593,0,0,0,0,0,'Thanah II f',9,45,2850,2850,3,3,80,0,0),(594,0,0,0,0,0,'Thanah II b',9,7,450,450,1,1,20,0,0),(595,0,0,0,0,0,'Thanah II c',9,6,450,450,1,1,15,0,0),(596,0,0,0,0,0,'Thanah II d',9,4,350,350,1,1,16,0,0),(597,0,0,0,0,0,'Thanah II e',9,4,350,350,1,1,12,0,0),(599,0,0,0,0,0,'Thanah II a',9,22,850,850,1,1,37,0,0),(600,0,0,0,0,0,'Thrarhor I c (Shop)',9,25,1050,1050,2,2,57,0,0),(601,0,0,0,0,0,'Thrarhor I d (Shop)',9,10,1050,1050,1,1,21,0,0),(602,0,0,0,0,0,'Thrarhor I a (Shop)',9,10,1050,1050,1,1,32,0,0),(603,0,0,0,0,0,'Thrarhor I b (Shop)',9,10,1050,1050,1,1,24,0,0),(604,0,0,0,0,0,'Thanah I c',9,51,3250,3250,4,3,91,0,0),(605,0,0,0,0,0,'Thanah I d',9,42,2900,2900,4,4,80,0,0),(606,0,0,0,0,0,'Thanah I b',9,50,3000,3000,3,3,84,0,0),(607,0,0,0,0,0,'Thanah I a',9,14,850,850,1,1,27,0,0),(608,0,0,0,0,0,'Harrah I',9,96,5740,5740,7,10,190,0,0),(609,0,0,0,0,0,'Charsirakh I b',9,32,1580,1580,1,2,51,0,0),(610,0,0,0,0,0,'Charsirakh I a',9,4,280,280,1,1,15,0,0),(611,0,0,0,0,0,'Othehothep I d',9,34,2020,2020,3,4,68,0,0),(612,0,0,0,0,0,'Othehothep I c',9,31,1720,1720,2,3,58,0,0),(613,0,0,0,0,0,'Othehothep I b',9,26,1380,1380,2,2,49,0,0),(614,0,0,0,0,0,'Othehothep I a',9,5,280,280,1,1,14,0,0),(615,0,0,0,0,0,'Othehothep II e',9,26,1340,1340,1,2,44,0,0),(616,0,0,0,0,0,'Othehothep II f',9,27,1340,1340,1,2,44,0,0),(617,0,0,0,0,0,'Othehothep II d',9,18,840,840,1,1,32,0,0),(618,0,0,0,0,0,'Othehothep II c',9,18,840,840,1,1,30,0,0),(619,0,0,0,0,0,'Othehothep II b',9,36,1920,1920,3,3,67,0,0),(620,0,0,0,0,0,'Othehothep II a',9,8,400,400,1,1,18,0,0),(621,0,0,0,0,0,'Mothrem I',9,21,1140,1140,1,2,38,0,0),(622,0,0,0,0,0,'Arakmehn I',9,21,1320,1320,1,3,41,0,0),(623,0,0,0,0,0,'Othehothep III d',9,23,1040,1040,1,1,36,0,0),(624,0,0,0,0,0,'Othehothep III c',9,16,940,940,1,2,30,0,0),(625,0,0,0,0,0,'Othehothep III e',9,18,840,840,1,1,32,0,0),(626,0,0,0,0,0,'Othehothep III f',9,14,680,680,1,1,27,0,0),(627,0,0,0,0,0,'Othehothep III b',9,26,1340,1340,3,2,49,0,0),(628,0,0,0,0,0,'Othehothep III a',9,4,280,280,1,1,14,0,0),(629,0,0,0,0,0,'Unklath I d',9,30,1680,1680,1,3,49,0,0),(630,0,0,0,0,0,'Unklath I e',9,32,1580,1580,1,2,51,0,0),(631,0,0,0,0,0,'Unklath I g',9,34,1480,1480,1,1,51,0,0),(632,0,0,0,0,0,'Unklath I f',9,32,1580,1580,1,2,51,0,0),(633,0,0,0,0,0,'Unklath I c',9,29,1460,1460,2,2,50,0,0),(634,0,0,0,0,0,'Unklath I b',9,28,1460,1460,2,2,50,0,0),(635,0,0,0,0,0,'Unklath I a',9,21,1140,1140,1,2,38,0,0),(636,0,0,0,0,0,'Arakmehn II',9,23,1040,1040,1,1,38,0,0),(637,0,0,0,0,0,'Arakmehn III',9,21,1140,1140,1,2,38,0,0),(638,0,0,0,0,0,'Unklath II b',9,14,680,680,1,1,25,0,0),(639,0,0,0,0,0,'Unklath II c',9,14,680,680,1,1,27,0,0),(640,0,0,0,0,0,'Unklath II d',9,32,1580,1580,1,2,52,0,0),(641,0,0,0,0,0,'Unklath II a',9,23,1040,1040,1,1,36,0,0),(642,0,0,0,0,0,'Arakmehn IV',9,24,1220,1220,1,2,41,0,0),(643,0,0,0,0,0,'Rathal I b',9,14,680,680,1,1,25,0,0),(644,0,0,0,0,0,'Rathal I c',9,14,680,680,1,1,27,0,0),(645,0,0,0,0,0,'Rathal I e',9,12,780,780,1,2,27,0,0),(646,0,0,0,0,0,'Rathal I d',9,12,780,780,1,2,27,0,0),(647,0,0,0,0,0,'Rathal I a',9,21,1140,1140,1,2,36,0,0),(648,0,0,0,0,0,'Rathal II b',9,14,680,680,1,1,25,0,0),(649,0,0,0,0,0,'Rathal II c',9,14,680,680,1,1,27,0,0),(650,0,0,0,0,0,'Rathal II d',9,29,1460,1460,2,2,52,0,0),(651,0,0,0,0,0,'Rathal II a',9,24,1040,1040,1,1,38,0,0),(653,0,0,0,0,0,'Esuph II a',9,4,280,280,1,1,14,0,0),(654,0,0,0,0,0,'Uthemath II',9,76,4460,4460,3,8,138,0,0),(655,0,0,0,0,0,'Uthemath I e',9,16,940,940,1,2,32,0,0),(656,0,0,0,0,0,'Uthemath I d',9,18,840,840,1,1,30,0,0),(657,0,0,0,0,0,'Uthemath I f',9,49,2440,2440,4,3,86,0,0),(658,0,0,0,0,0,'Uthemath I b',9,17,800,800,2,1,32,0,0),(659,0,0,0,0,0,'Uthemath I c',9,15,900,900,2,2,34,0,0),(660,0,0,0,0,0,'Uthemath I a',9,7,400,400,1,1,18,0,0),(661,0,0,0,0,0,'Botham I c',9,26,1700,1700,2,2,49,0,0),(662,0,0,0,0,0,'Botham I e',9,27,1650,1650,1,2,44,0,0),(663,0,0,0,0,0,'Botham I d',9,50,3050,3050,2,3,80,0,0),(664,0,0,0,0,0,'Botham I b',9,47,3000,3000,3,3,83,0,0),(666,0,0,0,0,0,'Horakhal',9,174,9420,9420,5,14,277,0,0),(667,0,0,0,0,0,'Esuph III b',9,26,1340,1340,3,2,49,0,0),(668,0,0,0,0,0,'Esuph III a',9,4,280,280,1,1,14,0,0),(669,0,0,0,0,0,'Esuph IV b',9,7,400,400,1,1,16,0,0),(670,0,0,0,0,0,'Esuph IV c',9,7,400,400,1,1,18,0,0),(671,0,0,0,0,0,'Esuph IV d',9,16,800,800,2,1,34,0,0),(672,0,0,0,0,0,'Esuph IV a',9,7,400,400,1,1,16,0,0),(673,0,0,0,0,0,'Botham II e',9,26,1650,1650,1,2,42,0,0),(674,0,0,0,0,0,'Botham II g',9,21,1400,1400,1,2,38,0,0),(675,0,0,0,0,0,'Botham II f',9,26,1650,1650,1,2,44,0,0),(676,0,0,0,0,0,'Botham II d',9,32,1950,1950,1,2,49,0,0),(677,0,0,0,0,0,'Botham II c',9,17,1250,1250,2,2,38,0,0),(678,0,0,0,0,0,'Botham II b',9,26,1600,1600,2,2,47,0,0),(679,0,0,0,0,0,'Botham II a',9,14,850,850,1,1,25,0,0),(680,0,0,0,0,0,'Botham III g',9,26,1650,1650,1,2,42,0,0),(681,0,0,0,0,0,'Botham III f',9,36,2350,2350,1,3,56,0,0),(682,0,0,0,0,0,'Botham III h',9,64,3750,3750,3,3,98,0,0),(683,0,0,0,0,0,'Botham III d',9,14,850,850,1,1,27,0,0),(684,0,0,0,0,0,'Botham III e',9,15,850,850,1,1,27,0,0),(685,0,0,0,0,0,'Botham III b',9,12,950,950,1,2,25,0,0),(686,0,0,0,0,0,'Botham III c',9,14,850,850,1,1,27,0,0),(687,0,0,0,0,0,'Botham III a',9,22,1400,1400,1,2,36,0,0),(688,0,0,0,0,0,'Botham IV i',9,26,1800,1800,2,3,51,0,0),(689,0,0,0,0,0,'Botham IV h',9,34,1850,1850,1,1,49,0,0),(690,0,0,0,0,0,'Botham IV f',9,26,1700,1700,2,2,49,0,0),(691,0,0,0,0,0,'Botham IV g',9,24,1650,1650,3,2,49,0,0),(692,0,0,0,0,0,'Botham IV c',9,14,850,850,1,1,27,0,0),(693,0,0,0,0,0,'Botham IV e',9,14,850,850,1,1,27,0,0),(694,0,0,0,0,0,'Botham IV d',9,14,850,850,1,1,27,0,0),(695,0,0,0,0,0,'Botham IV b',9,14,850,850,1,1,25,0,0),(696,0,0,0,0,0,'Botham IV a',9,22,1400,1400,1,2,36,0,0),(697,0,0,0,0,0,'Ramen Tah',9,90,7650,7650,4,16,182,0,0),(698,0,0,0,0,0,'Banana Bay 1',8,7,450,450,2,1,25,0,0),(699,0,0,0,0,0,'Banana Bay 2',8,14,765,765,3,1,36,0,0),(700,0,0,0,0,0,'Banana Bay 3',8,7,450,450,2,1,25,0,0),(701,0,0,0,0,0,'Banana Bay 4',8,7,450,450,2,1,25,0,0),(702,0,0,0,0,0,'Shark Manor',8,127,8780,8780,9,15,286,0,0),(703,0,0,0,0,0,'Coconut Quay 1',8,32,1765,1765,3,2,64,0,0),(704,0,0,0,0,0,'Coconut Quay 2',8,16,1045,1045,4,2,42,0,0),(705,0,0,0,0,0,'Coconut Quay 3',8,32,2145,2145,3,4,70,0,0),(706,0,0,0,0,0,'Coconut Quay 4',8,36,2135,2135,3,3,72,0,0),(707,0,0,0,0,0,'Crocodile Bridge 3',8,22,1270,1270,4,2,49,0,0),(708,0,0,0,0,0,'Crocodile Bridge 2',8,12,865,865,2,2,36,0,0),(709,0,0,0,0,0,'Crocodile Bridge 1',8,17,1045,1045,4,2,42,0,0),(710,0,0,0,0,0,'Bamboo Garden 1',8,25,1640,1640,2,3,63,0,0),(711,0,0,0,0,0,'Crocodile Bridge 4',8,88,4755,4755,7,4,176,0,0),(712,0,0,0,0,0,'Crocodile Bridge 5',8,80,3970,3970,8,2,157,0,0),(713,0,0,0,0,0,'Woodway 1',8,14,765,765,1,1,36,0,0),(714,0,0,0,0,0,'Woodway 2',8,11,585,585,3,1,30,0,0),(715,0,0,0,0,0,'Woodway 3',8,27,1540,1540,6,2,65,0,0),(716,0,0,0,0,0,'Woodway 4',8,6,405,405,3,1,24,0,0),(717,0,0,0,0,0,'Flamingo Flats 5',8,38,1845,1845,4,1,84,0,0),(718,0,0,0,0,0,'Bamboo Fortress',8,381,21970,21970,23,20,848,0,0),(719,0,0,0,0,0,'Bamboo Garden 3',8,27,1540,1540,3,2,63,0,0),(720,0,0,0,0,0,'Bamboo Garden 2',8,16,1045,1045,2,2,42,0,0),(721,0,0,0,0,0,'Flamingo Flats 4',8,12,865,865,2,2,36,0,0),(722,0,0,0,0,0,'Flamingo Flats 2',8,16,1045,1045,3,2,42,0,0),(723,0,0,0,0,0,'Flamingo Flats 3',8,8,685,685,3,2,30,0,0),(724,0,0,0,0,0,'Flamingo Flats 1',8,8,685,685,3,2,30,0,0),(725,0,0,0,0,0,'Jungle Edge 4',8,12,865,865,4,2,36,0,0),(726,0,0,0,0,0,'Jungle Edge 5',8,12,865,865,3,2,36,0,0),(727,0,0,0,0,0,'Jungle Edge 6',8,7,450,450,1,1,25,0,0),(728,0,0,0,0,0,'Jungle Edge 2',8,59,3170,3170,9,3,128,0,0),(729,0,0,0,0,0,'Jungle Edge 3',8,12,865,865,1,2,36,0,0),(730,0,0,0,0,0,'Jungle Edge 1',8,44,2495,2495,4,3,98,0,0),(731,0,0,0,0,0,'Haggler\'s Hangout 6',8,113,6450,6450,7,4,208,0,0),(732,0,0,0,0,0,'Haggler\'s Hangout 5 (Shop)',8,24,1550,1550,3,1,56,0,0),(733,0,0,0,0,0,'Haggler\'s Hangout 4a (Shop)',8,30,1850,1850,2,1,56,0,0),(734,0,0,0,0,0,'Haggler\'s Hangout 4b (Shop)',8,24,1550,1550,4,1,56,0,0),(735,0,0,0,0,0,'Haggler\'s Hangout 3',8,137,7550,7550,8,4,256,0,0),(736,0,0,0,0,0,'Haggler\'s Hangout 2',8,23,1300,1300,2,1,49,0,0),(737,0,0,0,0,0,'Haggler\'s Hangout 1',8,22,1400,1400,3,2,49,0,0),(738,0,0,0,0,0,'River Homes 1',8,66,3485,3485,6,3,128,0,0),(739,0,0,0,0,0,'River Homes 2a',8,21,1270,1270,4,2,42,0,0),(740,0,0,0,0,0,'River Homes 2b',8,24,1595,1595,4,3,56,0,0),(741,0,0,0,0,0,'River Homes 3',8,82,5055,5055,6,7,176,0,0),(742,0,0,0,0,0,'The Treehouse',8,484,24120,24120,11,23,897,0,0),(743,0,0,0,0,0,'Corner Shop (Shop)',12,36,2215,2215,7,2,96,0,0),(744,0,0,0,0,0,'Tusk Flats 1',12,14,765,765,3,2,40,0,0),(745,0,0,0,0,0,'Tusk Flats 2',12,16,835,835,2,2,42,0,0),(746,0,0,0,0,0,'Tusk Flats 3',12,11,660,660,2,2,34,0,0),(747,0,0,0,0,0,'Tusk Flats 4',12,6,315,315,2,1,24,0,0),(748,0,0,0,0,0,'Tusk Flats 6',12,12,660,660,3,2,35,0,0),(749,0,0,0,0,0,'Tusk Flats 5',12,11,455,455,2,1,30,0,0),(750,0,0,0,0,0,'Shady Rocks 5',12,57,2890,2890,4,2,110,0,0),(751,0,0,0,0,0,'Shady Rocks 4 (Shop)',12,50,2710,2710,6,2,110,0,0),(752,0,0,0,0,0,'Shady Rocks 3',12,77,4115,4115,8,3,154,0,0),(753,0,0,0,0,0,'Shady Rocks 2',12,29,2010,2010,4,4,77,0,0),(754,0,0,0,0,0,'Shady Rocks 1',12,65,3630,3630,7,4,132,0,0),(755,0,0,0,0,0,'Crystal Glance',12,237,19625,19625,16,24,569,0,0),(756,0,0,0,0,0,'Arena Walk 3',12,59,3550,3550,5,3,126,0,0),(757,0,0,0,0,0,'Arena Walk 2',12,21,1400,1400,4,2,54,0,0),(758,0,0,0,0,0,'Arena Walk 1',12,55,3250,3250,7,3,128,0,0),(759,0,0,0,0,0,'Bears Paw 2',12,44,2305,2305,6,2,100,0,0),(760,0,0,0,0,0,'Bears Paw 1',12,33,1810,1810,6,2,72,0,0),(761,0,0,0,0,0,'Spirit Homes 5',12,21,1450,1450,3,2,56,0,0),(762,0,0,0,0,0,'Glacier Side 3',12,30,1950,1950,6,2,75,0,0),(763,0,0,0,0,0,'Glacier Side 2',12,83,4750,4750,8,3,154,0,0),(764,0,0,0,0,0,'Glacier Side 1',12,26,1600,1600,6,2,65,0,0),(765,0,0,0,0,0,'Spirit Homes 1',12,27,1700,1700,3,2,56,0,0),(766,0,0,0,0,0,'Spirit Homes 2',12,31,1900,1900,5,2,72,0,0),(767,0,0,0,0,0,'Spirit Homes 3',12,75,4250,4250,4,3,128,0,0),(768,0,0,0,0,0,'Spirit Homes 4',12,19,1100,1100,3,1,49,0,0),(770,0,0,0,0,0,'Glacier Side 4',12,38,2050,2050,5,1,75,0,0),(771,0,0,0,0,0,'Shelf Site',12,83,4800,4800,8,3,160,0,0),(772,0,0,0,0,0,'Raven Corner 1',12,15,855,855,4,1,45,0,0),(773,0,0,0,0,0,'Raven Corner 2',12,25,1685,1685,4,3,60,0,0),(774,0,0,0,0,0,'Raven Corner 3',12,15,855,855,4,1,45,0,0),(775,0,0,0,0,0,'Bears Paw 3',12,35,2090,2090,4,3,82,0,0),(776,0,0,0,0,0,'Bears Paw 4',12,99,5205,5205,12,4,189,0,0),(778,0,0,0,0,0,'Bears Paw 5',12,34,2045,2045,5,3,81,0,0),(779,0,0,0,0,0,'Trout Plaza 5 (Shop)',12,73,3880,3880,7,2,144,0,0),(780,0,0,0,0,0,'Pilchard Bin 1',12,8,685,685,1,2,30,0,0),(781,0,0,0,0,0,'Pilchard Bin 2',12,8,685,685,1,2,24,0,0),(782,0,0,0,0,0,'Pilchard Bin 3',12,10,585,585,1,1,24,0,0),(783,0,0,0,0,0,'Pilchard Bin 4',12,10,585,585,1,1,24,0,0),(784,0,0,0,0,0,'Pilchard Bin 5',12,8,685,685,1,2,24,0,0),(785,0,0,0,0,0,'Pilchard Bin 10',12,7,450,450,1,1,20,0,0),(786,0,0,0,0,0,'Pilchard Bin 9',12,7,450,450,1,1,20,0,0),(787,0,0,0,0,0,'Pilchard Bin 8',12,6,450,450,1,2,20,0,0),(789,0,0,0,0,0,'Pilchard Bin 7',12,7,450,450,1,1,20,0,0),(790,0,0,0,0,0,'Pilchard Bin 6',12,7,450,450,1,1,25,0,0),(791,0,0,0,0,0,'Trout Plaza 1',12,43,2395,2395,7,2,112,0,0),(792,0,0,0,0,0,'Trout Plaza 2',12,26,1540,1540,4,2,64,0,0),(793,0,0,0,0,0,'Trout Plaza 3',12,18,900,900,3,1,36,0,0),(794,0,0,0,0,0,'Trout Plaza 4',12,18,900,900,4,1,45,0,0),(795,0,0,0,0,0,'Skiffs End 1',12,28,1540,1540,4,2,70,0,0),(796,0,0,0,0,0,'Skiffs End 2',12,13,910,910,4,2,42,0,0),(797,0,0,0,0,0,'Furrier Quarter 3',12,20,1010,1010,4,2,54,0,0),(798,0,0,0,0,0,'Mammoth Belly',12,278,22810,22810,29,30,634,0,0),(799,0,0,0,0,0,'Furrier Quarter 2',12,21,1045,1045,4,2,56,0,0),(800,0,0,0,0,0,'Furrier Quarter 1',12,34,1635,1635,5,3,84,0,0),(801,0,0,0,0,0,'Fimbul Shelf 3',12,28,1255,1255,4,2,66,0,0),(802,0,0,0,0,0,'Fimbul Shelf 4',12,22,1045,1045,3,2,56,0,0),(803,0,0,0,0,0,'Fimbul Shelf 2',12,21,1045,1045,3,2,56,0,0),(804,0,0,0,0,0,'Fimbul Shelf 1',12,20,975,975,3,2,48,0,0),(805,0,0,0,0,0,'Frost Manor',12,382,26370,26370,32,24,806,0,0),(806,0,0,0,0,0,'Lower Barracks 11',3,7,300,300,1,1,20,0,0),(807,0,0,0,0,0,'Lower Barracks 12',3,7,300,300,1,1,16,0,0),(808,0,0,0,0,0,'Lower Barracks 9',3,7,300,300,1,1,20,0,0),(809,0,0,0,0,0,'Lower Barracks 10',3,7,300,300,1,1,19,0,0),(810,0,0,0,0,0,'Lower Barracks 7',3,7,300,300,1,1,20,0,0),(811,0,0,0,0,0,'Lower Barracks 8',3,7,300,300,1,1,16,0,0),(812,0,0,0,0,0,'Lower Barracks 5',3,7,300,300,1,1,20,0,0),(813,0,0,0,0,0,'Lower Barracks 6',3,7,300,300,1,1,16,0,0),(814,0,0,0,0,0,'Lower Barracks 3',3,7,300,300,1,1,20,0,0),(815,0,0,0,0,0,'Lower Barracks 4',3,7,300,300,1,1,19,0,0),(816,0,0,0,0,0,'Lower Barracks 1',3,7,300,300,1,1,20,0,0),(817,0,0,0,0,0,'Lower Barracks 2',3,7,300,300,1,1,16,0,0),(818,0,0,0,0,0,'Lower Barracks 24',3,7,300,300,1,1,20,0,0),(819,0,0,0,0,0,'Lower Barracks 23',3,7,300,300,1,1,16,0,0),(820,0,0,0,0,0,'Lower Barracks 22',3,7,300,300,1,1,20,0,0),(821,0,0,0,0,0,'Lower Barracks 21',3,7,300,300,1,1,16,0,0),(822,0,0,0,0,0,'Lower Barracks 20',3,7,300,300,1,1,20,0,0),(823,0,0,0,0,0,'Lower Barracks 19',3,7,300,300,1,1,16,0,0),(824,0,0,0,0,0,'Lower Barracks 18',3,7,300,300,1,1,20,0,0),(825,0,0,0,0,0,'Lower Barracks 17',3,7,300,300,1,1,16,0,0),(826,0,0,0,0,0,'Lower Barracks 16',3,7,300,300,1,1,20,0,0),(828,0,0,0,0,0,'Lower Barracks 15',3,7,300,300,1,1,16,0,0),(829,0,0,0,0,0,'Lower Barracks 14',3,7,300,300,1,1,20,0,0),(830,0,0,0,0,0,'Lower Barracks 13',3,7,300,300,1,1,16,0,0),(831,0,0,0,0,0,'Marble Guildhall',3,282,16810,16810,18,17,540,0,0),(832,0,0,0,0,0,'Iron Guildhall',3,243,15560,15560,15,17,464,0,0),(833,0,0,0,0,0,'The Market 1 (Shop)',3,8,650,650,2,1,25,0,0),(834,0,0,0,0,0,'The Market 3 (Shop)',3,22,1450,1450,2,1,40,0,0),(835,0,0,0,0,0,'The Market 2 (Shop)',3,17,1100,1100,2,1,40,0,0),(836,0,0,0,0,0,'The Market 4 (Shop)',3,28,1800,1800,2,1,48,0,0),(837,0,0,0,0,0,'Granite Guildhall',3,296,17845,17845,18,17,589,0,0),(838,0,0,0,0,0,'Upper Barracks 1',3,4,210,210,1,1,20,0,0),(839,0,0,0,0,0,'Upper Barracks 2',3,4,210,210,1,1,15,0,0),(840,0,0,0,0,0,'Upper Barracks 3',3,4,210,210,1,1,15,0,0),(841,0,0,0,0,0,'Upper Barracks 4',3,4,210,210,1,1,15,0,0),(842,0,0,0,0,0,'Upper Barracks 5',3,4,210,210,1,1,12,0,0),(843,0,0,0,0,0,'Upper Barracks 6',3,4,210,210,1,1,12,0,0),(844,0,0,0,0,0,'Upper Barracks 7',3,4,210,210,1,1,16,0,0),(845,0,0,0,0,0,'Upper Barracks 8',3,4,210,210,1,1,20,0,0),(847,0,0,0,0,0,'Upper Barracks 10',3,4,210,210,1,1,15,0,0),(848,0,0,0,0,0,'Upper Barracks 11',3,4,210,210,1,1,15,0,0),(849,0,0,0,0,0,'Upper Barracks 12',3,4,210,210,1,1,16,0,0),(850,0,0,0,0,0,'Upper Barracks 13',3,11,580,580,1,2,24,0,0),(851,0,0,0,0,0,'Nobility Quarter 4',3,14,765,765,1,1,25,0,0),(852,0,0,0,0,0,'Nobility Quarter 5',3,15,765,765,1,1,25,0,0),(853,0,0,0,0,0,'Nobility Quarter 7',3,14,765,765,1,1,30,0,0),(854,0,0,0,0,0,'Nobility Quarter 6',3,14,765,765,1,1,30,0,0),(855,0,0,0,0,0,'Nobility Quarter 8',3,14,765,765,1,1,30,0,0),(856,0,0,0,0,0,'Nobility Quarter 9',3,14,765,765,1,1,30,0,0),(857,0,0,0,0,0,'Nobility Quarter 2',3,30,1865,1865,1,3,56,0,0),(858,0,0,0,0,0,'Nobility Quarter 3',3,30,1865,1865,1,3,56,0,0),(859,0,0,0,0,0,'Nobility Quarter 1',3,30,1865,1865,1,3,62,0,0),(863,0,0,0,0,0,'The Farms 6, Fishing Hut',3,16,1255,1255,1,2,36,0,0),(864,0,0,0,0,0,'The Farms 5',3,21,1530,1530,1,2,36,0,0),(865,0,0,0,0,0,'The Farms 4',3,21,1530,1530,1,2,36,0,0),(866,0,0,0,0,0,'The Farms 3',3,21,1530,1530,1,2,36,0,0),(867,0,0,0,0,0,'The Farms 2',3,21,1530,1530,1,2,36,0,0),(868,0,0,0,0,0,'The Farms 1',3,34,2510,2510,2,3,60,0,0),(869,0,0,0,0,0,'Outlaw Camp 12 (Shop)',3,6,280,280,1,0,12,0,0),(870,0,0,0,0,0,'Outlaw Camp 13 (Shop)',3,6,280,280,1,0,12,0,0),(871,0,0,0,0,0,'Outlaw Camp 14 (Shop)',3,16,640,640,1,0,30,0,0),(872,0,0,0,0,0,'Outlaw Camp 7',3,12,780,780,1,2,38,0,0),(874,0,0,0,0,0,'Outlaw Camp 8',3,5,280,280,1,1,20,0,0),(877,0,0,0,0,0,'Outlaw Camp 9',3,3,200,200,1,1,12,0,0),(878,0,0,0,0,0,'Outlaw Camp 10',3,2,200,200,1,1,12,0,0),(879,0,0,0,0,0,'Outlaw Camp 11',3,2,200,200,1,1,16,0,0),(880,0,0,0,0,0,'Outlaw Camp 2',3,4,280,280,2,1,20,0,0),(881,0,0,0,0,0,'Outlaw Camp 3',3,11,740,740,3,2,35,0,0),(882,0,0,0,0,0,'Outlaw Camp 4',3,2,200,200,3,1,12,0,0),(883,0,0,0,0,0,'Outlaw Camp 5',3,2,200,200,3,1,12,0,0),(884,0,0,0,0,0,'Outlaw Camp 6',3,2,200,200,3,1,16,0,0),(885,0,0,0,0,0,'Outlaw Camp 1',3,46,1660,1660,1,2,91,0,0),(886,0,0,0,0,0,'Outlaw Castle',3,158,8000,8000,11,9,410,0,0),(888,0,0,0,0,0,'Tunnel Gardens 1',3,20,1820,1820,1,3,44,0,0),(889,0,0,0,0,0,'Tunnel Gardens 3',3,23,2000,2000,1,3,48,0,0),(890,0,0,0,0,0,'Tunnel Gardens 4',3,24,2000,2000,1,3,45,0,0),(891,0,0,0,0,0,'Tunnel Gardens 2',3,20,1820,1820,1,3,47,0,0),(892,0,0,0,0,0,'Tunnel Gardens 5',3,16,1360,1360,1,2,35,0,0),(893,0,0,0,0,0,'Tunnel Gardens 6',3,16,1360,1360,1,2,38,0,0),(894,0,0,0,0,0,'Tunnel Gardens 8',3,16,1360,1360,1,2,35,0,0),(895,0,0,0,0,0,'Tunnel Gardens 7',3,16,1360,1360,1,2,35,0,0),(896,0,0,0,0,0,'Tunnel Gardens 12',3,11,1060,1060,1,2,24,0,0),(897,0,0,0,0,0,'Tunnel Gardens 11',3,11,1060,1060,1,2,32,0,0),(898,0,0,0,0,0,'Tunnel Gardens 9',3,10,1000,1000,1,2,29,0,0),(899,0,0,0,0,0,'Tunnel Gardens 10',3,10,1000,1000,1,2,29,0,0),(900,0,0,0,0,0,'Wolftower',3,316,21550,21550,27,23,699,0,0),(901,0,0,0,0,0,'Paupers Palace, Flat 11',1,4,315,315,2,1,14,0,0),(902,0,0,0,0,0,'Upper Barracks 9',3,4,210,210,1,1,15,0,0),(905,0,0,0,0,0,'Botham I a',9,21,950,950,1,1,36,0,0),(906,0,0,0,0,0,'Esuph I',9,18,680,680,1,1,39,0,0),(907,0,0,0,0,0,'Esuph II b',9,26,1380,1380,2,2,51,0,0),(1883,0,0,0,0,0,'Aureate Court 1',13,116,5240,5240,7,3,276,0,0),(1884,0,0,0,0,0,'Aureate Court 2',13,120,4860,4860,2,2,198,0,0),(1885,0,0,0,0,0,'Aureate Court 3',13,115,4300,4300,4,2,226,0,0),(1886,0,0,0,0,0,'Aureate Court 4',13,82,3980,3980,5,4,208,0,0),(1887,0,0,0,0,0,'Fortune Wing 1',13,237,10180,10180,4,4,420,0,0),(1888,0,0,0,0,0,'Fortune Wing 2',13,130,5580,5580,5,2,260,0,0),(1889,0,0,0,0,0,'Fortune Wing 3',13,135,5740,5740,4,2,258,0,0),(1890,0,0,0,0,0,'Fortune Wing 4',13,129,5740,5740,4,4,305,0,0),(1891,0,0,0,0,0,'Luminous Arc 1',13,147,6460,6460,8,2,344,0,0),(1892,0,0,0,0,0,'Luminous Arc 2',13,145,6460,6460,3,4,301,0,0),(1893,0,0,0,0,0,'Luminous Arc 3',13,121,5400,5400,6,3,249,0,0),(1894,0,0,0,0,0,'Luminous Arc 4',13,175,8000,8000,7,5,343,0,0),(1895,0,0,0,0,0,'Radiant Plaza 1',13,123,5620,5620,5,4,276,0,0),(1896,0,0,0,0,0,'Radiant Plaza 2',13,87,3820,3820,2,2,179,0,0),(1897,0,0,0,0,0,'Radiant Plaza 3',13,114,4900,4900,4,2,256,0,0),(1898,0,0,0,0,0,'Radiant Plaza 4',13,178,7460,7460,4,3,367,0,0),(1899,0,0,0,0,0,'Sun Palace',13,460,23120,23120,12,27,974,0,0),(1900,0,0,0,0,0,'Halls of Serenity',13,432,23360,23360,21,33,1090,0,0),(1901,0,0,0,0,0,'Cascade Towers',13,315,19500,19500,24,33,810,0,0),(1902,0,0,0,0,0,'Sorcerer\'s Avenue 5',2,42,2695,2695,4,1,96,0,0),(1903,0,0,0,0,0,'Sorcerer\'s Avenue 1a',2,16,1255,1255,3,2,42,0,0),(1904,0,0,0,0,0,'Sorcerer\'s Avenue 1b',2,12,1035,1035,2,2,36,0,0),(1905,0,0,0,0,0,'Sorcerer\'s Avenue 1c',2,16,1255,1255,2,2,36,0,0),(1906,0,0,0,0,0,'Beach Home Apartments, Flat 06',2,14,1145,1145,3,2,40,0,0),(1911,0,0,0,0,0,'Beach Home Apartments, Flat 05',2,10,715,715,2,1,24,0,0),(1912,0,0,0,0,0,'Beach Home Apartments, Flat 16',2,14,1145,1145,3,2,40,0,0),(1913,0,0,0,0,0,'Beach Home Apartments, Flat 11',2,10,715,715,2,1,30,0,0),(1914,0,0,0,0,0,'Beach Home Apartments, Flat 12',2,13,880,880,1,1,30,0,0),(1915,0,0,0,0,0,'Beach Home Apartments, Flat 13',2,13,880,880,3,1,29,0,0),(1916,0,0,0,0,0,'Beach Home Apartments, Flat 14',2,4,385,385,2,1,15,0,0),(1917,0,0,0,0,0,'Beach Home Apartments, Flat 15',2,4,385,385,2,1,15,0,0),(1918,0,0,0,0,0,'Thais Clanhall',2,154,8420,8420,20,10,370,0,0),(1919,0,0,0,0,0,'Harbour Street 4',2,14,935,935,1,1,30,0,0),(1920,0,0,0,0,0,'Thais Hostel',2,63,6980,6980,7,24,171,0,0),(1921,0,0,0,0,0,'Lower Swamp Lane 1',2,62,4740,4740,13,4,166,0,0),(1923,0,0,0,0,0,'Lower Swamp Lane 3',2,62,4740,4740,13,4,161,0,0),(1927,0,0,0,0,0,'Sunset Homes, Flat 14',2,10,520,520,3,1,30,0,0),(1929,0,0,0,0,0,'Sunset Homes, Flat 13',2,15,860,860,1,2,35,0,0),(1930,0,0,0,0,0,'Sunset Homes, Flat 12',2,10,520,520,1,1,25,0,0),(1932,0,0,0,0,0,'Sunset Homes, Flat 11',2,10,520,520,3,1,25,0,0),(1935,0,0,0,0,0,'Sunset Homes, Flat 24',2,10,520,520,3,1,30,0,0),(1936,0,0,0,0,0,'Sunset Homes, Flat 23',2,14,860,860,1,2,35,0,0),(1937,0,0,0,0,0,'Sunset Homes, Flat 22',2,10,520,520,1,1,25,0,0),(1938,0,0,0,0,0,'Sunset Homes, Flat 21',2,10,520,520,3,1,25,0,0),(1941,0,0,0,0,0,'Warriors Guildhall',2,257,14725,14725,24,11,499,0,0),(1943,0,0,0,0,0,'Farm Lane, Basement (Shop)',2,15,945,945,2,0,36,0,0),(1945,0,0,0,0,0,'Main Street 9a, 2nd floor (Shop)',2,0,765,765,0,0,6,0,0),(1946,0,0,0,0,0,'Main Street 9b, 2nd floor (Shop)',2,0,1260,1260,0,0,4,0,0),(1947,0,0,0,0,0,'Farm Lane, 2nd Floor (Shop)',2,0,945,945,0,0,6,0,0),(1951,0,0,0,0,0,'The City Wall 5b',2,10,585,585,3,1,24,0,0),(1952,0,0,0,0,0,'The City Wall 5d',2,10,585,585,1,1,24,0,0),(1953,0,0,0,0,0,'The City Wall 5f',2,10,585,585,3,1,30,0,0),(1954,0,0,0,0,0,'The City Wall 3a',2,16,1045,1045,1,2,42,0,0),(1955,0,0,0,0,0,'The City Wall 3b',2,16,1045,1045,1,2,35,0,0),(1956,0,0,0,0,0,'The City Wall 3c',2,16,1045,1045,1,2,35,0,0),(1957,0,0,0,0,0,'The City Wall 3d',2,16,1045,1045,1,2,42,0,0),(1958,0,0,0,0,0,'The City Wall 3e',2,16,1045,1045,1,2,35,0,0),(1959,0,0,0,0,0,'The City Wall 3f',2,16,1045,1045,1,2,35,0,0),(1960,0,0,0,0,0,'The City Wall 1a',2,21,1270,1270,4,2,49,0,0),(1961,0,0,0,0,0,'Mill Avenue 3',2,21,1400,1400,4,2,49,0,0),(1962,0,0,0,0,0,'The City Wall 1b',2,21,1270,1270,4,2,49,0,0),(1963,0,0,0,0,0,'Mill Avenue 4',2,21,1400,1400,5,2,49,0,0),(1964,0,0,0,0,0,'Mill Avenue 5',2,49,3250,3250,9,4,128,0,0),(1965,0,0,0,0,0,'Mill Avenue 1 (Shop)',2,17,1300,1300,6,1,54,0,0),(1966,0,0,0,0,0,'Mill Avenue 2 (Shop)',2,38,2350,2350,6,2,80,0,0),(1971,0,0,0,0,0,'The City Wall 7d',2,12,865,865,2,2,36,0,0),(1972,0,0,0,0,0,'The City Wall 7b',2,10,585,585,2,1,30,0,0),(1973,0,0,0,0,0,'The City Wall 7f',2,12,865,865,2,2,35,0,0),(1974,0,0,0,0,0,'The City Wall 7h',2,10,585,585,2,1,30,0,0),(1975,0,0,0,0,0,'The City Wall 9',2,14,955,955,4,2,50,0,0),(1976,0,0,0,0,0,'Upper Swamp Lane 12',2,46,3800,3800,11,3,116,0,0),(1977,0,0,0,0,0,'Upper Swamp Lane 10',2,25,2060,2060,6,3,70,0,0),(1978,0,0,0,0,0,'Upper Swamp Lane 8',2,124,8120,8120,13,3,216,0,0),(1979,0,0,0,0,0,'Southern Thais Guildhall',2,275,22440,22440,34,14,560,0,0),(1980,0,0,0,0,0,'Alai Flats, Flat 04',2,14,765,765,2,1,30,0,0),(1981,0,0,0,0,0,'Alai Flats, Flat 05',2,20,1225,1225,1,2,38,0,0),(1982,0,0,0,0,0,'Alai Flats, Flat 06',2,20,1225,1225,1,2,48,0,0),(1983,0,0,0,0,0,'',0,6,140000,140000,1,1,9,0,0),(1984,0,0,0,0,0,'',0,6,140000,140000,1,1,10,0,0),(1985,0,0,0,0,0,'',0,7,160000,160000,1,1,12,0,0),(1986,0,0,0,0,0,'',0,7,160000,160000,1,1,12,0,0),(1987,0,0,0,0,0,'',0,7,160000,160000,1,1,10,0,0),(1988,0,0,0,0,0,'',0,7,160000,160000,1,1,10,0,0),(1989,0,0,0,0,0,'',0,7,160000,160000,1,1,12,0,0),(1990,0,0,0,0,0,'',0,14,320000,320000,1,2,21,0,0),(1991,0,0,0,0,0,'',0,17,380000,380000,1,2,24,0,0),(1992,0,0,0,0,0,'Alai Flats, Flat 18',2,16,900,900,4,1,38,0,0),(1993,0,0,0,0,0,'Alai Flats, Flat 13',2,14,765,765,1,1,36,0,0),(1994,0,0,0,0,0,'Alai Flats, Flat 12',2,14,765,765,1,1,25,0,0),(1995,0,0,0,0,0,'Alai Flats, Flat 11',2,14,765,765,3,1,35,0,0),(1996,0,0,0,0,0,'Alai Flats, Flat 24',2,16,900,900,3,1,36,0,0),(1997,0,0,0,0,0,'Alai Flats, Flat 25',2,24,1450,1450,2,2,52,0,0),(1998,0,0,0,0,0,'Alai Flats, Flat 26',2,24,1450,1450,3,2,60,0,0),(1999,0,0,0,0,0,'Alai Flats, Flat 27',2,16,900,900,4,1,38,0,0),(2000,0,0,0,0,0,'Alai Flats, Flat 28',2,16,900,900,4,1,38,0,0),(2001,0,0,0,0,0,'Alai Flats, Flat 23',2,14,765,765,1,1,35,0,0),(2002,0,0,0,0,0,'Alai Flats, Flat 22',2,14,765,765,1,1,25,0,0),(2003,0,0,0,0,0,'Alai Flats, Flat 21',2,14,765,765,3,1,36,0,0),(2004,0,0,0,0,0,'Upper Swamp Lane 4',2,57,4740,4740,13,4,165,0,0),(2005,0,0,0,0,0,'Upper Swamp Lane 2',2,57,4740,4740,13,4,159,0,0),(2006,0,0,0,0,0,'Sorcerer\'s Avenue Labs 2c',2,10,715,715,1,1,20,0,0),(2007,0,0,0,0,0,'Sorcerer\'s Avenue Labs 2d',2,10,715,715,1,1,20,0,0),(2008,0,0,0,0,0,'Sorcerer\'s Avenue Labs 2e',2,10,715,715,1,1,20,0,0),(2009,0,0,0,0,0,'Sorcerer\'s Avenue Labs 2f',2,10,715,715,1,1,20,0,0),(2010,0,0,0,0,0,'Sorcerer\'s Avenue Labs 2b',2,10,715,715,1,1,24,0,0),(2011,0,0,0,0,0,'Sorcerer\'s Avenue Labs 2a',2,10,715,715,1,1,24,0,0),(2012,0,0,0,0,0,'Ivory Circle 1',7,71,4280,4280,5,2,160,0,0),(2013,0,0,0,0,0,'Admiral\'s Avenue 3',7,68,4115,4115,3,2,142,0,0),(2014,0,0,0,0,0,'Admiral\'s Avenue 2',7,85,5470,5470,5,4,176,0,0),(2015,0,0,0,0,0,'Admiral\'s Avenue 1',7,83,5105,5105,5,2,168,0,0),(2016,0,0,0,0,0,'Sugar Street 5',7,20,1350,1350,1,2,48,0,0),(2017,0,0,0,0,0,'Freedom Street 1',7,41,2450,2450,2,2,84,0,0),(2018,0,0,0,0,0,'Freedom Street 2',7,103,6050,6050,8,4,208,0,0),(2019,0,0,0,0,0,'Trader\'s Point 2 (Shop)',7,93,5350,5350,9,2,198,0,0),(2020,0,0,0,0,0,'Trader\'s Point 3 (Shop)',7,106,5950,5950,9,2,195,0,0),(2021,0,0,0,0,0,'Ivory Circle 2',7,120,7030,7030,3,2,214,0,0),(2022,0,0,0,0,0,'The Tavern 1a',7,40,2750,2750,2,4,72,0,0),(2023,0,0,0,0,0,'The Tavern 1b',7,31,1900,1900,3,2,54,0,0),(2024,0,0,0,0,0,'The Tavern 1c',7,73,4150,4150,5,3,132,0,0),(2025,0,0,0,0,0,'The Tavern 1d',7,24,1550,1550,3,2,48,0,0),(2026,0,0,0,0,0,'The Tavern 2d',7,20,1350,1350,2,2,40,0,0),(2027,0,0,0,0,0,'The Tavern 2c',7,16,950,950,2,1,32,0,0),(2028,0,0,0,0,0,'The Tavern 2b',7,27,1700,1700,2,2,62,0,0),(2029,0,0,0,0,0,'The Tavern 2a',7,92,5550,5550,9,5,163,0,0),(2030,0,0,0,0,0,'Straycat\'s Corner 4',7,4,210,210,3,1,20,0,0),(2031,0,0,0,0,0,'Straycat\'s Corner 3',7,4,210,210,2,1,20,0,0),(2032,0,0,0,0,0,'Straycat\'s Corner 2',7,18,660,660,4,1,49,0,0),(2033,0,0,0,0,0,'Litter Promenade 5',7,11,580,580,3,2,35,0,0),(2034,0,0,0,0,0,'Litter Promenade 4',7,10,390,390,2,1,30,0,0),(2035,0,0,0,0,0,'Litter Promenade 3',7,12,450,450,2,1,36,0,0),(2036,0,0,0,0,0,'Litter Promenade 2',7,7,300,300,2,1,25,0,0),(2037,0,0,0,0,0,'Litter Promenade 1',7,6,400,400,2,2,25,0,0),(2038,0,0,0,0,0,'The Shelter',7,282,13590,13590,16,31,560,0,0),(2039,0,0,0,0,0,'Straycat\'s Corner 6',7,7,300,300,2,1,25,0,0),(2040,0,0,0,0,0,'Straycat\'s Corner 5',7,16,760,760,3,2,48,0,0),(2042,0,0,0,0,0,'Rum Alley 3',7,9,330,330,2,1,28,0,0),(2043,0,0,0,0,0,'Straycat\'s Corner 1',7,7,300,300,2,1,25,0,0),(2044,0,0,0,0,0,'Rum Alley 2',7,7,300,300,3,1,25,0,0),(2045,0,0,0,0,0,'Rum Alley 1',7,14,510,510,2,1,36,0,0),(2046,0,0,0,0,0,'Smuggler Backyard 3',7,15,700,700,4,2,40,0,0),(2048,0,0,0,0,0,'Shady Trail 3',7,7,300,300,2,1,25,0,0),(2049,0,0,0,0,0,'Shady Trail 1',7,14,1150,1150,3,5,48,0,0),(2050,0,0,0,0,0,'Shady Trail 2',7,8,490,490,3,2,30,0,0),(2051,0,0,0,0,0,'Smuggler Backyard 5',7,11,610,610,3,2,35,0,0),(2052,0,0,0,0,0,'Smuggler Backyard 4',7,10,390,390,2,1,30,0,0),(2053,0,0,0,0,0,'Smuggler Backyard 2',7,15,670,670,2,2,40,0,0),(2054,0,0,0,0,0,'Smuggler Backyard 1',7,14,670,670,3,2,40,0,0),(2055,0,0,0,0,0,'Sugar Street 2',7,39,2550,2550,4,3,84,0,0),(2056,0,0,0,0,0,'Sugar Street 1',7,50,3000,3000,4,3,84,0,0),(2057,0,0,0,0,0,'Sugar Street 3a',7,22,1650,1650,2,3,54,0,0),(2058,0,0,0,0,0,'Sugar Street 3b',7,30,2050,2050,4,3,60,0,0),(2059,0,0,0,0,0,'Harvester\'s Haven, Flat 01',7,12,950,950,1,2,36,0,0),(2060,0,0,0,0,0,'Harvester\'s Haven, Flat 03',7,12,950,950,1,2,30,0,0),(2061,0,0,0,0,0,'Harvester\'s Haven, Flat 05',7,12,950,950,1,2,30,0,0),(2062,0,0,0,0,0,'Harvester\'s Haven, Flat 02',7,12,950,950,1,2,36,0,0),(2063,0,0,0,0,0,'Harvester\'s Haven, Flat 04',7,12,950,950,1,2,30,0,0),(2064,0,0,0,0,0,'Harvester\'s Haven, Flat 06',7,12,950,950,1,2,30,0,0),(2065,0,0,0,0,0,'Harvester\'s Haven, Flat 07',7,12,950,950,2,2,30,0,0),(2066,0,0,0,0,0,'Harvester\'s Haven, Flat 09',7,13,950,950,1,2,30,0,0),(2067,0,0,0,0,0,'Harvester\'s Haven, Flat 11',7,12,950,950,2,2,36,0,0),(2068,0,0,0,0,0,'Harvester\'s Haven, Flat 12',7,13,950,950,2,2,36,0,0),(2069,0,0,0,0,0,'Harvester\'s Haven, Flat 10',7,12,950,950,1,2,30,0,0),(2070,0,0,0,0,0,'Harvester\'s Haven, Flat 08',7,12,950,950,2,2,30,0,0),(2071,0,0,0,0,0,'Marble Lane 4',7,102,6350,6350,7,4,192,0,0),(2072,0,0,0,0,0,'Marble Lane 2',7,106,6415,6415,3,3,200,0,0),(2073,0,0,0,0,0,'Marble Lane 3',7,133,8055,8055,4,4,240,0,0),(2074,0,0,0,0,0,'Marble Lane 1',7,178,11060,11060,7,6,320,0,0),(2075,0,0,0,0,0,'Ivy Cottage',7,469,30650,30650,10,26,858,0,0),(2076,0,0,0,0,0,'Sugar Street 4d',7,8,750,750,1,2,24,0,0),(2077,0,0,0,0,0,'Sugar Street 4c',7,10,650,650,1,1,24,0,0),(2078,0,0,0,0,0,'Sugar Street 4b',7,12,950,950,2,2,36,0,0),(2079,0,0,0,0,0,'Sugar Street 4a',7,12,950,950,2,2,30,0,0),(2080,0,0,0,0,0,'Trader\'s Point 1',7,38,2200,2200,2,2,77,0,0),(2081,0,0,0,0,0,'Mountain Hideout',7,234,15550,15550,11,17,486,0,0),(2082,0,0,0,0,0,'Dark Mansion',2,294,17845,17845,22,17,573,0,0),(2083,0,0,0,0,0,'Halls of the Adventurers',2,243,15380,15380,18,18,518,0,0),(2084,0,0,0,0,0,'Castle of Greenshore',2,254,18860,18860,17,12,600,0,0),(2085,0,0,0,0,0,'Greenshore Clanhall',2,133,10800,10800,18,10,312,0,0),(2086,0,0,0,0,0,'Greenshore Village 1',2,30,2420,2420,2,3,64,0,0),(2087,0,0,0,0,0,'Greenshore Village, Shop',2,20,1800,1800,5,1,56,0,0),(2088,0,0,0,0,0,'Greenshore Village, Villa',2,117,8700,8700,16,4,263,0,0),(2089,0,0,0,0,0,'Greenshore Village 2',2,10,780,780,2,1,30,0,0),(2090,0,0,0,0,0,'Greenshore Village 3',2,10,780,780,2,1,25,0,0),(2091,0,0,0,0,0,'Greenshore Village 5',2,10,780,780,2,1,30,0,0),(2092,0,0,0,0,0,'Greenshore Village 4',2,10,780,780,2,1,25,0,0),(2093,0,0,0,0,0,'Greenshore Village 6',2,61,4360,4360,6,2,118,0,0),(2094,0,0,0,0,0,'Greenshore Village 7',2,18,1260,1260,3,1,42,0,0),(2095,0,0,0,0,0,'The Tibianic',2,445,34500,34500,10,22,871,0,0),(2097,0,0,0,0,0,'Fibula Village 5',2,21,1790,1790,2,2,42,0,0),(2098,0,0,0,0,0,'Fibula Village 4',2,21,1790,1790,2,2,42,0,0),(2099,0,0,0,0,0,'Fibula Village, Tower Flat',2,72,5105,5105,3,2,161,0,0),(2100,0,0,0,0,0,'Fibula Village 1',2,10,845,845,3,1,30,0,0),(2101,0,0,0,0,0,'Fibula Village 2',2,10,845,845,3,1,30,0,0),(2102,0,0,0,0,0,'Fibula Village 3',2,45,3810,3810,4,4,110,0,0),(2103,0,0,0,0,0,'Mercenary Tower',2,525,41955,41955,22,26,996,0,0),(2104,0,0,0,0,0,'Guildhall of the Red Rose',2,340,27725,27725,13,15,572,0,0),(2105,0,0,0,0,0,'Fibula Village, Bar',2,59,5235,5235,5,2,122,0,0),(2106,0,0,0,0,0,'Fibula Village, Villa',2,181,11490,11490,23,5,402,0,0),(2107,0,0,0,0,0,'Fibula Clanhall',2,128,11430,11430,21,10,290,0,0),(2108,0,0,0,0,0,'Spiritkeep',2,316,19210,19210,19,23,783,0,0),(2109,0,0,0,0,0,'Snake Tower',2,532,29720,29720,33,21,1064,0,0),(2110,0,0,0,0,0,'Bloodhall',2,245,15270,15270,23,15,569,0,0),(2111,0,0,0,0,0,'Senja Clanhall',4,172,10575,10575,22,9,396,0,0),(2112,0,0,0,0,0,'Senja Village 2',4,14,765,765,2,1,36,0,0),(2113,0,0,0,0,0,'Senja Village 1a',4,14,765,765,2,1,36,0,0),(2114,0,0,0,0,0,'Senja Village 1b',4,28,1630,1630,6,2,66,0,0),(2115,0,0,0,0,0,'Senja Village 4',4,14,765,765,2,1,30,0,0),(2116,0,0,0,0,0,'Senja Village 3',4,28,1765,1765,3,2,72,0,0),(2117,0,0,0,0,0,'Senja Village 6b',4,14,765,765,2,1,30,0,0),(2118,0,0,0,0,0,'Senja Village 6a',4,14,765,765,2,1,30,0,0),(2119,0,0,0,0,0,'Senja Village 5',4,20,1225,1225,3,2,48,0,0),(2120,0,0,0,0,0,'Senja Village 10',4,30,1485,1485,2,1,72,0,0),(2121,0,0,0,0,0,'Senja Village 11',4,50,2620,2620,5,2,96,0,0),(2122,0,0,0,0,0,'Senja Village 9',4,48,2575,2575,3,2,103,0,0),(2123,0,0,0,0,0,'Senja Village 8',4,30,1675,1675,2,2,57,0,0),(2124,0,0,0,0,0,'Senja Village 7',4,12,865,865,2,2,37,0,0),(2125,0,0,0,0,0,'Rosebud C',4,30,1340,1340,4,0,70,0,0),(2127,0,0,0,0,0,'Rosebud A',4,22,1000,1000,3,1,60,0,0),(2128,0,0,0,0,0,'Rosebud B',4,22,1000,1000,3,1,60,0,0),(2129,0,0,0,0,0,'Nordic Stronghold',4,258,18400,18400,14,11,570,0,0),(2130,0,0,0,0,0,'Northport Village 2',4,20,1475,1475,3,2,40,0,0),(2131,0,0,0,0,0,'Northport Village 1',4,20,1475,1475,3,2,48,0,0),(2132,0,0,0,0,0,'Northport Village 3',4,96,5435,5435,5,2,178,0,0),(2133,0,0,0,0,0,'Northport Village 4',4,42,2630,2630,4,2,81,0,0),(2134,0,0,0,0,0,'Northport Village 5',4,26,1805,1805,2,2,56,0,0),(2135,0,0,0,0,0,'Northport Village 6',4,32,2135,2135,4,2,64,0,0),(2136,0,0,0,0,0,'Seawatch',4,364,25010,25010,15,19,749,0,0),(2137,0,0,0,0,0,'Northport Clanhall',4,130,9810,9810,16,10,292,0,0),(2138,0,0,0,0,0,'Druids Retreat D',4,22,1180,1180,1,2,54,0,0),(2139,0,0,0,0,0,'Druids Retreat A',4,26,1340,1340,1,2,60,0,0),(2140,0,0,0,0,0,'Druids Retreat C',4,17,980,980,1,2,45,0,0),(2141,0,0,0,0,0,'Druids Retreat B',4,24,980,980,1,2,55,0,0),(2142,0,0,0,0,0,'Theater Avenue 14 (Shop)',4,36,2115,2115,3,1,83,0,0),(2143,0,0,0,0,0,'Theater Avenue 12',4,14,955,955,2,2,28,0,0),(2144,0,0,0,0,0,'Theater Avenue 10',4,17,1090,1090,1,2,45,0,0),(2145,0,0,0,0,0,'Theater Avenue 11c',4,10,585,585,2,1,24,0,0),(2146,0,0,0,0,0,'Theater Avenue 11b',4,10,585,585,2,1,24,0,0),(2147,0,0,0,0,0,'Theater Avenue 11a',4,24,1405,1405,2,2,54,0,0),(2148,0,0,0,0,0,'Magician\'s Alley 1',4,14,1050,1050,1,2,35,0,0),(2149,0,0,0,0,0,'Magician\'s Alley 1a',4,7,700,700,1,2,29,0,0),(2150,0,0,0,0,0,'Magician\'s Alley 1d',4,6,450,450,1,1,24,0,0),(2151,0,0,0,0,0,'Magician\'s Alley 1b',4,8,750,750,1,2,24,0,0),(2152,0,0,0,0,0,'Magician\'s Alley 1c',4,7,500,500,1,1,20,0,0),(2153,0,0,0,0,0,'Magician\'s Alley 5a',4,4,350,350,1,1,14,0,0),(2154,0,0,0,0,0,'Magician\'s Alley 5b',4,7,500,500,1,1,25,0,0),(2155,0,0,0,0,0,'Magician\'s Alley 5d',4,7,500,500,1,1,20,0,0),(2156,0,0,0,0,0,'Magician\'s Alley 5e',4,7,500,500,1,1,25,0,0),(2157,0,0,0,0,0,'Magician\'s Alley 5c',4,16,1150,1150,1,2,35,0,0),(2158,0,0,0,0,0,'Magician\'s Alley 5f',4,16,1150,1150,1,2,42,0,0),(2159,0,0,0,0,0,'Carlin Clanhall',4,167,10750,10750,2,10,364,0,0),(2160,0,0,0,0,0,'Magician\'s Alley 4',4,40,2750,2750,1,4,96,0,0),(2161,0,0,0,0,0,'Lonely Sea Side Hostel',4,218,10540,10540,5,8,454,0,0),(2162,0,0,0,0,0,'Suntower',4,204,10080,10080,21,7,450,0,0),(2163,0,0,0,0,0,'Harbour Lane 3',4,77,3560,3560,1,3,145,0,0),(2164,0,0,0,0,0,'Harbour Flats, Flat 11',4,10,520,520,2,1,24,0,0),(2165,0,0,0,0,0,'Harbour Flats, Flat 13',4,10,520,520,1,1,24,0,0),(2166,0,0,0,0,0,'Harbour Flats, Flat 15',4,6,360,360,1,1,18,0,0),(2167,0,0,0,0,0,'Harbour Flats, Flat 17',4,6,360,360,1,1,24,0,0),(2168,0,0,0,0,0,'Harbour Flats, Flat 12',4,7,400,400,1,1,20,0,0),(2169,0,0,0,0,0,'Harbour Flats, Flat 14',4,7,400,400,1,1,20,0,0),(2170,0,0,0,0,0,'Harbour Flats, Flat 16',4,7,400,400,1,1,20,0,0),(2171,0,0,0,0,0,'Harbour Flats, Flat 18',4,7,400,400,1,1,25,0,0),(2172,0,0,0,0,0,'Harbour Flats, Flat 21',4,14,860,860,1,2,35,0,0),(2173,0,0,0,0,0,'Harbour Flats, Flat 22',4,17,980,980,1,2,45,0,0),(2174,0,0,0,0,0,'Harbour Flats, Flat 23',4,7,400,400,1,1,25,0,0),(2175,0,0,0,0,0,'Harbour Lane 2a (Shop)',4,12,680,680,2,0,32,0,0),(2176,0,0,0,0,0,'Harbour Lane 2b (Shop)',4,12,680,680,2,0,40,0,0),(2177,0,0,0,0,0,'Harbour Lane 1 (Shop)',4,19,1040,1040,2,0,54,0,0),(2178,0,0,0,0,0,'Theater Avenue 6e',4,11,820,820,2,2,31,0,0),(2179,0,0,0,0,0,'Theater Avenue 6c',4,2,225,225,2,1,12,0,0),(2180,0,0,0,0,0,'Theater Avenue 6a',4,11,820,820,2,2,35,0,0),(2181,0,0,0,0,0,'Theater Avenue 6f',4,11,820,820,2,2,31,0,0),(2182,0,0,0,0,0,'Theater Avenue 6d',4,2,225,225,2,1,12,0,0),(2183,0,0,0,0,0,'Theater Avenue 6b',4,11,820,820,2,2,35,0,0),(2184,0,0,0,0,0,'East Lane 1a',4,48,2260,2260,1,2,95,0,0),(2185,0,0,0,0,0,'East Lane 1b',4,34,1700,1700,0,2,83,0,0),(2186,0,0,0,0,0,'East Lane 2',4,87,3900,3900,1,2,172,0,0),(2191,0,0,0,0,0,'Northern Street 5',4,41,1980,1980,1,2,94,0,0),(2192,0,0,0,0,0,'Northern Street 7',4,34,1700,1700,1,2,83,0,0),(2193,0,0,0,0,0,'Northern Street 3a',4,11,740,740,1,2,31,0,0),(2194,0,0,0,0,0,'Northern Street 3b',4,12,780,780,1,2,36,0,0),(2195,0,0,0,0,0,'Northern Street 1c',4,11,740,740,1,2,31,0,0),(2196,0,0,0,0,0,'Northern Street 1b',4,16,740,740,1,2,37,0,0),(2197,0,0,0,0,0,'Northern Street 1a',4,16,940,940,1,2,41,0,0),(2198,0,0,0,0,0,'Theater Avenue 7, Flat 06',4,4,315,315,2,1,20,0,0),(2199,0,0,0,0,0,'Theater Avenue 7, Flat 01',4,4,315,315,2,1,15,0,0),(2200,0,0,0,0,0,'Theater Avenue 7, Flat 05',4,6,405,405,1,1,20,0,0),(2201,0,0,0,0,0,'Theater Avenue 7, Flat 02',4,6,405,405,1,1,20,0,0),(2202,0,0,0,0,0,'Theater Avenue 7, Flat 04',4,8,495,495,2,1,20,0,0),(2203,0,0,0,0,0,'Theater Avenue 7, Flat 03',4,6,405,405,1,1,19,0,0),(2204,0,0,0,0,0,'Theater Avenue 7, Flat 14',4,8,495,495,1,1,20,0,0),(2205,0,0,0,0,0,'Theater Avenue 7, Flat 13',4,6,405,405,1,1,17,0,0),(2206,0,0,0,0,0,'Theater Avenue 7, Flat 15',4,6,405,405,1,1,19,0,0),(2207,0,0,0,0,0,'Theater Avenue 7, Flat 16',4,6,405,405,1,1,20,0,0),(2208,0,0,0,0,0,'Theater Avenue 7, Flat 11',4,8,495,495,1,1,23,0,0),(2209,0,0,0,0,0,'Theater Avenue 7, Flat 12',4,6,405,405,1,1,15,0,0),(2210,0,0,0,0,0,'Theater Avenue 8a',4,21,1270,1270,1,2,50,0,0),(2211,0,0,0,0,0,'Theater Avenue 8b',4,19,1370,1370,1,3,49,0,0),(2212,0,0,0,0,0,'Central Plaza 3',4,8,600,600,1,0,20,0,0),(2213,0,0,0,0,0,'Central Plaza 2',4,8,600,600,1,0,20,0,0),(2214,0,0,0,0,0,'Central Plaza 1',4,8,600,600,1,0,20,0,0),(2215,0,0,0,0,0,'Park Lane 1a',4,21,1220,1220,0,2,53,0,0),(2216,0,0,0,0,0,'Park Lane 3a',4,21,1220,1220,3,2,48,0,0),(2217,0,0,0,0,0,'Park Lane 1b',4,27,1380,1380,2,2,64,0,0),(2218,0,0,0,0,0,'Park Lane 3b',4,20,1100,1100,1,2,48,0,0),(2219,0,0,0,0,0,'Park Lane 4',4,16,980,980,1,2,42,0,0),(2220,0,0,0,0,0,'Park Lane 2',4,16,980,980,1,2,42,0,0),(2221,0,0,0,0,0,'Magician\'s Alley 8',4,21,1400,1400,1,2,42,0,0),(2222,0,0,0,0,0,'Moonkeep',4,240,13020,13020,15,16,522,0,0),(2225,0,0,0,0,0,'Castle, Basement, Flat 01',11,10,585,585,1,1,30,0,0),(2226,0,0,0,0,0,'Castle, Basement, Flat 02',11,10,585,585,1,1,20,0,0),(2227,0,0,0,0,0,'Castle, Basement, Flat 03',11,10,585,585,1,1,20,0,0),(2228,0,0,0,0,0,'Castle, Basement, Flat 04',11,10,585,585,1,1,20,0,0),(2229,0,0,0,0,0,'Castle, Basement, Flat 07',11,10,585,585,1,1,20,0,0),(2230,0,0,0,0,0,'Castle, Basement, Flat 08',11,10,585,585,1,1,20,0,0),(2231,0,0,0,0,0,'Castle, Basement, Flat 09',11,10,585,585,1,1,24,0,0),(2232,0,0,0,0,0,'Castle, Basement, Flat 06',11,10,585,585,1,1,24,0,0),(2233,0,0,0,0,0,'Castle, Basement, Flat 05',11,10,585,585,1,1,24,0,0),(2234,0,0,0,0,0,'Castle Shop 1',11,31,1890,1890,4,1,67,0,0),(2235,0,0,0,0,0,'Castle Shop 2',11,31,1890,1890,4,1,70,0,0),(2236,0,0,0,0,0,'Castle Shop 3',11,31,1890,1890,4,1,67,0,0),(2237,0,0,0,0,0,'Castle, 4th Floor, Flat 09',11,13,720,720,1,1,28,0,0),(2238,0,0,0,0,0,'Castle, 4th Floor, Flat 08',11,18,945,945,1,1,42,0,0),(2239,0,0,0,0,0,'Castle, 4th Floor, Flat 06',11,18,945,945,1,1,36,0,0),(2240,0,0,0,0,0,'Castle, 4th Floor, Flat 07',11,13,720,720,1,1,30,0,0),(2241,0,0,0,0,0,'Castle, 4th Floor, Flat 05',11,14,765,765,1,1,30,0,0),(2242,0,0,0,0,0,'Castle, 4th Floor, Flat 04',11,10,585,585,1,1,25,0,0),(2243,0,0,0,0,0,'Castle, 4th Floor, Flat 03',11,10,585,585,1,1,30,0,0),(2244,0,0,0,0,0,'Castle, 4th Floor, Flat 02',11,14,765,765,1,1,30,0,0),(2245,0,0,0,0,0,'Castle, 4th Floor, Flat 01',11,10,585,585,1,1,30,0,0),(2246,0,0,0,0,0,'Castle, 3rd Floor, Flat 01',11,10,585,585,2,1,30,0,0),(2247,0,0,0,0,0,'Castle, 3rd Floor, Flat 02',11,14,765,765,1,1,30,0,0),(2248,0,0,0,0,0,'Castle, 3rd Floor, Flat 03',11,10,585,585,1,1,25,0,0),(2249,0,0,0,0,0,'Castle, 3rd Floor, Flat 05',11,14,765,765,1,1,30,0,0),(2250,0,0,0,0,0,'Castle, 3rd Floor, Flat 04',11,10,585,585,1,1,25,0,0),(2251,0,0,0,0,0,'Castle, 3rd Floor, Flat 06',11,16,1045,1045,1,2,36,0,0),(2252,0,0,0,0,0,'Castle, 3rd Floor, Flat 07',11,13,720,720,1,1,30,0,0),(2253,0,0,0,0,0,'Castle Street 1',11,53,2900,2900,8,3,112,0,0),(2254,0,0,0,0,0,'Castle Street 2',11,26,1495,1495,4,2,56,0,0),(2255,0,0,0,0,0,'Castle Street 3',11,32,1765,1765,3,2,56,0,0),(2256,0,0,0,0,0,'Castle Street 4',11,32,1765,1765,3,2,64,0,0),(2257,0,0,0,0,0,'Castle Street 5',11,32,1765,1765,3,2,61,0,0),(2258,0,0,0,0,0,'Edron Flats, Basement Flat 2',11,31,1540,1540,1,2,48,0,0),(2259,0,0,0,0,0,'Edron Flats, Basement Flat 1',11,31,1540,1540,1,2,48,0,0),(2260,0,0,0,0,0,'Edron Flats, Flat 01',11,7,400,400,1,1,20,0,0),(2261,0,0,0,0,0,'Edron Flats, Flat 02',11,14,860,860,1,2,28,0,0),(2262,0,0,0,0,0,'Edron Flats, Flat 03',11,7,400,400,2,1,20,0,0),(2263,0,0,0,0,0,'Edron Flats, Flat 04',11,7,400,400,1,1,20,0,0),(2264,0,0,0,0,0,'Edron Flats, Flat 06',11,7,400,400,2,1,20,0,0),(2265,0,0,0,0,0,'Edron Flats, Flat 05',11,7,400,400,1,1,20,0,0),(2266,0,0,0,0,0,'Edron Flats, Flat 07',11,7,400,400,2,1,20,0,0),(2267,0,0,0,0,0,'Edron Flats, Flat 08',11,7,400,400,1,1,20,0,0),(2268,0,0,0,0,0,'Edron Flats, Flat 11',11,7,400,400,1,1,25,0,0),(2269,0,0,0,0,0,'Edron Flats, Flat 12',11,7,400,400,2,1,25,0,0),(2270,0,0,0,0,0,'Edron Flats, Flat 14',11,7,400,400,1,1,25,0,0),(2271,0,0,0,0,0,'Edron Flats, Flat 13',11,7,400,400,2,1,25,0,0),(2272,0,0,0,0,0,'Edron Flats, Flat 16',11,7,400,400,2,1,20,0,0),(2273,0,0,0,0,0,'Edron Flats, Flat 15',11,7,400,400,1,1,20,0,0),(2274,0,0,0,0,0,'Edron Flats, Flat 18',11,7,400,400,1,1,20,0,0),(2275,0,0,0,0,0,'Edron Flats, Flat 17',11,7,400,400,2,1,20,0,0),(2276,0,0,0,0,0,'Edron Flats, Flat 22',11,7,400,400,2,1,25,0,0),(2277,0,0,0,0,0,'Edron Flats, Flat 21',11,14,860,860,1,2,40,0,0),(2278,0,0,0,0,0,'Edron Flats, Flat 24',11,7,400,400,1,1,20,0,0),(2279,0,0,0,0,0,'Edron Flats, Flat 23',11,7,400,400,2,1,25,0,0),(2280,0,0,0,0,0,'Edron Flats, Flat 26',11,7,400,400,2,1,20,0,0),(2281,0,0,0,0,0,'Edron Flats, Flat 27',11,7,400,400,2,1,20,0,0),(2282,0,0,0,0,0,'Edron Flats, Flat 28',11,7,400,400,1,1,20,0,0),(2283,0,0,0,0,0,'Edron Flats, Flat 25',11,7,400,400,1,1,20,0,0),(2284,0,0,0,0,0,'',0,24,520000,520000,2,2,56,0,0),(2285,0,0,0,0,0,'',0,24,520000,520000,2,2,59,0,0),(2286,0,0,0,0,0,'',0,29,580000,580000,0,0,49,0,0),(2287,0,0,0,0,0,'',0,29,580000,580000,0,0,49,0,0),(2288,0,0,0,0,0,'Central Circle 5',11,79,4160,4160,7,5,161,0,0),(2289,0,0,0,0,0,'Central Circle 6 (Shop)',11,84,3980,3980,10,2,182,0,0),(2290,0,0,0,0,0,'Central Circle 7 (Shop)',11,84,3980,3980,10,2,161,0,0),(2291,0,0,0,0,0,'Central Circle 8 (Shop)',11,84,3980,3980,10,2,166,0,0),(2292,0,0,0,0,0,'Central Circle 9a',11,16,940,940,2,2,42,0,0),(2293,0,0,0,0,0,'Central Circle 9b',11,18,940,940,2,2,44,0,0),(2294,0,0,0,0,0,'Sky Lane, Guild 1',11,342,21145,21145,20,23,666,0,0),(2295,0,0,0,0,0,'Sky Lane, Guild 2',11,344,19300,19300,23,14,650,0,0),(2296,0,0,0,0,0,'Sky Lane, Guild 3',11,296,17315,17315,23,18,564,0,0),(2297,0,0,0,0,0,'Sky Lane, Sea Tower',11,80,4775,4775,9,6,196,0,0),(2298,0,0,0,0,0,'',0,23,500000,500000,3,2,56,0,0),(2299,0,0,0,0,0,'',0,20,440000,440000,1,2,56,0,0),(2300,0,0,0,0,0,'Wood Avenue 10a',11,26,1540,1540,4,2,64,0,0),(2301,0,0,0,0,0,'Wood Avenue 11',11,130,7205,7205,13,6,253,0,0),(2302,0,0,0,0,0,'',0,33,660000,660000,1,0,60,0,0),(2303,0,0,0,0,0,'',0,66,1320000,1320000,1,0,86,0,0),(2304,0,0,0,0,0,'Wood Avenue 6b',11,23,1450,1450,5,2,56,0,0),(2305,0,0,0,0,0,'Wood Avenue 9b',11,25,1495,1495,2,2,56,0,0),(2306,0,0,0,0,0,'Wood Avenue 10b',11,22,1595,1595,4,3,64,0,0),(2307,0,0,0,0,0,'',0,32,680000,680000,0,2,64,0,0),(2308,0,0,0,0,0,'Wood Avenue 4a',11,26,1495,1495,2,2,56,0,0),(2309,0,0,0,0,0,'Wood Avenue 4b',11,26,1495,1495,3,2,56,0,0),(2310,0,0,0,0,0,'Wood Avenue 4c',11,32,1765,1765,2,2,56,0,0),(2311,0,0,0,0,0,'Wood Avenue 4',11,32,1765,1765,2,2,64,0,0),(2312,0,0,0,0,0,'Wood Avenue 3',11,32,1765,1765,3,2,56,0,0),(2313,0,0,0,0,0,'Wood Avenue 2',11,32,1765,1765,2,2,49,0,0),(2314,0,0,0,0,0,'Wood Avenue 1',11,32,1765,1765,2,2,64,0,0),(2315,0,0,0,0,0,'Magic Academy, Guild',11,155,12025,12025,7,14,414,0,0),(2316,0,0,0,0,0,'Magic Academy, Flat 1',11,16,1465,1465,2,3,57,0,0),(2317,0,0,0,0,0,'Magic Academy, Flat 2',11,21,1530,1530,1,2,55,0,0),(2318,0,0,0,0,0,'Magic Academy, Flat 3',11,24,1430,1430,1,1,55,0,0),(2319,0,0,0,0,0,'Magic Academy, Flat 4',11,21,1530,1530,1,2,55,0,0),(2320,0,0,0,0,0,'Magic Academy, Flat 5',11,23,1430,1430,1,1,55,0,0),(2321,0,0,0,0,0,'Magic Academy, Shop',11,18,1595,1595,1,1,48,0,0),(2322,0,0,0,0,0,'Stonehome Village 1',11,36,1780,1780,4,2,74,0,0),(2323,0,0,0,0,0,'Stonehome Flats, Flat 05',11,7,400,400,2,1,20,0,0),(2324,0,0,0,0,0,'Stonehome Flats, Flat 04',11,7,400,400,2,1,25,0,0),(2325,0,0,0,0,0,'Stonehome Flats, Flat 06',11,7,400,400,2,1,20,0,0),(2326,0,0,0,0,0,'Stonehome Flats, Flat 03',11,7,400,400,2,1,20,0,0),(2327,0,0,0,0,0,'Stonehome Flats, Flat 01',11,7,400,400,2,1,20,0,0),(2328,0,0,0,0,0,'Stonehome Flats, Flat 02',11,11,740,740,3,2,30,0,0),(2329,0,0,0,0,0,'Stonehome Flats, Flat 11',11,11,740,740,2,2,35,0,0),(2330,0,0,0,0,0,'Stonehome Flats, Flat 12',11,11,740,740,3,2,35,0,0),(2331,0,0,0,0,0,'Stonehome Flats, Flat 13',11,7,400,400,2,1,20,0,0),(2332,0,0,0,0,0,'Stonehome Flats, Flat 14',11,7,400,400,2,1,20,0,0),(2333,0,0,0,0,0,'Stonehome Flats, Flat 16',11,7,400,400,2,1,20,0,0),(2334,0,0,0,0,0,'Stonehome Flats, Flat 15',11,7,400,400,2,1,20,0,0),(2335,0,0,0,0,0,'Stonehome Village 2',11,13,640,640,3,1,35,0,0),(2336,0,0,0,0,0,'Stonehome Village 3',11,14,680,680,3,1,36,0,0),(2337,0,0,0,0,0,'Stonehome Village 4',11,16,940,940,2,2,42,0,0),(2338,0,0,0,0,0,'Stonehome Village 6',11,25,1300,1300,2,2,55,0,0),(2339,0,0,0,0,0,'Stonehome Village 5',11,28,1140,1140,2,2,56,0,0),(2340,0,0,0,0,0,'Stonehome Village 7',11,21,1140,1140,2,2,49,0,0),(2341,0,0,0,0,0,'Stonehome Village 8',11,14,680,680,2,1,36,0,0),(2342,0,0,0,0,0,'Stonehome Village 9',11,14,680,680,2,1,36,0,0),(2343,0,0,0,0,0,'Stonehome Clanhall',11,157,8580,8580,24,9,345,0,0),(2344,0,0,0,0,0,'Cormaya 1',11,21,1270,1270,3,2,49,0,0),(2345,0,0,0,0,0,'Cormaya 2',11,70,3710,3710,6,3,145,0,0),(2346,0,0,0,0,0,'Cormaya Flats, Flat 01',11,7,450,450,2,1,20,0,0),(2347,0,0,0,0,0,'Cormaya Flats, Flat 02',11,7,450,450,2,1,20,0,0),(2348,0,0,0,0,0,'Cormaya Flats, Flat 03',11,11,820,820,2,2,30,0,0),(2349,0,0,0,0,0,'Cormaya Flats, Flat 06',11,7,450,450,2,1,20,0,0),(2350,0,0,0,0,0,'Cormaya Flats, Flat 05',11,7,450,450,2,1,20,0,0),(2351,0,0,0,0,0,'Cormaya Flats, Flat 04',11,11,820,820,2,2,30,0,0),(2352,0,0,0,0,0,'Cormaya Flats, Flat 13',11,11,820,820,2,2,30,0,0),(2353,0,0,0,0,0,'Cormaya Flats, Flat 14',11,11,820,820,2,2,35,0,0),(2354,0,0,0,0,0,'Cormaya Flats, Flat 15',11,7,450,450,2,1,20,0,0),(2355,0,0,0,0,0,'Cormaya Flats, Flat 16',11,7,450,450,2,1,20,0,0),(2356,0,0,0,0,0,'Cormaya Flats, Flat 11',11,7,450,450,2,1,20,0,0),(2357,0,0,0,0,0,'Cormaya Flats, Flat 12',11,7,450,450,2,1,20,0,0),(2358,0,0,0,0,0,'Cormaya 3',11,38,2035,2035,3,2,72,0,0),(2359,0,0,0,0,0,'Castle of the White Dragon',11,442,25110,25110,24,19,882,0,0),(2360,0,0,0,0,0,'Cormaya 4',11,31,1720,1720,3,2,63,0,0),(2361,0,0,0,0,0,'Cormaya 5',11,77,4250,4250,7,3,167,0,0),(2362,0,0,0,0,0,'Cormaya 6',11,46,2395,2395,3,2,84,0,0),(2363,0,0,0,0,0,'Cormaya 7',11,46,2395,2395,1,2,84,0,0),(2364,0,0,0,0,0,'Cormaya 8',11,53,2710,2710,4,2,113,0,0),(2365,0,0,0,0,0,'Cormaya 9b',11,50,2620,2620,4,2,88,0,0),(2366,0,0,0,0,0,'Cormaya 9a',11,20,1225,1225,2,2,48,0,0),(2367,0,0,0,0,0,'Cormaya 9c',11,20,1225,1225,2,2,48,0,0),(2368,0,0,0,0,0,'Cormaya 9d',11,50,2620,2620,5,2,88,0,0),(2369,0,0,0,0,0,'Cormaya 10',11,73,3800,3800,5,3,140,0,0),(2370,0,0,0,0,0,'Cormaya 11',11,38,2035,2035,3,2,72,0,0),(2371,0,0,0,0,0,'Demon Tower',2,50,3340,3340,1,2,127,0,0),(2372,0,0,0,0,0,'Nautic Observer',4,145,6540,6540,4,4,300,0,0),(2373,0,0,0,0,0,'Riverspring',3,284,19450,19450,33,18,632,0,0),(2374,0,0,0,0,0,'House of Recreation',4,337,22540,22540,5,16,702,0,0),(2375,0,0,0,0,0,'Valorous Venore',1,271,14435,14435,29,9,507,0,0),(2376,0,0,0,0,0,'Ab\'Dendriel Clanhall',5,264,14850,14850,17,10,498,0,0),(2377,0,0,0,0,0,'Castle of the Winds',5,422,23885,23885,26,18,842,0,0),(2378,0,0,0,0,0,'The Hideout',5,321,20800,20800,14,20,597,0,0),(2379,0,0,0,0,0,'Shadow Towers',5,348,21800,21800,21,18,750,0,0),(2380,0,0,0,0,0,'Hill Hideout',3,193,13950,13950,8,15,346,0,0),(2381,0,0,0,0,0,'Meriana Beach',7,140,8230,8230,2,3,184,0,0),(2382,0,0,0,0,0,'Darashia 8, Flat 01',10,52,2485,2485,1,0,80,0,0),(2383,0,0,0,0,0,'Darashia 8, Flat 02',10,71,3385,3385,2,0,114,0,0),(2384,0,0,0,0,0,'Darashia 8, Flat 03',10,92,4700,4700,5,2,171,0,0),(2385,0,0,0,0,0,'Darashia 8, Flat 04',10,60,2845,2845,0,0,76,0,0),(2386,0,0,0,0,0,'Darashia 8, Flat 05',10,54,2665,2665,1,1,75,0,0),(2387,0,0,0,0,0,'Darashia, Eastern Guildhall',10,204,12660,12660,15,16,444,0,0),(2388,0,0,0,0,0,'Theater Avenue 5a',4,7,450,450,1,1,20,0,0),(2389,0,0,0,0,0,'Theater Avenue 5b',4,7,450,450,1,1,19,0,0),(2390,0,0,0,0,0,'Theater Avenue 5c',4,7,450,450,1,1,16,0,0),(2391,0,0,0,0,0,'Theater Avenue 5d',4,7,450,450,1,1,16,0,0),(2392,0,0,0,0,0,'Harbour Place 1',2,17,3000,3000,4,0,35,0,0),(2393,0,0,0,0,0,'Harbour Place 2',2,20,3500,3500,3,0,42,0,0),(2394,0,0,0,0,0,'Sunset Homes, Flat 01',2,12,2000,2000,1,0,20,0,0),(2395,0,0,0,0,0,'Sunset Homes, Flat 02',2,12,2000,2000,1,0,20,0,0),(2396,0,0,0,0,0,'Sunset Homes, Flat 03',2,12,2000,2000,1,0,20,0,0),(2397,0,0,0,0,0,'Main Street 9, 1st floor',2,24,4500,4500,4,0,50,0,0),(2398,0,0,0,0,0,'Farm Lane, 1st floor',2,16,4000,4000,2,0,25,0,0),(2399,0,0,0,0,0,'Beach Home Apartments, Flat 01',2,12,2200,2200,1,0,23,0,0),(2400,0,0,0,0,0,'Beach Home Apartments, Flat 02',2,12,2200,2200,1,0,23,0,0),(2401,0,0,0,0,0,'Beach Home Apartments, Flat 03',2,12,2300,2300,1,0,20,0,0),(2402,0,0,0,0,0,'Beach Home Apartments, Flat 04',2,13,3300,3300,1,0,20,0,0),(2403,0,0,0,0,0,'Gengia House 19',0,13,280000,280000,0,1,19,0,0),(2404,0,0,0,0,0,'Gengia House 20',0,10,220000,220000,0,1,13,0,0),(2405,0,0,0,0,0,'Gengia House 21',0,8,160000,160000,0,0,8,0,0),(2406,0,0,0,0,0,'OTX headquarter (Flat 1, Area 42)',0,0,0,0,2,2,51,0,0);
/*!40000 ALTER TABLE `houses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ioe`
--

DROP TABLE IF EXISTS `ioe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ioe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `data` varchar(255) NOT NULL,
  `hora` varchar(255) NOT NULL,
  `itemid` int(11) NOT NULL,
  `boss` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ioe`
--

LOCK TABLES `ioe` WRITE;
/*!40000 ALTER TABLE `ioe` DISABLE KEYS */;
/*!40000 ALTER TABLE `ioe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `killers`
--

DROP TABLE IF EXISTS `killers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `killers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `death_id` int(11) NOT NULL,
  `final_hit` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `unjustified` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `war` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `death_id` (`death_id`),
  CONSTRAINT `killers_ibfk_1` FOREIGN KEY (`death_id`) REFERENCES `player_deaths` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5632 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `killers`
--

LOCK TABLES `killers` WRITE;
/*!40000 ALTER TABLE `killers` DISABLE KEYS */;
INSERT INTO `killers` VALUES (5394,2091,1,0,0),(5395,2091,0,0,0),(5396,2092,1,0,0),(5397,2093,1,0,0),(5398,2094,1,0,0),(5399,2094,0,0,0),(5400,2094,0,0,0),(5401,2094,0,0,0),(5402,2095,1,0,0),(5403,2096,1,0,0),(5404,2096,0,0,0),(5405,2096,0,0,0),(5406,2096,0,0,0),(5407,2096,0,0,0),(5408,2097,1,0,0),(5409,2097,0,0,0),(5410,2097,0,0,0),(5411,2098,1,0,0),(5412,2098,0,0,0),(5413,2098,0,0,0),(5414,2099,1,0,0),(5415,2100,1,0,0),(5416,2100,0,0,0),(5417,2100,0,0,0),(5418,2100,0,0,0),(5419,2100,0,0,0),(5420,2100,0,0,0),(5421,2100,0,0,0),(5422,2100,0,0,0),(5423,2100,0,0,0),(5424,2101,1,0,0),(5425,2101,0,0,0),(5426,2101,0,0,0),(5427,2101,0,0,0),(5428,2102,1,0,0),(5429,2102,0,0,0),(5430,2102,0,0,0),(5431,2102,0,0,0),(5432,2102,0,0,0),(5433,2103,1,0,0),(5434,2103,0,0,0),(5435,2103,0,0,0),(5436,2104,1,0,0),(5437,2105,1,0,0),(5438,2106,1,0,0),(5439,2106,0,0,0),(5440,2107,1,0,0),(5441,2107,0,0,0),(5442,2107,0,0,0),(5443,2107,0,0,0),(5444,2107,0,0,0),(5445,2107,0,0,0),(5446,2108,1,0,0),(5447,2109,1,0,0),(5448,2109,0,0,0),(5449,2109,0,0,0),(5450,2109,0,0,0),(5451,2110,1,0,0),(5452,2110,0,0,0),(5453,2111,1,0,0),(5454,2112,1,0,0),(5455,2113,1,1,0),(5456,2113,0,0,0),(5457,2114,1,0,0),(5458,2114,0,0,0),(5459,2115,1,0,0),(5460,2116,1,0,0),(5461,2117,1,0,0),(5462,2117,0,0,0),(5463,2117,0,0,0),(5464,2117,0,0,0),(5465,2118,1,0,0),(5466,2118,0,0,0),(5467,2118,0,0,0),(5468,2118,0,0,0),(5469,2118,0,0,0),(5470,2118,0,0,0),(5471,2118,0,0,0),(5472,2118,0,0,0),(5473,2118,0,0,0),(5474,2118,0,0,0),(5475,2118,0,0,0),(5476,2118,0,0,0),(5477,2119,1,0,0),(5478,2119,0,0,0),(5479,2119,0,0,0),(5480,2119,0,0,0),(5481,2120,1,0,0),(5482,2121,1,0,0),(5483,2122,1,0,0),(5484,2122,0,0,0),(5485,2122,0,0,0),(5486,2123,1,0,0),(5487,2124,1,0,0),(5488,2125,1,0,0),(5489,2126,1,0,0),(5490,2127,1,0,0),(5491,2128,1,0,0),(5492,2129,1,0,0),(5493,2130,1,0,0),(5494,2130,0,0,0),(5495,2130,0,0,0),(5496,2130,0,0,0),(5497,2130,0,0,0),(5498,2131,1,0,0),(5499,2131,0,0,0),(5500,2131,0,0,0),(5501,2132,1,0,0),(5502,2132,0,0,0),(5503,2132,0,0,0),(5504,2133,1,0,0),(5505,2133,0,0,0),(5506,2133,0,0,0),(5507,2134,1,0,0),(5508,2134,0,0,0),(5509,2134,0,0,0),(5510,2134,0,0,0),(5511,2134,0,0,0),(5512,2135,1,0,0),(5513,2135,0,0,0),(5514,2135,0,0,0),(5515,2135,0,0,0),(5516,2136,1,0,0),(5517,2136,0,0,0),(5518,2137,1,0,0),(5519,2137,0,0,0),(5520,2138,1,0,0),(5521,2138,0,0,0),(5522,2138,0,0,0),(5523,2138,0,0,0),(5524,2138,0,0,0),(5525,2139,1,0,0),(5526,2139,0,0,0),(5527,2139,0,0,0),(5528,2139,0,0,0),(5529,2139,0,0,0),(5530,2139,0,0,0),(5531,2140,1,0,0),(5532,2141,1,0,0),(5533,2142,1,0,0),(5534,2142,0,0,0),(5535,2142,0,0,0),(5536,2142,0,0,0),(5537,2143,1,0,0),(5538,2143,0,0,0),(5539,2144,1,0,0),(5540,2144,0,0,0),(5541,2144,0,0,0),(5542,2144,0,0,0),(5543,2144,0,0,0),(5544,2144,0,0,0),(5545,2145,1,0,0),(5546,2145,0,0,0),(5547,2146,1,0,0),(5548,2147,1,0,0),(5549,2148,1,0,0),(5550,2148,0,0,0),(5551,2149,1,0,0),(5552,2149,0,0,0),(5553,2149,0,0,0),(5554,2149,0,0,0),(5555,2149,0,0,0),(5556,2149,0,0,0),(5557,2149,0,0,0),(5558,2149,0,0,0),(5559,2149,0,0,0),(5560,2150,1,0,0),(5561,2150,0,0,0),(5562,2150,0,0,0),(5563,2150,0,0,0),(5564,2150,0,0,0),(5565,2150,0,0,0),(5566,2150,0,0,0),(5567,2150,0,0,0),(5568,2151,1,0,0),(5569,2151,0,0,0),(5570,2151,0,0,0),(5571,2151,0,0,0),(5572,2151,0,0,0),(5573,2151,0,0,0),(5574,2151,0,0,0),(5575,2151,0,0,0),(5576,2151,0,0,0),(5577,2151,0,0,0),(5578,2152,1,0,0),(5579,2152,0,0,0),(5580,2152,0,0,0),(5581,2152,0,0,0),(5582,2153,1,0,0),(5583,2153,0,0,0),(5584,2154,1,0,0),(5585,2155,1,0,0),(5586,2155,0,0,0),(5587,2155,0,0,0),(5588,2155,0,0,0),(5589,2156,1,0,0),(5590,2157,1,0,0),(5591,2157,0,0,0),(5592,2157,0,0,0),(5593,2158,1,0,0),(5594,2159,1,0,0),(5595,2159,0,0,0),(5596,2159,0,0,0),(5597,2159,0,0,0),(5598,2159,0,0,0),(5599,2160,1,0,0),(5600,2160,0,0,0),(5601,2161,1,0,0),(5602,2162,1,0,0),(5603,2162,0,0,0),(5604,2162,0,0,0),(5605,2163,1,0,0),(5606,2163,0,0,0),(5607,2163,0,0,0),(5608,2164,1,0,0),(5609,2164,0,0,0),(5610,2165,1,0,0),(5611,2165,0,0,0),(5612,2166,1,0,0),(5613,2166,0,0,0),(5614,2167,1,0,0),(5615,2168,1,0,0),(5616,2169,1,0,0),(5617,2169,0,0,0),(5618,2169,0,0,0),(5619,2170,1,0,0),(5620,2170,0,0,0),(5621,2170,0,0,0),(5622,2170,0,0,0),(5623,2171,1,0,0),(5624,2171,0,0,0),(5625,2171,0,0,0),(5626,2172,1,0,0),(5627,2172,0,0,0),(5628,2172,0,0,0),(5629,2173,1,0,0),(5630,2174,1,0,0),(5631,2175,1,0,0);
/*!40000 ALTER TABLE `killers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_history`
--

DROP TABLE IF EXISTS `login_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_history` (
  `account_id` int(11) NOT NULL DEFAULT '0',
  `player_id` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `login` tinyint(1) NOT NULL DEFAULT '0',
  `ip` int(11) NOT NULL DEFAULT '0',
  `date` int(11) NOT NULL DEFAULT '0',
  KEY `player_id` (`player_id`),
  CONSTRAINT `login_history_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_history`
--

LOCK TABLES `login_history` WRITE;
/*!40000 ALTER TABLE `login_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lottery`
--

DROP TABLE IF EXISTS `lottery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lottery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `item_name` varchar(255) NOT NULL,
  `date` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lottery`
--

LOCK TABLES `lottery` WRITE;
/*!40000 ALTER TABLE `lottery` DISABLE KEYS */;
INSERT INTO `lottery` VALUES (1,'Godzinhu','5958',0,'winning lottery ticket','30/04/2019 - 22:00:25'),(2,'Kryon','5958',0,'winning lottery ticket','02/05/2019 - 21:00:10'),(3,'Todoroki','5958',0,'winning lottery ticket','04/05/2019 - 18:00:16'),(4,'Master Lannister','5958',0,'winning lottery ticket','05/05/2019 - 07:00:35'),(5,'Quase Ouro','5958',0,'winning lottery ticket','06/05/2019 - 18:00:45'),(6,'Eu tentei','5958',0,'winning lottery ticket','06/05/2019 - 21:00:51'),(7,'Todoroki','5958',0,'winning lottery ticket','07/05/2019 - 00:00:55');
/*!40000 ALTER TABLE `lottery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marriage_system`
--

DROP TABLE IF EXISTS `marriage_system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marriage_system` (
  `id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `partner` varchar(255) NOT NULL,
  `marriage_date` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marriage_system`
--

LOCK TABLES `marriage_system` WRITE;
/*!40000 ALTER TABLE `marriage_system` DISABLE KEYS */;
/*!40000 ALTER TABLE `marriage_system` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagseguro_transactions`
--

DROP TABLE IF EXISTS `pagseguro_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagseguro_transactions` (
  `transaction_code` varchar(36) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `payment_method` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `item_count` int(11) NOT NULL,
  `data` datetime NOT NULL,
  UNIQUE KEY `transaction_code` (`transaction_code`,`status`),
  KEY `name` (`name`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagseguro_transactions`
--

LOCK TABLES `pagseguro_transactions` WRITE;
/*!40000 ALTER TABLE `pagseguro_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagseguro_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagsegurotransacoes`
--

DROP TABLE IF EXISTS `pagsegurotransacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagsegurotransacoes` (
  `TransacaoID` varchar(36) NOT NULL,
  `VendedorEmail` varchar(200) NOT NULL,
  `Referencia` varchar(200) DEFAULT NULL,
  `TipoFrete` char(2) DEFAULT NULL,
  `ValorFrete` decimal(10,2) DEFAULT NULL,
  `Extras` decimal(10,2) DEFAULT NULL,
  `Anotacao` text,
  `TipoPagamento` varchar(50) NOT NULL,
  `StatusTransacao` varchar(50) NOT NULL,
  `CliNome` varchar(200) NOT NULL,
  `CliEmail` varchar(200) NOT NULL,
  `CliEndereco` varchar(200) NOT NULL,
  `CliNumero` varchar(10) DEFAULT NULL,
  `CliComplemento` varchar(100) DEFAULT NULL,
  `CliBairro` varchar(100) NOT NULL,
  `CliCidade` varchar(100) NOT NULL,
  `CliEstado` char(2) NOT NULL,
  `CliCEP` varchar(9) NOT NULL,
  `CliTelefone` varchar(14) DEFAULT NULL,
  `NumItens` int(11) NOT NULL,
  `Data` datetime NOT NULL,
  `ProdQuantidade_x` int(5) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `TransacaoID` (`TransacaoID`,`StatusTransacao`),
  KEY `Referencia` (`Referencia`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagsegurotransacoes`
--

LOCK TABLES `pagsegurotransacoes` WRITE;
/*!40000 ALTER TABLE `pagsegurotransacoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagsegurotransacoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_deaths`
--

DROP TABLE IF EXISTS `player_deaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_deaths` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) NOT NULL,
  `date` bigint(20) unsigned NOT NULL,
  `level` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `date` (`date`),
  KEY `player_id` (`player_id`),
  CONSTRAINT `player_deaths_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2176 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_deaths`
--

LOCK TABLES `player_deaths` WRITE;
/*!40000 ALTER TABLE `player_deaths` DISABLE KEYS */;
INSERT INTO `player_deaths` VALUES (2091,42,1557166489,108),(2092,42,1557166553,108),(2093,43,1557166669,8),(2094,43,1557167053,7),(2095,43,1557167389,29),(2096,43,1557168223,136),(2097,43,1557168633,176),(2098,46,1557168994,30),(2099,47,1557171022,143),(2100,48,1557172039,267),(2101,48,1557172292,271),(2102,48,1557172591,286),(2103,36,1557172959,17),(2104,46,1557173621,183),(2105,50,1557174537,121),(2106,46,1557174685,186),(2107,48,1557174809,342),(2108,46,1557174837,184),(2109,48,1557175308,362),(2110,50,1557175376,144),(2111,46,1557175510,182),(2112,50,1557175896,163),(2113,36,1557176442,69),(2114,36,1557176479,69),(2115,52,1557176914,90),(2116,52,1557176947,89),(2117,46,1557177649,205),(2118,48,1557177722,381),(2119,52,1557180160,143),(2120,52,1557182101,199),(2121,46,1557182103,204),(2122,52,1557182415,205),(2123,46,1557182504,211),(2124,46,1557182610,209),(2125,46,1557182711,208),(2126,46,1557182921,208),(2127,46,1557183103,206),(2128,46,1557183898,243),(2129,57,1557184662,92),(2130,46,1557185436,256),(2131,46,1557185539,253),(2132,46,1557185593,250),(2133,52,1557185764,217),(2134,52,1557185846,216),(2135,46,1557185925,249),(2136,60,1557186397,31),(2137,60,1557186509,56),(2138,59,1557186816,134),(2139,59,1557187339,171),(2140,46,1557187636,252),(2141,57,1557187709,295),(2142,60,1557187919,131),(2143,59,1557188485,195),(2144,60,1557188545,155),(2145,46,1557189165,269),(2146,59,1557191850,274),(2147,59,1557192081,274),(2148,59,1557192272,272),(2149,57,1557193335,356),(2150,36,1557193888,554),(2151,36,1557194306,551),(2152,61,1557195466,88),(2153,61,1557195836,118),(2154,65,1557196895,58),(2155,65,1557197329,121),(2156,61,1557198218,153),(2157,65,1557198786,180),(2158,61,1557200162,206),(2159,67,1557200985,56),(2160,67,1557202274,78),(2161,67,1557202792,160),(2162,61,1557203257,235),(2163,61,1557203378,234),(2164,67,1557203547,190),(2165,67,1557204982,203),(2166,67,1557205032,203),(2167,61,1557205037,253),(2168,67,1557205159,210),(2169,67,1557205253,208),(2170,67,1557205324,207),(2171,67,1557205419,207),(2172,69,1557207810,127),(2173,69,1557208672,136),(2174,61,1557209160,291),(2175,69,1557212844,342);
/*!40000 ALTER TABLE `player_deaths` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_depotitems`
--

DROP TABLE IF EXISTS `player_depotitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_depotitems` (
  `player_id` int(11) NOT NULL,
  `sid` int(11) NOT NULL COMMENT 'any given range, eg. 0-100 is reserved for depot lockers and all above 100 will be normal items inside depots',
  `pid` int(11) NOT NULL DEFAULT '0',
  `itemtype` int(11) NOT NULL,
  `count` int(11) NOT NULL DEFAULT '0',
  `attributes` blob NOT NULL,
  `serial` varchar(255) NOT NULL DEFAULT '',
  UNIQUE KEY `player_id_2` (`player_id`,`sid`),
  KEY `player_id` (`player_id`),
  CONSTRAINT `player_depotitems_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_depotitems`
--

LOCK TABLES `player_depotitems` WRITE;
/*!40000 ALTER TABLE `player_depotitems` DISABLE KEYS */;
INSERT INTO `player_depotitems` VALUES (9,101,1,2589,1,'',''),(9,102,101,2594,1,'',''),(46,101,1,2589,1,'',''),(46,102,101,2594,1,'',''),(46,103,102,12715,4,'',''),(46,104,102,2152,83,'S',''),(46,105,102,2498,1,'',''),(46,106,102,2498,1,'',''),(46,107,102,7402,1,'',''),(46,108,102,2528,1,'',''),(46,109,102,2528,1,'',''),(46,110,102,7399,1,'',''),(46,111,102,2528,1,'',''),(46,112,102,2392,1,'',''),(46,113,102,2528,1,'',''),(46,114,102,2528,1,'',''),(46,115,102,2528,1,'',''),(46,116,102,2528,1,'',''),(46,117,102,2528,1,'',''),(46,118,102,2528,1,'',''),(46,119,102,2195,1,'',''),(52,101,1,2589,1,'',''),(52,102,101,2594,1,'',''),(60,101,1,2589,1,'',''),(60,102,101,2594,1,'',''),(60,103,102,7415,1,'',''),(60,104,102,7434,1,'',''),(60,105,102,10521,1,'',''),(60,106,105,2491,1,'',''),(60,107,105,2488,1,'',''),(60,108,105,2487,1,'',''),(60,109,105,2195,1,'',''),(60,110,105,2514,1,'',''),(60,111,105,7382,1,'',''),(61,101,1,2589,1,'',''),(61,102,101,12715,37,'%',''),(61,103,101,2594,1,'',''),(69,101,1,2589,1,'',''),(69,102,101,2594,1,'',''),(69,103,102,3967,1,'',''),(69,104,102,5810,1,'',''),(69,105,102,9141,1,'',''),(69,106,102,7958,1,'','');
/*!40000 ALTER TABLE `player_depotitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_inboxitems`
--

DROP TABLE IF EXISTS `player_inboxitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_inboxitems` (
  `player_id` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0',
  `itemtype` smallint(6) NOT NULL,
  `count` smallint(6) NOT NULL DEFAULT '0',
  `attributes` blob NOT NULL,
  `serial` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`player_id`),
  UNIQUE KEY `player_id` (`player_id`,`sid`),
  CONSTRAINT `player_inboxitems_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_inboxitems`
--

LOCK TABLES `player_inboxitems` WRITE;
/*!40000 ALTER TABLE `player_inboxitems` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_inboxitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_items`
--

DROP TABLE IF EXISTS `player_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_items` (
  `player_id` int(11) NOT NULL DEFAULT '0',
  `pid` int(11) NOT NULL DEFAULT '0',
  `sid` int(11) NOT NULL DEFAULT '0',
  `itemtype` int(11) NOT NULL DEFAULT '0',
  `count` int(11) NOT NULL DEFAULT '0',
  `attributes` blob NOT NULL,
  `serial` varchar(255) NOT NULL DEFAULT '',
  UNIQUE KEY `player_id_2` (`player_id`,`sid`),
  KEY `player_id` (`player_id`),
  CONSTRAINT `player_items_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_items`
--

LOCK TABLES `player_items` WRITE;
/*!40000 ALTER TABLE `player_items` DISABLE KEYS */;
INSERT INTO `player_items` VALUES (9,1,101,2323,1,'',''),(9,2,102,2173,1,'Ä\0\0charges\0\0\0',''),(9,3,103,1988,1,'',''),(9,4,104,8871,1,'',''),(9,5,105,2534,1,'',''),(9,6,106,12695,1,'',''),(9,7,107,11304,1,'',''),(9,8,108,11303,1,'',''),(9,9,109,2124,1,'',''),(9,10,110,10137,1,'',''),(9,103,111,2160,3,'',''),(9,103,112,2160,100,'dˇˇˇˇ',''),(9,103,113,2160,100,'dˇˇˇˇ',''),(9,103,114,2160,100,'dˇˇˇˇ',''),(9,103,115,2160,100,'dˇˇˇˇ',''),(9,103,116,12734,5,'',''),(9,103,117,12701,1,'',''),(9,103,118,12727,1,'',''),(9,103,119,2184,1,'',''),(9,103,120,2789,25,'',''),(9,103,121,8473,1,'',''),(9,103,122,8472,1,'',''),(9,103,123,7590,1,'',''),(9,103,124,7620,1,'',''),(9,103,125,2554,1,'',''),(9,103,126,7618,1,'',''),(9,103,127,2160,100,'dˇˇˇˇ',''),(9,103,128,2120,1,'',''),(36,1,101,2491,1,'',''),(36,2,102,2173,1,'Ä\0\0charges\0\0\0',''),(36,3,103,10518,1,'',''),(36,4,104,2472,1,'',''),(36,5,105,2514,1,'',''),(36,6,106,12678,1,'',''),(36,7,107,2470,1,'',''),(36,8,108,11303,1,'',''),(36,9,109,2124,1,'',''),(36,103,110,2160,26,'\Z',''),(36,103,111,12715,27,'',''),(36,103,112,10518,1,'',''),(36,112,113,10518,1,'',''),(36,113,114,1988,1,'',''),(36,114,115,5958,1,'',''),(36,114,116,9141,1,'',''),(36,114,117,2789,24,'',''),(36,114,118,8473,1,'',''),(36,114,119,7620,1,'',''),(36,114,120,2554,1,'',''),(36,114,121,7618,1,'',''),(36,114,122,2120,1,'',''),(42,1,101,2498,1,'',''),(42,2,102,2173,1,'Ä\0\0charges\0\0\0',''),(42,3,103,1988,1,'',''),(42,4,104,2476,1,'',''),(42,5,105,2536,1,'',''),(42,6,106,7368,1,'',''),(42,7,107,2488,1,'',''),(42,8,108,11303,1,'',''),(42,9,109,2124,1,'',''),(42,103,110,2160,1,'',''),(42,103,111,12715,5,'',''),(42,103,112,2789,17,'',''),(42,103,113,8472,1,'',''),(42,103,114,2554,1,'',''),(43,1,101,2323,1,'',''),(43,2,102,7887,142,'ˇˇˇˇÄ\0\0chargesé\0\0\0',''),(43,3,103,1988,1,'',''),(43,4,104,8871,1,'',''),(43,5,105,2534,1,'',''),(43,6,106,12689,1,'',''),(43,7,107,11304,1,'',''),(43,8,108,11303,1,'',''),(43,9,109,2124,1,'',''),(43,103,110,2173,1,'Ä\0\0charges\0\0\0',''),(43,103,111,2160,98,'b',''),(43,103,112,12715,31,'',''),(43,103,113,10518,1,'',''),(43,103,114,2789,25,'',''),(43,103,115,8473,1,'',''),(43,103,116,8472,1,'',''),(43,103,117,7590,1,'',''),(43,103,118,7620,1,'',''),(43,103,119,2554,1,'',''),(43,103,120,7618,1,'',''),(43,103,121,2120,1,'',''),(44,1,101,2323,1,'',''),(44,2,102,2173,1,'Ä\0\0charges\0\0\0',''),(44,3,103,1988,1,'',''),(44,4,104,8871,1,'',''),(44,5,105,2534,1,'',''),(44,6,106,2184,1,'',''),(44,7,107,11304,1,'',''),(44,8,108,11303,1,'',''),(44,9,109,2124,1,'',''),(44,103,110,12765,1,'Ä\0\0date£–\\\0writer\0\0\0Cerveja\0text\0\0\0asfasf',''),(44,103,111,2789,25,'',''),(44,103,112,8473,1,'',''),(44,103,113,8472,1,'',''),(44,103,114,7590,1,'',''),(44,103,115,7620,1,'',''),(44,103,116,2554,1,'',''),(44,103,117,7618,1,'',''),(44,103,118,2160,3,'',''),(44,103,119,2120,1,'',''),(45,1,101,2323,1,'',''),(45,2,102,2173,1,'Ä\0\0charges\0\0\0',''),(45,3,103,1988,1,'',''),(45,4,104,8871,1,'',''),(45,5,105,2534,1,'',''),(45,6,106,2184,1,'',''),(45,7,107,11304,1,'',''),(45,8,108,11303,1,'',''),(45,9,109,2124,1,'',''),(45,103,110,2789,25,'',''),(45,103,111,8473,1,'',''),(45,103,112,8472,1,'',''),(45,103,113,7590,1,'',''),(45,103,114,7620,1,'',''),(45,103,115,2554,1,'',''),(45,103,116,7618,1,'',''),(45,103,117,2160,3,'',''),(45,103,118,2120,1,'',''),(46,1,101,2498,1,'',''),(46,3,102,1987,1,'',''),(46,4,103,8871,1,'',''),(46,5,104,2514,1,'',''),(46,6,105,2184,1,'',''),(46,7,106,11304,1,'',''),(46,8,107,2195,1,'',''),(47,1,101,2323,1,'',''),(47,2,102,2173,1,'Ä\0\0charges\0\0\0',''),(47,3,103,1988,1,'',''),(47,4,104,8871,1,'',''),(47,5,105,2534,1,'',''),(47,6,106,2184,1,'',''),(47,7,107,11304,1,'',''),(47,8,108,11303,1,'',''),(47,9,109,2124,1,'',''),(47,103,110,2160,2,'',''),(47,103,111,12715,5,'',''),(47,103,112,2789,24,'',''),(47,103,113,7590,1,'',''),(47,103,114,2554,1,'',''),(47,103,115,2120,1,'',''),(48,1,101,7458,1,'',''),(48,3,102,2365,1,'',''),(48,4,103,8869,1,'',''),(48,5,104,8918,1,'',''),(48,6,105,12689,1,'',''),(48,7,106,11304,1,'',''),(48,8,107,2640,1,'XÍô\0Ä\0\0decaying\0\0\0',''),(48,9,108,2124,1,'',''),(48,10,109,10137,1,'',''),(48,102,110,2152,88,'X',''),(48,102,111,2160,99,'cˇˇˇˇ',''),(48,102,112,12715,14,'ˇˇˇˇ',''),(48,102,113,2195,1,'',''),(48,102,114,2120,1,'',''),(48,102,115,10518,1,'',''),(48,102,116,2268,1,'',''),(48,102,117,2293,1,'',''),(48,102,118,2278,1,'',''),(48,102,119,2305,1,'',''),(48,102,120,2261,1,'',''),(48,102,121,2789,18,'',''),(48,102,122,7590,1,'',''),(48,102,123,2554,1,'',''),(48,115,124,2361,1,'',''),(48,115,125,5791,1,'',''),(48,115,126,2474,1,'',''),(48,115,127,10518,1,'',''),(49,1,101,2491,1,'',''),(49,2,102,2173,1,'Ä\0\0charges\0\0\0',''),(49,3,103,1988,1,'',''),(49,4,104,2487,1,'',''),(49,5,105,2519,1,'',''),(49,6,106,7368,1,'',''),(49,7,107,2488,1,'',''),(49,8,108,11303,1,'',''),(49,9,109,2124,1,'',''),(49,103,110,2789,25,'',''),(49,103,111,8473,1,'',''),(49,103,112,8472,1,'',''),(49,103,113,7590,1,'',''),(49,103,114,7620,1,'',''),(49,103,115,2554,1,'',''),(49,103,116,7618,1,'',''),(49,103,117,2160,3,'',''),(49,103,118,2120,1,'',''),(50,1,101,2323,1,'',''),(50,3,102,1988,1,'',''),(50,4,103,8871,1,'',''),(50,5,104,2534,1,'',''),(50,6,105,2184,1,'',''),(50,7,106,11304,1,'',''),(50,8,107,11303,1,'',''),(50,102,108,2330,1,'Ä\0\0aidd\0\0\0\0uidõ≠\0\0',''),(50,102,109,2152,28,'',''),(50,102,110,2160,7,'ˇˇˇˇ',''),(50,102,111,12715,7,'ˇˇˇˇ',''),(50,102,112,10518,1,'',''),(50,102,113,2124,1,'',''),(50,102,114,2268,1,'',''),(50,102,115,2789,22,'',''),(50,102,116,8473,1,'',''),(50,102,117,8472,1,'',''),(50,102,118,7590,1,'',''),(50,102,119,7620,1,'',''),(50,102,120,2554,1,'',''),(50,102,121,7618,1,'',''),(50,102,122,2120,1,'',''),(50,112,123,10518,1,'',''),(51,1,101,2323,1,'',''),(51,2,102,2173,1,'Ä\0\0charges\0\0\0',''),(51,3,103,1988,1,'',''),(51,4,104,8871,1,'',''),(51,5,105,2534,1,'',''),(51,6,106,2184,1,'',''),(51,7,107,11304,1,'',''),(51,8,108,11303,1,'',''),(51,9,109,2124,1,'',''),(51,103,110,2789,25,'',''),(51,103,111,8473,1,'',''),(51,103,112,8472,1,'',''),(51,103,113,7590,1,'',''),(51,103,114,7620,1,'',''),(51,103,115,2554,1,'',''),(51,103,116,7618,1,'',''),(51,103,117,2160,3,'',''),(51,103,118,2120,1,'',''),(52,1,101,2323,1,'',''),(52,3,102,1988,1,'',''),(52,4,103,8871,1,'',''),(52,5,104,8918,1,'',''),(52,6,105,2184,1,'',''),(52,7,106,11304,1,'',''),(52,8,107,2195,1,'',''),(52,9,108,2124,1,'',''),(52,102,109,2148,92,'\\',''),(52,102,110,2152,98,'b',''),(52,102,111,2160,4,'',''),(52,102,112,2160,100,'dˇˇˇˇ',''),(52,102,113,2268,1,'',''),(52,102,114,10521,1,'',''),(52,102,115,10521,1,'',''),(52,102,116,10521,1,'',''),(52,102,117,10521,1,'',''),(52,102,118,10521,1,'',''),(52,102,119,10521,1,'',''),(52,102,120,10521,1,'',''),(52,102,121,2789,18,'',''),(52,102,122,7590,1,'',''),(52,102,123,7620,1,'',''),(52,102,124,2554,1,'',''),(52,102,125,2120,1,'',''),(53,1,101,2491,1,'',''),(53,2,102,2173,1,'Ä\0\0charges\0\0\0',''),(53,3,103,1988,1,'',''),(53,4,104,2487,1,'',''),(53,5,105,2519,1,'',''),(53,6,106,7368,1,'',''),(53,7,107,2488,1,'',''),(53,8,108,11303,1,'',''),(53,9,109,2124,1,'',''),(53,103,110,2789,25,'',''),(53,103,111,8473,1,'',''),(53,103,112,8472,1,'',''),(53,103,113,7590,1,'',''),(53,103,114,7620,1,'',''),(53,103,115,2554,1,'',''),(53,103,116,7618,1,'',''),(53,103,117,2160,3,'',''),(53,103,118,2120,1,'',''),(54,1,101,2491,1,'',''),(54,2,102,2173,1,'Ä\0\0charges\0\0\0',''),(54,3,103,1988,1,'',''),(54,4,104,2487,1,'',''),(54,5,105,2519,1,'',''),(54,6,106,7368,1,'',''),(54,7,107,2488,1,'',''),(54,8,108,11303,1,'',''),(54,9,109,2124,1,'',''),(54,103,110,2789,25,'',''),(54,103,111,8473,1,'',''),(54,103,112,8472,1,'',''),(54,103,113,7590,1,'',''),(54,103,114,7620,1,'',''),(54,103,115,2554,1,'',''),(54,103,116,7618,1,'',''),(54,103,117,2160,3,'',''),(54,103,118,2120,1,'',''),(55,1,101,2323,1,'',''),(55,2,102,2173,1,'Ä\0\0charges\0\0\0',''),(55,3,103,1988,1,'',''),(55,4,104,8871,1,'',''),(55,5,105,2534,1,'',''),(55,6,106,2184,1,'',''),(55,7,107,11304,1,'',''),(55,8,108,11303,1,'',''),(55,9,109,2124,1,'',''),(55,103,110,2789,25,'',''),(55,103,111,8473,1,'',''),(55,103,112,8472,1,'',''),(55,103,113,7590,1,'',''),(55,103,114,7620,1,'',''),(55,103,115,2554,1,'',''),(55,103,116,7618,1,'',''),(55,103,117,2160,3,'',''),(55,103,118,2120,1,'',''),(56,1,101,2323,1,'',''),(56,2,102,2173,1,'Ä\0\0charges\0\0\0',''),(56,3,103,1988,1,'',''),(56,4,104,8871,1,'',''),(56,5,105,2534,1,'',''),(56,6,106,2184,1,'',''),(56,7,107,11304,1,'',''),(56,8,108,11303,1,'',''),(56,9,109,2124,1,'',''),(56,103,110,2789,25,'',''),(56,103,111,8473,1,'',''),(56,103,112,8472,1,'',''),(56,103,113,7590,1,'',''),(56,103,114,7620,1,'',''),(56,103,115,2554,1,'',''),(56,103,116,7618,1,'',''),(56,103,117,2160,3,'',''),(56,103,118,2120,1,'',''),(57,1,101,2323,1,'',''),(57,2,102,2173,1,'Ä\0\0charges\0\0\0',''),(57,3,103,1988,1,'',''),(57,4,104,8871,1,'',''),(57,5,105,8918,1,'',''),(57,6,106,12689,1,'',''),(57,7,107,11304,1,'',''),(57,8,108,2195,1,'',''),(57,103,109,12715,4,'',''),(57,103,110,8918,1,'',''),(57,103,111,1986,1,'',''),(57,103,112,1999,1,'',''),(57,103,113,7368,1,'',''),(57,103,114,9774,1,'',''),(57,103,115,2268,1,'',''),(57,103,116,2789,19,'',''),(57,103,117,8473,1,'',''),(57,103,118,8472,1,'',''),(57,103,119,7590,1,'',''),(57,103,120,7620,1,'',''),(57,103,121,2554,1,'',''),(57,103,122,7618,1,'',''),(57,103,123,2120,1,'',''),(57,112,124,2146,84,'T',''),(57,112,125,7451,1,'',''),(57,112,126,8904,1,'',''),(57,112,127,7380,1,'',''),(57,114,128,9774,1,'',''),(57,128,129,9774,1,'',''),(57,129,130,9774,1,'',''),(57,130,131,9774,1,'',''),(58,1,101,2491,1,'',''),(58,2,102,2173,1,'Ä\0\0charges\0\0\0',''),(58,3,103,1988,1,'',''),(58,4,104,2487,1,'',''),(58,5,105,2519,1,'',''),(58,6,106,7368,1,'',''),(58,7,107,2488,1,'',''),(58,8,108,11303,1,'',''),(58,9,109,2124,1,'',''),(58,103,110,2789,23,'',''),(58,103,111,8473,1,'',''),(58,103,112,8472,1,'',''),(58,103,113,7590,1,'',''),(58,103,114,7620,1,'',''),(58,103,115,2554,1,'',''),(58,103,116,7618,1,'',''),(58,103,117,2160,3,'',''),(58,103,118,2120,1,'',''),(59,1,101,2491,1,'',''),(59,2,102,2173,1,'Ä\0\0charges\0\0\0',''),(59,3,103,1988,1,'',''),(59,4,104,2487,1,'',''),(59,5,105,2519,1,'',''),(59,6,106,12712,1,'',''),(59,7,107,2488,1,'',''),(59,8,108,11303,1,'',''),(59,9,109,2124,1,'',''),(59,103,110,2671,99,'c',''),(59,103,111,2160,7,'',''),(59,103,112,5809,1,'',''),(59,103,113,10521,1,'',''),(59,103,114,2230,1,'',''),(59,103,115,2789,4,'',''),(59,103,116,8473,1,'',''),(59,113,117,10521,1,'',''),(59,117,118,10521,1,'',''),(59,118,119,10521,1,'',''),(59,119,120,10521,1,'',''),(59,120,121,10521,1,'',''),(59,121,122,10521,1,'',''),(59,122,123,10521,1,'',''),(59,123,124,10521,1,'',''),(59,124,125,10521,1,'',''),(59,125,126,10521,1,'',''),(59,126,127,10521,1,'',''),(59,127,128,10521,1,'',''),(60,1,101,2498,1,'',''),(60,3,102,1988,1,'',''),(60,4,103,2472,1,'',''),(60,5,104,2514,1,'',''),(60,6,105,7390,1,'',''),(60,7,106,2470,1,'',''),(60,8,107,2195,1,'',''),(60,9,108,2124,1,'',''),(60,102,109,12715,15,'ˇˇˇˇ',''),(60,102,110,2152,99,'c',''),(60,102,111,2160,2,'',''),(60,102,112,10521,1,'',''),(60,102,113,10521,1,'',''),(60,102,114,2789,19,'',''),(60,102,115,2554,1,'',''),(60,102,116,2120,1,'',''),(60,113,117,8473,1,'',''),(60,113,118,5958,1,'',''),(60,113,119,7620,1,'',''),(60,113,120,2520,1,'',''),(60,113,121,2519,1,'',''),(60,113,122,2472,1,'',''),(61,1,101,2498,1,'',''),(61,2,102,2173,1,'Ä\0\0charges\0\0\0',''),(61,3,103,1988,1,'',''),(61,4,104,2487,1,'',''),(61,5,105,2520,1,'',''),(61,6,106,2352,1,'',''),(61,7,107,2488,1,'',''),(61,8,108,2195,1,'',''),(61,9,109,2124,1,'',''),(61,103,110,2152,30,'',''),(61,103,111,2160,100,'dˇˇˇˇ',''),(61,103,112,10518,1,'',''),(61,103,113,10518,1,'',''),(61,103,114,10518,1,'',''),(61,103,115,10518,1,'',''),(61,103,116,10518,1,'',''),(61,103,117,10518,1,'',''),(61,103,118,10518,1,'',''),(61,103,119,10518,1,'',''),(61,103,120,10518,1,'',''),(61,103,121,10518,1,'',''),(61,103,122,10518,1,'',''),(61,103,123,10518,1,'',''),(61,103,124,10518,1,'',''),(61,103,125,10518,1,'',''),(61,103,126,10518,1,'',''),(61,103,127,10518,1,'',''),(61,103,128,10518,1,'',''),(61,103,129,10518,1,'',''),(61,112,130,2514,1,'',''),(61,112,131,2470,1,'',''),(61,112,132,2160,6,'',''),(61,112,133,2160,100,'dˇˇˇˇ',''),(61,112,134,12715,7,'ˇˇˇˇ',''),(61,129,135,8472,1,'',''),(61,129,136,2197,5,'Ä\0\0charges\0\0\0',''),(61,129,137,2197,5,'Ä\0\0charges\0\0\0',''),(61,129,138,2197,5,'Ä\0\0charges\0\0\0',''),(61,129,139,2197,5,'Ä\0\0charges\0\0\0',''),(61,129,140,2197,5,'Ä\0\0charges\0\0\0',''),(61,129,141,2197,5,'Ä\0\0charges\0\0\0',''),(61,129,142,2197,5,'Ä\0\0charges\0\0\0',''),(61,129,143,2197,5,'Ä\0\0charges\0\0\0',''),(61,129,144,2197,5,'Ä\0\0charges\0\0\0',''),(61,129,145,2197,5,'Ä\0\0charges\0\0\0',''),(61,129,146,2197,5,'Ä\0\0charges\0\0\0',''),(61,129,147,2197,5,'Ä\0\0charges\0\0\0',''),(61,129,148,2536,1,'',''),(61,129,149,10518,1,'',''),(61,149,150,2173,1,'Ä\0\0charges\0\0\0',''),(61,149,151,2197,5,'Ä\0\0charges\0\0\0',''),(61,149,152,2197,5,'Ä\0\0charges\0\0\0',''),(61,149,153,2197,5,'Ä\0\0charges\0\0\0',''),(61,149,154,2197,5,'Ä\0\0charges\0\0\0',''),(61,149,155,2197,5,'Ä\0\0charges\0\0\0',''),(61,149,156,2197,5,'Ä\0\0charges\0\0\0',''),(61,149,157,2197,5,'Ä\0\0charges\0\0\0',''),(61,149,158,2197,5,'Ä\0\0charges\0\0\0',''),(61,149,159,2197,5,'Ä\0\0charges\0\0\0',''),(61,149,160,2197,5,'Ä\0\0charges\0\0\0',''),(61,149,161,2197,5,'Ä\0\0charges\0\0\0',''),(61,149,162,2197,5,'Ä\0\0charges\0\0\0',''),(61,149,163,10518,1,'',''),(61,163,164,2197,5,'Ä\0\0charges\0\0\0',''),(61,163,165,2197,5,'Ä\0\0charges\0\0\0',''),(61,163,166,2197,5,'Ä\0\0charges\0\0\0',''),(61,163,167,2197,5,'Ä\0\0charges\0\0\0',''),(61,163,168,2197,5,'Ä\0\0charges\0\0\0',''),(61,163,169,2197,5,'Ä\0\0charges\0\0\0',''),(61,163,170,10518,1,'',''),(61,170,171,2197,5,'Ä\0\0charges\0\0\0',''),(61,170,172,2197,5,'Ä\0\0charges\0\0\0',''),(61,170,173,2197,5,'Ä\0\0charges\0\0\0',''),(61,170,174,2197,5,'Ä\0\0charges\0\0\0',''),(61,170,175,2197,5,'Ä\0\0charges\0\0\0',''),(61,170,176,2197,5,'Ä\0\0charges\0\0\0',''),(61,170,177,2197,5,'Ä\0\0charges\0\0\0',''),(61,170,178,2197,5,'Ä\0\0charges\0\0\0',''),(61,170,179,10518,1,'',''),(61,179,180,2197,5,'Ä\0\0charges\0\0\0',''),(61,179,181,2197,5,'Ä\0\0charges\0\0\0',''),(61,179,182,2197,5,'Ä\0\0charges\0\0\0',''),(61,179,183,2197,5,'Ä\0\0charges\0\0\0',''),(61,179,184,10518,1,'',''),(61,184,185,2197,5,'Ä\0\0charges\0\0\0',''),(61,184,186,2197,5,'Ä\0\0charges\0\0\0',''),(61,184,187,2197,5,'Ä\0\0charges\0\0\0',''),(61,184,188,10518,1,'',''),(61,188,189,2197,5,'Ä\0\0charges\0\0\0',''),(61,188,190,2197,5,'Ä\0\0charges\0\0\0',''),(61,188,191,2197,5,'Ä\0\0charges\0\0\0',''),(61,188,192,10518,1,'',''),(61,192,193,2197,5,'Ä\0\0charges\0\0\0',''),(61,192,194,2197,5,'Ä\0\0charges\0\0\0',''),(61,192,195,2197,5,'Ä\0\0charges\0\0\0',''),(61,192,196,2197,5,'Ä\0\0charges\0\0\0',''),(61,192,197,10518,1,'',''),(61,197,198,2197,5,'Ä\0\0charges\0\0\0',''),(61,197,199,2197,5,'Ä\0\0charges\0\0\0',''),(61,197,200,2197,5,'Ä\0\0charges\0\0\0',''),(61,197,201,2197,5,'Ä\0\0charges\0\0\0',''),(61,197,202,2197,5,'Ä\0\0charges\0\0\0',''),(61,197,203,10518,1,'',''),(61,203,204,2197,5,'Ä\0\0charges\0\0\0',''),(61,203,205,2197,5,'Ä\0\0charges\0\0\0',''),(61,203,206,2197,5,'Ä\0\0charges\0\0\0',''),(61,203,207,2197,5,'Ä\0\0charges\0\0\0',''),(61,203,208,10518,1,'',''),(61,208,209,2197,5,'Ä\0\0charges\0\0\0',''),(61,208,210,2197,5,'Ä\0\0charges\0\0\0',''),(61,208,211,10518,1,'',''),(61,211,212,10518,1,'',''),(61,212,213,10518,1,'',''),(61,213,214,10518,1,'',''),(61,214,215,10518,1,'',''),(61,215,216,10518,1,'',''),(61,216,217,10518,1,'',''),(61,217,218,10518,1,'',''),(61,218,219,10518,1,'',''),(61,219,220,10518,1,'',''),(61,220,221,10518,1,'',''),(61,221,222,10518,1,'',''),(61,222,223,10518,1,'',''),(61,223,224,10518,1,'',''),(61,224,225,10518,1,'',''),(61,225,226,10518,1,'',''),(61,226,227,10518,1,'',''),(61,227,228,10518,1,'',''),(61,228,229,10518,1,'',''),(61,229,230,10518,1,'',''),(61,230,231,10518,1,'',''),(61,231,232,10518,1,'',''),(62,1,101,2491,1,'',''),(62,2,102,2173,1,'Ä\0\0charges\0\0\0',''),(62,3,103,1988,1,'',''),(62,5,104,2519,1,'',''),(62,6,105,7390,1,'',''),(62,7,106,2470,1,'',''),(62,8,107,11303,1,'',''),(62,9,108,2124,1,'',''),(62,103,109,1999,1,'',''),(62,103,110,1999,1,'',''),(62,103,111,7380,1,'',''),(62,103,112,7415,1,'',''),(62,103,113,7434,1,'',''),(62,103,114,2789,25,'',''),(62,103,115,8473,1,'',''),(62,103,116,8472,1,'',''),(62,103,117,7590,1,'',''),(62,103,118,7620,1,'',''),(62,103,119,2554,1,'',''),(62,103,120,7618,1,'',''),(62,103,121,2160,3,'',''),(62,103,122,2120,1,'',''),(63,1,101,2323,1,'',''),(63,2,102,2173,1,'Ä\0\0charges\0\0\0',''),(63,3,103,1988,1,'',''),(63,4,104,8871,1,'',''),(63,5,105,2534,1,'',''),(63,6,106,2184,1,'',''),(63,7,107,11304,1,'',''),(63,8,108,11303,1,'',''),(63,9,109,2124,1,'',''),(63,103,110,2789,25,'',''),(63,103,111,8473,1,'',''),(63,103,112,8472,1,'',''),(63,103,113,7590,1,'',''),(63,103,114,7620,1,'',''),(63,103,115,2554,1,'',''),(63,103,116,7618,1,'',''),(63,103,117,2160,3,'',''),(63,103,118,2120,1,'',''),(64,1,101,2323,1,'',''),(64,2,102,2173,1,'Ä\0\0charges\0\0\0',''),(64,3,103,1988,1,'',''),(64,4,104,8871,1,'',''),(64,5,105,2534,1,'',''),(64,6,106,2184,1,'',''),(64,7,107,11304,1,'',''),(64,8,108,11303,1,'',''),(64,9,109,2124,1,'',''),(64,103,110,2789,25,'',''),(64,103,111,8473,1,'',''),(64,103,112,8472,1,'',''),(64,103,113,7590,1,'',''),(64,103,114,7620,1,'',''),(64,103,115,2554,1,'',''),(64,103,116,7618,1,'',''),(64,103,117,2160,3,'',''),(64,103,118,2120,1,'',''),(65,1,101,2498,1,'',''),(65,2,102,2173,1,'Ä\0\0charges\0\0\0',''),(65,3,103,1988,1,'',''),(65,4,104,2472,1,'',''),(65,5,105,2514,1,'',''),(65,6,106,7390,1,'',''),(65,7,107,2470,1,'',''),(65,8,108,2195,1,'',''),(65,103,109,2160,7,'',''),(65,103,110,12715,9,'	',''),(65,103,111,1988,1,'',''),(65,103,112,2120,1,'',''),(65,103,113,2789,22,'',''),(65,103,114,8473,1,'ˇˇˇˇ',''),(65,103,115,2554,1,'',''),(65,111,116,1988,1,'',''),(65,111,117,1988,1,'',''),(65,116,118,1988,1,'',''),(65,118,119,1988,1,'',''),(66,1,101,2323,1,'',''),(66,2,102,2173,1,'Ä\0\0charges\0\0\0',''),(66,3,103,1988,1,'',''),(66,4,104,8871,1,'',''),(66,5,105,2534,1,'',''),(66,6,106,2184,1,'',''),(66,7,107,11304,1,'',''),(66,8,108,11303,1,'',''),(66,9,109,2124,1,'',''),(66,103,110,2789,25,'',''),(66,103,111,8473,1,'',''),(66,103,112,8472,1,'',''),(66,103,113,7590,1,'',''),(66,103,114,7620,1,'',''),(66,103,115,2554,1,'',''),(66,103,116,7618,1,'',''),(66,103,117,2160,3,'',''),(66,103,118,2120,1,'',''),(67,1,101,2323,1,'',''),(67,2,102,2173,1,'Ä\0\0charges\0\0\0',''),(67,3,103,1988,1,'',''),(67,4,104,8869,1,'',''),(67,5,105,8918,1,'',''),(67,6,106,12689,1,'',''),(67,7,107,11304,1,'',''),(67,8,108,2195,1,'',''),(67,103,109,2152,98,'b',''),(67,103,110,2160,25,'',''),(67,103,111,1988,1,'',''),(67,103,112,12543,1,'',''),(67,103,113,2553,1,'',''),(67,103,114,12715,6,'',''),(67,103,115,2268,1,'',''),(67,103,116,2789,15,'',''),(67,103,117,7590,1,'',''),(67,103,118,2554,1,'',''),(67,103,119,2120,1,'',''),(67,111,120,8904,1,'',''),(67,111,121,2184,1,'',''),(67,111,122,2514,1,'',''),(67,111,123,2522,1,'',''),(67,111,124,2421,1,'',''),(67,111,125,2470,1,'',''),(69,2,101,2173,1,'Ä\0\0charges\0\0\0',''),(69,3,102,11263,1,'',''),(69,6,103,12689,1,'',''),(69,102,104,2536,1,'',''),(69,102,105,2195,1,'',''),(69,102,106,8871,1,'',''),(69,102,107,11304,1,'',''),(69,102,108,2498,1,'',''),(69,102,109,2160,48,'0',''),(69,102,110,6553,1,'',''),(69,102,111,12715,5,'ˇˇˇˇ',''),(69,102,112,1988,1,'',''),(69,112,113,2291,1,'',''),(69,112,114,2305,1,'',''),(69,112,115,2293,1,'',''),(69,112,116,2278,1,'',''),(69,112,117,2268,1,'',''),(69,112,118,2262,1,'',''),(69,112,119,7590,1,'',''),(69,112,120,2120,1,'','');
/*!40000 ALTER TABLE `player_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_killers`
--

DROP TABLE IF EXISTS `player_killers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_killers` (
  `kill_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  KEY `kill_id` (`kill_id`),
  KEY `player_id` (`player_id`),
  CONSTRAINT `player_killers_ibfk_1` FOREIGN KEY (`kill_id`) REFERENCES `killers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `player_killers_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_killers`
--

LOCK TABLES `player_killers` WRITE;
/*!40000 ALTER TABLE `player_killers` DISABLE KEYS */;
INSERT INTO `player_killers` VALUES (5455,46);
/*!40000 ALTER TABLE `player_killers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_namelocks`
--

DROP TABLE IF EXISTS `player_namelocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_namelocks` (
  `player_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `new_name` varchar(255) NOT NULL,
  `date` bigint(20) NOT NULL DEFAULT '0',
  KEY `player_id` (`player_id`),
  CONSTRAINT `player_namelocks_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_namelocks`
--

LOCK TABLES `player_namelocks` WRITE;
/*!40000 ALTER TABLE `player_namelocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_namelocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_skills`
--

DROP TABLE IF EXISTS `player_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_skills` (
  `player_id` int(11) NOT NULL,
  `skillid` tinyint(2) NOT NULL DEFAULT '0',
  `value` int(10) unsigned NOT NULL DEFAULT '0',
  `count` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `player_id_2` (`player_id`,`skillid`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_skills`
--

LOCK TABLES `player_skills` WRITE;
/*!40000 ALTER TABLE `player_skills` DISABLE KEYS */;
INSERT INTO `player_skills` VALUES (2,0,10,0),(2,1,10,0),(2,2,10,0),(2,3,10,0),(2,4,10,0),(2,5,10,0),(2,6,10,0),(3,0,10,0),(3,1,10,0),(3,2,10,0),(3,3,10,0),(3,4,10,0),(3,5,10,0),(3,6,10,0),(4,0,10,0),(4,1,10,0),(4,2,10,0),(4,3,10,0),(4,4,10,0),(4,5,10,0),(4,6,10,0),(5,0,10,0),(5,1,10,0),(5,2,10,0),(5,3,10,0),(5,4,10,0),(5,5,10,0),(5,6,10,0),(6,0,10,0),(6,1,10,0),(6,2,10,0),(6,3,10,0),(6,4,10,0),(6,5,10,0),(6,6,10,0),(7,0,10,0),(7,1,10,0),(7,2,10,0),(7,3,10,0),(7,4,10,0),(7,5,10,0),(7,6,10,0),(8,0,10,0),(8,1,10,0),(8,2,10,0),(8,3,10,0),(8,4,10,0),(8,5,10,0),(8,6,10,0),(9,0,10,0),(9,1,10,0),(9,2,10,0),(9,3,10,0),(9,4,10,0),(9,5,10,0),(9,6,10,0),(10,0,10,0),(10,1,10,0),(10,2,10,0),(10,3,65,3667),(10,4,10,0),(10,5,34,895),(10,6,10,0),(11,0,10,0),(11,1,10,0),(11,2,10,0),(11,3,10,0),(11,4,10,0),(11,5,12,127),(11,6,10,0),(12,0,10,0),(12,1,10,0),(12,2,10,0),(12,3,10,0),(12,4,10,0),(12,5,13,125),(12,6,10,0),(13,0,10,0),(13,1,10,0),(13,2,10,0),(13,3,10,0),(13,4,10,0),(13,5,10,0),(13,6,10,0),(14,0,10,0),(14,1,10,0),(14,2,82,37137),(14,3,18,31),(14,4,10,0),(14,5,36,1093),(14,6,10,0),(15,0,10,0),(15,1,10,0),(15,2,10,0),(15,3,10,0),(15,4,97,69487),(15,5,57,6820),(15,6,10,0),(16,0,10,0),(16,1,10,0),(16,2,10,0),(16,3,10,0),(16,4,10,0),(16,5,10,57),(16,6,10,0),(17,0,10,0),(17,1,10,0),(17,2,10,0),(17,3,10,0),(17,4,10,0),(17,5,10,20),(17,6,10,0),(18,0,10,0),(18,1,10,0),(18,2,10,0),(18,3,10,0),(18,4,10,0),(18,5,10,0),(18,6,10,0),(19,0,10,0),(19,1,10,0),(19,2,10,0),(19,3,10,0),(19,4,10,0),(19,5,10,0),(19,6,10,0),(20,0,10,0),(20,1,10,0),(20,2,10,0),(20,3,10,0),(20,4,10,0),(20,5,10,0),(20,6,10,0),(21,0,10,0),(21,1,10,0),(21,2,10,0),(21,3,10,0),(21,4,10,0),(21,5,10,0),(21,6,10,0),(22,0,10,0),(22,1,10,0),(22,2,10,0),(22,3,10,0),(22,4,10,0),(22,5,12,52),(22,6,10,0),(23,0,10,0),(23,1,10,0),(23,2,10,0),(23,3,10,0),(23,4,10,0),(23,5,10,37),(23,6,10,0),(24,0,58,2087),(24,1,95,29308),(24,2,10,0),(24,3,10,0),(24,4,10,0),(24,5,70,8924),(24,6,10,0),(25,0,10,0),(25,1,10,0),(25,2,10,0),(25,3,10,0),(25,4,10,0),(25,5,13,214),(25,6,10,0),(26,0,10,0),(26,1,10,0),(26,2,10,0),(26,3,10,0),(26,4,52,71),(26,5,14,76),(26,6,10,0),(27,0,10,0),(27,1,10,0),(27,2,10,0),(27,3,10,0),(27,4,30,172),(27,5,12,70),(27,6,10,0),(28,0,10,0),(28,1,10,0),(28,2,10,0),(28,3,10,0),(28,4,10,0),(28,5,10,77),(28,6,10,0),(29,0,10,0),(29,1,10,0),(29,2,10,0),(29,3,10,0),(29,4,31,101),(29,5,10,57),(29,6,10,0),(30,0,10,0),(30,1,10,0),(30,2,10,0),(30,3,10,0),(30,4,10,0),(30,5,10,0),(30,6,10,0),(31,0,10,0),(31,1,10,0),(31,2,10,0),(31,3,10,0),(31,4,10,0),(31,5,11,18),(31,6,10,0),(32,0,10,0),(32,1,10,0),(32,2,10,0),(32,3,10,0),(32,4,66,3376),(32,5,29,349),(32,6,10,0),(33,0,10,0),(33,1,10,0),(33,2,10,0),(33,3,10,0),(33,4,10,0),(33,5,10,20),(33,6,10,0),(34,0,10,0),(34,1,10,0),(34,2,10,0),(34,3,10,0),(34,4,10,0),(34,5,10,0),(34,6,10,0),(35,0,10,0),(35,1,10,0),(35,2,10,0),(35,3,10,0),(35,4,47,217),(35,5,12,50),(35,6,10,0),(36,0,10,0),(36,1,94,134722),(36,2,10,0),(36,3,10,0),(36,4,10,0),(36,5,70,2444),(36,6,10,0),(37,0,10,0),(37,1,10,0),(37,2,10,0),(37,3,10,0),(37,4,10,0),(37,5,10,0),(37,6,10,0),(38,0,10,0),(38,1,10,0),(38,2,10,0),(38,3,10,0),(38,4,10,0),(38,5,12,145),(38,6,10,0),(39,0,10,0),(39,1,10,0),(39,2,10,0),(39,3,10,0),(39,4,10,0),(39,5,10,0),(39,6,10,0),(40,0,10,0),(40,1,10,0),(40,2,10,0),(40,3,10,0),(40,4,10,0),(40,5,10,0),(40,6,10,0),(41,0,10,0),(41,1,10,0),(41,2,170,0),(41,3,10,0),(41,4,10,0),(41,5,10,0),(41,6,10,0),(42,0,10,0),(42,1,10,0),(42,2,10,0),(42,3,10,0),(42,4,95,94530),(42,5,56,4352),(42,6,10,0),(43,0,10,0),(43,1,10,0),(43,2,10,0),(43,3,10,0),(43,4,10,0),(43,5,11,105),(43,6,10,0),(44,0,10,0),(44,1,10,0),(44,2,10,0),(44,3,10,0),(44,4,10,0),(44,5,12,190),(44,6,10,0),(45,0,10,0),(45,1,10,0),(45,2,10,0),(45,3,10,0),(45,4,10,0),(45,5,10,0),(45,6,10,0),(46,0,16,321),(46,1,10,0),(46,2,10,0),(46,3,10,0),(46,4,10,0),(46,5,18,1059),(46,6,10,0),(47,0,10,0),(47,1,10,0),(47,2,10,0),(47,3,10,0),(47,4,10,0),(47,5,18,778),(47,6,10,0),(48,0,10,0),(48,1,10,0),(48,2,10,0),(48,3,10,0),(48,4,10,0),(48,5,15,681),(48,6,10,0),(49,0,10,0),(49,1,10,0),(49,2,10,0),(49,3,10,0),(49,4,10,0),(49,5,10,0),(49,6,10,0),(50,0,10,0),(50,1,10,0),(50,2,10,0),(50,3,10,0),(50,4,10,0),(50,5,12,71),(50,6,10,0),(51,0,10,0),(51,1,10,0),(51,2,10,0),(51,3,10,0),(51,4,10,0),(51,5,10,0),(51,6,10,0),(52,0,10,0),(52,1,10,0),(52,2,10,0),(52,3,10,0),(52,4,10,0),(52,5,19,402),(52,6,10,0),(53,0,10,0),(53,1,10,0),(53,2,10,0),(53,3,10,0),(53,4,14,22),(53,5,10,0),(53,6,10,0),(54,0,10,0),(54,1,10,0),(54,2,10,0),(54,3,10,0),(54,4,31,51),(54,5,10,80),(54,6,10,0),(55,0,10,0),(55,1,10,0),(55,2,10,0),(55,3,10,0),(55,4,10,0),(55,5,10,60),(55,6,10,0),(56,0,10,0),(56,1,10,0),(56,2,10,0),(56,3,10,0),(56,4,10,0),(56,5,10,0),(56,6,10,0),(57,0,10,0),(57,1,10,0),(57,2,10,0),(57,3,10,0),(57,4,10,0),(57,5,21,1844),(57,6,10,0),(58,0,10,0),(58,1,10,0),(58,2,10,0),(58,3,10,0),(58,4,38,227),(58,5,15,110),(58,6,10,0),(59,0,16,36),(59,1,10,0),(59,2,10,0),(59,3,76,15742),(59,4,10,0),(59,5,45,294),(59,6,10,0),(60,0,10,0),(60,1,10,0),(60,2,59,3717),(60,3,10,0),(60,4,10,0),(60,5,23,302),(60,6,10,0),(61,0,10,0),(61,1,10,0),(61,2,10,0),(61,3,10,0),(61,4,91,59655),(61,5,47,1855),(61,6,10,0),(62,0,10,0),(62,1,10,0),(62,2,92,104016),(62,3,10,0),(62,4,10,0),(62,5,63,7236),(62,6,10,0),(63,0,10,0),(63,1,10,0),(63,2,10,0),(63,3,10,0),(63,4,10,0),(63,5,10,20),(63,6,10,0),(64,0,10,0),(64,1,10,0),(64,2,10,0),(64,3,10,0),(64,4,10,0),(64,5,10,0),(64,6,10,0),(65,0,10,0),(65,1,10,0),(65,2,72,7656),(65,3,10,0),(65,4,10,0),(65,5,37,199),(65,6,10,0),(66,0,10,0),(66,1,10,0),(66,2,10,0),(66,3,10,0),(66,4,10,0),(66,5,10,0),(66,6,10,0),(67,0,10,0),(67,1,10,0),(67,2,10,0),(67,3,10,0),(67,4,10,0),(67,5,19,3721),(67,6,10,0),(68,0,10,0),(68,1,10,0),(68,2,10,0),(68,3,10,0),(68,4,10,0),(68,5,10,0),(68,6,10,0),(69,0,10,0),(69,1,10,0),(69,2,10,0),(69,3,10,0),(69,4,10,0),(69,5,17,740),(69,6,10,0);
/*!40000 ALTER TABLE `player_skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_spells`
--

DROP TABLE IF EXISTS `player_spells`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_spells` (
  `player_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  UNIQUE KEY `player_id_2` (`player_id`,`name`),
  KEY `player_id` (`player_id`),
  CONSTRAINT `player_spells_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_spells`
--

LOCK TABLES `player_spells` WRITE;
/*!40000 ALTER TABLE `player_spells` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_spells` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_statements`
--

DROP TABLE IF EXISTS `player_statements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_statements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) NOT NULL,
  `channel_id` int(11) NOT NULL DEFAULT '0',
  `text` varchar(255) NOT NULL,
  `date` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `player_id` (`player_id`),
  KEY `channel_id` (`channel_id`),
  CONSTRAINT `player_statements_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=744 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_statements`
--

LOCK TABLES `player_statements` WRITE;
/*!40000 ALTER TABLE `player_statements` DISABLE KEYS */;
INSERT INTO `player_statements` VALUES (1,43,0,'!points',1557166677),(2,43,0,'!backpack',1557166805),(3,43,0,'!buypremium',1557166828),(4,43,0,'!premium',1557166831),(5,43,0,'d',1557167104),(6,43,0,'industed',1557167128),(7,43,0,'hi',1557167147),(8,43,0,'hi',1557167148),(9,43,0,'trade',1557167151),(10,43,0,'tr',1557167157),(11,43,0,'hi',1557167245),(12,43,0,'trade',1557167247),(13,43,0,'d',1557167607),(14,43,0,'hi',1557167727),(15,43,0,'task',1557167729),(16,43,0,'yes',1557167732),(17,43,0,'hi',1557167763),(18,43,0,'trade',1557167765),(19,43,0,'yes',1557167767),(20,44,0,'888222888',1557167805),(21,43,0,'!promotion',1557168242),(22,44,0,'adm',1557168387),(23,44,0,'como',1557168387),(24,44,0,'assim',1557168388),(25,44,0,'idade?',1557168389),(26,43,0,'yes',1557168417),(27,48,0,'!buyhouse',1557170134),(28,48,0,'hi',1557170146),(29,48,0,'trade',1557170148),(30,48,0,'hi',1557170158),(31,48,0,'trade',1557170159),(32,48,0,'hi',1557170171),(33,48,0,'trade',1557170173),(34,48,0,'!bp',1557170237),(35,48,0,'!bp',1557170239),(36,48,0,'hi',1557170446),(37,48,0,'trade',1557170447),(38,48,0,'hi',1557170474),(39,48,0,'task',1557170476),(40,48,0,'yes',1557170484),(41,46,0,'hi',1557170647),(42,46,0,'trade',1557170651),(43,46,0,'hi',1557170669),(44,46,0,'trade',1557170674),(45,48,4,'!save',1557170807),(46,48,0,'hi',1557171169),(47,48,0,'report',1557171170),(48,48,0,'task',1557171182),(49,48,0,'yes',1557171188),(50,48,0,'!buyhouse',1557171199),(51,48,0,'!buyhouse',1557171202),(52,48,0,'alana res',1557171205),(53,46,0,'hi',1557171929),(54,46,0,'trade',1557171932),(55,46,0,'hi',1557171944),(56,46,0,'trade',1557171946),(57,46,0,'hi',1557171970),(58,46,0,'trade',1557171972),(59,46,0,'hi',1557171991),(60,46,0,'trade',1557171993),(61,46,0,'hi',1557172047),(62,46,0,'trade',1557172049),(63,46,0,'hi',1557172058),(64,46,0,'trade[',1557172060),(65,46,0,'trade',1557172063),(66,46,0,'hi',1557172198),(67,46,0,'trade',1557172200),(68,46,0,'utani gran hun',1557172271),(69,46,0,'utani gran hun',1557172272),(70,46,0,'hi',1557172337),(71,46,0,'trade',1557172340),(72,46,0,'hi',1557172359),(73,46,0,'trtade',1557172363),(74,46,0,'trade',1557172367),(75,46,0,'hi',1557172394),(76,46,0,'hi',1557172404),(77,46,0,'hi',1557172508),(78,46,0,'trade',1557172511),(79,46,0,'ou',1557172621),(80,46,0,'onde eu vendo meu ites?',1557172633),(81,46,0,'ou',1557172693),(82,46,0,'sabe onde vendo meu itens?',1557172706),(83,46,0,'hi',1557172718),(84,46,0,'hi',1557172723),(85,46,0,'trade',1557172727),(86,50,0,'Explosion Death ',1557173420),(87,50,0,'Explosion Death ',1557173420),(88,50,0,'Explosion Death ',1557173420),(89,50,0,'Explosion Death ',1557173420),(90,50,0,'Explosion Death ',1557173420),(91,50,0,'Explosion Death ',1557173437),(92,50,0,'Explosion Death ',1557173437),(93,50,0,'Explosion Death ',1557173437),(94,50,0,'Explosion Death ',1557173437),(95,50,0,'Explosion Death ',1557173437),(96,48,0,'hi',1557173561),(97,48,0,'trade',1557173562),(98,46,0,'hi',1557174067),(99,46,0,'trade',1557174070),(100,46,9,'oi',1557174155),(101,46,9,'oi',1557174163),(102,51,6,'putz wake bk? serio q tu compro isso',1557174419),(103,51,9,'putz wake bk? serio q tu compro isso',1557174422),(104,50,0,'Explosion Death ',1557174752),(105,50,0,'Explosion Death ',1557174753),(106,50,0,'life heal',1557174753),(107,50,0,'Explosion Death ',1557174753),(108,48,0,'!ap;',1557174813),(109,50,0,'hi',1557174962),(110,50,0,'outfit',1557174965),(111,50,0,'king outfit',1557174967),(112,46,0,'hi',1557175076),(113,46,0,'trade',1557175079),(114,46,0,'/aol',1557175126),(115,46,0,'hi',1557175152),(116,46,0,'trade',1557175155),(117,50,0,'hi',1557175202),(118,50,0,'trade',1557175202),(119,46,0,'oi',1557175214),(120,50,0,'opa',1557175217),(121,46,0,'onde vende cajado',1557175223),(122,50,0,'aq axo',1557175228),(123,50,0,'>',1557175243),(124,50,0,'aq ',1557175248),(125,50,0,'10kk',1557175249),(126,50,0,'Explosion Death ',1557175351),(127,50,0,'!bp',1557175440),(128,50,0,'!bp',1557175558),(129,46,0,'hi',1557175653),(130,46,0,'trade',1557175656),(131,50,0,'hi',1557175665),(132,50,0,'trade',1557175665),(133,50,9,'trade',1557175666),(134,50,0,'trade',1557175672),(135,46,0,'hi',1557175674),(136,46,0,'trade',1557175677),(137,50,0,'hi',1557175687),(138,50,0,'trade',1557175687),(139,46,0,'hi',1557175692),(140,46,0,'trade',1557175694),(141,50,0,'hi',1557175717),(142,50,0,'trade',1557175718),(143,50,0,'depositar',1557175720),(144,52,0,'hi',1557176474),(145,52,0,'trade',1557176476),(146,52,0,'hi',1557176535),(147,52,0,'trade',1557176538),(148,52,0,'hi',1557176736),(149,46,0,'/flag',1557176764),(150,52,0,'hi',1557176780),(151,52,0,'trade',1557176781),(152,52,0,'hi',1557176798),(153,52,0,'trade',1557176800),(154,52,0,'hi',1557176836),(155,52,0,'trade',1557176837),(156,9,0,'boa noite!',1557176866),(157,52,0,'hi',1557176874),(158,52,0,'deposit all',1557176876),(159,52,0,'yes',1557176878),(160,52,0,'balance',1557176880),(161,48,0,'hello',1557176891),(162,9,0,'eae',1557176894),(163,9,0,':D',1557176895),(164,9,0,'curtindo',1557176900),(165,9,0,'servidor?',1557176901),(166,48,0,'what',1557176904),(167,48,0,'bro',1557176904),(168,48,0,'moment',1557176905),(169,48,0,'i dont speak your langauge haha',1557176913),(170,48,0,'of corse',1557176928),(171,48,0,'its okey',1557176929),(172,9,0,'eae',1557176941),(173,9,0,'curtindo',1557176944),(174,9,0,'servidor',1557176945),(175,46,0,'oi',1557176945),(176,9,0,'maninho/',1557176946),(177,46,0,'blz',1557176955),(178,48,0,'Voce gostaria de dar algum ponto?',1557176955),(179,46,0,'serve bom',1557176959),(180,9,0,'haha',1557176962),(181,9,0,'vlw',1557176963),(182,9,0,'chama os amigos ae',1557176965),(183,9,0,'gogo',1557176967),(184,46,0,'sim',1557176971),(185,46,0,'aqui',1557176979),(186,46,0,'onde conpra ',1557176988),(187,46,0,'aoul',1557176991),(188,9,0,'oque?',1557176996),(189,48,0,'hm?',1557177015),(190,46,0,'aol',1557177023),(191,9,0,'nao dou pontos.',1557177024),(192,9,0,'...!aol',1557177027),(193,48,0,'okay',1557177061),(194,48,0,'Onde o chefe √© respeitado?',1557177089),(195,46,0,'hi',1557177099),(196,46,0,'trade',1557177102),(197,48,0,'hm?',1557177206),(198,48,0,'????????',1557177277),(199,46,0,'hi',1557177295),(200,46,0,'offer',1557177310),(201,48,0,'hi',1557177317),(202,48,0,'promotion',1557177320),(203,48,0,'yes',1557177320),(204,46,0,'Outfit',1557177321),(205,46,0,'King Outfit',1557177330),(206,46,0,'hi[',1557177354),(207,46,0,'Outfit',1557177363),(208,46,0,'addon',1557177370),(209,46,0,'addons',1557177374),(210,52,0,'!afk',1557177385),(211,48,0,'ADMIN',1557177497),(212,48,0,'bro',1557177548),(213,48,0,'come',1557177549),(214,48,0,'i show you',1557177553),(215,48,0,'items',1557177557),(216,48,0,'and i give you',1557177561),(217,53,0,'adm',1557177909),(218,53,0,'adm',1557177911),(219,53,0,'ADM',1557177911),(220,53,0,'ADM',1557177912),(221,53,0,'ADM',1557177913),(222,53,0,'ADM',1557177913),(223,53,0,'TA AE',1557177914),(224,46,0,'ai',1557178262),(225,46,0,'ta on?',1557178274),(226,36,0,'!buypremiu!spells',1557178376),(227,36,0,'!buypremium',1557178387),(228,46,0,'online',1557178389),(229,46,0,'/ !critical',1557178566),(230,54,0,'uai',1557179585),(231,54,0,'kspoakospaoska',1557179586),(232,54,0,'kika',1557179588),(233,54,0,'mika',1557179589),(234,54,0,'\'0\'',1557179590),(235,55,0,'?',1557179591),(236,54,0,'kkkkk',1557179593),(237,55,0,'kk',1557179593),(238,54,0,'iae',1557179595),(239,54,0,'sera q ',1557179598),(240,55,0,'dnv',1557179599),(241,54,0,'pe',1557179599),(242,54,0,'√©',1557179600),(243,55,0,'pqp',1557179601),(244,54,0,'bom',1557179601),(245,54,0,'esse ot',1557179603),(246,54,0,'\'0\'',1557179604),(247,55,0,'se',1557179608),(248,55,0,'tiver',1557179609),(249,55,0,'adm',1557179609),(250,55,0,'on',1557179610),(251,55,0,'eh pra ser',1557179612),(252,54,0,'de novo oq noia ???',1557179614),(253,55,0,'em todos',1557179625),(254,55,0,'otsa',1557179625),(255,54,0,'kkk',1557179633),(256,55,9,'alguem ',1557179644),(257,55,9,'?',1557179645),(258,54,0,'exura gran san',1557179653),(259,54,0,'exura gran san',1557179653),(260,54,0,'exura gran san',1557179653),(261,54,0,'exura gran san',1557179653),(262,54,0,'exura gran san',1557179654),(263,55,0,'algum fdp ai ?',1557179671),(264,55,0,'algum fdp ai ?',1557179674),(265,54,0,'exura gran san',1557179682),(266,54,0,'exura gran san',1557179682),(267,54,0,'exura gran san',1557179682),(268,54,0,'exura gran san',1557179683),(269,54,0,'exura gran san',1557179683),(270,52,0,'hi',1557179803),(271,52,0,'trade',1557179818),(272,54,9,'adm ?',1557179824),(273,52,0,'hi',1557179859),(274,52,0,'deposit all',1557179861),(275,52,0,'yes',1557179863),(276,52,0,'balance',1557179867),(277,52,0,'hi',1557180603),(278,52,0,'trade',1557180604),(279,52,0,'hi',1557180646),(280,52,0,'deposit all',1557180648),(281,52,0,'yes',1557180650),(282,52,0,'balance',1557180653),(283,52,0,'hi',1557180740),(284,52,0,'withdraw',1557180747),(285,56,0,'Oie',1557180750),(286,52,0,'1720000',1557180752),(287,52,0,'yes',1557180754),(288,56,0,'Ot abriu pouco tempo?',1557180758),(289,52,0,'!buy house',1557180767),(290,52,0,'!buyhouse',1557180773),(291,56,0,'Ot abriu pouco tempo?',1557180785),(292,52,0,'cara]',1557180805),(293,52,0,'nem sie ',1557180807),(294,52,0,'kkkk',1557180809),(295,56,0,'rsrs',1557180812),(296,52,0,'to jogando pra brinca',1557180814),(297,56,0,'Obrigada',1557180818),(298,52,0,'no primeiro que achei',1557180819),(299,52,0,'kkk',1557180821),(300,56,0,'kkkk',1557180823),(301,56,0,'ta mt vazio :( ',1557180830),(302,52,0,'dahora assim haah',1557180835),(303,56,0,'rsrs',1557180838),(304,52,0,'!buyhouse',1557180860),(305,52,0,'hi',1557180873),(306,56,0,'to entediada, procurando algum ot mais cheio kkk',1557180874),(307,52,0,'deposit all',1557180875),(308,56,0,':*',1557180875),(309,52,0,'yes',1557180877),(310,56,0,'Obrigada',1557180879),(311,46,0,'/ONLINE',1557181697),(312,52,0,'hi',1557181738),(313,52,0,'trade',1557181740),(314,46,0,'utami vita',1557182207),(315,52,0,'!buyhouse',1557182309),(316,52,0,'hi',1557182532),(317,52,0,'quest',1557182534),(318,52,0,'yes',1557182540),(319,52,0,'sim',1557182545),(320,52,0,'ta fazendo quest',1557182559),(321,52,0,'?',1557182560),(322,46,0,'nao',1557182565),(323,52,0,'^^',1557182569),(324,52,0,'hi',1557182582),(325,52,0,'trade',1557182584),(326,57,0,'hi',1557183987),(327,57,0,'hi',1557184026),(328,57,0,'!tanks',1557184033),(329,57,0,'!tasks',1557184037),(330,57,0,'task',1557184047),(331,57,0,'hi',1557184125),(332,57,0,'hii',1557184130),(333,57,0,'hi',1557184131),(334,57,0,'bones',1557184135),(335,57,0,'yes',1557184137),(336,57,0,'!auto loot',1557184143),(337,57,0,'hi',1557184293),(338,57,0,'hi',1557184298),(339,57,0,'trade',1557184300),(340,57,0,'hi',1557184321),(341,57,0,'hi',1557184324),(342,57,0,'promotion',1557184325),(343,57,0,'trade',1557184327),(344,57,0,'hi',1557184343),(345,57,0,'!promotion',1557184351),(346,57,0,'hi',1557184364),(347,57,0,'trade',1557184365),(348,36,0,'!fly depot',1557184502),(349,36,0,'!flydepot',1557184519),(350,52,0,'1',1557184763),(351,36,0,'!online',1557184909),(352,46,0,'hi',1557185001),(353,46,0,'trade',1557185003),(354,46,0,'/online',1557185109),(355,52,0,'hi',1557185182),(356,52,0,'trade',1557185184),(357,46,0,'kkkk',1557185263),(358,36,0,'aaawadass?',1557185274),(359,46,0,'Quase Ouro',1557185290),(360,52,0,'?',1557185297),(361,46,0,'vamos quest',1557185297),(362,46,0,':?',1557185300),(363,52,0,'bora',1557185305),(364,46,0,'Todoroki',1557185323),(365,46,0,'quest',1557185326),(366,46,0,'go',1557185345),(367,46,0,',',1557185350),(368,46,0,'Quase Ouro',1557185352),(369,46,0,'vamos',1557185357),(370,52,0,'qual',1557185390),(371,52,0,'?',1557185391),(372,52,0,'nussaaa',1557185406),(373,52,0,'uashuahsuahsu',1557185407),(374,52,0,'kkk',1557185412),(375,52,0,'cade o kina',1557185466),(376,52,0,'lokaoo',1557185467),(377,46,0,'poi',1557185500),(378,52,0,'volta aki nas quest',1557185522),(379,52,0,'vemman',1557185680),(380,52,0,'c mon',1557185707),(381,58,0,'exura grana',1557185726),(382,58,0,'ih',1557185738),(383,58,0,'trade',1557185740),(384,58,0,'hi',1557185743),(385,58,0,'task',1557185747),(386,58,0,'yes',1557185749),(387,52,0,'!invte',1557185942),(388,52,0,'!invite',1557185954),(389,52,0,'!invite',1557185962),(390,52,0,'!join',1557185970),(391,52,0,'!notice',1557185974),(392,52,0,'exori mas frigo',1557185996),(393,59,0,'Exori Gran\"\" Porrada Cantou',1557186049),(394,59,0,'exorfi',1557186062),(395,59,0,'!auto loot list',1557186556),(396,59,0,'hi',1557187371),(397,59,0,'trade',1557187372),(398,59,0,'hi',1557187392),(399,59,0,'trade',1557187393),(400,59,0,'hi',1557187394),(401,59,0,'trade',1557187395),(402,36,4,'XD',1557187742),(403,59,0,'hi',1557187840),(404,59,0,'trade',1557187841),(405,59,0,'hi',1557187894),(406,59,0,'hi',1557187914),(407,59,0,'trade',1557187915),(408,59,0,'hi',1557187941),(409,59,0,'trade',1557187942),(410,59,0,'imortal n√≥s dois',1557188318),(411,59,0,'asuhuhasuhsahu',1557188319),(412,60,0,'sempre',1557188333),(413,59,0,'hi',1557188521),(414,59,0,'trade',1557188522),(415,59,0,'hi',1557188547),(416,59,0,'hi',1557188572),(417,59,0,'task',1557188573),(418,60,0,'\'hi',1557188624),(419,60,0,'trade',1557188626),(420,59,0,'Utito Tempo hur',1557189031),(421,59,0,'Utito Tempo hur',1557189034),(422,59,0,'Utito Tempo hur',1557189113),(423,59,0,'Utito Tempo hur',1557189114),(424,59,0,'Utito Tempo hur',1557189114),(425,59,0,'Utito Tempo hur',1557189114),(426,59,0,'Utito Tempo hur',1557189114),(427,36,0,'!bp',1557189252),(428,36,0,'!bp',1557189262),(429,59,0,'Utito Tempo hur',1557189571),(430,36,0,'!bp',1557189587),(431,59,0,'hi',1557189799),(432,59,0,'entregar',1557189815),(433,59,0,'hi',1557189850),(434,59,0,'task',1557189854),(435,59,0,'yes',1557189858),(436,59,0,'!buyhouse',1557189894),(437,59,100,'ADM TA MUITO LAGG',1557189921),(438,59,9,'adm ta mt LAG',1557189928),(439,62,0,'hi',1557189975),(440,57,0,'hi',1557190055),(441,57,0,'task',1557190056),(442,55,0,'boa noite',1557190065),(443,55,9,'alguem ?',1557190119),(444,57,0,'hi',1557190857),(445,57,0,'trask',1557190859),(446,57,0,'task',1557190860),(447,57,0,'entregar',1557190863),(448,57,0,'hi',1557190870),(449,57,0,'task',1557190871),(450,57,0,'yes',1557190872),(451,36,0,'!sell loot',1557191721),(452,36,0,'!onlline',1557192060),(453,59,0,'hi',1557192131),(454,59,0,'hi',1557192133),(455,59,0,'entregar',1557192135),(456,59,0,'hi',1557192161),(457,59,0,'task',1557192163),(458,59,0,'yes',1557192167),(459,59,0,'!task',1557192172),(460,59,0,'ai',1557192180),(461,59,0,'que lag',1557192184),(462,59,0,'ta foda',1557192185),(463,62,0,'nosa mano',1557192199),(464,62,0,'e eu chingando virado o capeta',1557192204),(465,62,0,'kkkkkkkkkkkkkkkk',1557192210),(466,62,0,'ta foda aki dando debug toda hora',1557192301),(467,57,0,'hi',1557192367),(468,57,0,'hi',1557192379),(469,57,0,'entregar',1557192382),(470,57,0,'yes',1557192384),(471,62,0,'ta foda o lag aki',1557192457),(472,62,0,'em',1557192458),(473,62,0,'nosa e ese lag insano',1557192481),(474,62,0,'em',1557192482),(475,36,0,'trade',1557193640),(476,36,0,'hi',1557193646),(477,36,0,'trade',1557193651),(478,36,0,'hi',1557193722),(479,36,0,'saldo',1557193733),(480,36,0,'hi',1557193811),(481,36,0,'quest',1557193822),(482,36,0,'yes',1557193830),(483,57,0,'hi',1557193927),(484,57,0,'hi',1557193946),(485,57,0,'entregar',1557193952),(486,57,0,'yes',1557193953),(487,57,0,'hi',1557193955),(488,57,0,'bye',1557193957),(489,57,0,'hi',1557193958),(490,57,0,'daily',1557193963),(491,57,0,'task',1557193973),(492,57,0,'yes',1557193973),(493,57,0,'hi',1557193989),(494,57,0,'trade',1557193990),(495,63,0,'adm',1557194098),(496,36,0,'hi',1557194257),(497,36,0,'quest',1557194262),(498,36,0,'yes',1557194267),(499,57,0,'hi',1557194587),(500,57,0,'yes',1557194590),(501,57,0,'trade',1557194591),(502,57,0,'help',1557194595),(503,57,0,'mission',1557194595),(504,57,0,'yes',1557194596),(505,57,0,'task',1557194596),(506,57,0,'!promotion',1557194696),(507,57,0,'/promotion',1557194700),(508,57,0,'L',1557194737),(509,57,0,'L',1557194754),(510,57,0,'Hi',1557194773),(511,57,0,'HI',1557194786),(512,59,0,'exori gran flan',1557195049),(513,59,0,'exori gran flan',1557195049),(514,59,0,'exori gran flan',1557195049),(515,59,0,'exori gran flan',1557195050),(516,59,0,'exori gran flan',1557195054),(517,59,0,'exori gran flan',1557195054),(518,59,0,'exori gran flan',1557195055),(519,59,0,'',1557195321),(520,59,0,'',1557195322),(521,59,0,'',1557195323),(522,59,0,'',1557195324),(523,59,0,'',1557195325),(524,59,0,'',1557195326),(525,59,0,'',1557195327),(526,59,0,'',1557195328),(527,61,0,'exura gran san',1557195379),(528,61,0,'hi',1557195871),(529,61,0,'trade',1557195874),(530,61,0,'hi',1557196478),(531,61,0,'trade',1557196479),(532,61,0,'hi',1557196522),(533,61,0,'trade',1557196525),(534,61,0,'!backpack',1557196541),(535,61,0,'!backpack',1557196544),(536,61,0,'!backpack',1557196553),(537,61,0,'!backpack',1557196560),(538,61,0,'!backpack',1557196569),(539,61,0,'!backpack',1557196572),(540,61,0,'2455!',1557196636),(541,61,0,'!backpack',1557196638),(542,61,0,'!backpack',1557196640),(543,61,0,'!backpack',1557196643),(544,61,0,'!backpack',1557196855),(545,61,0,'!backpack',1557196857),(546,61,0,'!backpack',1557196858),(547,61,0,'!backpack',1557196859),(548,61,0,'!backpack',1557196862),(549,61,0,'!backpack',1557196864),(550,61,0,'!backpack',1557196865),(551,61,0,'!backpack',1557196867),(552,61,0,'!backpack',1557196938),(553,61,0,'!backpack',1557196939),(554,61,0,'!backpack',1557196941),(555,61,0,'!backpack',1557196942),(556,61,0,'!backpack',1557196943),(557,61,0,'!backpack',1557196945),(558,61,0,'!backpack',1557196946),(559,61,0,'!backpack',1557196947),(560,61,0,'!backpack',1557196969),(561,61,0,'!backpack',1557196970),(562,61,0,'!backpack',1557196971),(563,61,0,'!backpack',1557196974),(564,61,0,'!backpack',1557196974),(565,61,0,'!backpack',1557196978),(566,61,0,'!backpack',1557196981),(567,61,0,'!backpack',1557196982),(568,61,0,'!backpack',1557196984),(569,61,0,'hi',1557197099),(570,61,0,'trade',1557197101),(571,65,0,'!premium',1557197132),(572,65,0,'!buypremium',1557197137),(573,66,0,'god',1557197683),(574,61,0,'hi',1557197691),(575,61,0,'trade',1557197694),(576,65,0,'hi',1557198096),(577,65,0,'trade',1557198097),(578,65,0,'hi',1557198132),(579,65,0,'trade',1557198134),(580,65,0,'!onlibe',1557198164),(581,36,0,'!fly dopot',1557199001),(582,61,0,'fala meu broder',1557199191),(583,36,0,'hi',1557199268),(584,36,0,'trade',1557199274),(585,65,0,'hi',1557199423),(586,65,0,'trade',1557199425),(587,65,0,'bye',1557199432),(588,61,9,'hi',1557200346),(589,61,0,'hi',1557200356),(590,61,0,'trade',1557200358),(591,61,0,'fala doido boa noite',1557201042),(592,61,0,'hi',1557201270),(593,61,0,'trade',1557201271),(594,61,0,'exori mas flam',1557201412),(595,61,0,'exori mas flam',1557201412),(596,61,0,'exori mas flam',1557201412),(597,61,0,'exori mas flam',1557201412),(598,61,0,'exori mas flam',1557201412),(599,65,0,'hyper wizard buff ',1557201447),(600,61,0,'fala mano so deboa',1557201719),(601,67,0,'!afk on',1557201726),(602,61,0,'hi',1557202039),(603,61,0,'trade',1557202040),(604,61,0,'hi',1557202258),(605,61,0,'trade',1557202259),(606,61,0,'hi',1557202265),(607,61,0,'trade',1557202266),(608,61,0,'3hi',1557202348),(609,61,0,'hi',1557202351),(610,61,0,'trade',1557202353),(611,61,0,'trade',1557202363),(612,61,0,'3mano vc e br',1557202665),(613,61,0,'hi',1557202749),(614,61,0,'trade',1557202750),(615,61,0,'hi',1557202755),(616,61,0,'trade',1557202756),(617,61,0,'!aol',1557202786),(618,61,0,'!bless',1557202788),(619,61,0,'hi',1557203151),(620,61,0,'trade',1557203152),(621,61,0,'hi',1557203159),(622,61,0,'trade',1557203160),(623,61,0,'!aol',1557203263),(624,61,0,'!aol',1557203265),(625,61,0,'hi',1557203339),(626,61,0,'trade',1557203340),(627,61,0,'hi',1557203344),(628,61,0,'trade',1557203346),(629,61,0,'!aol',1557203382),(630,61,0,'!aol',1557203383),(631,61,0,'hi',1557203507),(632,61,0,'trade',1557203508),(633,61,0,'hi',1557203513),(634,61,0,'trade',1557203514),(635,67,0,'hi',1557203585),(636,67,0,'trade',1557203586),(637,62,0,'fala doido',1557203599),(638,62,0,'boa noite',1557203614),(639,62,0,'vai chupa pika entao otario',1557203682),(640,67,0,'hi',1557203842),(641,61,0,'hi',1557203852),(642,61,0,'trade',1557203853),(643,67,0,'hi',1557203856),(644,67,0,'trade',1557203857),(645,61,0,'hi',1557203860),(646,61,0,'trade',1557203861),(647,67,0,'hi',1557203880),(648,67,0,'trade',1557203883),(649,67,0,'hi',1557203910),(650,67,0,'promotion',1557203916),(651,67,0,'yes',1557203918),(652,67,0,'help',1557203920),(653,67,0,'hi',1557203943),(654,67,0,'trade',1557203944),(655,61,0,'hi',1557204159),(656,61,0,'trade',1557204160),(657,61,0,'hi',1557204165),(658,61,0,'trade',1557204166),(659,67,0,'hi',1557204627),(660,67,0,'pick',1557204632),(661,67,0,'help',1557204646),(662,67,0,'trade',1557204658),(663,61,0,'hi',1557205056),(664,61,0,'trade',1557205058),(665,61,0,'hi',1557205062),(666,61,0,'trade',1557205064),(667,67,0,'!AOL',1557205230),(668,61,0,'hi',1557205245),(669,61,0,'trade',1557205246),(670,61,0,'hi',1557205258),(671,61,0,'trade',1557205258),(672,61,0,'hi',1557205338),(673,61,0,'trade',1557205339),(674,61,0,'hi',1557205344),(675,61,0,'trade',1557205345),(676,61,0,'hi',1557205665),(677,61,0,'trade',1557205666),(678,61,0,'hi',1557205671),(679,61,0,'trade',1557205672),(680,61,0,'hi',1557205987),(681,61,0,'trade',1557205988),(682,61,0,'hi',1557205993),(683,61,0,'trade',1557205994),(684,61,0,'hi',1557206855),(685,61,0,'trade',1557206857),(686,61,0,'hi',1557207509),(687,61,0,'trade',1557207510),(688,61,0,'hi',1557207586),(689,61,0,'trade',1557207588),(690,61,0,'!backpack',1557207671),(691,61,0,'!backpack',1557207673),(692,61,0,'!backpack',1557207674),(693,61,0,'!backpack',1557207675),(694,61,0,'!backpack',1557207676),(695,61,0,'!backpack',1557207677),(696,61,0,'!backpack',1557207678),(697,61,0,'!backpack',1557207679),(698,61,0,'!backpack',1557207680),(699,61,0,'!backpack',1557207680),(700,61,0,'!backpack',1557207681),(701,61,0,'!backpack',1557207682),(702,61,0,'!backpack',1557207683),(703,61,0,'!backpack',1557207684),(704,61,0,'!backpack',1557207685),(705,61,0,'!backpack',1557207686),(706,61,0,'!backpack',1557207687),(707,61,0,'hi',1557207861),(708,61,0,'trade',1557207862),(709,61,0,'hi',1557207868),(710,61,0,'trade',1557207869),(711,69,0,'hi',1557207943),(712,69,0,'trade',1557207946),(713,69,0,'!buyhouse',1557208071),(714,61,0,'hi',1557208289),(715,61,0,'trade',1557208290),(716,61,0,'hi',1557208296),(717,61,0,'trade',1557208298),(718,69,0,'hi',1557208529),(719,69,0,'trade',1557208531),(720,61,0,'hi',1557208740),(721,61,0,'trade',1557208741),(722,61,0,'hi',1557208745),(723,61,0,'trade',1557208746),(724,61,0,'hi',1557208776),(725,61,0,'trade',1557208777),(726,61,0,'hi',1557208782),(727,61,0,'trade',1557208783),(728,61,0,'hi',1557209074),(729,61,0,'trade',1557209075),(730,61,0,'hi',1557209081),(731,61,0,'trade',1557209082),(732,61,0,'!bless',1557209410),(733,61,0,'hi',1557209422),(734,61,0,'trade',1557209423),(735,61,0,'hi',1557209429),(736,61,0,'trade',1557209430),(737,69,0,'hi',1557213212),(738,69,0,'trade',1557213214),(739,69,0,'hi',1557213336),(740,69,0,'trade',1557213338),(741,69,0,'!addon pirate',1557213833),(742,69,0,'!addon pirate',1557213863),(743,69,0,'!voodoo pirate',1557213907);
/*!40000 ALTER TABLE `player_statements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_storage`
--

DROP TABLE IF EXISTS `player_storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_storage` (
  `player_id` int(11) NOT NULL DEFAULT '0',
  `key` varchar(32) NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '0',
  UNIQUE KEY `player_id_2` (`player_id`,`key`),
  KEY `player_id` (`player_id`),
  CONSTRAINT `player_storage_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_storage`
--

LOCK TABLES `player_storage` WRITE;
/*!40000 ALTER TABLE `player_storage` DISABLE KEYS */;
INSERT INTO `player_storage` VALUES (9,'10001','0'),(9,'10002','1'),(9,'10003','1'),(9,'12232','-1'),(9,'123540','1556734004'),(9,'123541','1'),(9,'40046','1'),(9,'48902','0'),(9,'48913','0'),(9,'49689','-1'),(9,'54555','1557176858'),(9,'666','1557177007'),(9,'6723','111'),(9,'72702','22'),(9,'7604','1'),(9,'8600','0'),(9,'879780','0'),(9,'879781','0'),(9,'9952','-1'),(36,'10000','400'),(36,'19141','1'),(36,'25090','1557199391'),(36,'281821','1557284455'),(36,'30700','Values: \'100\',\'200\',\'400\',\'500\''),(36,'40046','1'),(36,'48902','0'),(36,'48913','0'),(36,'54555','1557194314'),(36,'666','1557199164'),(36,'6723','45'),(36,'72702','10'),(36,'879780','0'),(36,'879781','0'),(42,'10000','100'),(42,'30700','Values: \'100\''),(42,'40046','1'),(42,'48902','0'),(42,'48913','0'),(42,'54555','1557177013'),(42,'6723','12'),(42,'72702','2'),(42,'879780','0'),(42,'879781','1557177908'),(43,'10000','75'),(43,'17540','1'),(43,'17541','1'),(43,'176207','1'),(43,'176603','11'),(43,'30700','Values: \'100\''),(43,'40046','1'),(43,'48902','0'),(43,'48913','0'),(43,'54555','1557168639'),(43,'666','1557166902'),(43,'6723','1'),(43,'72702','0'),(43,'879780','0'),(43,'879781','0'),(44,'10000','60'),(44,'123540','1557254427'),(44,'123541','1'),(44,'17540','1'),(44,'40046','1'),(44,'48902','0'),(44,'48913','0'),(44,'54555','1557167026'),(44,'666','1557167705'),(44,'6723','3'),(44,'72702','0'),(44,'879780','0'),(44,'879781','0'),(45,'40046','1'),(45,'48902','0'),(45,'48913','0'),(45,'54555','1557167217'),(45,'72702','0'),(45,'879780','0'),(45,'879781','0'),(46,'10000','100'),(46,'10001501','65539'),(46,'10001502','327683'),(46,'123540','1557261409'),(46,'123541','1'),(46,'18001','1'),(46,'18002','1'),(46,'18009','1'),(46,'18010','1'),(46,'30700','Values: \'100\',\'200\''),(46,'40046','1'),(46,'45814','1557175665.5'),(46,'48902','0'),(46,'48913','0'),(46,'54555','1557189182'),(46,'666','1557185125'),(46,'6723','18'),(46,'72702','0'),(46,'879780','0'),(46,'879781','0'),(47,'10000','100'),(47,'30700','Values: \'100\''),(47,'40046','1'),(47,'48902','0'),(47,'48913','0'),(47,'54555','1557171029'),(47,'666','1557170651'),(47,'6723','0'),(47,'72702','0'),(47,'879780','0'),(47,'879781','0'),(48,'10000','100'),(48,'10001501','65539'),(48,'10137','1'),(48,'10543','1'),(48,'10544','1'),(48,'10547','1'),(48,'10549','1'),(48,'10550','1'),(48,'10559','1'),(48,'11259','1'),(48,'17458','1'),(48,'17540','1'),(48,'176202','1'),(48,'176207','1'),(48,'176601','2'),(48,'176602','5'),(48,'176603','43'),(48,'18001','1'),(48,'18002','1'),(48,'23782','1'),(48,'2493','1'),(48,'29189','1'),(48,'30700','Values: \'100\',\'200\''),(48,'40046','1'),(48,'45814','1557170187.5'),(48,'48902','0'),(48,'48913','0'),(48,'54555','1557175315'),(48,'666','1557175258'),(48,'6723','8'),(48,'72702','0'),(48,'879780','0'),(48,'879781','0'),(49,'40046','1'),(49,'48902','0'),(49,'48913','0'),(49,'54555','1557170655'),(49,'72702','0'),(49,'879780','0'),(49,'879781','0'),(50,'10000','100'),(50,'123540','1557262133'),(50,'123541','1'),(50,'30700','Values: \'100\''),(50,'40046','1'),(50,'45001','1'),(50,'45005','-1'),(50,'45814','1557175208.5'),(50,'48902','0'),(50,'48913','0'),(50,'54555','1557175902'),(50,'6723','2'),(50,'72702','0'),(50,'879780','0'),(50,'879781','0'),(51,'40046','1'),(51,'48902','0'),(51,'48913','0'),(51,'54555','1557174388'),(51,'666','1557174406'),(51,'72702','0'),(51,'879780','0'),(51,'879781','0'),(52,'10000','90'),(52,'2493','1'),(52,'281821','1557262845'),(52,'30700','Values: \'100\',\'200\''),(52,'40046','1'),(52,'45814','1557182589.5'),(52,'48902','0'),(52,'48913','0'),(52,'54555','1557186754'),(52,'666','1557185073'),(52,'6723','8'),(52,'72702','0'),(52,'879780','0'),(52,'879781','0'),(53,'40046','1'),(53,'48902','0'),(53,'48913','0'),(53,'54555','1557177633'),(53,'666','1557177908'),(53,'72702','0'),(53,'879780','0'),(53,'879781','0'),(54,'10000','30'),(54,'40046','1'),(54,'48902','0'),(54,'48913','0'),(54,'54555','1557179564'),(54,'72702','0'),(54,'7604','1'),(54,'8600','0'),(54,'879780','0'),(54,'879781','0'),(55,'10000','31'),(55,'40046','1'),(55,'48902','0'),(55,'48913','0'),(55,'54555','1557190018'),(55,'72702','0'),(55,'879780','0'),(55,'879781','0'),(55,'9952','-1'),(56,'40046','1'),(56,'48902','0'),(56,'48913','0'),(56,'54555','1557180642'),(56,'666','1557180660'),(56,'72702','0'),(56,'879780','0'),(56,'879781','0'),(57,'10000','100'),(57,'17540','1'),(57,'17541','1'),(57,'176202','1'),(57,'176203','1'),(57,'176207','1'),(57,'176601','3'),(57,'176602','11'),(57,'176603','32'),(57,'176604','11'),(57,'176605','0'),(57,'176606','1557280363'),(57,'176607','1'),(57,'30700','Values: \'100\',\'200\''),(57,'40046','1'),(57,'45814','1557184375.5'),(57,'48902','0'),(57,'48913','0'),(57,'54555','1557193344'),(57,'666','1557189084'),(57,'6723','13'),(57,'72702','2'),(57,'7604','1'),(57,'8600','0'),(57,'879780','0'),(57,'879781','1557197258'),(58,'10000','26'),(58,'40046','1'),(58,'48902','0'),(58,'48913','0'),(58,'54555','1557185562'),(58,'72702','0'),(58,'879780','0'),(58,'879781','1557186016'),(59,'10000','55'),(59,'10543','1'),(59,'17541','1'),(59,'176202','1'),(59,'176203','1'),(59,'176207','1'),(59,'176601','3'),(59,'176602','11'),(59,'176603','0'),(59,'30700','Values: \'100\',\'200\''),(59,'40046','1'),(59,'45004','0'),(59,'45006','2492'),(59,'45814','1557187951.5'),(59,'48902','0'),(59,'48913','0'),(59,'54555','1557192329'),(59,'6723','11'),(59,'72702','0'),(59,'879780','0'),(59,'879781','1557195980'),(60,'10000','55'),(60,'281821','1557273651'),(60,'30700','Values: \'100\',\'200\''),(60,'40046','1'),(60,'45814','1557188634.5'),(60,'48902','0'),(60,'48913','0'),(60,'54555','1557188551'),(60,'6723','3'),(60,'72702','0'),(60,'879780','0'),(60,'879781','0'),(61,'10000','80'),(61,'25090','1557206384'),(61,'30700','Values: \'100\',\'200\''),(61,'40046','1'),(61,'45001','1'),(61,'45004','2'),(61,'45005','a1:  1 golden legs + 1 mastermind shield +, 2: 0, a'),(61,'45006','2514'),(61,'45007','2472'),(61,'45008','2470'),(61,'48902','0'),(61,'48913','0'),(61,'54555','1557209413'),(61,'666','1557205385'),(61,'6723','21'),(61,'72702','1'),(61,'879780','0'),(61,'879781','0'),(62,'10000','25'),(62,'40046','1'),(62,'48902','0'),(62,'48913','0'),(62,'54555','1557212277'),(62,'666','1557203589'),(62,'6723','26'),(62,'72702','0'),(62,'879780','0'),(62,'879781','1557214373'),(63,'10000','22'),(63,'40046','1'),(63,'48902','0'),(63,'48913','0'),(63,'54555','1557194062'),(63,'72702','0'),(63,'879780','0'),(63,'879781','0'),(64,'40046','1'),(64,'48902','0'),(64,'48913','0'),(64,'54555','1557195231'),(64,'666','1557195244'),(64,'72702','0'),(64,'879780','0'),(64,'879781','0'),(65,'10000','110'),(65,'10001501','65539'),(65,'17540','1'),(65,'18001','1'),(65,'18002','1'),(65,'30700','Values: \'100\',\'200\''),(65,'40046','1'),(65,'45002','1'),(65,'45003','6605'),(65,'45005','a2: 70, a'),(65,'45814','1557198139.5'),(65,'48902','0'),(65,'48913','0'),(65,'54555','1557206404'),(65,'666','1557206414'),(65,'6723','6'),(65,'72702','0'),(65,'879780','0'),(65,'879781','1557207001'),(66,'40046','1'),(66,'48902','0'),(66,'48913','0'),(66,'54555','1557197683'),(66,'72702','0'),(66,'879780','0'),(66,'879781','0'),(67,'10000','100'),(67,'29189','1'),(67,'30700','Values: \'100\',\'200\''),(67,'40046','1'),(67,'45814','1557204660.5'),(67,'48902','0'),(67,'48913','0'),(67,'54555','1557205425'),(67,'6723','5'),(67,'72702','0'),(67,'7604','1'),(67,'8600','0'),(67,'879780','0'),(67,'879781','1557206051'),(69,'10000','54'),(69,'10001501','262146'),(69,'13967','1'),(69,'18008','1'),(69,'19141','1'),(69,'30700','Values: \'100\',\'200\''),(69,'40046','1'),(69,'45814','1557208576.5'),(69,'48902','0'),(69,'48913','0'),(69,'54555','1557213137'),(69,'5924','1'),(69,'5925','1'),(69,'5927','1'),(69,'666','1557208168'),(69,'6723','8'),(69,'72702','1'),(69,'879780','1'),(69,'879781','1557216269');
/*!40000 ALTER TABLE `player_storage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_viplist`
--

DROP TABLE IF EXISTS `player_viplist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_viplist` (
  `player_id` int(11) NOT NULL,
  `vip_id` int(11) NOT NULL,
  UNIQUE KEY `player_id_2` (`player_id`,`vip_id`),
  KEY `player_id` (`player_id`),
  KEY `vip_id` (`vip_id`),
  CONSTRAINT `player_viplist_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE,
  CONSTRAINT `player_viplist_ibfk_2` FOREIGN KEY (`vip_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_viplist`
--

LOCK TABLES `player_viplist` WRITE;
/*!40000 ALTER TABLE `player_viplist` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_viplist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `group_id` int(11) NOT NULL DEFAULT '1',
  `account_id` int(11) NOT NULL DEFAULT '0',
  `level` int(11) NOT NULL DEFAULT '1',
  `vocation` int(11) NOT NULL DEFAULT '0',
  `health` int(11) NOT NULL DEFAULT '150',
  `healthmax` int(11) NOT NULL DEFAULT '150',
  `experience` bigint(20) NOT NULL DEFAULT '0',
  `lookbody` int(11) NOT NULL DEFAULT '0',
  `lookfeet` int(11) NOT NULL DEFAULT '0',
  `lookhead` int(11) NOT NULL DEFAULT '0',
  `looklegs` int(11) NOT NULL DEFAULT '0',
  `looktype` int(11) NOT NULL DEFAULT '136',
  `lookaddons` int(11) NOT NULL DEFAULT '0',
  `lookmount` int(11) NOT NULL DEFAULT '0',
  `maglevel` int(11) NOT NULL DEFAULT '0',
  `mana` int(11) NOT NULL DEFAULT '0',
  `manamax` int(11) NOT NULL DEFAULT '0',
  `manaspent` int(11) NOT NULL DEFAULT '0',
  `soul` int(10) unsigned NOT NULL DEFAULT '0',
  `town_id` int(11) NOT NULL DEFAULT '0',
  `posx` int(11) NOT NULL DEFAULT '0',
  `posy` int(11) NOT NULL DEFAULT '0',
  `posz` int(11) NOT NULL DEFAULT '0',
  `conditions` blob NOT NULL,
  `cap` int(11) NOT NULL DEFAULT '0',
  `sex` int(11) NOT NULL DEFAULT '0',
  `lastlogin` bigint(20) unsigned NOT NULL DEFAULT '0',
  `lastip` int(10) unsigned NOT NULL DEFAULT '0',
  `save` tinyint(1) NOT NULL DEFAULT '1',
  `skull` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `skulltime` int(11) NOT NULL DEFAULT '0',
  `rank_id` int(11) NOT NULL DEFAULT '0',
  `guildnick` varchar(255) NOT NULL DEFAULT '',
  `lastlogout` bigint(20) unsigned NOT NULL DEFAULT '0',
  `blessings` tinyint(2) NOT NULL DEFAULT '0',
  `pvp_blessing` tinyint(1) NOT NULL DEFAULT '0',
  `balance` bigint(20) NOT NULL DEFAULT '0',
  `stamina` bigint(20) NOT NULL DEFAULT '151200000' COMMENT 'stored in miliseconds',
  `direction` int(11) NOT NULL DEFAULT '2',
  `loss_experience` int(11) NOT NULL DEFAULT '100',
  `loss_mana` int(11) NOT NULL DEFAULT '100',
  `loss_skills` int(11) NOT NULL DEFAULT '100',
  `loss_containers` int(11) NOT NULL DEFAULT '100',
  `loss_items` int(11) NOT NULL DEFAULT '100',
  `premend` int(11) NOT NULL DEFAULT '0' COMMENT 'NOT IN USE BY THE SERVER',
  `online` tinyint(1) NOT NULL DEFAULT '0',
  `marriage` int(10) unsigned NOT NULL DEFAULT '0',
  `marrystatus` int(10) unsigned NOT NULL DEFAULT '0',
  `promotion` int(11) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL DEFAULT '',
  `exphist_lastexp` bigint(255) NOT NULL DEFAULT '0',
  `exphist1` bigint(255) NOT NULL DEFAULT '0',
  `exphist2` bigint(255) NOT NULL DEFAULT '0',
  `exphist3` bigint(255) NOT NULL DEFAULT '0',
  `exphist4` bigint(255) NOT NULL DEFAULT '0',
  `exphist5` bigint(255) NOT NULL DEFAULT '0',
  `exphist6` bigint(255) NOT NULL DEFAULT '0',
  `exphist7` bigint(255) NOT NULL DEFAULT '0',
  `onlinetimetoday` bigint(255) NOT NULL DEFAULT '0',
  `onlinetime1` bigint(255) NOT NULL DEFAULT '0',
  `onlinetime2` bigint(255) NOT NULL DEFAULT '0',
  `onlinetime3` bigint(255) NOT NULL DEFAULT '0',
  `onlinetime4` bigint(255) NOT NULL DEFAULT '0',
  `onlinetime5` bigint(255) NOT NULL DEFAULT '0',
  `onlinetime6` bigint(255) NOT NULL DEFAULT '0',
  `onlinetime7` bigint(255) NOT NULL DEFAULT '0',
  `onlinetimeall` bigint(255) NOT NULL DEFAULT '0',
  `auction_balance` int(15) NOT NULL,
  `created` int(11) NOT NULL,
  `nick_verify` varchar(5) NOT NULL,
  `old_name` varchar(255) NOT NULL DEFAULT '',
  `hide_char` int(11) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `show_outfit` int(11) NOT NULL DEFAULT '0',
  `show_eq` int(11) NOT NULL DEFAULT '0',
  `show_bars` int(11) NOT NULL DEFAULT '0',
  `show_skills` int(11) NOT NULL DEFAULT '0',
  `show_quests` int(11) NOT NULL DEFAULT '0',
  `stars` int(11) NOT NULL DEFAULT '0',
  `create_ip` int(11) NOT NULL DEFAULT '0',
  `create_date` int(11) NOT NULL DEFAULT '0',
  `signature` text NOT NULL,
  `cast` tinyint(4) NOT NULL DEFAULT '0',
  `castViewers` int(11) NOT NULL DEFAULT '0',
  `castDescription` varchar(255) NOT NULL,
  `offlinetraining_time` smallint(5) unsigned NOT NULL DEFAULT '43200',
  `offlinetraining_skill` int(11) NOT NULL DEFAULT '-1',
  `broadcasting` tinyint(4) DEFAULT '0',
  `viewers` int(1) DEFAULT '0',
  `ip` varchar(17) NOT NULL DEFAULT '0',
  `skill_fist` int(10) unsigned NOT NULL DEFAULT '10',
  `skill_fist_tries` bigint(20) unsigned NOT NULL DEFAULT '0',
  `skill_club` int(10) unsigned NOT NULL DEFAULT '10',
  `skill_club_tries` bigint(20) unsigned NOT NULL DEFAULT '0',
  `skill_sword` int(10) unsigned NOT NULL DEFAULT '10',
  `skill_sword_tries` bigint(20) unsigned NOT NULL DEFAULT '0',
  `skill_axe` int(10) unsigned NOT NULL DEFAULT '10',
  `skill_axe_tries` bigint(20) unsigned NOT NULL DEFAULT '0',
  `skill_dist` int(10) unsigned NOT NULL DEFAULT '10',
  `skill_dist_tries` bigint(20) unsigned NOT NULL DEFAULT '0',
  `skill_shielding` int(10) unsigned NOT NULL DEFAULT '10',
  `skill_shielding_tries` bigint(20) unsigned NOT NULL DEFAULT '0',
  `skill_fishing` int(10) unsigned NOT NULL DEFAULT '10',
  `skill_fishing_tries` bigint(20) unsigned NOT NULL DEFAULT '0',
  `sbw_points` bigint(255) NOT NULL DEFAULT '0',
  `frags_all` smallint(5) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`deleted`),
  KEY `account_id` (`account_id`),
  KEY `group_id` (`group_id`),
  KEY `online` (`online`),
  KEY `deleted` (`deleted`),
  CONSTRAINT `players_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` VALUES (1,'Account Manager',0,1,1,8,0,180,180,4200,0,88,88,0,127,0,0,0,50,50,0,100,1,804,439,7,'',700,0,1557210332,2391672521,0,0,0,0,'',0,0,0,0,151200000,0,100,100,100,100,100,0,0,0,0,0,0,'',4200,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','',0,'0',0,0,0,0,0,0,0,0,'',0,0,'',43200,-1,0,0,'201.6.142.142',10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,0),(2,'Rook Sample',0,1,3,8,0,180,180,4200,0,88,88,0,134,0,0,0,50,50,0,100,1,157,50,7,'',700,1,0,0,1,0,0,0,'',0,0,0,0,151200000,0,0,100,100,100,100,0,0,0,0,0,0,'',4200,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1299890460,'1','',0,'0',0,0,0,0,0,0,0,0,'',0,0,'',43200,-1,0,0,'0',10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,0),(3,'Sorcerer Sample',0,1,3,8,1,180,180,4200,0,88,88,0,134,0,0,0,50,50,0,100,1,157,50,7,'',700,1,0,0,1,0,0,0,'',0,0,0,30000,151200000,0,100,100,100,100,100,0,0,0,0,0,0,'',4200,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1299890460,'1','',0,'',0,0,0,0,0,0,0,0,'',0,0,'',43200,-1,0,0,'0',10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,0),(4,'Druid Sample',0,1,3,8,2,180,180,4200,0,88,88,0,134,0,0,0,50,50,0,100,1,157,50,7,'',700,1,0,0,1,0,0,0,'',0,0,0,0,151200000,0,100,100,100,100,100,0,0,0,0,0,0,'',4200,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1299890460,'1','',0,'',0,0,0,0,0,0,0,0,'',0,0,'',43200,-1,0,0,'0',10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,0),(5,'Paladin Sample',0,1,3,8,3,180,180,4200,0,88,88,0,134,0,0,0,50,50,0,100,1,157,50,7,'',700,1,0,0,1,0,0,0,'',0,0,0,0,151200000,0,100,100,100,100,100,0,0,0,0,0,0,'',4200,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1299890460,'1','',0,'',0,0,0,0,0,0,0,0,'',0,0,'',43200,-1,0,0,'0',10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,0),(6,'Knight Sample',0,1,3,8,4,180,180,4200,0,88,88,0,134,0,0,0,50,50,0,100,1,157,50,7,'',700,1,0,0,1,0,0,0,'',0,0,0,0,151200000,0,100,100,100,100,100,0,0,0,0,0,0,'',4200,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1299890461,'1','',0,'',0,0,0,0,0,0,0,0,'',0,0,'',43200,-1,0,0,'0',10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,0),(9,'[Admin]',0,6,5,400,2,180,180,1050779800,0,88,88,0,134,3,0,0,50,50,0,100,1,156,55,7,'',700,1,1557176853,2600398003,1,0,0,110,'',1557177056,0,0,0,151200000,0,100,100,100,100,100,0,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','',0,'',0,0,0,0,0,0,2147483647,1556638573,'',0,0,'',43200,-1,0,0,'179.236.254.154',10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,0),(36,'Todoroki',0,1,32,599,4,9039,9045,3563573923,90,92,0,130,251,0,0,9,712,3005,5903397,100,1,1523,1867,7,'\0\0\0ˇˇˇˇxÊ\0\0\Z\0\0\0\0\0\0\0\0˛\0@\0\0ˇˇˇˇò•\0\Z\0\0\0\0\0\0\0\0\0\0\0¿‘\0˛\0\0Ä\0ˇˇˇˇxÊ\0\0\Z\0\0\0\0\0\0\0\0˛\0\0\0ˇˇˇˇÙ\0\0\Z\0\0\0\0\0\0\0˛',15475,1,1557194309,212972987,1,3,0,0,'',1557216003,31,0,0,135158000,0,100,100,100,100,100,0,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','',0,'',0,0,0,0,0,0,2147483647,1557076609,'',0,0,'',43200,-1,0,0,'187.181.177.12',10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,0),(37,'Alahor',0,1,33,8,2,180,180,4200,0,88,88,0,134,0,0,0,50,50,0,100,2,0,0,0,'',700,1,0,0,1,0,0,0,'',0,0,0,0,151200000,0,100,100,100,100,100,0,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','',0,'',0,0,0,0,0,0,2147483647,1557091812,'',0,0,'',43200,-1,0,0,'0',10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,0),(39,'Eternal Pally',0,1,34,8,3,180,180,4200,0,88,88,0,134,0,0,0,50,50,0,100,1,0,0,0,'',700,1,0,0,1,0,0,0,'',0,0,0,0,151200000,0,100,100,100,100,100,0,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','',0,'',0,0,0,0,0,0,2147483647,1557107408,'',0,0,'',43200,-1,0,0,'0',10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,0),(42,'Master Lannister',0,1,31,155,3,1650,1650,60703156,87,114,94,114,139,0,0,24,45,2255,4996115,100,1,1217,146,6,'\0\0\0ˇˇˇˇ`Í\0\0\Z\0\0\0\0\0\0\0\0˛',3640,0,1557177008,768012991,1,0,0,0,'',1557177728,31,0,0,150182000,0,100,100,100,100,100,0,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','',0,'',0,0,0,0,0,0,2147483647,1557160762,'',0,0,'',43200,-1,0,0,'191.242.198.45',10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,0),(43,'Darkaiser',0,1,36,175,1,1020,1020,86814123,68,76,78,39,136,0,0,25,5045,5045,14119,100,1,155,52,7,'',2105,0,1557168634,1942734269,1,0,0,0,'',1557168707,0,0,0,150131000,2,100,100,100,100,100,0,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','',0,'',0,0,0,0,0,0,0,0,'',0,0,'',43200,-1,0,0,'189.197.203.115',10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,0),(44,'Cerveja',0,1,37,61,2,450,450,3469200,68,76,78,39,128,0,0,3,1125,1625,1529,100,1,157,47,7,'',965,1,1557167021,1377095823,1,0,0,0,'',1557170217,31,0,0,150966000,2,100,100,100,100,100,0,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','',0,'',0,0,0,0,0,0,0,0,'',0,0,'',43200,-1,0,0,'143.208.20.82',10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,0),(45,'Druid Rush',0,1,38,8,2,180,180,4200,0,88,88,0,134,0,0,0,50,50,0,100,1,156,51,7,'',700,1,1557167212,3251877307,1,0,0,0,'',1557167247,31,0,0,151200000,0,100,100,100,100,100,0,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','',0,'',0,0,0,0,0,0,2147483647,1557167188,'',0,0,'',43200,-1,0,0,'187.181.211.193',10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,0),(46,'Askan',0,1,39,266,2,1475,1475,306890238,0,114,0,0,132,3,0,54,7175,7775,16967,100,1,155,48,7,'',3015,1,1557189177,3625763258,1,0,0,0,'',1557189295,0,0,0,143922833,2,100,100,100,100,100,0,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','',0,'',0,0,0,0,0,0,0,0,'',0,0,'',43200,-1,0,0,'186.193.28.216',10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,0),(47,'Tone Bicklas',0,1,40,151,2,900,900,55622351,68,76,78,39,128,0,0,54,4316,4325,140468,100,1,539,433,7,'\0\0\0ˇˇˇˇ¿⁄\0\0\Z\0\0\0\0\0\0\0\0˛\0\0Ä\0ˇˇˇˇ‡´\0\0\Z\0\0\0\0\0\0\0\0˛\0@\0\0ˇˇˇˇ\0k\0\Z\0\0\0\0\0\0\0\0\0\0\0¿‘\0˛',1865,1,1557171024,2501024601,1,0,0,0,'',1557171136,31,0,0,150733000,2,100,100,100,100,100,0,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','',0,'',0,0,0,0,0,0,0,0,'',0,0,'',43200,-1,0,0,'89.155.18.149',10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,0),(48,'Krystian',0,1,41,378,2,2035,2035,889461089,95,79,79,95,128,3,0,68,11135,11135,460115,100,1,157,50,7,'',4135,1,1557175310,1706421170,1,0,0,0,'',1557177722,0,0,0,145200000,2,100,100,100,100,100,0,0,0,0,1,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','',0,'',0,0,0,0,0,0,0,0,'',0,0,'',43200,-1,0,0,'178.235.181.101',10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,0),(49,'Xx Anonymous Xx',0,1,42,8,3,185,185,4200,68,76,78,39,128,0,0,0,35,35,0,100,1,157,51,7,'',435,1,1557170650,3631416767,1,0,0,0,'',1557170715,31,0,0,151200000,2,100,100,100,100,100,0,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','',0,'',0,0,0,0,0,0,0,0,'',0,0,'',43200,-1,0,0,'191.5.115.216',10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,0),(50,'Bom no lol',0,1,43,162,2,955,955,68476823,68,76,78,39,128,0,0,55,4505,4655,207499,100,1,162,50,7,'',1975,1,1557175897,419724465,1,0,0,0,'',1557175902,0,0,0,149740000,2,100,100,100,100,100,0,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','',0,'',0,0,0,0,0,0,0,0,'',0,0,'',43200,-1,0,0,'177.124.4.25',10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,0),(51,'Foda-se',0,1,44,8,2,185,185,4200,68,76,78,39,128,0,0,0,35,35,0,100,1,148,50,7,'',435,1,1557174383,3389815985,1,0,0,0,'',1557174450,31,0,0,151200000,2,100,100,100,100,100,0,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','',0,'',0,0,0,0,0,0,0,0,'',0,0,'',43200,-1,0,0,'177.124.12.202',10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,0),(52,'Quase Ouro',0,1,45,215,2,1220,1220,162530222,114,114,95,114,152,0,0,57,6245,6245,348105,100,1,132,55,5,'\0\0\0ˇˇˇˇ¯*\0\0\Z\0\0\0\0\0\0\0\0˛\0@\0\0ˇˇˇˇ–x\0\Z\0\0\0\0\0\0\0\0\0\0\0¿‘\0˛\0 \0\0ˇˇˇˇêÇ\0\Z\0\0\0\0\0\0\0\0Ë\0\0d\0\0\0Ë\0\0»\0\0\0˛',2505,1,1557186749,452276145,1,0,0,0,'',1557186756,31,0,8812600,148450833,2,100,100,100,100,100,0,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','',0,'',0,0,0,0,0,0,0,0,'',0,0,'',43200,-1,0,0,'177.47.245.26',10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,0),(53,'Rosario Tijeraz',0,1,46,8,3,185,185,4200,68,76,78,39,128,0,0,0,35,35,0,100,1,170,41,7,'',435,1,1557177628,1262609073,1,0,0,0,'',1557177990,31,0,0,151200000,2,100,100,100,100,100,0,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','',0,'',0,0,0,0,0,0,0,0,'',0,0,'',43200,-1,0,0,'177.226.65.75',10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,0),(54,'Mikka',0,1,47,32,3,425,425,465900,68,76,78,39,136,0,0,0,335,395,420,100,1,146,51,7,'\0@\0\0ˇˇˇˇ@ñ\0\Z\0\0\0\0\0\0\0\0\0\0\0¿‘\0˛',915,0,1557179559,4134729642,1,0,0,0,'',1557179852,31,0,0,151120000,2,100,100,100,100,100,0,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','',0,'',0,0,0,0,0,0,0,0,'',0,0,'',43200,-1,0,0,'170.247.114.246',10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,0),(55,'Kika',0,1,48,31,2,300,300,409200,68,76,78,39,128,0,0,0,725,725,420,100,1,153,56,7,'\0@\0\0ˇˇˇˇ\0\Z\0\0\0\0\0\0\0\0\0\0\0¿‘\0˛',665,1,1557190013,3558800831,1,0,0,0,'',1557190240,31,0,0,151133000,2,100,100,100,100,100,0,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','',0,'',0,0,0,0,0,0,0,0,'',0,0,'',43200,-1,0,0,'191.253.30.212',10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,0),(56,'Jana',0,1,49,8,2,185,185,4200,91,0,79,91,156,0,0,0,35,35,0,100,1,151,56,7,'',435,0,1557180637,1289826493,1,0,0,0,'',1557180967,31,0,0,151200000,2,100,100,100,100,100,0,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','',0,'',0,0,0,0,0,0,0,0,'',0,0,'',43200,-1,0,0,'189.48.225.76',10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,0),(57,'Sapo Leao',0,1,50,357,1,1930,1930,746432215,68,76,78,39,128,0,0,82,10322,10505,805546,100,1,155,45,8,'\0\0\0ˇˇˇˇ`Í\0\0\Z\0\0\0\0\0\0\0\0˛\0\0\0ˇˇˇˇ∞\0\0\Z\0\0\0\0\0\0\0˛',3925,1,1557193339,209175473,1,0,0,0,'',1557197078,31,0,0,142958500,2,100,100,100,100,100,0,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','',0,'',0,0,0,0,0,0,0,0,'',0,0,'',43200,-1,0,0,'177.195.119.12',10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,0),(58,'Palanco',0,1,51,28,3,385,385,325500,68,76,78,39,128,0,0,1,275,335,640,100,1,146,53,7,'\0 \0\0ˇˇˇˇà\0\Z\0\0\0\0\0\0\0\0Ë\0\0d\0\0\0Ë\0\0»\0\0\0˛\0\0\0ˇˇˇˇÿY\0\0\Z\0\0\0\0\0\0\0\0˛\0@\0\0ˇˇˇˇ…\0\Z\0\0\0\0\0\0\0\0\0\0\0¿‘\0˛',835,1,1557185557,209175473,1,0,0,0,'',1557185773,31,0,0,151093000,2,100,100,100,100,100,0,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','',0,'',0,0,0,0,0,0,0,0,'',0,0,'',43200,-1,0,0,'177.195.119.12',10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,0),(59,'Knight',0,1,52,269,4,4100,4100,319848704,68,76,78,39,128,0,0,8,1340,1340,1342412,100,1,159,45,8,'\0 \0\0ˇˇˇˇêF\Z\0\Z\0\0\0\0\0\0\0\0Ë\0\0»\0\0\0Ë\0\0»\0\0\0˛\0\0\0ˇˇˇˇ`Í\0\0\Z\0\0\0\0\0\0\0\0˛',6960,1,1557192324,209175473,1,0,0,0,'',1557195774,0,0,0,146652000,2,100,100,100,100,100,0,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','',0,'',0,0,0,0,0,0,0,0,'',0,0,'',43200,-1,0,0,'177.195.119.12',10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,0),(60,'Eu tentei',0,1,45,201,4,3071,3080,132736670,115,0,0,114,289,0,0,6,1000,1000,573112,100,1,158,54,7,'\0 \0\0ˇˇˇˇ1\0\Z\0\0\0\0\0\0\0\0Ë\0\0»\0\0\0Ë\0\0»\0\0\0˛\0@\0\0ˇˇˇˇ–r\0\Z\0\0\0\0\0\0\0\0\0\0\0¿‘\0˛\0\0\0ˇˇˇˇ“\0\0\Z\0\0\0\0\0\0\0\0˛\0\0Ä\0ˇˇˇˇ∞≥\0\0\Z\0\0\0\0\0\0\0\0˛',5260,1,1557188546,452276145,1,0,0,0,'',1557189864,0,0,0,149024000,2,100,100,100,100,100,0,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','',0,'',0,0,0,0,0,0,0,0,'',0,0,'',43200,-1,0,0,'177.47.245.26',10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,0),(61,'Pally Maldito',0,1,53,289,3,2977,2995,396679465,68,76,78,39,128,0,0,20,1849,4250,373499,100,1,2096,481,6,'',6055,1,1557209408,30801796,1,0,0,0,'',1557210146,31,0,0,148788000,2,100,100,100,100,100,0,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','',0,'',0,0,0,0,0,0,0,0,'',0,0,'',43200,-1,0,0,'132.255.213.1',10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,0),(62,'Knight Maldito',0,1,54,25,4,440,440,212100,68,76,78,39,128,0,0,0,120,120,0,100,1,151,45,8,'\0\0\0ˇˇˇˇ`Í\0\0\Z\0\0\0\0\0\0\0\0˛',860,1,1557212272,30801796,1,0,0,0,'',1557214253,31,0,0,151200000,2,100,100,100,100,100,0,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','',0,'',0,0,0,0,0,0,0,0,'',0,0,'',43200,-1,0,0,'132.255.213.1',10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,0),(63,'Mege matdor',0,1,55,22,2,186,255,150000,68,76,78,39,128,0,0,0,455,455,175,100,1,222,1178,7,'\0@\0\0ˇˇˇˇ®U\0\Z\0\0\0\0\0\0\0\0\0\0\0¿‘\0˛',575,1,1557194057,249151153,1,0,0,0,'',1557194178,31,0,0,151136000,2,100,100,100,100,100,0,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','',0,'',0,0,0,0,0,0,0,0,'',0,0,'',43200,-1,0,0,'177.190.217.14',10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,0),(64,'Felipe',0,1,56,8,2,180,180,4200,0,88,88,0,134,0,0,0,50,50,0,100,1,152,54,7,'',700,1,1557195226,4123076017,1,0,0,0,'',1557195237,31,0,0,151200000,0,100,100,100,100,100,0,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','',0,'',0,0,0,0,0,0,2147483647,1557195217,'',0,0,'',43200,-1,0,0,'177.37.193.245',10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,0),(65,'Solo',0,1,57,281,4,4280,4280,363775740,114,0,0,0,128,1,0,6,1400,1400,745347,100,1,1062,146,6,'\0\0\0ˇˇˇˇ`Í\0\0\Z\0\0\0\0\0\0\0\0˛\0 \0\0ˇˇˇˇËó\0\Z\0\0\0\0\0\0\0\0Ë\0\0»\0\0\0Ë\0\0»\0\0\0˛',7260,1,1557206399,834630333,1,0,0,0,'',1557206881,0,0,19693,146588166,2,100,100,100,100,100,0,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','',0,'',0,0,0,0,0,0,0,0,'',0,0,'',43200,-1,0,0,'189.114.191.49',10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,0),(66,'Qualquerum',0,1,58,8,2,185,185,4200,68,76,78,39,128,0,0,0,35,35,0,100,1,156,54,7,'',435,1,1557197678,3721069869,1,0,0,0,'',1557197718,31,0,0,151200000,2,100,100,100,100,100,0,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','',0,'',0,0,0,0,0,0,0,0,'',0,0,'',43200,-1,0,0,'45.5.203.221',10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,0),(67,'Dimaszyn',0,1,60,206,2,1170,1170,142417094,0,88,88,0,130,0,0,57,5982,5990,232749,100,1,1062,155,6,'\0\0\0ˇˇˇˇ`Í\0\0\Z\0\0\0\0\0\0\0\0˛\0 \0\0ˇˇˇˇX2\0\Z\0\0\0\0\0\0\0\0Ë\0\0d\0\0\0Ë\0\0»\0\0\0˛',2680,1,1557205420,1882984393,1,0,0,0,'',1557205931,31,0,0,149223000,0,100,100,100,100,100,0,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','',0,'',0,0,0,0,0,0,2147483647,1557200376,'',0,0,'',43200,-1,0,0,'201.15.60.112',10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,0),(68,'Dimas',0,1,60,8,2,180,180,4200,0,88,88,0,134,0,0,0,50,50,0,100,1,0,0,0,'',700,1,0,0,1,0,0,0,'',0,0,0,0,151200000,0,100,100,100,100,100,0,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','',0,'',0,0,0,0,0,0,2147483647,1557200382,'',0,0,'',43200,-1,0,0,'0',10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,0),(69,'Viuva Negra',0,1,61,363,2,1960,1960,784373254,2,128,2,128,131,2,0,64,10685,10685,164445,100,1,151,45,8,'\0\0\0ˇˇˇˇ`Í\0\0\Z\0\0\0\0\0\0\0\0˛\0\0\0ˇˇˇˇ∞\0\0\Z\0\0\0\0\0\0\0˛\0\0\0ˇˇˇˇË\0\0\Z\0\0\0\0\0\0\0˛',3985,1,1557213132,4202013229,1,0,0,0,'',1557216003,31,0,0,145665000,2,100,100,100,100,100,0,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','',0,'',0,0,0,0,0,0,0,0,'',0,0,'',43200,-1,0,0,'45.162.117.250',10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,0);
/*!40000 ALTER TABLE `players` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `oncreate_players` AFTER INSERT ON `players`
 FOR EACH ROW BEGIN
        INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 0, 10);
        INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 1, 10);
        INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 2, 10);
        INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 3, 10);
        INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 4, 10);
        INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 5, 10);
        INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 6, 10);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ondelete_players` BEFORE DELETE ON `players`
 FOR EACH ROW BEGIN
        DELETE FROM `bans` WHERE `type` IN (2, 5) AND `value` = OLD.`id`;
        UPDATE `houses` SET `owner` = 0 WHERE `owner` = OLD.`id`;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `poll_votes`
--

DROP TABLE IF EXISTS `poll_votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poll_votes` (
  `poll_id` int(11) NOT NULL,
  `votes` varchar(255) NOT NULL,
  `account_id` varchar(255) NOT NULL,
  KEY `poll_id` (`poll_id`),
  CONSTRAINT `poll_votes_ibfk_1` FOREIGN KEY (`poll_id`) REFERENCES `polls` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poll_votes`
--

LOCK TABLES `poll_votes` WRITE;
/*!40000 ALTER TABLE `poll_votes` DISABLE KEYS */;
/*!40000 ALTER TABLE `poll_votes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `polls`
--

DROP TABLE IF EXISTS `polls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `polls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) NOT NULL,
  `poll` varchar(255) NOT NULL,
  `options` varchar(255) NOT NULL,
  `timestamp` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `player_id` (`player_id`),
  CONSTRAINT `polls_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `polls`
--

LOCK TABLES `polls` WRITE;
/*!40000 ALTER TABLE `polls` DISABLE KEYS */;
/*!40000 ALTER TABLE `polls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server_config`
--

DROP TABLE IF EXISTS `server_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `server_config` (
  `config` varchar(35) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  UNIQUE KEY `config` (`config`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server_config`
--

LOCK TABLES `server_config` WRITE;
/*!40000 ALTER TABLE `server_config` DISABLE KEYS */;
INSERT INTO `server_config` VALUES ('encryption','2');
/*!40000 ALTER TABLE `server_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server_motd`
--

DROP TABLE IF EXISTS `server_motd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `server_motd` (
  `id` int(10) unsigned NOT NULL,
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `text` text NOT NULL,
  UNIQUE KEY `id` (`id`,`world_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server_motd`
--

LOCK TABLES `server_motd` WRITE;
/*!40000 ALTER TABLE `server_motd` DISABLE KEYS */;
INSERT INTO `server_motd` VALUES (409,0,'Welcome to Wake-Baiak! Inovar √© nosso lema!'),(410,0,'Welcome to Extreme-Baiak! Inovar √© nosso lema!');
/*!40000 ALTER TABLE `server_motd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server_record`
--

DROP TABLE IF EXISTS `server_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `server_record` (
  `record` int(11) NOT NULL,
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `timestamp` bigint(20) NOT NULL,
  UNIQUE KEY `record` (`record`,`world_id`,`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server_record`
--

LOCK TABLES `server_record` WRITE;
/*!40000 ALTER TABLE `server_record` DISABLE KEYS */;
INSERT INTO `server_record` VALUES (1,0,1543266508),(2,0,1543266902),(3,0,1543270868),(4,0,1543270886),(5,0,1543270904),(6,0,1543271059),(7,0,1543271123),(8,0,1543271125),(9,0,1543271253),(10,0,1543271549),(11,0,1543271550),(12,0,1543271616),(13,0,1543271630),(14,0,1543374723),(15,0,1543374753),(16,0,1543374862),(17,0,1543375404),(18,0,1543375566),(19,0,1543785661),(20,0,1543787581),(21,0,1543787980),(22,0,1543833843),(23,0,1543834622),(24,0,1543846595),(25,0,1543848219),(26,0,1543848249),(27,0,1543849565),(28,0,1543852436),(29,0,1543853830);
/*!40000 ALTER TABLE `server_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server_reports`
--

DROP TABLE IF EXISTS `server_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `server_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `player_id` int(11) NOT NULL DEFAULT '1',
  `posx` int(11) NOT NULL DEFAULT '0',
  `posy` int(11) NOT NULL DEFAULT '0',
  `posz` int(11) NOT NULL DEFAULT '0',
  `timestamp` bigint(20) NOT NULL DEFAULT '0',
  `report` text NOT NULL,
  `reads` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `world_id` (`world_id`),
  KEY `reads` (`reads`),
  KEY `player_id` (`player_id`),
  CONSTRAINT `server_reports_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server_reports`
--

LOCK TABLES `server_reports` WRITE;
/*!40000 ALTER TABLE `server_reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `server_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `snowballwar`
--

DROP TABLE IF EXISTS `snowballwar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `snowballwar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `score` int(11) NOT NULL,
  `data` varchar(255) NOT NULL,
  `hora` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `snowballwar`
--

LOCK TABLES `snowballwar` WRITE;
/*!40000 ALTER TABLE `snowballwar` DISABLE KEYS */;
INSERT INTO `snowballwar` VALUES (1,'Fanta',3,'12/03/18','18:15:00'),(2,'Queen',0,'12/04/18','18:15:00'),(3,'Fanta',26,'12/05/18','18:15:00'),(4,'Sinister',0,'12/06/18','18:15:00');
/*!40000 ALTER TABLE `snowballwar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tickets` (
  `ticket_id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_subject` varchar(45) NOT NULL DEFAULT '',
  `ticket_author` varchar(255) NOT NULL DEFAULT '',
  `ticket_author_acc_id` int(11) NOT NULL,
  `ticket_last_reply` varchar(45) NOT NULL DEFAULT '',
  `ticket_admin_reply` int(11) NOT NULL,
  `ticket_date` datetime NOT NULL,
  `ticket_ended` varchar(45) NOT NULL DEFAULT '',
  `ticket_status` varchar(45) NOT NULL DEFAULT '',
  `ticket_category` varchar(45) NOT NULL DEFAULT '',
  `ticket_description` text NOT NULL,
  PRIMARY KEY (`ticket_id`) USING BTREE,
  KEY `tickets_ibfk_1_idx` (`ticket_author_acc_id`) USING BTREE,
  CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`ticket_author_acc_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=899290 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets_reply`
--

DROP TABLE IF EXISTS `tickets_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tickets_reply` (
  `ticket_replyid` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) NOT NULL,
  `reply_author` varchar(255) DEFAULT NULL,
  `reply_message` text,
  `reply_date` datetime DEFAULT NULL,
  PRIMARY KEY (`ticket_replyid`) USING BTREE,
  KEY `ticket_id_idx` (`ticket_id`) USING BTREE,
  CONSTRAINT `ticket_id` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets_reply`
--

LOCK TABLES `tickets_reply` WRITE;
/*!40000 ALTER TABLE `tickets_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `tickets_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tile_items`
--

DROP TABLE IF EXISTS `tile_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tile_items` (
  `tile_id` int(10) unsigned NOT NULL,
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `sid` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0',
  `itemtype` int(11) NOT NULL,
  `count` int(11) NOT NULL DEFAULT '0',
  `attributes` blob NOT NULL,
  `serial` varchar(255) NOT NULL DEFAULT '',
  UNIQUE KEY `tile_id` (`tile_id`,`world_id`,`sid`),
  KEY `sid` (`sid`),
  CONSTRAINT `tile_items_ibfk_1` FOREIGN KEY (`tile_id`) REFERENCES `tiles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tile_items`
--

LOCK TABLES `tile_items` WRITE;
/*!40000 ALTER TABLE `tile_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `tile_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tile_store`
--

DROP TABLE IF EXISTS `tile_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tile_store` (
  `house_id` int(10) unsigned NOT NULL,
  `world_id` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `data` longblob NOT NULL,
  `serial` varchar(255) NOT NULL DEFAULT '',
  KEY `house_id` (`house_id`),
  CONSTRAINT `tile_store_ibfk_1` FOREIGN KEY (`house_id`) REFERENCES `houses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tile_store`
--

LOCK TABLES `tile_store` WRITE;
/*!40000 ALTER TABLE `tile_store` DISABLE KEYS */;
INSERT INTO `tile_store` VALUES (12,0,'õ\0Y\0\0\0\0\"(Ä\0\0description\\\0\0\0It belongs to house \'Cemetery house 1\'. Nobody owns this house. It costs 1200000 gold coins.\0',''),(12,0,'ú\0Z\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(12,0,'ú\0[\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(13,0,'ß\0V\0\0\0\0 (Ä\0\0description\\\0\0\0It belongs to house \'Cemetery house 2\'. Nobody owns this house. It costs 1540000 gold coins.\0',''),(13,0,'®\0W\0\0\0\0‡Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(13,0,'©\0W\0\0\0\0·Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(13,0,'°\0X\0\0\0\0(\0',''),(13,0,'°\0[\0\0\0\0(\0',''),(13,0,'§\0Y\0\0\0\0(Ä\0\0description\\\0\0\0It belongs to house \'Cemetery house 2\'. Nobody owns this house. It costs 1540000 gold coins.\0',''),(16,0,'t\0ã\0\0\0\0r\0',''),(16,0,'u\0à\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(16,0,'u\0â\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(16,0,'x\0à\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(16,0,'x\0â\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(16,0,'w\0ç\0\0\0\0Ï\ZÄ\0\0descriptionY\0\0\0It belongs to house \'Frozen Ville 1\'. Nobody owns this house. It costs 360000 gold coins.\0',''),(17,0,'Å\0ë\0\0\0\0t\0',''),(17,0,'Ç\0ë\0\0\0\0‡Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(17,0,'É\0ë\0\0\0\0·Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(17,0,'Ü\0ì\0\0\0\0Ù\ZÄ\0\0descriptionY\0\0\0It belongs to house \'Frozen Ville 2\'. Nobody owns this house. It costs 500000 gold coins.\0',''),(17,0,'Å\0î\0\0\0\0t\0',''),(18,0,'~\0ï\0\0\0\0Î\ZÄ\0\0descriptionY\0\0\0It belongs to house \'Frozen Ville 3\'. Nobody owns this house. It costs 300000 gold coins.\0',''),(18,0,'\0ñ\0\0\0\0‡Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(18,0,'Ä\0ï\0\0\0\0sÄ\0\0descriptionY\0\0\0It belongs to house \'Frozen Ville 3\'. Nobody owns this house. It costs 300000 gold coins.\0',''),(18,0,'Ä\0ñ\0\0\0\0·Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(19,0,'{\0ã\0\0\0\0t\0',''),(19,0,'|\0à\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(19,0,'|\0â\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(19,0,'\0à\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(19,0,'\0â\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(19,0,'~\0ç\0\0\0\0Î\ZÄ\0\0descriptionY\0\0\0It belongs to house \'Frozen Ville 4\'. Nobody owns this house. It costs 360000 gold coins.\0',''),(19,0,'Ä\0ã\0\0\0\0t\0',''),(20,0,'è\0ô\0\0\0\0t\0',''),(20,0,'ê\0ì\0\0\0\0t\0',''),(20,0,'ë\0ì\0\0\0\0‡Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(20,0,'í\0ì\0\0\0\0·Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(20,0,'ê\0ï\0\0\0\0Ù\ZÄ\0\0descriptionY\0\0\0It belongs to house \'Frozen Ville 5\'. Nobody owns this house. It costs 440000 gold coins.\0',''),(21,0,'Z\0•\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(21,0,'Z\0¶\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(21,0,'U\0™\0\0\0\0qÄ\0\0descriptionZ\0\0\0It belongs to house \'Frozen Ville 6\'. Nobody owns this house. It costs 1400000 gold coins.\0',''),(21,0,'W\0™\0\0\0\0Ì\ZÄ\0\0descriptionZ\0\0\0It belongs to house \'Frozen Ville 6\'. Nobody owns this house. It costs 1400000 gold coins.\0',''),(21,0,'Y\0™\0\0\0\0qÄ\0\0descriptionZ\0\0\0It belongs to house \'Frozen Ville 6\'. Nobody owns this house. It costs 1400000 gold coins.\0',''),(22,0,'d\0•\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(22,0,'d\0¶\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(22,0,'a\0™\0\0\0\0Ï\ZÄ\0\0descriptionZ\0\0\0It belongs to house \'Frozen Ville 7\'. Nobody owns this house. It costs 1380000 gold coins.\0',''),(23,0,'W\0∞\0\0\0\0r\0',''),(23,0,'W\0±\0\0\0\0Ù\ZÄ\0\0descriptionZ\0\0\0It belongs to house \'Frozen Ville 8\'. Nobody owns this house. It costs 1340000 gold coins.\0',''),(23,0,'S\0µ\0\0\0\0‡Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(23,0,'T\0µ\0\0\0\0·Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(23,0,'X\0µ\0\0\0\0r\0',''),(24,0,'[\0Æ\0\0\0\0t\0',''),(24,0,'a\0Æ\0\0\0\0r\0',''),(24,0,'[\0±\0\0\0\0t\0',''),(24,0,']\0≤\0\0\0\0sÄ\0\0descriptionY\0\0\0It belongs to house \'Frozen Ville 9\'. Nobody owns this house. It costs 800000 gold coins.\0',''),(24,0,'^\0≤\0\0\0\0Ï\ZÄ\0\0descriptionY\0\0\0It belongs to house \'Frozen Ville 9\'. Nobody owns this house. It costs 800000 gold coins.\0',''),(24,0,'a\0±\0\0\0\0r\0',''),(24,0,'`\0≤\0\0\0\0sÄ\0\0descriptionY\0\0\0It belongs to house \'Frozen Ville 9\'. Nobody owns this house. It costs 800000 gold coins.\0',''),(25,0,'X\0ª\0\0\0\0r\0',''),(25,0,'X\0ª\0\0\0\0r\0',''),(25,0,'_\0ª\0\0\0\0r\0',''),(25,0,'\\\0∏\0\0\0\0Î\ZÄ\0\0description[\0\0\0It belongs to house \'Frozen Ville 10\'. Nobody owns this house. It costs 1180000 gold coins.\0',''),(25,0,'^\0π\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(25,0,'^\0∫\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(25,0,'_\0ª\0\0\0\0r\0',''),(26,0,'h\0Æ\0\0\0\0qÄ\0\0description[\0\0\0It belongs to house \'Frozen Ville 11\'. Nobody owns this house. It costs 1540000 gold coins.\0',''),(26,0,'e\0≤\0\0\0\0r\0',''),(26,0,'e\0±\0\0\0\0Ù\ZÄ\0\0description[\0\0\0It belongs to house \'Frozen Ville 11\'. Nobody owns this house. It costs 1540000 gold coins.\0',''),(26,0,'k\0≤\0\0\0\0r\0r\0',''),(26,0,'d\0¥\0\0\0\0‡Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(26,0,'e\0¥\0\0\0\0·Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(26,0,'h\0∂\0\0\0\0qÄ\0\0description[\0\0\0It belongs to house \'Frozen Ville 11\'. Nobody owns this house. It costs 1540000 gold coins.\0',''),(27,0,'c\0ª\0\0\0\0Ù\ZÄ\0\0descriptionZ\0\0\0It belongs to house \'Frozen Ville 12\'. Nobody owns this house. It costs 580000 gold coins.\0',''),(27,0,'g\0∏\0\0\0\0qÄ\0\0descriptionZ\0\0\0It belongs to house \'Frozen Ville 12\'. Nobody owns this house. It costs 580000 gold coins.\0',''),(27,0,'i\0π\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(27,0,'i\0∫\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(27,0,'g\0æ\0\0\0\0qÄ\0\0descriptionZ\0\0\0It belongs to house \'Frozen Ville 12\'. Nobody owns this house. It costs 580000 gold coins.\0',''),(29,0,'ú\0j\0\0\0\0Î\ZÄ\0\0description^\0\0\0It belongs to house \'Frozen First ville\'. Nobody owns this house. It costs 1140000 gold coins.\0',''),(29,0,'û\0j\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(29,0,'û\0k\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(29,0,'¢\0i\0\0\0\0t\0',''),(29,0,'¢\0i\0\0\0\0t\0',''),(29,0,'†\0l\0\0\0\0sÄ\0\0description^\0\0\0It belongs to house \'Frozen First ville\'. Nobody owns this house. It costs 1140000 gold coins.\0',''),(29,0,'†\0l\0\0\0\0sÄ\0\0description^\0\0\0It belongs to house \'Frozen First ville\'. Nobody owns this house. It costs 1140000 gold coins.\0',''),(30,0,'à\0\0\0\0\0√Ä\0\0descriptionY\0\0\0It belongs to house \'North Ville 1\'. Nobody owns this house. It costs 1540000 gold coins.\0',''),(30,0,'à\0\0\0\0\0√Ä\0\0descriptionY\0\0\0It belongs to house \'North Ville 1\'. Nobody owns this house. It costs 1540000 gold coins.\0',''),(30,0,'é\0\0\0\0\0√Ä\0\0descriptionY\0\0\0It belongs to house \'North Ville 1\'. Nobody owns this house. It costs 1540000 gold coins.\0',''),(31,0,'ì\0\0\0\0\0‡Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(31,0,'î\0\0\0\0\0·Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(31,0,'î\0!\0\0\0\0(Ä\0\0descriptionX\0\0\0It belongs to house \'North Ville 2\'. Nobody owns this house. It costs 480000 gold coins.\0',''),(31,0,'ñ\0!\0\0\0\0 (Ä\0\0descriptionX\0\0\0It belongs to house \'North Ville 2\'. Nobody owns this house. It costs 480000 gold coins.\0',''),(32,0,'õ\0\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(32,0,'õ\0\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(32,0,'ü\0\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(32,0,'ü\0\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(32,0,'ù\0\0\0\0\0 (Ä\0\0descriptionY\0\0\0It belongs to house \'North Ville 3\'. Nobody owns this house. It costs 1400000 gold coins.\0',''),(32,0,'ù\0!\0\0\0\0 (Ä\0\0descriptionY\0\0\0It belongs to house \'North Ville 3\'. Nobody owns this house. It costs 1400000 gold coins.\0',''),(32,0,'ù\0!\0\0\0\0 (Ä\0\0descriptionY\0\0\0It belongs to house \'North Ville 3\'. Nobody owns this house. It costs 1400000 gold coins.\0',''),(33,0,'Ø\0\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(33,0,'Æ\0\0\0\0\0(\0',''),(33,0,'Ø\0\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(33,0,'≥\0\0\0\0\0 (Ä\0\0descriptionX\0\0\0It belongs to house \'North Ville 4\'. Nobody owns this house. It costs 540000 gold coins.\0',''),(35,0,'Æ\03\0\0\0\0(Ä\0\0descriptionA\0\0\0It belongs to house \'Principal Street 6\'. Knight owns this house.\0',''),(35,0,'≠\04\0\0\0\0\n\0',''),(35,0,'Ø\08\0\0\0\0!(Ä\0\0descriptionA\0\0\0It belongs to house \'Principal Street 6\'. Knight owns this house.\0',''),(35,0,'≤\03\0\0\0\0(Ä\0\0descriptionA\0\0\0It belongs to house \'Principal Street 6\'. Knight owns this house.\0',''),(36,0,'π\0;\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(36,0,'π\0;\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(36,0,'∫\0;\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(36,0,'π\0<\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(36,0,'∏\0<\0\0\0\0(\0',''),(36,0,'∏\0>\0\0\0\0\"(Ä\0\0description^\0\0\0It belongs to house \'Principal Street 8\'. Nobody owns this house. It costs 1200000 gold coins.\0',''),(36,0,'π\0<\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(36,0,'∫\0<\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(36,0,'¿\0;\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(36,0,'¿\0<\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(36,0,'¡\0=\0\0\0\0(\0',''),(37,0,'∑\0\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(37,0,'∑\0\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(37,0,'æ\0\0\0\0\0(\0',''),(37,0,'∂\0!\0\0\0\0\"(Ä\0\0descriptionY\0\0\0It belongs to house \'Demon Street 1\'. Nobody owns this house. It costs 680000 gold coins.\0',''),(38,0,'∂\0%\0\0\0\0\"(Ä\0\0descriptionY\0\0\0It belongs to house \'Demon Street 2\'. Nobody owns this house. It costs 540000 gold coins.\0',''),(38,0,'∑\0$\0\0\0\0‡Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(38,0,'∏\0$\0\0\0\0·Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(38,0,'æ\0&\0\0\0\0(\0',''),(39,0,'∂\0+\0\0\0\0\"(Ä\0\0descriptionY\0\0\0It belongs to house \'Demon Street 3\'. Nobody owns this house. It costs 540000 gold coins.\0',''),(39,0,'∑\0,\0\0\0\0‡Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(39,0,'∏\0,\0\0\0\0·Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(40,0,'π\0/\0\0\0\0\"(Ä\0\0descriptionY\0\0\0It belongs to house \'Demon Street 4\'. Nobody owns this house. It costs 680000 gold coins.\0',''),(40,0,'ø\0,\0\0\0\0‡Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(40,0,'ø\0,\0\0\0\0‡Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(40,0,'¿\0,\0\0\0\0·Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(40,0,'¿\0,\0\0\0\0·Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(40,0,'¡\0.\0\0\0\0(\0',''),(41,0,'∫\02\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(41,0,'∫\03\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(41,0,'π\02\0\0\0\0\"(Ä\0\0descriptionY\0\0\0It belongs to house \'Demon Street 5\'. Nobody owns this house. It costs 800000 gold coins.\0',''),(41,0,'∫\03\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(41,0,'∫\04\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(41,0,'¡\03\0\0\0\0(\0',''),(42,0,'Ø\0\0\0\0\0‡Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(42,0,'∞\0\0\0\0\0·Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(42,0,'±\0 \0\0\0\0 (Ä\0\0descriptionX\0\0\0It belongs to house \'Demon Ville 1\'. Nobody owns this house. It costs 220000 gold coins.\0',''),(43,0,'≥\0\0\0\0\0‡Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(43,0,'¥\0\0\0\0\0·Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(43,0,'∂\0 \0\0\0\0 (Ä\0\0descriptionX\0\0\0It belongs to house \'Demon Ville 2\'. Nobody owns this house. It costs 340000 gold coins.\0',''),(44,0,'∏\0\0\0\0\0‡Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(44,0,'π\0\0\0\0\0·Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(44,0,'π\0\"\0\0\0\0 (Ä\0\0descriptionX\0\0\0It belongs to house \'Demon Ville 3\'. Nobody owns this house. It costs 580000 gold coins.\0',''),(45,0,'Ω\0#\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(45,0,'∑\0%\0\0\0\0\"(Ä\0\0descriptionX\0\0\0It belongs to house \'Demon Ville 4\'. Nobody owns this house. It costs 340000 gold coins.\0',''),(45,0,'Ω\0$\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(46,0,'∑\0)\0\0\0\0\"(Ä\0\0descriptionX\0\0\0It belongs to house \'Demon Ville 5\'. Nobody owns this house. It costs 580000 gold coins.\0',''),(46,0,'Ω\0(\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(46,0,'Ω\0)\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(47,0,'ª\0B\0\0\0\0\"(Ä\0\0descriptionY\0\0\0It belongs to house \'Demon Street 6\'. Nobody owns this house. It costs 640000 gold coins.\0',''),(47,0,'ø\0A\0\0\0\0‡Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(47,0,'º\0C\0\0\0\0‡Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(47,0,'Ω\0C\0\0\0\0·Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(47,0,'¿\0A\0\0\0\0·Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(47,0,'¡\0D\0\0\0\0(\0',''),(48,0,'ø\0I\0\0\0\0\"(Ä\0\0descriptionY\0\0\0It belongs to house \'Demon Street 7\'. Nobody owns this house. It costs 560000 gold coins.\0',''),(48,0,'¬\0L\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(48,0,'¬\0M\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(49,0,'¨\0)\0\0\0\0\"(Ä\0\0descriptionV\0\0\0It belongs to house \'HouseShop 1\'. Nobody owns this house. It costs 300000 gold coins.\0',''),(49,0,'∞\0\'\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(49,0,'∞\0(\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(49,0,'±\0(\0\0\0\0(\0',''),(49,0,'±\0*\0\0\0\0(\0',''),(50,0,'û\0N\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(50,0,'û\0O\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(50,0,'°\0J\0\0\0\0≈Ä\0\0description_\0\0\0It belongs to house \'Cemetery Village #1\'. Nobody owns this house. It costs 2440000 gold coins.\0',''),(50,0,'£\0K\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(50,0,'£\0L\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(50,0,'£\0O\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(50,0,'°\0N\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(50,0,'°\0O\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(50,0,'§\0L\0\0\0\0(\0',''),(50,0,'û\0P\0\0\0\0‡Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(50,0,'ü\0P\0\0\0\0·Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(50,0,'ü\0Q\0\0\0\0\Z(Ä\0\0description_\0\0\0It belongs to house \'Cemetery Village #1\'. Nobody owns this house. It costs 2440000 gold coins.\0',''),(50,0,'°\0Q\0\0\0\0≈Ä\0\0description_\0\0\0It belongs to house \'Cemetery Village #1\'. Nobody owns this house. It costs 2440000 gold coins.\0',''),(50,0,'£\0P\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(51,0,'è\0?\0\0\0\0 \0\0\0\0\0´1\n\0',''),(51,0,'ê\0?\0\0\0\0Ω	\0',''),(51,0,'ë\0?\0\0\0\0“	\0',''),(51,0,'í\0?\0\0\0\0o	\0',''),(51,0,'ì\0?\0\0\0\0÷\"\0',''),(51,0,'ë\0>\0\0\0\0∆Ä\0\0descriptionE\0\0\0It belongs to house \'Principal Street 1\'. Quase Ouro owns this house.\0',''),(51,0,'ì\0?\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(51,0,'î\0?\0\0\0\0»\"\0»\"\0',''),(51,0,'ç\0@\0\0\0\0(\0',''),(51,0,'ì\0@\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(51,0,'ì\0C\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(51,0,'î\0@\0\0\0\0(\0',''),(51,0,'ë\0E\0\0\0\0\Z(Ä\0\0descriptionE\0\0\0It belongs to house \'Principal Street 1\'. Quase Ouro owns this house.\0',''),(51,0,'ì\0D\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(52,0,'ö\0>\0\0\0\0≈Ä\0\0descriptionC\0\0\0It belongs to house \'Principal Street 2\'. Godzinhu owns this house.\0',''),(52,0,'ú\0?\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(52,0,'ñ\0@\0\0\0\0(\0',''),(52,0,'ñ\0@\0\0\0\0ﬁÄ\0\0description\0\0\0Nobody is sleeping there.\0',''),(52,0,'ñ\0A\0\0\0\0ﬂÄ\0\0description\0\0\0Nobody is sleeping there.\0',''),(52,0,'ó\0@\0\0\0\0∂\0\0\0\0\0',''),(52,0,'ô\0B\0\0\0\0ﬁÄ\0\0description\0\0\0Nobody is sleeping there.\0',''),(52,0,'ô\0C\0\0\0\0ﬂÄ\0\0description\0\0\0Nobody is sleeping there.\0',''),(52,0,'ú\0@\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(52,0,'ú\0C\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(52,0,'ù\0@\0\0\0\0(\0',''),(52,0,'ö\0E\0\0\0\0\Z(Ä\0\0descriptionC\0\0\0It belongs to house \'Principal Street 2\'. Godzinhu owns this house.\0',''),(52,0,'ú\0D\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(53,0,'†\0?\0\0\0\0⁄ˇˇˇˇÄ\0\0description\0\0\0Nobody is sleeping there.\0',''),(53,0,'°\0?\0\0\0\0pd\0',''),(53,0,'¢\0?\0\0\0\0pd\0',''),(53,0,'£\0>\0\0\0\0∆Ä\0\0description;\0\0\0It belongs to house \'Principal Street 3\'.  owns this house.\0',''),(53,0,'£\0?\0\0\0\0pd\0',''),(53,0,'§\0?\0\0\0\0pd\0',''),(53,0,'•\0?\0\0\0\0pd\0',''),(53,0,'ü\0@\0\0\0\0(\0',''),(53,0,'†\0@\0\0\0\0€ˇˇˇˇÄ\0\0description\0\0\0Nobody is sleeping there.\0',''),(53,0,'°\0@\0\0\0\0pd\0',''),(53,0,'°\0A\0\0\0\0pd\0',''),(53,0,'¢\0@\0\0\0\0˜\0',''),(53,0,'¢\0A\0\0\0\0pd\0',''),(53,0,'£\0@\0\0\0\0\n\0',''),(53,0,'£\0A\0\0\0\0pd\0',''),(53,0,'§\0@\0\0\0\0ﬁ\0',''),(53,0,'§\0A\0\0\0\0pd\0',''),(53,0,'•\0@\0\0\0\0pd\0',''),(53,0,'•\0A\0\0\0\0pd\0',''),(53,0,'•\0C\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(53,0,'¶\0@\0\0\0\0(\0',''),(53,0,'£\0E\0\0\0\0\Z(Ä\0\0descriptionC\0\0\0It belongs to house \'Principal Street 3\'. Todoroki owns this house.\0',''),(53,0,'•\0D\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(54,0,'≠\0G\0\0\0\0jÄ\0\0descriptionY\0\0\0It belongs to house \'Sphere Gallery\'. Nobody owns this house. It costs 220000 gold coins.\0',''),(54,0,'∞\0E\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(54,0,'∞\0F\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(55,0,'Æ\0A\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(55,0,'Æ\0B\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(55,0,'Ø\0A\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(55,0,'Ø\0B\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(55,0,'±\0C\0\0\0\0mÄ\0\0description[\0\0\0It belongs to house \'Sphere Gallery 2\'. Nobody owns this house. It costs 460000 gold coins.\0',''),(56,0,'Æ\0>\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(56,0,'Æ\0?\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(56,0,'Ø\0>\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(56,0,'Ø\0?\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(56,0,'≥\0>\0\0\0\0jÄ\0\0description[\0\0\0It belongs to house \'Sphere Gallery 3\'. Nobody owns this house. It costs 960000 gold coins.\0',''),(56,0,'≠\0A\0\0\0\0jÄ\0\0description[\0\0\0It belongs to house \'Sphere Gallery 3\'. Nobody owns this house. It costs 960000 gold coins.\0',''),(57,0,'™\0M\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(57,0,'™\0N\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(57,0,'´\0L\0\0\0\0mÄ\0\0description[\0\0\0It belongs to house \'Sphere Gallery 4\'. Nobody owns this house. It costs 340000 gold coins.\0',''),(58,0,'\0?\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(58,0,'Å\0>\0\0\0\0(Ä\0\0description]\0\0\0It belongs to house \'Principal Street 4\'. Nobody owns this house. It costs 400000 gold coins.\0',''),(58,0,'Ñ\0>\0\0\0\0 (Ä\0\0description]\0\0\0It belongs to house \'Principal Street 4\'. Nobody owns this house. It costs 400000 gold coins.\0',''),(58,0,'\0@\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(58,0,'Ü\0A\0\0\0\0(\0',''),(59,0,'\0?\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(59,0,'\0@\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(59,0,'~\0@\0\0\0\0\"(Ä\0\0description]\0\0\0It belongs to house \'Principal Street 5\'. Nobody owns this house. It costs 700000 gold coins.\0',''),(59,0,'Å\0B\0\0\0\0(Ä\0\0description]\0\0\0It belongs to house \'Principal Street 5\'. Nobody owns this house. It costs 700000 gold coins.\0',''),(59,0,'Å\0B\0\0\0\0(Ä\0\0description]\0\0\0It belongs to house \'Principal Street 5\'. Nobody owns this house. It costs 700000 gold coins.\0',''),(59,0,'Ü\0A\0\0\0\0(\0',''),(60,0,'û\0\0\0\0\0(Ä\0\0descriptionY\0\0\0It belongs to house \'North Ville 5\'. Nobody owns this house. It costs 1580000 gold coins.\0',''),(60,0,'õ\0\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(60,0,'õ\0\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(60,0,'õ\0\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(60,0,'õ\0\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(60,0,'ü\0\0\0\0\0$(Ä\0\0descriptionY\0\0\0It belongs to house \'North Ville 5\'. Nobody owns this house. It costs 1580000 gold coins.\0',''),(60,0,'û\0\0\0\0\0$(Ä\0\0descriptionY\0\0\0It belongs to house \'North Ville 5\'. Nobody owns this house. It costs 1580000 gold coins.\0',''),(60,0,'§\0\0\0\0\0\"(Ä\0\0descriptionY\0\0\0It belongs to house \'North Ville 5\'. Nobody owns this house. It costs 1580000 gold coins.\0',''),(61,0,'ß\0\Z\0\0\0\0 (Ä\0\0descriptionX\0\0\0It belongs to house \'North Ville 6\'. Nobody owns this house. It costs 160000 gold coins.\0',''),(61,0,'ß\0\0\0\0\0‡Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(61,0,'®\0\0\0\0\0·Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(62,0,'¶\0\0\0\0\0\"(Ä\0\0descriptionX\0\0\0It belongs to house \'North Ville 7\'. Nobody owns this house. It costs 300000 gold coins.\0',''),(62,0,'•\0\"\0\0\0\0‡Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(62,0,'¶\0\"\0\0\0\0·Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(62,0,'¶\0#\0\0\0\0(Ä\0\0descriptionX\0\0\0It belongs to house \'North Ville 7\'. Nobody owns this house. It costs 300000 gold coins.\0',''),(62,0,'©\0#\0\0\0\0(Ä\0\0descriptionX\0\0\0It belongs to house \'North Ville 7\'. Nobody owns this house. It costs 300000 gold coins.\0',''),(63,0,'°\0\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(63,0,'°\0\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(63,0,'ß\0\Z\0\0\0\0\"(Ä\0\0descriptionX\0\0\0It belongs to house \'North Ville 8\'. Nobody owns this house. It costs 500000 gold coins.\0',''),(64,0,'•\0\0\0\0\0‡Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(64,0,'¶\0\0\0\0\0·Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(64,0,'©\0\0\0\0\0 (Ä\0\0descriptionY\0\0\0It belongs to house \'North Ville 9\'. Nobody owns this house. It costs 1680000 gold coins.\0',''),(64,0,'ß\0#\0\0\0\0(Ä\0\0descriptionY\0\0\0It belongs to house \'North Ville 9\'. Nobody owns this house. It costs 1680000 gold coins.\0',''),(64,0,'®\0\"\0\0\0\0\0(Ä\0\0descriptionY\0\0\0It belongs to house \'North Ville 9\'. Nobody owns this house. It costs 1680000 gold coins.\0',''),(64,0,'®\0\"\0\0\0\0(Ä\0\0descriptionY\0\0\0It belongs to house \'North Ville 9\'. Nobody owns this house. It costs 1680000 gold coins.\0',''),(64,0,'®\0\"\0\0\0\0(Ä\0\0descriptionY\0\0\0It belongs to house \'North Ville 9\'. Nobody owns this house. It costs 1680000 gold coins.\0',''),(64,0,'®\0\"\0\0\0\0(Ä\0\0descriptionY\0\0\0It belongs to house \'North Ville 9\'. Nobody owns this house. It costs 1680000 gold coins.\0',''),(64,0,'®\0\"\0\0\0\0(Ä\0\0descriptionY\0\0\0It belongs to house \'North Ville 9\'. Nobody owns this house. It costs 1680000 gold coins.\0',''),(64,0,'®\0#\0\0\0\0(Ä\0\0descriptionY\0\0\0It belongs to house \'North Ville 9\'. Nobody owns this house. It costs 1680000 gold coins.\0',''),(65,0,'‘\0≥\0\0\0\0ﬁÄ\0\0description\0\0\0Nobody is sleeping there.\0',''),(65,0,'÷\0≤\0\0\0\0œ\rÄ\0\0descriptionT\0\0\0It belongs to house \'Jungle #1\'. Nobody owns this house. It costs 780000 gold coins.\0',''),(65,0,'‘\0¥\0\0\0\0ﬂÄ\0\0description\0\0\0Nobody is sleeping there.\0',''),(66,0,'Ã\0≥\0\0\0\0ﬁÄ\0\0description\0\0\0Nobody is sleeping there.\0',''),(66,0,'Œ\0≤\0\0\0\0œ\rÄ\0\0descriptionT\0\0\0It belongs to house \'Jungle #2\'. Nobody owns this house. It costs 780000 gold coins.\0',''),(66,0,'Ã\0¥\0\0\0\0ﬂÄ\0\0description\0\0\0Nobody is sleeping there.\0',''),(67,0,'ƒ\0≥\0\0\0\0ﬁÄ\0\0description\0\0\0Nobody is sleeping there.\0',''),(67,0,'∆\0≤\0\0\0\0œ\rÄ\0\0descriptionT\0\0\0It belongs to house \'Jungle #3\'. Nobody owns this house. It costs 780000 gold coins.\0',''),(67,0,'ƒ\0¥\0\0\0\0ﬂÄ\0\0description\0\0\0Nobody is sleeping there.\0',''),(68,0,'’\0>\0\0\0\0‡Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(68,0,'÷\0>\0\0\0\0·Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(68,0,'“\0@\0\0\0\0(\0',''),(68,0,'“\0A\0\0\0\0\"(Ä\0\0descriptionZ\0\0\0It belongs to house \'Desert Ville #1\'. Nobody owns this house. It costs 760000 gold coins.\0',''),(68,0,'“\0B\0\0\0\0(\0',''),(69,0,' \0B\0\0\0\0(Ä\0\0descriptionZ\0\0\0It belongs to house \'Desert Ville #2\'. Nobody owns this house. It costs 380000 gold coins.\0',''),(69,0,' \0C\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(69,0,' \0D\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(69,0,'Œ\0E\0\0\0\0\"(Ä\0\0descriptionZ\0\0\0It belongs to house \'Desert Ville #2\'. Nobody owns this house. It costs 380000 gold coins.\0',''),(70,0,'«\0>\0\0\0\0 (Ä\0\0descriptionZ\0\0\0It belongs to house \'Desert Ville #3\'. Nobody owns this house. It costs 960000 gold coins.\0',''),(70,0,' \0?\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(70,0,'∆\0B\0\0\0\0(Ä\0\0descriptionZ\0\0\0It belongs to house \'Desert Ville #3\'. Nobody owns this house. It costs 960000 gold coins.\0',''),(70,0,' \0@\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(71,0,'Ã\03\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(71,0,'≈\06\0\0\0\0\"(Ä\0\0description[\0\0\0It belongs to house \'Desert Ville #4\'. Nobody owns this house. It costs 1700000 gold coins.\0',''),(71,0,'∆\07\0\0\0\0‡Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(71,0,'«\07\0\0\0\0·Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(71,0,'Ã\04\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(71,0,'«\08\0\0\0\0(Ä\0\0description[\0\0\0It belongs to house \'Desert Ville #4\'. Nobody owns this house. It costs 1700000 gold coins.\0',''),(71,0,'Ã\08\0\0\0\0(Ä\0\0description[\0\0\0It belongs to house \'Desert Ville #4\'. Nobody owns this house. It costs 1700000 gold coins.\0',''),(72,0,'Ã\0*\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(72,0,'Ã\0+\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(72,0,' \0/\0\0\0\0(Ä\0\0description[\0\0\0It belongs to house \'Desert Ville #5\'. Nobody owns this house. It costs 1420000 gold coins.\0',''),(72,0,'Ã\0/\0\0\0\0 (Ä\0\0description[\0\0\0It belongs to house \'Desert Ville #5\'. Nobody owns this house. It costs 1420000 gold coins.\0',''),(73,0,'œ\0!\0\0\0\0 (Ä\0\0description[\0\0\0It belongs to house \'Desert Ville #6\'. Nobody owns this house. It costs 1460000 gold coins.\0',''),(73,0,'–\0\"\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(73,0,'–\0#\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(73,0,'—\0#\0\0\0\0(\0',''),(73,0,'—\0&\0\0\0\0(\0',''),(74,0,'≈\0!\0\0\0\0 (Ä\0\0description[\0\0\0It belongs to house \'Desert Ville #7\'. Nobody owns this house. It costs 1360000 gold coins.\0',''),(74,0,'«\0!\0\0\0\0(Ä\0\0description[\0\0\0It belongs to house \'Desert Ville #7\'. Nobody owns this house. It costs 1360000 gold coins.\0',''),(74,0,'»\0\"\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(74,0,'»\0#\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(75,0,'‰\0;\0\0\0\0 (Ä\0\0description[\0\0\0It belongs to house \'Desert Ville #8\'. Nobody owns this house. It costs 1320000 gold coins.\0',''),(75,0,'‚\0C\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(75,0,'„\0B\0\0\0\0!(Ä\0\0description[\0\0\0It belongs to house \'Desert Ville #8\'. Nobody owns this house. It costs 1320000 gold coins.\0',''),(75,0,'‚\0D\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(76,0,'÷\02\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(76,0,'÷\03\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(76,0,'–\05\0\0\0\0\"(Ä\0\0description[\0\0\0It belongs to house \'Desert Ville #9\'. Nobody owns this house. It costs 1980000 gold coins.\0',''),(77,0,'ﬁ\0\"\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(77,0,'ﬁ\0#\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(77,0,'„\0&\0\0\0\0\"(Ä\0\0description[\0\0\0It belongs to house \'Desert Ville #10\'. Nobody owns this house. It costs 480000 gold coins.\0',''),(78,0,'Ë\0\Z\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(78,0,'Ë\0\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(78,0,'È\0\0\0\0\0(Ä\0\0description[\0\0\0It belongs to house \'Desert Ville #11\'. Nobody owns this house. It costs 960000 gold coins.\0',''),(78,0,'Ì\0\0\0\0\0(Ä\0\0description[\0\0\0It belongs to house \'Desert Ville #11\'. Nobody owns this house. It costs 960000 gold coins.\0',''),(78,0,'Î\0!\0\0\0\0 (Ä\0\0description[\0\0\0It belongs to house \'Desert Ville #11\'. Nobody owns this house. It costs 960000 gold coins.\0',''),(79,0,'\0\Z\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(79,0,'\0\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(79,0,'ı\0\0\0\0\0(Ä\0\0description[\0\0\0It belongs to house \'Desert Ville #12\'. Nobody owns this house. It costs 960000 gold coins.\0',''),(79,0,'Û\0!\0\0\0\0 (Ä\0\0description[\0\0\0It belongs to house \'Desert Ville #12\'. Nobody owns this house. It costs 960000 gold coins.\0',''),(80,0,'¯\0\Z\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(80,0,'¯\0\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(80,0,'˘\0\0\0\0\0(Ä\0\0description[\0\0\0It belongs to house \'Desert Ville #13\'. Nobody owns this house. It costs 960000 gold coins.\0',''),(80,0,'˝\0\0\0\0\0(Ä\0\0description[\0\0\0It belongs to house \'Desert Ville #13\'. Nobody owns this house. It costs 960000 gold coins.\0',''),(80,0,'˚\0!\0\0\0\0 (Ä\0\0description[\0\0\0It belongs to house \'Desert Ville #13\'. Nobody owns this house. It costs 960000 gold coins.\0',''),(81,0,'\0\Z\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(81,0,'\0\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(81,0,'\0\0\0\0(Ä\0\0description[\0\0\0It belongs to house \'Desert Ville #14\'. Nobody owns this house. It costs 960000 gold coins.\0',''),(81,0,'\0\0\0\0(Ä\0\0description[\0\0\0It belongs to house \'Desert Ville #14\'. Nobody owns this house. It costs 960000 gold coins.\0',''),(81,0,'!\0\0\0\0 (Ä\0\0description[\0\0\0It belongs to house \'Desert Ville #14\'. Nobody owns this house. It costs 960000 gold coins.\0',''),(82,0,'\Z\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(82,0,'\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(82,0,'	\0\0\0\0(Ä\0\0description[\0\0\0It belongs to house \'Desert Ville #15\'. Nobody owns this house. It costs 960000 gold coins.\0',''),(82,0,'\r\0\0\0\0(Ä\0\0description[\0\0\0It belongs to house \'Desert Ville #15\'. Nobody owns this house. It costs 960000 gold coins.\0',''),(82,0,'!\0\0\0\0 (Ä\0\0description[\0\0\0It belongs to house \'Desert Ville #15\'. Nobody owns this house. It costs 960000 gold coins.\0',''),(83,0,'\Z\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(83,0,'\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(83,0,'\0\0\0\0(Ä\0\0description[\0\0\0It belongs to house \'Desert Ville #17\'. Nobody owns this house. It costs 960000 gold coins.\0',''),(83,0,'!\0\0\0\0 (Ä\0\0description[\0\0\0It belongs to house \'Desert Ville #17\'. Nobody owns this house. It costs 960000 gold coins.\0',''),(84,0,'ﬂ\0/\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(84,0,'·\0.\0\0\0\0 (Ä\0\0description[\0\0\0It belongs to house \'Desert Ville #16\'. Nobody owns this house. It costs 480000 gold coins.\0',''),(84,0,'ﬂ\00\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(85,0,'Ë\0:\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(85,0,'Ë\0;\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(85,0,'Î\09\0\0\0\0 (Ä\0\0description[\0\0\0It belongs to house \'Desert Ville #28\'. Nobody owns this house. It costs 960000 gold coins.\0',''),(86,0,'\0:\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(86,0,'\0;\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(86,0,'Û\09\0\0\0\0 (Ä\0\0description[\0\0\0It belongs to house \'Desert Ville #29\'. Nobody owns this house. It costs 960000 gold coins.\0',''),(87,0,'¯\0:\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(87,0,'¯\0;\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(87,0,'˚\09\0\0\0\0 (Ä\0\0description[\0\0\0It belongs to house \'Desert Ville #30\'. Nobody owns this house. It costs 960000 gold coins.\0',''),(88,0,'\0:\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(88,0,'\0;\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(88,0,'9\0\0\0\0 (Ä\0\0description[\0\0\0It belongs to house \'Desert Ville #31\'. Nobody owns this house. It costs 960000 gold coins.\0',''),(89,0,':\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(89,0,';\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(89,0,'9\0\0\0\0 (Ä\0\0description[\0\0\0It belongs to house \'Desert Ville #32\'. Nobody owns this house. It costs 960000 gold coins.\0',''),(90,0,':\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(90,0,';\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(90,0,'9\0\0\0\0 (Ä\0\0description[\0\0\0It belongs to house \'Desert Ville #33\'. Nobody owns this house. It costs 960000 gold coins.\0',''),(91,0,'\"\0\0\0\0‡Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(91,0,'\"\0\0\0\0·Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(91,0,'%\0\0\0\0\"(Ä\0\0description[\0\0\0It belongs to house \'Desert Ville #34\'. Nobody owns this house. It costs 960000 gold coins.\0',''),(92,0,'*\0\0\0\0‡Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(92,0,'*\0\0\0\0·Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(92,0,'-\0\0\0\0\"(Ä\0\0description[\0\0\0It belongs to house \'Desert Ville #35\'. Nobody owns this house. It costs 960000 gold coins.\0',''),(93,0,'2\0\0\0\0‡Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(93,0,'2\0\0\0\0·Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(93,0,'5\0\0\0\0\"(Ä\0\0description[\0\0\0It belongs to house \'Desert Ville #36\'. Nobody owns this house. It costs 960000 gold coins.\0',''),(94,0,'Û\0/\0\0\0\0(\0',''),(94,0,'Ù\0-\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(94,0,'Ù\0.\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(94,0,'Û\01\0\0\0\0(\0',''),(94,0,'ı\03\0\0\0\0\Z(Ä\0\0description[\0\0\0It belongs to house \'Desert Ville #37\'. Nobody owns this house. It costs 220000 gold coins.\0',''),(94,0,'ˆ\00\0\0\0\0√Ä\0\0description[\0\0\0It belongs to house \'Desert Ville #37\'. Nobody owns this house. It costs 220000 gold coins.\0',''),(95,0,'Ù\0*\0\0\0\0‡Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(95,0,'ı\0)\0\0\0\0\Z(Ä\0\0description[\0\0\0It belongs to house \'Desert Ville #38\'. Nobody owns this house. It costs 280000 gold coins.\0',''),(95,0,'ı\0*\0\0\0\0·Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(95,0,'¯\0)\0\0\0\0(Ä\0\0description[\0\0\0It belongs to house \'Desert Ville #38\'. Nobody owns this house. It costs 280000 gold coins.\0',''),(95,0,'˙\0*\0\0\0\0‡Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(95,0,'˚\0)\0\0\0\0\Z(Ä\0\0description[\0\0\0It belongs to house \'Desert Ville #38\'. Nobody owns this house. It costs 280000 gold coins.\0',''),(95,0,'˚\0*\0\0\0\0·Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(95,0,'¯\0,\0\0\0\0≈Ä\0\0description[\0\0\0It belongs to house \'Desert Ville #38\'. Nobody owns this house. It costs 280000 gold coins.\0',''),(96,0,'˚\0-\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(96,0,'˚\0.\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(96,0,'¸\0/\0\0\0\0(\0',''),(96,0,'˘\00\0\0\0\0√Ä\0\0description[\0\0\0It belongs to house \'Desert Ville #39\'. Nobody owns this house. It costs 220000 gold coins.\0',''),(96,0,'˚\03\0\0\0\0\Z(Ä\0\0description[\0\0\0It belongs to house \'Desert Ville #39\'. Nobody owns this house. It costs 220000 gold coins.\0',''),(96,0,'¸\01\0\0\0\0(\0',''),(97,0,'Ù\0*\0\0\0\0‡Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(97,0,'ı\0*\0\0\0\0·Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(97,0,'˜\0)\0\0\0\0\Z(Ä\0\0description[\0\0\0It belongs to house \'Desert Ville #40\'. Nobody owns this house. It costs 600000 gold coins.\0',''),(97,0,'¯\0)\0\0\0\0\Z(Ä\0\0description[\0\0\0It belongs to house \'Desert Ville #40\'. Nobody owns this house. It costs 600000 gold coins.\0',''),(97,0,'˚\0*\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(97,0,'˚\0+\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(97,0,'ˆ\0.\0\0\0\0≈Ä\0\0description[\0\0\0It belongs to house \'Desert Ville #40\'. Nobody owns this house. It costs 600000 gold coins.\0',''),(98,0,'˚\0/\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(98,0,'¯\01\0\0\0\0√Ä\0\0description[\0\0\0It belongs to house \'Desert Ville #41\'. Nobody owns this house. It costs 220000 gold coins.\0',''),(98,0,'˚\00\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(98,0,'˚\03\0\0\0\0\Z(Ä\0\0description[\0\0\0It belongs to house \'Desert Ville #41\'. Nobody owns this house. It costs 220000 gold coins.\0',''),(99,0,'\0/\0\0\0\0(Ä\0\0description[\0\0\0It belongs to house \'Desert Ville #42\'. Nobody owns this house. It costs 380000 gold coins.\0',''),(99,0,'Ò\0/\0\0\0\0 (Ä\0\0description[\0\0\0It belongs to house \'Desert Ville #42\'. Nobody owns this house. It costs 380000 gold coins.\0',''),(99,0,'Ú\0/\0\0\0\0(Ä\0\0description[\0\0\0It belongs to house \'Desert Ville #42\'. Nobody owns this house. It costs 380000 gold coins.\0',''),(99,0,'È\00\0\0\0\0‡Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(99,0,'Í\00\0\0\0\0·Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(100,0,'È\0+\0\0\0\0‡Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(100,0,'Í\0+\0\0\0\0·Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(100,0,'Ó\0-\0\0\0\0(Ä\0\0description[\0\0\0It belongs to house \'Desert Ville #18\'. Nobody owns this house. It costs 380000 gold coins.\0',''),(100,0,'Ô\0-\0\0\0\0 (Ä\0\0description[\0\0\0It belongs to house \'Desert Ville #18\'. Nobody owns this house. It costs 380000 gold coins.\0',''),(100,0,'\0-\0\0\0\0(Ä\0\0description[\0\0\0It belongs to house \'Desert Ville #18\'. Nobody owns this house. It costs 380000 gold coins.\0',''),(100,0,'Û\0,\0\0\0\0(\0',''),(101,0,'˝\0+\0\0\0\0‡Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(101,0,'˛\0+\0\0\0\0·Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(101,0,'-\0\0\0\0(Ä\0\0description[\0\0\0It belongs to house \'Desert Ville #19\'. Nobody owns this house. It costs 340000 gold coins.\0',''),(101,0,'-\0\0\0\0 (Ä\0\0description[\0\0\0It belongs to house \'Desert Ville #19\'. Nobody owns this house. It costs 340000 gold coins.\0',''),(101,0,'-\0\0\0\0(Ä\0\0description[\0\0\0It belongs to house \'Desert Ville #19\'. Nobody owns this house. It costs 340000 gold coins.\0',''),(102,0,'-\0\0\0\0(Ä\0\0description[\0\0\0It belongs to house \'Desert Ville #20\'. Nobody owns this house. It costs 200000 gold coins.\0',''),(102,0,'	-\0\0\0\0 (Ä\0\0description[\0\0\0It belongs to house \'Desert Ville #20\'. Nobody owns this house. It costs 200000 gold coins.\0',''),(102,0,'\n-\0\0\0\0(Ä\0\0description[\0\0\0It belongs to house \'Desert Ville #20\'. Nobody owns this house. It costs 200000 gold coins.\0',''),(103,0,'˝\00\0\0\0\0‡Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(103,0,'˛\00\0\0\0\0·Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(103,0,'/\0\0\0\0(Ä\0\0description[\0\0\0It belongs to house \'Desert Ville #21\'. Nobody owns this house. It costs 340000 gold coins.\0',''),(103,0,'/\0\0\0\0 (Ä\0\0description[\0\0\0It belongs to house \'Desert Ville #21\'. Nobody owns this house. It costs 340000 gold coins.\0',''),(103,0,'/\0\0\0\0(Ä\0\0description[\0\0\0It belongs to house \'Desert Ville #21\'. Nobody owns this house. It costs 340000 gold coins.\0',''),(104,0,'	/\0\0\0\0(Ä\0\0description[\0\0\0It belongs to house \'Desert Ville #22\'. Nobody owns this house. It costs 200000 gold coins.\0',''),(104,0,'\n/\0\0\0\0 (Ä\0\0description[\0\0\0It belongs to house \'Desert Ville #22\'. Nobody owns this house. It costs 200000 gold coins.\0',''),(104,0,'/\0\0\0\0(Ä\0\0description[\0\0\0It belongs to house \'Desert Ville #22\'. Nobody owns this house. It costs 200000 gold coins.\0',''),(105,0,'Í\0*\0\0\0\0 (Ä\0\0description[\0\0\0It belongs to house \'Desert Ville #23\'. Nobody owns this house. It costs 400000 gold coins.\0',''),(105,0,'È\00\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(105,0,'È\01\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(106,0,'Ó\0*\0\0\0\0 (Ä\0\0description[\0\0\0It belongs to house \'Desert Ville #24\'. Nobody owns this house. It costs 400000 gold coins.\0',''),(106,0,'Ì\00\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(106,0,'Ì\01\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(107,0,'*\0\0\0\0 (Ä\0\0description[\0\0\0It belongs to house \'Desert Ville #25\'. Nobody owns this house. It costs 400000 gold coins.\0',''),(107,0,'0\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(107,0,'1\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(108,0,'*\0\0\0\0 (Ä\0\0description[\0\0\0It belongs to house \'Desert Ville #26\'. Nobody owns this house. It costs 400000 gold coins.\0',''),(108,0,'0\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(108,0,'1\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(109,0,'\n*\0\0\0\0 (Ä\0\0description[\0\0\0It belongs to house \'Desert Ville #27\'. Nobody owns this house. It costs 400000 gold coins.\0',''),(109,0,'	0\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(109,0,'	1\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(110,0,'€\0R\0\0\0\0/\0',''),(110,0,'€\0R\0\0\0\0/\0',''),(110,0,'ﬂ\0Q\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(110,0,'ﬂ\0R\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(110,0,'ﬁ\0P\0\0\0\0.Ä\0\0description^\0\0\0It belongs to house \'Biggest Guild Hall\'. Nobody owns this house. It costs 2140000 gold coins.\0',''),(110,0,'ﬁ\0S\0\0\0\0qÄ\0\0description^\0\0\0It belongs to house \'Biggest Guild Hall\'. Nobody owns this house. It costs 2140000 gold coins.\0',''),(110,0,'ﬂ\0Q\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(110,0,'ﬂ\0R\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(110,0,'‹\0Q\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(110,0,'‹\0R\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(110,0,'›\0S\0\0\0\0qÄ\0\0description^\0\0\0It belongs to house \'Biggest Guild Hall\'. Nobody owns this house. It costs 2140000 gold coins.\0',''),(110,0,'ﬁ\0P\0\0\0\0qÄ\0\0description^\0\0\0It belongs to house \'Biggest Guild Hall\'. Nobody owns this house. It costs 2140000 gold coins.\0',''),(110,0,'ﬂ\0R\0\0\0\0oÄ\0\0description^\0\0\0It belongs to house \'Biggest Guild Hall\'. Nobody owns this house. It costs 2140000 gold coins.\0',''),(110,0,'›\0V\0\0\0\0oÄ\0\0description^\0\0\0It belongs to house \'Biggest Guild Hall\'. Nobody owns this house. It costs 2140000 gold coins.\0',''),(110,0,'ﬂ\0W\0\0\0\0.Ä\0\0description^\0\0\0It belongs to house \'Biggest Guild Hall\'. Nobody owns this house. It costs 2140000 gold coins.\0',''),(110,0,'ﬁ\0T\0\0\0\0qÄ\0\0description^\0\0\0It belongs to house \'Biggest Guild Hall\'. Nobody owns this house. It costs 2140000 gold coins.\0',''),(110,0,'ﬂ\0V\0\0\0\0oÄ\0\0description^\0\0\0It belongs to house \'Biggest Guild Hall\'. Nobody owns this house. It costs 2140000 gold coins.\0',''),(110,0,'‡\0R\0\0\0\0oÄ\0\0description^\0\0\0It belongs to house \'Biggest Guild Hall\'. Nobody owns this house. It costs 2140000 gold coins.\0',''),(110,0,'‚\0P\0\0\0\0\0',''),(110,0,'„\0P\0\0\0\0\0',''),(110,0,'„\0S\0\0\0\0qÄ\0\0description^\0\0\0It belongs to house \'Biggest Guild Hall\'. Nobody owns this house. It costs 2140000 gold coins.\0',''),(110,0,'‡\0U\0\0\0\0-\0',''),(110,0,'‡\0V\0\0\0\0oÄ\0\0description^\0\0\0It belongs to house \'Biggest Guild Hall\'. Nobody owns this house. It costs 2140000 gold coins.\0',''),(111,0,'ê\0,\0\0\0\0$(Ä\0\0description[\0\0\0It belongs to house \'Temple Ville #1\'. Nobody owns this house. It costs 1040000 gold coins.\0',''),(112,0,'ç\02\0\0\0\0≈Ä\0\0descriptionZ\0\0\0It belongs to house \'Temple Ville #2\'. Nobody owns this house. It costs 260000 gold coins.\0',''),(113,0,'°\0-\0\0\0\0√Ä\0\0descriptionZ\0\0\0It belongs to house \'Temple Ville #3\'. Nobody owns this house. It costs 420000 gold coins.\0',''),(114,0,'é\0,\0\0\0\0≈Ä\0\0descriptionZ\0\0\0It belongs to house \'Temple Ville #4\'. Nobody owns this house. It costs 680000 gold coins.\0',''),(115,0,'ê\03\0\0\0\0√Ä\0\0descriptionZ\0\0\0It belongs to house \'Temple Ville #5\'. Nobody owns this house. It costs 360000 gold coins.\0',''),(116,0,'£\00\0\0\0\0≈Ä\0\0descriptionZ\0\0\0It belongs to house \'Temple Ville #6\'. Nobody owns this house. It costs 500000 gold coins.\0',''),(117,0,'§\02\0\0\0\0√Ä\0\0descriptionZ\0\0\0It belongs to house \'Temple Ville #7\'. Nobody owns this house. It costs 700000 gold coins.\0',''),(117,0,'¶\03\0\0\0\0≈Ä\0\0descriptionZ\0\0\0It belongs to house \'Temple Ville #7\'. Nobody owns this house. It costs 700000 gold coins.\0',''),(118,0,':\0‰\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(118,0,':\0Â\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(118,0,'?\0‰\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(118,0,'?\0Â\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(118,0,':\0È\0\0\0\0‡Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(118,0,';\0È\0\0\0\0·Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(118,0,';\0Í\0\0\0\0\Z(Ä\0\0descriptionR\0\0\0It belongs to house \'VIP #1\'. Nobody owns this house. It costs 1680000 gold coins.\0',''),(118,0,'=\0Í\0\0\0\0≈Ä\0\0descriptionR\0\0\0It belongs to house \'VIP #1\'. Nobody owns this house. It costs 1680000 gold coins.\0',''),(118,0,'?\0Í\0\0\0\0\Z(Ä\0\0descriptionR\0\0\0It belongs to house \'VIP #1\'. Nobody owns this house. It costs 1680000 gold coins.\0',''),(118,0,'@\0Â\0\0\0\0(\0',''),(119,0,'4\0˝\0\0\0\0-\0',''),(119,0,'6\0ˇ\0\0\0\0‡Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(119,0,'7\0ˇ\0\0\0\0·Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(119,0,'8\0¸\0\0\0\0oÄ\0\0descriptionQ\0\0\0It belongs to house \'VIP #2\'. Nobody owns this house. It costs 280000 gold coins.\0',''),(119,0,'6\0\0\0\0\0,Ä\0\0descriptionQ\0\0\0It belongs to house \'VIP #2\'. Nobody owns this house. It costs 280000 gold coins.\0',''),(120,0,':\0˝\0\0\0\0qÄ\0\0descriptionP\0\0\0It belongs to house \'VIP #3\'. Nobody owns this house. It costs 80000 gold coins.\0',''),(121,0,';\0¸\0\0\0\0oÄ\0\0descriptionQ\0\0\0It belongs to house \'VIP #5\'. Nobody owns this house. It costs 280000 gold coins.\0',''),(121,0,'<\0˛\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(121,0,'<\0ˇ\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(121,0,'?\0˝\0\0\0\0-\0',''),(121,0,'=\0\0\0\0\0,Ä\0\0descriptionQ\0\0\0It belongs to house \'VIP #5\'. Nobody owns this house. It costs 280000 gold coins.\0',''),(122,0,'5\0˚\0\0\0\0‡Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(122,0,'6\0˚\0\0\0\0·Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(122,0,'<\0˚\0\0\0\0‡Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(122,0,'=\0˚\0\0\0\0·Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(122,0,'8\0¸\0\0\0\0oÄ\0\0descriptionQ\0\0\0It belongs to house \'VIP #4\'. Nobody owns this house. It costs 660000 gold coins.\0',''),(122,0,';\0ˇ\0\0\0\0oÄ\0\0descriptionQ\0\0\0It belongs to house \'VIP #4\'. Nobody owns this house. It costs 660000 gold coins.\0',''),(122,0,'=\0ˇ\0\0\0\0‡Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(122,0,'>\0ˇ\0\0\0\0·Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(122,0,':\0\0\0\0\0,Ä\0\0descriptionQ\0\0\0It belongs to house \'VIP #4\'. Nobody owns this house. It costs 660000 gold coins.\0',''),(122,0,'=\0\0\0\0\0,Ä\0\0descriptionQ\0\0\0It belongs to house \'VIP #4\'. Nobody owns this house. It costs 660000 gold coins.\0',''),(123,0,'M\0Û\0\0\0\0(\0',''),(123,0,'N\0Û\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(123,0,'N\0Ù\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(123,0,'N\0¯\0\0\0\0‡Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(123,0,'O\0¯\0\0\0\0·Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(123,0,'O\0˘\0\0\0\0\Z(Ä\0\0descriptionR\0\0\0It belongs to house \'VIP #7\'. Nobody owns this house. It costs 1700000 gold coins.\0',''),(123,0,'Q\0Ú\0\0\0\0\Z(Ä\0\0descriptionR\0\0\0It belongs to house \'VIP #7\'. Nobody owns this house. It costs 1700000 gold coins.\0',''),(123,0,'S\0Û\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(123,0,'S\0Ù\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(123,0,'T\0Ù\0\0\0\0(\0',''),(123,0,'Q\0˘\0\0\0\0≈Ä\0\0descriptionR\0\0\0It belongs to house \'VIP #7\'. Nobody owns this house. It costs 1700000 gold coins.\0',''),(123,0,'S\0˘\0\0\0\0\Z(Ä\0\0descriptionR\0\0\0It belongs to house \'VIP #7\'. Nobody owns this house. It costs 1700000 gold coins.\0',''),(124,0,'M\0˛\0\0\0\0(\0',''),(124,0,'N\0˛\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(124,0,'N\0ˇ\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(124,0,'Q\0˝\0\0\0\0≈Ä\0\0descriptionR\0\0\0It belongs to house \'VIP #6\'. Nobody owns this house. It costs 1700000 gold coins.\0',''),(124,0,'S\0˛\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(124,0,'S\0ˇ\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(124,0,'T\0ˇ\0\0\0\0(\0',''),(124,0,'N\0\0\0\0‡Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(124,0,'O\0\0\0\0·Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(124,0,'O\0\0\0\0\Z(Ä\0\0descriptionR\0\0\0It belongs to house \'VIP #6\'. Nobody owns this house. It costs 1700000 gold coins.\0',''),(124,0,'Q\0\0\0\0\Z(Ä\0\0descriptionR\0\0\0It belongs to house \'VIP #6\'. Nobody owns this house. It costs 1700000 gold coins.\0',''),(124,0,'S\0\0\0\0\Z(Ä\0\0descriptionR\0\0\0It belongs to house \'VIP #6\'. Nobody owns this house. It costs 1700000 gold coins.\0',''),(125,0,'~\0*\0\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(125,0,'~\0+\0\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(125,0,'Ç\0,\0\0\0\0”#Ä\0\0descriptionW\0\0\0It belongs to house \'Depot Home 1\'. Nobody owns this house. It costs 360000 gold coins.\0',''),(126,0,'y\0\0	\0\0\0‡Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(126,0,'z\0\0	\0\0\0·Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(126,0,'x\0\0	\0\0\0√Ä\0\0description]\0\0\0It belongs to house \'Rotworm Ville #126\'. Nobody owns this house. It costs 940000 gold coins.\0',''),(127,0,'Ñ\0\0	\0\0\0≈Ä\0\0description]\0\0\0It belongs to house \'Rotworm Ville #127\'. Nobody owns this house. It costs 600000 gold coins.\0',''),(128,0,'z\0\0	\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(128,0,'z\0\0	\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(128,0,'~\0\0	\0\0\0≈Ä\0\0description]\0\0\0It belongs to house \'Rotworm Ville #128\'. Nobody owns this house. It costs 800000 gold coins.\0',''),(129,0,'z\0\0	\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(129,0,'z\0	\0	\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(129,0,'~\0\r\0	\0\0\0≈Ä\0\0description]\0\0\0It belongs to house \'Rotworm Ville #129\'. Nobody owns this house. It costs 920000 gold coins.\0',''),(130,0,'p\0\0	\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(130,0,'p\0	\0	\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(130,0,'t\0\r\0	\0\0\0≈Ä\0\0description]\0\0\0It belongs to house \'Rotworm Ville #130\'. Nobody owns this house. It costs 780000 gold coins.\0',''),(131,0,'f\0\0	\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(131,0,'f\0	\0	\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(131,0,'j\0\r\0	\0\0\0≈Ä\0\0description]\0\0\0It belongs to house \'Rotworm Ville #131\'. Nobody owns this house. It costs 700000 gold coins.\0',''),(132,0,'Z\0\0	\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(132,0,'Z\0	\0	\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(132,0,'a\0\r\0	\0\0\0≈Ä\0\0description]\0\0\0It belongs to house \'Rotworm Ville #132\'. Nobody owns this house. It costs 780000 gold coins.\0',''),(132,0,'c\0\r\0	\0\0\0,Ä\0\0description]\0\0\0It belongs to house \'Rotworm Ville #132\'. Nobody owns this house. It costs 780000 gold coins.\0',''),(133,0,'r\0\0	\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(133,0,'r\0\0	\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(133,0,'t\0\Z\0	\0\0\0≈Ä\0\0description]\0\0\0It belongs to house \'Rotworm Ville #133\'. Nobody owns this house. It costs 980000 gold coins.\0',''),(133,0,'v\0\Z\0	\0\0\0,Ä\0\0description]\0\0\0It belongs to house \'Rotworm Ville #133\'. Nobody owns this house. It costs 980000 gold coins.\0',''),(134,0,'f\0\0	\0\0\0‡Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(134,0,'g\0\0	\0\0\0·Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(134,0,'l\0\0	\0\0\0√Ä\0\0description]\0\0\0It belongs to house \'Rotworm Ville #134\'. Nobody owns this house. It costs 460000 gold coins.\0',''),(135,0,'c\0\0	\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(135,0,'c\0\0	\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(135,0,'l\0\0	\0\0\0-\0',''),(135,0,'l\0\Z\0	\0\0\0√Ä\0\0description]\0\0\0It belongs to house \'Rotworm Ville #135\'. Nobody owns this house. It costs 820000 gold coins.\0',''),(135,0,'l\0\0	\0\0\0-\0',''),(136,0,'\\\0\0	\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(136,0,'\\\0\Z\0	\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(136,0,'^\0\0	\0\0\0≈Ä\0\0description]\0\0\0It belongs to house \'Rotworm Ville #136\'. Nobody owns this house. It costs 660000 gold coins.\0',''),(137,0,'S\0\0	\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(137,0,'S\0\Z\0	\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(137,0,'U\0\0	\0\0\0≈Ä\0\0description]\0\0\0It belongs to house \'Rotworm Ville #137\'. Nobody owns this house. It costs 660000 gold coins.\0',''),(138,0,'S\0\0	\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(138,0,'S\0\0	\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(138,0,'U\0\0	\0\0\0≈Ä\0\0description]\0\0\0It belongs to house \'Rotworm Ville #138\'. Nobody owns this house. It costs 460000 gold coins.\0',''),(138,0,'W\0\0	\0\0\0,Ä\0\0description]\0\0\0It belongs to house \'Rotworm Ville #138\'. Nobody owns this house. It costs 460000 gold coins.\0',''),(139,0,'O\0\0	\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(139,0,'O\0	\0	\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(139,0,'X\0\r\0	\0\0\0√Ä\0\0description^\0\0\0It belongs to house \'Rotworm Ville #139\'. Nobody owns this house. It costs 1000000 gold coins.\0',''),(140,0,'L\0\0	\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(140,0,'L\0	\0	\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(140,0,'K\0\0	\0\0\0≈Ä\0\0description]\0\0\0It belongs to house \'Rotworm Ville #140\'. Nobody owns this house. It costs 540000 gold coins.\0',''),(141,0,'A\0\0	\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(141,0,'A\0	\0	\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(141,0,'F\0\0	\0\0\0≈Ä\0\0description^\0\0\0It belongs to house \'Rotworm Ville #141\'. Nobody owns this house. It costs 1060000 gold coins.\0',''),(141,0,'H\0\0	\0\0\0.Ä\0\0description^\0\0\0It belongs to house \'Rotworm Ville #141\'. Nobody owns this house. It costs 1060000 gold coins.\0',''),(142,0,'N\0\0	\0\0\0≈Ä\0\0description]\0\0\0It belongs to house \'Rotworm Ville #142\'. Nobody owns this house. It costs 580000 gold coins.\0',''),(142,0,'L\0\0	\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(142,0,'L\0\0	\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(142,0,'P\0\0	\0\0\0,Ä\0\0description]\0\0\0It belongs to house \'Rotworm Ville #142\'. Nobody owns this house. It costs 580000 gold coins.\0',''),(143,0,'D\0\0	\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(143,0,'H\0\0	\0\0\0≈Ä\0\0description]\0\0\0It belongs to house \'Rotworm Ville #143\'. Nobody owns this house. It costs 580000 gold coins.\0',''),(143,0,'D\0\0	\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(144,0,'=\0\0	\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(144,0,'=\0\0	\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(144,0,'@\0\0	\0\0\0≈Ä\0\0description]\0\0\0It belongs to house \'Rotworm Ville #144\'. Nobody owns this house. It costs 820000 gold coins.\0',''),(145,0,'6\0\0	\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(145,0,'6\0	\0	\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(145,0,'7\0\0	\0\0\0.Ä\0\0description]\0\0\0It belongs to house \'Rotworm Ville #145\'. Nobody owns this house. It costs 860000 gold coins.\0',''),(145,0,'9\0\0	\0\0\0.Ä\0\0description]\0\0\0It belongs to house \'Rotworm Ville #145\'. Nobody owns this house. It costs 860000 gold coins.\0',''),(145,0,'=\0\0	\0\0\0≈Ä\0\0description]\0\0\0It belongs to house \'Rotworm Ville #145\'. Nobody owns this house. It costs 860000 gold coins.\0',''),(146,0,'-\0\0	\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(146,0,'-\0	\0	\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(146,0,'0\0\0	\0\0\0≈Ä\0\0description^\0\0\0It belongs to house \'Rotworm Ville #146\'. Nobody owns this house. It costs 1100000 gold coins.\0',''),(147,0,'9\0\0	\0\0\0≈Ä\0\0description]\0\0\0It belongs to house \'Rotworm Ville #147\'. Nobody owns this house. It costs 640000 gold coins.\0',''),(147,0,'5\0\0	\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(147,0,'5\0\0	\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(148,0,'/\0\0	\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(148,0,'/\0\0	\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(148,0,'1\0\0	\0\0\0≈Ä\0\0description]\0\0\0It belongs to house \'Rotworm Ville #148\'. Nobody owns this house. It costs 580000 gold coins.\0',''),(149,0,'#\0\0	\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(149,0,')\0\0	\0\0\0,Ä\0\0description]\0\0\0It belongs to house \'Rotworm Ville #149\'. Nobody owns this house. It costs 980000 gold coins.\0',''),(149,0,'*\0\0	\0\0\0≈Ä\0\0description]\0\0\0It belongs to house \'Rotworm Ville #149\'. Nobody owns this house. It costs 980000 gold coins.\0',''),(149,0,'#\0\0	\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(150,0,'\"\0\0	\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(150,0,'\"\0	\0	\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(150,0,'\'\0\0	\0\0\0,Ä\0\0description^\0\0\0It belongs to house \'Rotworm Ville #150\'. Nobody owns this house. It costs 1180000 gold coins.\0',''),(150,0,'(\0\0	\0\0\0≈Ä\0\0description^\0\0\0It belongs to house \'Rotworm Ville #150\'. Nobody owns this house. It costs 1180000 gold coins.\0',''),(150,0,'*\0\0	\0\0\0,Ä\0\0description^\0\0\0It belongs to house \'Rotworm Ville #150\'. Nobody owns this house. It costs 1180000 gold coins.\0',''),(151,0,'\0\0	\0\0\0‡Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(151,0,'\0\0	\0\0\0·Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(151,0,'\0\0	\0\0\0,Ä\0\0description^\0\0\0It belongs to house \'Rotworm Ville #151\'. Nobody owns this house. It costs 1300000 gold coins.\0',''),(151,0,'\0\0	\0\0\0≈Ä\0\0description^\0\0\0It belongs to house \'Rotworm Ville #151\'. Nobody owns this house. It costs 1300000 gold coins.\0',''),(152,0,'\0\0	\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(152,0,'\0\0	\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(152,0,'\0\0	\0\0\0√Ä\0\0description]\0\0\0It belongs to house \'Rotworm Ville #152\'. Nobody owns this house. It costs 560000 gold coins.\0',''),(153,0,'\0\Z\0	\0\0\0≈Ä\0\0description]\0\0\0It belongs to house \'Rotworm Ville #153\'. Nobody owns this house. It costs 580000 gold coins.\0',''),(153,0,'\0\0	\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(153,0,'\0\0	\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(154,0,'\Z\0\Z\0	\0\0\0‡Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(154,0,'\0\Z\0	\0\0\0·Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(154,0,'\0\Z\0	\0\0\0≈Ä\0\0description]\0\0\0It belongs to house \'Rotworm Ville #154\'. Nobody owns this house. It costs 580000 gold coins.\0',''),(154,0,'\0\Z\0	\0\0\0,Ä\0\0description]\0\0\0It belongs to house \'Rotworm Ville #154\'. Nobody owns this house. It costs 580000 gold coins.\0',''),(155,0,'Q\0\0\n\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(155,0,'Q\0\0\n\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(155,0,'V\0\0\n\0\0\0∂\0\0\0\0\0',''),(155,0,'W\0\0\n\0\0\0∑\0\0\0\0\0',''),(155,0,'V\0\0\n\0\0\0–#Ä\0\0descriptionX\0\0\0It belongs to house \'Ville Depot 1\'. Nobody owns this house. It costs 480000 gold coins.\0',''),(156,0,']\0\0\n\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(156,0,']\0\0\n\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(156,0,'c\0\0\n\0\0\0⁄Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(156,0,'c\0\0\n\0\0\0€Ä\0\0description\0\0\0Nobody is sleeping there.\0',''),(156,0,'_\0\0\n\0\0\0–#Ä\0\0descriptionX\0\0\0It belongs to house \'Ville Depot 2\'. Nobody owns this house. It costs 420000 gold coins.\0',''),(173,0,'∑\0j\0\0\0\0üÄ\0\0descriptionZ\0\0\0It belongs to house \'Wood House #173\'. Nobody owns this house. It costs 240000 gold coins.\0',''),(174,0,'Ω\0l\0\0\0\0üÄ\0\0descriptionZ\0\0\0It belongs to house \'Wood House #174\'. Nobody owns this house. It costs 240000 gold coins.\0',''),(175,0,'¡\0m\0\0\0\0üÄ\0\0descriptionZ\0\0\0It belongs to house \'Wood House #175\'. Nobody owns this house. It costs 240000 gold coins.\0',''),(176,0,'∆\0m\0\0\0\0üÄ\0\0descriptionZ\0\0\0It belongs to house \'Wood House #176\'. Nobody owns this house. It costs 240000 gold coins.\0',''),(177,0,'À\0m\0\0\0\0üÄ\0\0descriptionZ\0\0\0It belongs to house \'Wood House #177\'. Nobody owns this house. It costs 240000 gold coins.\0',''),(177,0,'Õ\0o\0\0\0\0I\0',''),(178,0,'Ã\0j\0\0\0\0¢Ä\0\0descriptionZ\0\0\0It belongs to house \'Wood House #178\'. Nobody owns this house. It costs 620000 gold coins.\0',''),(178,0,'–\0i\0\0\0\0I\0',''),(178,0,'–\0k\0\0\0\0¢Ä\0\0descriptionZ\0\0\0It belongs to house \'Wood House #178\'. Nobody owns this house. It costs 620000 gold coins.\0',''),(179,0,'Ã\0d\0\0\0\0¢Ä\0\0descriptionZ\0\0\0It belongs to house \'Wood House #179\'. Nobody owns this house. It costs 420000 gold coins.\0',''),(179,0,'–\0c\0\0\0\0I\0',''),(179,0,'–\0e\0\0\0\0¢Ä\0\0descriptionZ\0\0\0It belongs to house \'Wood House #179\'. Nobody owns this house. It costs 420000 gold coins.\0',''),(180,0,'π\0f\0\0\0\0¢Ä\0\0descriptionZ\0\0\0It belongs to house \'Wood House #180\'. Nobody owns this house. It costs 240000 gold coins.\0',''),(181,0,'ñ¸\0\0\0\0∂\0\0\0\0\0',''),(181,0,'ñˇ\0\0\0\0∂\0\0\0\0\0',''),(181,0,'ó¸\0\0\0\0∑\0\0\0\0\0',''),(181,0,'óˇ\0\0\0\0∑\0\0\0\0\0',''),(181,0,'ö¸\0\0\0\0∂\0\0\0\0\0',''),(181,0,'öˇ\0\0\0\0∂\0\0\0\0\0',''),(181,0,'õ¸\0\0\0\0∂\0\0\0\0\0',''),(181,0,'õˇ\0\0\0\0∑\0\0\0\0\0',''),(181,0,'öˇ\0\0\0\0›1Ä\0\0date∏é»\\\0writer\0\0\0[Admin]\0text\0\0\0oii\0›1Ä\0\0text\0\0\0top servidor\0writer\0\0\0Todoroki\0date˜Œ\\\0',''),(181,0,'úˇ\0\0\0\0∂\0\0\0\0\0',''),(181,0,'ùˇ\0\0\0\0∑\0\0\0\0\0',''),(181,0,'û¸\0\0\0\0∂\0\0\0\0\0',''),(181,0,'ñ\0\0\0∂\0\0\0\0\0',''),(181,0,'ó\0\0\0∑\0\0\0\0\0',''),(181,0,'ö\0\0\0∂\0\0\0\0\0',''),(181,0,'ö\0\0\0ΩÄ\0\0descriptionY\0\0\0It belongs to house \'GM House #181\'. Nobody owns this house. It costs 2160000 gold coins.\0',''),(181,0,'õ\0\0\0∑\0\0\0\0\0',''),(181,0,'õ\0\0\0ΩÄ\0\0descriptionY\0\0\0It belongs to house \'GM House #181\'. Nobody owns this house. It costs 2160000 gold coins.\0',''),(181,0,'ö\0\0\0ΩÄ\0\0descriptionY\0\0\0It belongs to house \'GM House #181\'. Nobody owns this house. It costs 2160000 gold coins.\0',''),(181,0,'ú\0\0\0∂\0\0\0\0\0',''),(181,0,'ù\0\0\0∑\0\0\0\0\0','');
/*!40000 ALTER TABLE `tile_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiles`
--

DROP TABLE IF EXISTS `tiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tiles` (
  `id` int(10) unsigned NOT NULL,
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `house_id` int(10) unsigned NOT NULL,
  `x` int(5) unsigned NOT NULL,
  `y` int(5) unsigned NOT NULL,
  `z` tinyint(2) unsigned NOT NULL,
  UNIQUE KEY `id` (`id`,`world_id`),
  KEY `x` (`x`,`y`,`z`),
  KEY `house_id` (`house_id`,`world_id`),
  CONSTRAINT `tiles_ibfk_1` FOREIGN KEY (`house_id`, `world_id`) REFERENCES `houses` (`id`, `world_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiles`
--

LOCK TABLES `tiles` WRITE;
/*!40000 ALTER TABLE `tiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `tiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `woe`
--

DROP TABLE IF EXISTS `woe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `woe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `started` int(11) NOT NULL,
  `guild` int(11) NOT NULL,
  `breaker` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `woe`
--

LOCK TABLES `woe` WRITE;
/*!40000 ALTER TABLE `woe` DISABLE KEYS */;
/*!40000 ALTER TABLE `woe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_changelog`
--

DROP TABLE IF EXISTS `z_changelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_changelog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL DEFAULT '',
  `where` varchar(255) NOT NULL DEFAULT '',
  `date` int(11) NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL,
  `hide` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_changelog`
--

LOCK TABLES `z_changelog` WRITE;
/*!40000 ALTER TABLE `z_changelog` DISABLE KEYS */;
/*!40000 ALTER TABLE `z_changelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_eventots_comunication`
--

DROP TABLE IF EXISTS `z_eventots_comunication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_eventots_comunication` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `param1` varchar(255) NOT NULL,
  `param2` varchar(255) NOT NULL,
  `param3` varchar(255) NOT NULL,
  `param4` varchar(255) NOT NULL,
  `param5` varchar(255) NOT NULL,
  `param6` varchar(255) NOT NULL,
  `param7` varchar(255) NOT NULL,
  `delete_it` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_eventots_comunication`
--

LOCK TABLES `z_eventots_comunication` WRITE;
/*!40000 ALTER TABLE `z_eventots_comunication` DISABLE KEYS */;
/*!40000 ALTER TABLE `z_eventots_comunication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_eventshop_history_item`
--

DROP TABLE IF EXISTS `z_eventshop_history_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_eventshop_history_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `to_name` varchar(255) NOT NULL DEFAULT '0',
  `to_account` int(11) NOT NULL DEFAULT '0',
  `from_nick` varchar(255) NOT NULL,
  `from_account` int(11) NOT NULL DEFAULT '0',
  `price` int(11) NOT NULL DEFAULT '0',
  `offer_id` int(11) NOT NULL DEFAULT '0',
  `offer_desc` varchar(255) DEFAULT NULL,
  `trans_state` varchar(255) NOT NULL,
  `trans_start` int(11) NOT NULL DEFAULT '0',
  `trans_real` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_eventshop_history_item`
--

LOCK TABLES `z_eventshop_history_item` WRITE;
/*!40000 ALTER TABLE `z_eventshop_history_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `z_eventshop_history_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_eventshop_history_pacc`
--

DROP TABLE IF EXISTS `z_eventshop_history_pacc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_eventshop_history_pacc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `to_name` varchar(255) NOT NULL DEFAULT '0',
  `to_account` int(11) NOT NULL DEFAULT '0',
  `from_nick` varchar(255) NOT NULL,
  `from_account` int(11) NOT NULL DEFAULT '0',
  `price` int(11) NOT NULL DEFAULT '0',
  `pacc_days` int(11) NOT NULL DEFAULT '0',
  `trans_state` varchar(255) NOT NULL,
  `trans_start` int(11) NOT NULL DEFAULT '0',
  `trans_real` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_eventshop_history_pacc`
--

LOCK TABLES `z_eventshop_history_pacc` WRITE;
/*!40000 ALTER TABLE `z_eventshop_history_pacc` DISABLE KEYS */;
/*!40000 ALTER TABLE `z_eventshop_history_pacc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_eventshop_offer`
--

DROP TABLE IF EXISTS `z_eventshop_offer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_eventshop_offer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `points` int(11) NOT NULL DEFAULT '0',
  `itemid1` int(11) NOT NULL DEFAULT '0',
  `count1` int(11) NOT NULL DEFAULT '0',
  `itemid2` int(11) NOT NULL DEFAULT '0',
  `count2` int(11) NOT NULL DEFAULT '0',
  `offer_type` varchar(255) DEFAULT NULL,
  `offer_description` text NOT NULL,
  `offer_name` varchar(255) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0',
  `category` int(11) NOT NULL DEFAULT '1',
  `offer_category` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_eventshop_offer`
--

LOCK TABLES `z_eventshop_offer` WRITE;
/*!40000 ALTER TABLE `z_eventshop_offer` DISABLE KEYS */;
INSERT INTO `z_eventshop_offer` VALUES (1,20,12701,1,0,0,'item','30 Minutos de double exp.','Double Exp Potion',0,0,1),(2,100,12710,1,0,0,'item','Arm:4, speed +40 and Faster Regeneration.','Super Boots',0,1,3),(3,40,12670,1,0,0,'item','10 dias de PREMIUM/VIP para toda a acc.','10 Days of Premium Account',0,1,-1),(4,20,12759,1,0,0,'item','6 horas de acesso a uma cave exclusiva.\r\n<b>level maximo: 600<b>','Cave Exclusiva Doll',0,1,-1);
/*!40000 ALTER TABLE `z_eventshop_offer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_featured_article`
--

DROP TABLE IF EXISTS `z_featured_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_featured_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `text` varchar(255) NOT NULL,
  `date` varchar(30) NOT NULL,
  `author` varchar(50) NOT NULL,
  `read_more` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_featured_article`
--

LOCK TABLES `z_featured_article` WRITE;
/*!40000 ALTER TABLE `z_featured_article` DISABLE KEYS */;
INSERT INTO `z_featured_article` VALUES (2,'WakeServ comes','<p>LOREM IPSUM&nbsp;LOREM IPSUM&nbsp;LOREM IPSUM</p>\r\n<p><strong>BUCETA BUCETA BUCETA</strong></p>\r\n<p><strong>SV: 8.6</strong></p>','1513736111','GM Wake',''),(3,'Welcome to Wake-Baiak','<p class=\"serverinfo\"><strong>Bem vindo ao Wake-Baiak&nbsp; -&nbsp; Vers&atilde;o: 8.60&nbsp; -&nbsp; Port: 7171</strong></p>\r\n<p class=\"servertext\">Seja Bem-vindo ao&nbsp;<strong>Wake-Baiak</strong>! Possu&iacute;mos&nbsp;<strong>sistemas</strong>,&nbsp;','1515007631','GM Wake',''),(4,'Bem vindo ao Wake-Baiak  -  Vers√É¬£o: 8.60  -  Port','<p class=\"serverinfo\">Seja Bem-vindo ao&nbsp;<strong>Wake-Baiak</strong>! Possu&iacute;mos&nbsp;<strong>sistemas</strong>,&nbsp;<strong>quests</strong>&nbsp;e&nbsp;<strong>eventos</strong>&nbsp;exclusivos, somos uma equipe empenhada em trazer o&nbsp;<stro','1515007700','GM Wake',''),(5,'Bem vindo ao Wake-Baiak  -  Vers√É¬£o: 8.60  -  Port','<p class=\"serverinfo\">Seja Bem-vindo ao&nbsp;<strong>Wake-Baiak</strong>!&nbsp;</p>','1515007749','GM Wake','');
/*!40000 ALTER TABLE `z_featured_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_forum`
--

DROP TABLE IF EXISTS `z_forum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_forum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_post` int(11) NOT NULL DEFAULT '0',
  `last_post` int(11) NOT NULL DEFAULT '0',
  `section` int(3) NOT NULL DEFAULT '0',
  `replies` int(20) NOT NULL DEFAULT '0',
  `views` int(20) NOT NULL DEFAULT '0',
  `author_aid` int(20) NOT NULL DEFAULT '0',
  `author_guid` int(20) NOT NULL DEFAULT '0',
  `post_text` text NOT NULL,
  `post_topic` varchar(255) NOT NULL,
  `post_smile` tinyint(1) NOT NULL DEFAULT '0',
  `post_date` int(20) NOT NULL DEFAULT '0',
  `last_edit_aid` int(20) NOT NULL DEFAULT '0',
  `edit_date` int(20) NOT NULL DEFAULT '0',
  `post_ip` varchar(15) NOT NULL DEFAULT '0.0.0.0',
  `icon_id` tinyint(4) NOT NULL DEFAULT '1',
  `post_icon_id` tinyint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `section` (`section`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_forum`
--

LOCK TABLES `z_forum` WRITE;
/*!40000 ALTER TABLE `z_forum` DISABLE KEYS */;
INSERT INTO `z_forum` VALUES (4,4,1557162408,1,0,0,5,9,'<center><img title=\"espaco\" src=\"images/mago.png\" alt=\"espaco\" /><br />\r\n<h3><span style=\"color: #ff0000;\">&bull; Extreme-Baiak NOVA ERA</span></h3>\r\n</center>\r\n<p><br /><br /><img src=\"images/setanews.png\" alt=\"\" width=\"20\" height=\"11\" />&nbsp;<span style=\"color: #ff0000;\"><strong>N</strong>ovidades.</span><br /><br /><img src=\"images/alerta.png\" alt=\"\" width=\"11\" height=\"11\" />&nbsp;Servidor PVP 100%<br /><img src=\"images/alerta.png\" alt=\"\" width=\"11\" height=\"11\" />&nbsp;Sem Lag<br /><img src=\"images/alerta.png\" alt=\"\" width=\"11\" height=\"11\" />&nbsp;Adicionado Push Cruzado 100%<br /><img src=\"images/alerta.png\" alt=\"\" width=\"11\" height=\"11\" />&nbsp;<strong>War Ant Entrosa - Com comandos 100%<br /><img src=\"images/alerta.png\" alt=\"\" width=\"11\" height=\"11\" />&nbsp;Cast Sytem Com CTRL+AROWS</strong><br /><img src=\"images/alerta.png\" alt=\"\" width=\"11\" height=\"11\" />&nbsp;Stamina nos treiner subindo a cada 3 minutos treinando.<br /><img src=\"images/alerta.png\" alt=\"\" width=\"11\" height=\"11\" />&nbsp;Castle 24horas e 48 horas<br /><img src=\"images/alerta.png\" alt=\"\" width=\"11\" height=\"11\" />&nbsp;Quests, Tasks, Respaws, Eventos, Citys, Stages, itens e addons<br /><img src=\"images/alerta.png\" alt=\"\" width=\"11\" height=\"11\" />&nbsp;Bugs 100% Corrigido<br /><br /><img src=\"images/setanews.png\" alt=\"\" width=\"20\" height=\"11\" />&nbsp;<span style=\"color: #ff0000;\"><strong>Informa&ccedil;&otilde;es sobre o servidor:</strong></span><br />Ip: extreme-baiak.com.br<br />Host BR<br />Porta: 7171<br />Vers&atilde;o: 8.60<br />Servidor 24horas<br /><br /><img src=\"images/setanews.png\" alt=\"\" width=\"20\" height=\"11\" />&nbsp;<span style=\"color: #ff0000;\"><strong>Serv Info</strong></span><br />Exp rate: 400x<br />Skill rate: 25x<br />Magic level: 10x<br />Loot rate: 8x<br />Exp From Players: 2x<br /><br />Veja mais em&nbsp;<a href=\"?subtopic=serverinfo\">Serv Info</a><br /><br /></p>\r\n<center><a href=\"?subtopic=createaccount\"><img src=\"images/criaraccount1.png\" alt=\"\" width=\"200\" height=\"65\" /></a><br /><br /><br /><img title=\"espaco\" src=\"images/espaco.png\" alt=\"espaco\" /><br /><br /><br /><br /><br /><strong>IP:</strong><span>&nbsp;</span><a href=\"http://www.extreme-baiak.com.br\"><em>www.extreme-baiak.com.br</em></a><br />\r\n<p align=\"right\">&nbsp;</p>\r\n</center>','Extreme-Baiak',0,1557162408,0,0,'179.236.254.154',0,0);
/*!40000 ALTER TABLE `z_forum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_helpdesk`
--

DROP TABLE IF EXISTS `z_helpdesk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_helpdesk` (
  `account` varchar(255) NOT NULL,
  `type` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `text` text NOT NULL,
  `id` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `priority` int(11) NOT NULL,
  `reply` int(11) NOT NULL,
  `who` int(11) NOT NULL,
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `tag` int(11) NOT NULL,
  `registered` int(11) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_helpdesk`
--

LOCK TABLES `z_helpdesk` WRITE;
/*!40000 ALTER TABLE `z_helpdesk` DISABLE KEYS */;
INSERT INTO `z_helpdesk` VALUES ('15',1,1,'ekwoewu',1,'Ewew',2,0,0,1,2,0);
/*!40000 ALTER TABLE `z_helpdesk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_monsters`
--

DROP TABLE IF EXISTS `z_monsters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_monsters` (
  `hide_creature` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `mana` int(11) NOT NULL,
  `exp` int(11) NOT NULL,
  `health` int(11) NOT NULL,
  `speed_lvl` int(11) NOT NULL DEFAULT '1',
  `use_haste` tinyint(1) NOT NULL,
  `voices` text NOT NULL,
  `immunities` varchar(255) NOT NULL,
  `summonable` tinyint(1) NOT NULL,
  `convinceable` tinyint(1) NOT NULL,
  `race` varchar(255) NOT NULL,
  `gfx_name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_monsters`
--

LOCK TABLES `z_monsters` WRITE;
/*!40000 ALTER TABLE `z_monsters` DISABLE KEYS */;
INSERT INTO `z_monsters` VALUES (0,'Amazon',390,60,110,1,0,'\"Yeeee ha!\", \"Your head shall be mine!\"','',1,1,'blood','amazon.gif'),(0,'Valkyrie',450,85,190,1,0,'\"Another head for me!\", \"Head off!\", \"Your head will be mine!\", \"Stand still!\", \"One more head for me!\"','',1,1,'blood','valkyrie.gif'),(0,'Carrion Worm',380,70,145,1,0,'','',0,1,'blood','carrionworm.gif'),(0,'Rotworm',305,40,65,1,0,'','',0,1,'blood','rotworm.gif'),(0,'Kongra',0,115,340,1,1,'\"Hugah!\", \"Ungh! Ungh!\", \"Huaauaauaauaa!\"','',0,0,'blood','kongra.gif'),(0,'Merlkin',0,145,235,1,0,'\"Ugh! Ugh! Ugh!\", \"Holy banana!\", \"Chakka! Chakka!\"','outfit, drunk, invisible',0,0,'blood','merlkin.gif'),(0,'Sibang',0,105,225,1,1,'\"Eeeeek! Eeeeek\", \"Huh! Huh! Huh!\", \"Ahhuuaaa!\"','outfit, drunk, invisible',0,0,'blood','sibang.gif'),(0,'Crystal Spider',0,900,1250,60,1,'\"Screeech!\"','paralyze, outfit, drunk, invisible',0,0,'undead','crystalspider.gif'),(0,'Giant Spider',0,900,1300,30,1,'','outfit, drunk, invisible',0,0,'venom','giantspider.gif'),(0,'Poison Spider',270,22,26,1,0,'','',1,1,'venom','poisonspider.gif'),(0,'Scorpion',310,45,45,1,0,'','',1,1,'venom','scorpion.gif'),(0,'Spider',210,12,20,1,0,'','',1,1,'venom','spider.gif'),(0,'Tarantula',485,120,225,30,1,'','outfit, drunk',1,1,'venom','tarantula.gif'),(0,'Wailing Widow',0,450,850,30,1,'\"EMBRACE MY GIFTS!\", \"I WILL FEAST ON YOUR SOUL!\"','paralyze, invisible, death, earth',0,0,'venom','wailingwidow.gif'),(0,'Drasilla',0,700,1320,1,0,'\"FCHHHHHHHH!\", \"GROOOOAAAAAAAAR!\", \"DIRTY LITTLE HUMANS\", \"YOU CAN\'T KEEP ME HERE FOREVER\"','invisible, fire',0,0,'blood','drasilla.gif'),(0,'Grimgor Guteater',0,670,1115,10,0,'\"Dont run, You\'re burning off precious fat.\"','invisible, fire',0,0,'blood','grimgorguteater.gif'),(0,'Slim',0,580,1025,1,0,'\"Zhroozzzzs.\"','invisible, death, earth',0,0,'undead','slim.gif'),(0,'Spirit Of Earth',0,800,1285,1,0,'\"Show your strengh ... or perish.\"','invisible, earth',0,0,'undead','spiritofearth.gif'),(0,'Spirit Of Fire',0,950,2140,1,0,'\"Feel the heat.\"','invisible, fire',0,0,'blood','spiritoffire.gif'),(0,'Spirit Of Water',0,850,1517,1,0,'\"Blubb\"','invisible, fire',0,0,'undead','spiritofwater.gif'),(0,'Darakan The Executioner',0,1600,3500,1,0,'\"FIGHT LIKE A BARBARIAN!\", \"VICTORY IS MINE!\", \"I AM your father!\", \"To be the man you have to beat the man!\"','invisible',0,1,'blood','darakantheexecutioner.gif'),(0,'Deathbringer',0,5100,10000,40,0,'\"YOU FOOLS WILL PAY!\", \"YOU ALL WILL DIE!!\", \"DEATH, DESTRUCTION!\", \"I will eat your soul!\"','fire, ice, death, invisible',0,0,'undead','deathbringer.gif'),(0,'Gnorre Chyllson',0,4000,7100,75,0,'\"I am like the merciless northwind.\", \"Snow will be your death shroud.\", \"Feel the wrath of father chyll!\"','paralyze, fire, ice, invisible',0,0,'blood','gnorrechyllson.gif'),(0,'Norgle Glacierbeard',0,2100,4300,1,0,'\"I\'ll extinguish you warmbloods.\", \"REVENGE!\", \"Far too hot.\", \"DISGUSTING WARMBLOODS!\", \"Revenge is sweetest when served cold.\"','invisible, ice, fire',0,1,'blood','norgleglacierbeard.gif'),(0,'Svoren The Mad',0,3000,6300,1,1,'\"NO mommy NO. Leave me alone!\", \"Not that tower again!\"','invisible, ice, energy, earth, fire',0,1,'blood','svorenthemad.gif'),(0,'The Masked Marauder',0,3500,6800,15,0,'\"Didn\'t you leave your house door open?\", \"Oops, your shoelaces are open!\"','invisible, fire',0,0,'blood','themaskedmarauder.gif'),(0,'The Obliverator',0,6000,9500,30,0,'\"NO ONE WILL BEAT ME!\"','invisible, fire',0,0,'fire','theobliverator.gif'),(0,'The Pit Lord',0,2500,4500,25,1,'\"I\'LL GET YOU ALL!\", \"I won\'t let you escape!\", \"I\'ll crush you beneath my feet!\"','invisible',0,0,'blood','thepitlord.gif'),(0,'Webster',0,1200,1750,35,1,'\"You are lost!\", \"Come my little morsel.\"','invisible, fire, ice',0,0,'undead','webster.gif'),(0,'Barbarian Bloodwalker',590,195,305,1,1,'\"YAAAHEEE!\", \"SLAUGHTER!\", \"CARNAGE!\", \"You can run but you can\'t hide\"','',0,1,'blood','barbarianbloodwalker.gif'),(0,'Barbarian Brutetamer',0,90,145,25,0,'\"To me, creatures of the wild!\", \"My instincts tell me about your cowardice.\"','lifedrain, paralyze, outfit, invisible',0,0,'blood','barbarianbrutetamer.gif'),(0,'Barbarian Headsplitter',450,85,100,25,0,'\"I will regain my honor with your blood!\", \"Surrender is not option!\", \"Its you or me!\"','paralyze',0,1,'blood','barbarianheadsplitter.gif'),(0,'Barbarian Skullhunter',450,85,135,25,0,'\"You will become my trophy.\", \"Fight harder, coward.\", \"Show that you are a worthy opponent.\"','drunk, paralyze',0,1,'blood','barbarianskullhunter.gif'),(0,'Bear',300,23,80,1,0,'\"grrrr\", \"groar\"','',1,1,'blood','bear.gif'),(0,'Panda',300,23,80,10,0,'\"Grrrr\", \"Groar\"','',1,1,'blood','panda.gif'),(0,'Polar Bear',315,28,85,1,0,'\"Grrrrrr\", \"GROARRR!\"','',1,1,'blood','polarbear.gif'),(0,'Beholder',0,170,260,1,0,'\"Eye for eye!\", \"Here\'s looking at you!\", \"Let me take a look at you!\", \"You\'ve got the look!\"','invisible',0,0,'venom','beholder.gif'),(0,'Braindeath',0,895,1225,25,0,'\"You have disturbed my thoughts!\", \"Let me turn you into something more useful!\", \"Let me taste your brain!\", \"You will be punished!\"','earth, death, invisible',0,0,'undead','braindeath.gif'),(0,'Elder Beholder',0,280,1100,25,0,'\"Let me take a look at you!\", \"Inferior creatures, bow before my power!\"','lifedrain, invisible',0,0,'blood','elderbeholder.gif'),(0,'Gazer',0,90,120,10,1,'\"Mommy!?\", \"Buuuuhaaaahhaaaaa!\", \"Me need mana!\"','invisible',0,0,'venom','gazer.gif'),(0,'Bog Raider',0,900,1300,40,1,'\"Tchhh!\", \"Slurp!\"','paralyze, invisible',0,0,'venom','bograider.gif'),(0,'Carniphila',0,150,255,10,0,'','invisible',0,0,'venom','carniphila.gif'),(0,'Defiler',0,3700,3650,20,0,'\"Blubb\"','paralyze, invisible',0,0,'venom','defiler.gif'),(0,'Haunted Treeling',0,310,450,20,0,'','earth',0,0,'undead','hauntedtreeling.gif'),(0,'Slime',0,160,150,1,0,'','',0,0,'venom','slime.gif'),(0,'Son Of Verminor',0,5900,8500,1,0,'','poison, paralyze, invisible',0,0,'venom','sonofverminor.gif'),(0,'Spit Nettle',0,20,150,1,0,'','paralyze, invisible',0,0,'venom','spitnettle.gif'),(0,'Chicken',220,0,15,1,0,'\"gokgoooook\", \"cluck cluck\"','',1,1,'blood','chicken.gif'),(0,'Dire Penguin',0,120,173,1,0,'','lifedrain, paralyze, outfit, invisible',0,0,'blood','direpenguin.gif'),(0,'Flamingo',250,0,25,1,0,'','',1,1,'blood','flamingo.gif'),(0,'Parrot',250,0,25,10,0,'\"BR? PL? SWE?\", \"Screeech!\", \"Neeeewbiiieee!\", \"You advanshed, you advanshed!\", \"Hope you die and loooosh it!\", \"Hunterrr ish PK!\", \"Shhtop whining! Rrah\", \"I\'m heeerrre! Screeeech!\", \"Leeave orrr hunted!!\", \"Blesshhh my stake! Screeech!\", \"Tarrrrp?\", \"You are corrrrupt! Corrrrupt!\", \"You powerrrrrrabuserrrrr!\", \"You advanshed, you advanshed!\"','',1,1,'blood','parrot.gif'),(0,'Penguin',300,1,33,1,0,'','',1,1,'blood','penguin.gif'),(0,'Seagull',250,0,25,1,0,'','',1,0,'blood','seagull.gif'),(0,'Terror Bird',490,150,300,30,0,'\"CRAAAHHH!\", \"Gruuuh Gruuuh.\", \"Carrah Carrah!\"','',1,1,'blood','terrorbird.gif'),(0,'Acid Blob',0,250,250,1,0,'','death, earth',0,0,'venom','acidblob.gif'),(0,'Death Blob',0,300,320,5,0,'','',0,0,'undead','deathblob.gif'),(0,'Mercury Blob',0,180,150,1,0,'\"Crackle\"','death',0,0,'undead','mercuryblob.gif'),(0,'Annihilon',0,10000,60000,80,1,'\"Annihilation!\"','lifedrain, invisible',0,0,'fire','annihilon.gif'),(0,'Apocalypse',0,80000,160000,90,0,'\"I AM APOCALYPSE, LORD OF DESTRUCTION!\"','paralyze, invisible',0,0,'undead','apocalypse.gif'),(0,'Apprentice Sheng',0,100,95,1,0,'\"I will protect the secrets of my master!\", \"This isle will become ours alone!\", \"Kaplar!\"','energy',0,0,'blood','apprenticesheng.gif'),(0,'Brutus Bloodbeard',0,500,1200,10,0,'','invisible',0,0,'blood','brutusbloodbeard.gif'),(0,'Countess Sorrow',0,5150,7200,15,0,'','physical, poison, ice, lifedrain, paralyze, outfit, drunk, invisible',0,0,'undead','countesssorrow.gif'),(0,'Deadeye Devious',0,500,2000,40,0,'\"Let\'s kill \'em\", \"Arrrgh!\", \"You\'ll never take me alive!\"','invisible',0,0,'blood','deadeyedevious.gif'),(0,'Demodras',0,4000,4500,5,0,'\"I WILL SET THE WORLD IN FIRE!\", \"I WILL PROTECT MY BROOD!\"','paralyze, invisible',0,0,'blood','demodras.gif'),(0,'Dharalion',0,380,380,10,1,'\"Feel my wrath!\", \"Noone will stop my ascension!\", \"My powers are divine!\"','fire, poison, lifedrain, outfit, drunk, invisible',0,0,'blood','dharalion.gif'),(0,'Dracola',0,7750,15850,95,0,'\"DEATH CAN\'T STOP MY HUNGER!\"','paralyze, invisible',0,0,'undead','dracola.gif'),(0,'Fernfang',0,400,400,10,1,'\"You desecrated this place!\", \"I will cleanse this isle!\", \"Grrrrrrr\", \"Yoooohhuuuu!\"','invisible',0,0,'blood','fernfang.gif'),(0,'Ferumbras',0,12000,35000,50,1,'\"NOONE WILL STOP ME THIS TIME!\", \"THE POWER IS MINE!\"','lifedrain, paralyze, outfit, drunk, invisible',0,0,'venom','ferumbras.gif'),(0,'Fluffy',0,3550,4500,45,0,'\"Wooof!\"','drunk, invisible',0,0,'blood','fluffy.gif'),(0,'General Murius',0,300,550,10,0,'\"Feel the power of the Mooh\'Tah!\", \"You will get what you deserve!\", \"For the king!\"','invisible',0,0,'blood','generalmurius.gif'),(0,'Ghazbaran',0,15000,60000,90,1,'\"COME HERE AND DIE!\", \"COME AND GIVE ME SOME AMUSEMENT!\", \"IS THAT THE BEST YOU HAVE TO OFFER, TIBIANS?\", \"I AM GHAZBARAN OF THE TRIANGLE... AND I AM HERE TO CHALLENGE YOU ALL!\", \"FLAWLESS VICTORY!\"','energy, fire, poison, lifedrain, paralyze, outfit, drunk, invisible',0,0,'fire','ghazbaran.gif'),(0,'Golgordan',0,10000,40000,65,0,'\"Latrivan your fool\"','death',0,0,'fire','golgordan.gif'),(0,'Grorlam',0,2400,3000,10,1,'','paralyze, invisible',0,0,'blood','grorlam.gif'),(0,'Hairman The Huge',0,335,600,5,1,'\"Hugah!\", \"Ungh! Ungh!\", \"Huaauaauaauaa!\"','invisible',0,0,'blood','hairmanthehuge.gif'),(0,'Hellgorak',0,10000,40000,70,0,'\"I\'ll sacrifice yours souls to seven!\", \"I\'m bad news for you mortals!\", \"No man can defeat me!\", \"Your puny skills are no match for me.\", \"I smell your fear.\", \"Delicious!\"','lifedrain, paralyze, invisible',0,0,'blood','hellgorak.gif'),(0,'Koshei The Deathless',0,0,2000,85,0,'\"Your pain will be beyond imagination!\", \"You can\'t defeat me! I will ressurect and take your soul!\", \"Death is my ally!\", \"Welcome to my domain, visitor!\", \"You will be my toy on the other side!\", \"What a disgusting smell of life!\"','death, earth, paralyze, invisible',0,0,'undead','kosheithedeathless.gif'),(0,'Latrivan',0,10000,40000,60,0,'\"I might reward you for killing my brother ~ with a swift dead!\"','fire',0,0,'fire','latrivan.gif'),(0,'Lethal Lissy',0,500,1450,10,0,'','invisible',0,0,'blood','lethallissy.gif'),(0,'Leviathan',0,5000,6000,20,0,'\"CHHHRRRR\", \"HISSSS!\"','ice, lifedrain, paralyze, invisible',0,0,'undead','leviathan.gif'),(0,'Lord Of The Elements',0,8000,10000,75,0,'','holy, earth, physical, fire, death, invisible',0,0,'undead','lordoftheelements.gif'),(0,'Mad Technomancer',0,55,1000,1,0,'\"I\'m going to make them an offer they can\'t refuse.\", \"My masterplan cannot fail!\", \"Gentlemen, you can\'t fight here! This is the War Room!\"','invisible',0,0,'blood','madtechnomancer.gif'),(0,'Madareth',0,10000,55000,80,0,'\"I am going to play with yourself!\"','energy, fire, invisible',0,0,'fire','madareth.gif'),(0,'Man In The Cave',0,555,485,1,0,'\"THE MONKS ARE MINE\", \"I will rope you up! All of you!\", \"You have been roped up!\", \"A MIC to rule them all!\"','fire, lifedrain, outfit, drunk, invisible',0,0,'blood','maninthecave.gif'),(0,'Massacre',0,9800,30000,85,1,'','energy, fire, poison, lifedrain, paralyze, outfit, drunk, invisible',0,0,'blood','massacre.gif'),(0,'Minishabaal',0,4000,3500,240,1,'\"I had Princess Lumelia as breakfast!\", \"Naaa-Nana-Naaa-Naaa!\", \"My brother will come and get you for this!\", \"Get them Fluffy!\", \"He He He!\", \"Pftt, Ferumbras such an upstart!\", \"My dragon is not that old, it\'s just second hand!\", \"My other dragon is a red one!\", \"When I am big I want to become the ruthless eighth!\", \"WHERE\'S FLUFFY?\", \"Muahaha!\"','invisible',0,0,'blood','minishabaal.gif'),(0,'Morgaroth',0,15000,55000,90,1,'\"I AM MORGAROTH, LORD OF THE TRIANGLE... AND YOU ARE LOST!\", \"MY SEED IS FEAR AND MY HARVEST ARE YOUR SOULS!\", \"THE TRIANGLE OF TERROR WILL RISE!\", \"ZATHROTH! LOOK AT THE DESTRUCTION I AM CAUSING IN YOUR NAME!\"','paralyze, invisible',0,0,'fire','morgaroth.gif'),(0,'Mr. Punish',0,5500,12000,125,0,'','energy, fire, poison, invisible',0,0,'undead','mr.punish.gif'),(0,'Munster',250,23,58,1,0,'\"Meeeeep!\"','',1,1,'blood','munster.gif'),(0,'Necropharus',0,700,750,10,0,'\"You will rise as my servant!\", \"Praise to my master Urgith!\"','poison, lifedrain, outfit, drunk, invisible',0,0,'blood','necropharus.gif'),(0,'Orshabaal',0,9999,22500,80,1,'\"PRAISED BE MY MASTERS, THE RUTHLESS SEVEN!\", \"YOU ARE DOOMED!\", \"ORSHABAAL IS BACK!\", \"Be prepared for the day my masters will come for you!\", \"SOULS FOR ORSHABAAL!\"','lifedrain, paralyze, invisible',0,0,'fire','orshabaal.gif'),(0,'Pythius The Rotten',0,100,9000,50,0,'\"YOU\'LL NEVER GET MY TREASURE!\", \"MINIONS, MEET YOUR NEW BROTHER!\", \"YOU WILL REGRET THAT YOU ARE BORN!\", \"YOU MADE A HUGE WASTE!\"','death, earth, energy, lifedrain, invisible',0,0,'undead','pythiustherotten.gif'),(0,'Ron The Ripper',0,500,1500,10,0,'','',0,0,'blood','rontheripper.gif'),(0,'Rotworm Queen',0,300,85,1,0,'','',0,0,'blood','rotwormqueen.gif'),(0,'The Count',0,1750,4600,75,0,'','lifedrain, death, invisible',0,0,'undead','thecount.gif'),(0,'The Evil Eye',0,500,1200,10,0,'\"Inferior creatures, bow before my power!\"','invisible',0,0,'blood','theevileye.gif'),(0,'The Handmaiden',0,3850,14500,115,1,'','energy, fire, ice, poison, lifedrain, paralyze, outfit, drunk, invisible',0,0,'blood','thehandmaiden.gif'),(0,'The Horned Fox',0,200,265,1,0,'\"You will never get me!\", \"I\'ll be back!\", \"Catch me, if you can!\", \"Help me, boys!\"','invisible',0,0,'blood','thehornedfox.gif'),(0,'The Imperor',0,8000,15000,55,1,'\"Muahaha!\", \"He he he!\"','fire, poison, lifedrain, paralyze, outfit, drunk, invisible',0,0,'fire','theimperor.gif'),(0,'The Noxious Spawn',0,6000,9500,10,0,'\"I bring you deathhhh, mortalssss.\"','paralyze, invisible',0,0,'venom','thenoxiousspawn.gif'),(0,'The Old Widow',0,2800,3200,10,1,'','fire, poison, lifedrain, outfit, drunk, invisible',0,0,'blood','theoldwidow.gif'),(0,'The Plasmother',0,8900,16050,45,0,'\"Blubb\"','poison, lifedrain, paralyze, invisible',0,0,'venom','theplasmother.gif'),(0,'Thul',0,1800,3000,40,0,'\"Gaaahhh!\"','',0,0,'undead','thul.gif'),(0,'Tiquandas Revenge',0,1755,2000,110,0,'','invisible',0,0,'venom','tiquandasrevenge.gif'),(0,'Undead Minion',620,550,850,5,0,'','fire, poison, lifedrain, drunk',0,1,'undead','undeadminion.gif'),(0,'Ushuriel',0,10000,50000,65,1,'','lifedrain, paralyze, invisible',0,0,'fire','ushuriel.gif'),(0,'Xenia',450,255,290,1,0,'\"Stand still!\", \"One more head for me!\", \"Head off!\"','',1,1,'blood','xenia.gif'),(0,'Zugurosh',0,10000,95000,60,0,'\"You will run out of resources soon enough!!\", \"One little mistake and your all are mine!\", \"I sense your strength fading!\"','death, paralyze, invisible',0,0,'fire','zugurosh.gif'),(0,'Dog',220,0,20,1,0,'\"Wuff! Wuff!\"','',1,1,'blood','dog.gif'),(0,'Hellhound',0,6800,7500,45,0,'\"GROOOWL!\", \"GRRRRR!\"','paralyze, outfit, drunk, invisible',0,0,'blood','hellhound.gif'),(0,'Husky',420,0,140,1,0,'\"Yoooohuuuu!\", \"Grrrrrrr\", \"Ruff, ruff!\"','',1,1,'blood','husky.gif'),(0,'War Wolf',0,55,140,1,0,'\"Grrrrrrr\", \"Yoooohhuuuu!\"','',0,1,'blood','warwolf.gif'),(0,'Werewolf',0,1450,1955,50,0,'\"BLOOD!\", \"HRAAAAAAAAAARRRRRR!\"','paralyze, invisible',0,0,'blood','werewolf.gif'),(0,'Winter Wolf',260,20,30,1,0,'','',1,1,'blood','winterwolf.gif'),(0,'Wolf',255,18,25,1,0,'','',1,1,'blood','wolf.gif'),(0,'Chakoya Toolshaper',0,40,80,25,0,'\"Chikuva!!\", \"Jinuma jamjam!\", \"Suvituka siq chuqua!\", \"Kiyosa sipaju!\"','',0,0,'blood','chakoyatoolshaper.gif'),(0,'Chakoya Tribewarden',305,40,68,25,0,'\"Quisavu tukavi!\", \"Si siyoqua jamjam!\", \"Achuq! jinuma!\", \"Si ji jusipa!\"','',0,1,'blood','chakoyatribewarden.gif'),(0,'Chakoya Windcaller',305,48,84,25,0,'\"Mupi! Si siyoqua jinuma!\", \"Siqsiq ji jusipa!\", \"Jagura taluka taqua!\", \"Quatu nguraka!\"','',0,1,'blood','chakoyawindcaller.gif'),(0,'Blood Crab',505,160,290,1,0,'','',1,0,'blood','bloodcrab.gif'),(0,'Crab',305,30,55,1,0,'\"crab crab!\"','',1,1,'blood','crab.gif'),(0,'Ice Golem',0,295,385,1,0,'\"Chrr.\"','paralyze, invisible',0,0,'undead','icegolem.gif'),(0,'Acolyte Of The Cult',0,300,390,5,0,'\"Praise voodoo!\"','invisible',0,0,'blood','acolyteofthecult.gif'),(0,'Adept Of The Cult',0,400,430,1,0,'','invisible',0,0,'blood','adeptofthecult.gif'),(0,'Enlightened Of The Cult',0,500,700,1,0,'','paralyze',0,0,'blood','enlightenedofthecult.gif'),(0,'Novice Of The Cult',0,100,285,1,0,'\"Fear us!\", \"You will not tell anyone what you have seen.\", \"Your curiosity will be punished!\"','',0,0,'blood','noviceofthecult.gif'),(0,'Dark Torturer',0,4650,7350,30,0,'\"You like it, don\'t you?\", \"The torturer is in!\", \"It\'s party time!\", \"Harrr, Harrr!\", \"IahaEhheAie!\"','invisible, fire',0,0,'blood','darktorturer.gif'),(0,'Demon',0,6000,8200,30,1,'\"MUHAHAHAHA!\", \"I SMELL FEEEEEAAAR!\", \"CHAMEK ATH UTHUL ARAK!\", \"Your resistance is futile!\", \"Your soul will be mine!\"','lifedrain, paralyze, invisible',0,0,'fire','demon.gif'),(0,'Destroyer',0,2500,3700,80,1,'\"COME HERE AND DIE!\", \"Destructiooooon!\", \"It\'s a good day to destroy!\"','paralyze, invisible',0,0,'blood','destroyer.gif'),(0,'Diabolic Imp',0,2900,1950,50,1,'\"Muahaha!\", \"He he he!\"','lifedrain, paralyze, invisible',0,0,'blood','diabolicimp.gif'),(0,'Fire Devil',530,145,200,1,0,'\"Hot, eh?\", \"Hell, oh hell!\"','',1,1,'blood','firedevil.gif'),(0,'Fury',0,4500,4100,120,1,'\"Ahhhhrrrr!\", \"Waaaaah!\", \"Carnage!\"','paralyze, invisible',0,0,'blood','fury.gif'),(0,'Gozzler',800,180,240,20,1,'\"Huhuhuhuuu!\", \"Let the fun begin!\", \"Yihahaha!\", \"I\'ll bite you! Nyehehehehe!\"','invisible',1,0,'blood','gozzler.gif'),(0,'Hand Of Cursed Fate',0,5000,7500,100,1,'','paralyze, invisible',0,0,'blood','handofcursedfate.gif'),(0,'Hellspawn',0,2550,3500,40,1,'\"Your fragile bones are like toothpicks to me.\", \"You little weasel will not live to see another day.\", \"I\'m just a messenger of what\'s yet to come.\", \"HRAAAAAAAAAAAAAAAARRRR!\", \"I\'m taking you down with me!\"','paralyze, invisible',0,0,'blood','hellspawn.gif'),(0,'Juggernaut',0,8700,20000,140,1,'\"WAHHHH!\", \"RAAARRR!\", \"GRRRRRR!\"','paralyze, invisible',0,0,'blood','juggernaut.gif'),(0,'Nightmare',0,2150,2700,80,1,'\"Close your eyes... I want to show you something!\", \"I will haunt you forever!\", \"I will make you scream!\", \"Pffffrrrrrrrrrrrr.\", \"Take a ride with me.\", \"Weeeheeheeeheee!\"','invisible, lifedrain',0,0,'blood','nightmare.gif'),(0,'Nightmare Scion',0,1350,1400,120,0,'\"Weeeheeheee!\", \"Pffffrrrrrrrrrrrr.\", \"Peak a boo, I killed you!\"','earth, death, invisible',0,0,'blood','nightmarescion.gif'),(0,'Plaguesmith',0,4500,8250,60,1,'\"You are looking a bit feverish today!\", \"You don\'t look that good!\", \"Hachoo!\", \"Cough Cough!\"','paralyze, invisible',0,0,'venom','plaguesmith.gif'),(0,'Blue Djinn',0,215,330,1,0,'\"Simsalabim\", \"Feel the power of my magic, tiny mortal!\", \"Be careful what you wish for.\", \"Wishes can come true.\"','paralyze, invisible',0,0,'blood','bluedjinn.gif'),(0,'Efreet',0,410,550,25,0,'\"I grant you a deathwish!\", \"Good wishes are for fairytales\"','paralyze, invisible',0,0,'blood','efreet.gif'),(0,'Green Djinn',0,215,330,1,0,'\"I grant you a deathwish!\", \"Muhahahaha!\", \"I wish you a merry trip to hell!\", \"Good wishes are for fairytales\"','paralyze, invisible',0,0,'blood','greendjinn.gif'),(0,'Marid',0,410,550,1,0,'\"Simsalabim\", \"Feel the power of my magic, tiny mortal!\", \"Wishes can come true.\", \"Djinns will soon again be the greatest!\"','paralyze, invisible',0,0,'blood','marid.gif'),(0,'Dragon Lord',0,2100,1900,10,0,'\"ZCHHHHH\", \"YOU WILL BURN!\"','fire, paralyze, invisible',0,0,'blood','dragonlord.gif'),(0,'Dragon Lord Hatchling',0,645,750,1,0,'\"Fchu?\", \"Rooawwrr\"','fire, paralyze, invisible',0,0,'blood','dragonlordhatchling.gif'),(0,'Dragon',0,700,1000,1,0,'\"GROOAAARRR\", \"FCHHHHH\"','fire, paralyze, invisible',0,0,'blood','dragon.gif'),(0,'Dragon Hatchling',0,185,380,1,0,'\"Fchu?\", \"Rooawwrr\"','fire, paralyze, invisible',0,0,'blood','dragonhatchling.gif'),(0,'Frost Dragon',0,2300,1800,20,0,'\"YOU WILL FREEZE!\", \"ZCHHHHH!\", \"I am so cool\", \"Chill out!.\"','fire, ice, earth, lifedrain, paralyze, invisible',0,0,'undead','frostdragon.gif'),(0,'Frost Dragon Hatchling',0,745,800,1,0,'\"Rooawwrr\", \"Fchu?\"','fire, lifedrain, ice, earth, invisible',0,0,'blood','frostdragonhatchling.gif'),(0,'Ghastly Dragon',0,4600,7800,95,0,'\"EMBRACE MY GIFTS!\", \"I WILL FEAST ON YOUR SOUL!\"','paralyze, invisible, death, earth',0,0,'undead','ghastlydragon.gif'),(0,'Wyrm',0,1450,1825,40,0,'\"GRRR!\", \"GROOOOAAAAAAAAR!\"','energy, paralyze, invisible, lifedrain',0,0,'blood','wyrm.gif'),(0,'Dwarf Geomancer',0,245,380,1,0,'\"Hail Durin!\", \"Earth is the strongest element.\", \"Dust to dust.\"','invisible',0,0,'blood','dwarfgeomancer.gif'),(0,'Dwarf Guard',650,165,245,1,0,'\"Hail Durin!\"','invisible',1,1,'blood','dwarfguard.gif'),(0,'Dwarf Soldier',360,70,135,1,0,'\"Hail Durin!\"','',1,1,'blood','dwarfsoldier.gif'),(0,'Dwarf',320,45,90,1,0,'\"Hail Durin!\"','',1,1,'blood','dwarf.gif'),(0,'Dworc Fleshhunter',0,35,85,10,0,'\"Grak brrretz!\", \"Grow truk grrrrr.\", \"Prek tars, dekklep zurk.\"','',0,1,'blood','dworcfleshhunter.gif'),(0,'Dworc Venomsniper',0,30,80,10,0,'\"grak brrretz!\", \"grow truk grrrrr.\", \"prek tars, dekklep zurk.\"','',0,1,'blood','dworcvenomsniper.gif'),(0,'Dworc Voodoomaster',0,50,80,10,1,'\"grak brrretz!\", \"grow truk grrrrr.\", \"prek tars, dekklep zurk.\"','',0,1,'blood','dworcvoodoomaster.gif'),(0,'Elephant',500,160,320,10,0,'\"Hooooot-Toooooot!\", \"Tooooot.\", \"Troooooot!\"','',1,1,'blood','elephant.gif'),(0,'Mammoth',0,110,190,1,0,'\"Troooooot!\", \"Hooooot-Toooooot!\", \"Tooooot.\"','',0,0,'blood','mammoth.gif'),(0,'Elf Arcanist',0,175,220,5,0,'\"Feel my wrath!\", \"For the Daughter of the Stars!\", \"I\'ll bring balance upon you!\", \"Tha\'shi Cenath!\", \"Vihil Ealuel!\"','invisible',0,0,'blood','elfarcanist.gif'),(0,'Elf Scout',360,75,160,3,0,'\"Tha\'shi Ab\'Dendriel!\", \"Feel the sting of my arrows!\", \"Thy blood will quench the soil\'s thirst!\", \"Evicor guide my arrow.\", \"Your existence will end here!\"','invisible',1,1,'blood','elfscout.gif'),(0,'Elf',320,42,100,1,0,'\"Ulathil beia Thratha!\", \"Bahaha aka!\", \"You are not welcome here.\", \"Flee as long as you can.\", \"Death to the defilers!\"','invisible',1,1,'blood','elf.gif'),(0,'Charged Energy Elemental',0,450,500,25,0,'','holy, fire, energy, ice, invisible',0,0,'undead','chargedenergyelemental.gif'),(0,'Energy Elemental',0,450,500,15,0,'','ice, fire, energy, invisible',0,0,'undead','energyelemental.gif'),(0,'Energy Overlord',0,2800,4000,35,0,'','energy, holy, poison, invisible',0,0,'undead','energyoverlord.gif'),(0,'Massive Energy Elemental',0,850,1100,40,0,'','ice, energy, fire, invisible',0,0,'undead','massiveenergyelemental.gif'),(0,'Overcharged Energy Elemental',0,1300,1700,40,0,'','ice, energy, invisible',0,0,'undead','overchargedenergyelemental.gif'),(0,'Cat',220,0,20,1,0,'\"Mew!\", \"Meow!\", \"Meow meow!\"','',1,1,'blood','cat.gif'),(0,'Lion',320,30,80,1,0,'\"Groarrr!\"','',1,1,'blood','lion.gif'),(0,'Tiger',420,40,75,10,1,'','',1,1,'blood','tiger.gif'),(0,'Azure Frog',305,20,60,5,0,'\"Ribbit, ribbit!\"','',1,0,'blood','azurefrog.gif'),(0,'Coral Frog',305,20,60,5,0,'\"Ribbit!\"','',1,0,'blood','coralfrog.gif'),(0,'Crimson Frog',305,20,60,5,0,'\"Ribbit!\"','',1,0,'blood','crimsonfrog.gif'),(0,'Green Frog',305,0,60,5,0,'\"Ribbit!\", \"Ribbit! Ribbit!\"','',1,0,'venom','greenfrog.gif'),(0,'Orchid Frog',0,20,60,5,0,'','',0,0,'blood','orchidfrog.gif'),(0,'Toad',400,60,135,10,0,'\"Ribbit, ribbit!\", \"Ribbit!\"','',1,0,'blood','toad.gif'),(0,'Damaged Worker Golem',0,95,260,25,0,'\"Klonk klonk klonk\", \"Failure! Failire!\", \"Good morning citizen. How may I serve you?\", \"Target identified: Rat! Termination initiated!\"','invisible, paralyze',0,0,'energy','damagedworkergolem.gif'),(0,'Earth Elemental',0,450,650,55,0,'','paralyze, invisible, earth, energy',0,0,'undead','earthelemental.gif'),(0,'Earth Overlord',0,2800,4000,55,0,'','paralyze, invisible, earth, energy, holy',0,0,'undead','earthoverlord.gif'),(0,'Gargoyle',0,150,450,15,0,'\"Harrrr Harrrr!\", \"Stone sweet stone.\", \"Feel my claws, softskin.\", \"Chhhhhrrrrk!\", \"There is a stone in your shoe!\"','lifedrain',0,0,'blood','gargoyle.gif'),(0,'Stone Golem',590,280,270,1,0,'','paralyze',1,1,'undead','stonegolem.gif'),(0,'Jagged Earth Elemental',0,1300,1500,30,0,'\"Stomp STOMP\"','paralyze, invisible, earth, holy',0,0,'undead','jaggedearthelemental.gif'),(0,'Massive Earth Elemental',0,850,1330,35,0,'','paralyze, invisible, earth, ice',0,0,'undead','massiveearthelemental.gif'),(0,'Muddy Earth Elemental',0,450,650,20,0,'','paralyze, invisible, earth, holy',0,0,'undead','muddyearthelemental.gif'),(0,'War Golem',0,2550,4300,30,1,'\"Azerus barada nikto!\", \"Klonk klonk klonk\", \"Engaging Enemy!\", \"Threat level processed.\", \"Charging weapon systems!\", \"Auto repair in progress.\", \"The battle is joined!\", \"Termination initialized!\", \"Rrrtttarrrttarrrtta\"','invisible, paralyze',0,0,'energy','wargolem.gif'),(0,'Worker Golem',0,1250,1400,25,0,'\"INTRUDER ALARM!\", \"klonk klonk klonk\", \"Rrrtttarrrttarrrtta\", \"Awaiting orders.\", \"Secret objective complete.\"','invisible, paralyze',0,0,'energy','workergolem.gif'),(0,'Ghost',100,120,150,1,0,'\"Huh!\", \"Shhhhhh\", \"Buuuuuh\"','lifedrain, paralyze',0,0,'undead','ghost.gif'),(0,'Phantasm',0,3300,3950,30,0,'\"Oh my, you forgot to put your pants on!\", \"Weeheeheeheehee!\", \"Its nothing but a dream!\", \"Give in!\"','paralyze, invisible',0,0,'undead','phantasm.gif'),(0,'Pirate Ghost',0,250,275,5,0,'\"Yooh Ho Hooh Ho!\", \"Hell is waiting for You!\", \"It\'s alive!\", \"The curse! Aww the curse!\", \"You will not get my treasure!\"','paralyze',0,0,'undead','pirateghost.gif'),(0,'Spectre',0,2100,1350,15,0,'\"Revenge ... is so ... sweet!\", \"Life...force! Feed me your... lifeforce!\"','paralyze, invisible',0,0,'undead','spectre.gif'),(0,'Wisp',0,0,115,1,1,'\"Crackle!\", \"Tsshh\"','death, paralyze',0,0,'undead','wisp.gif'),(0,'Behemoth',0,2500,4000,30,1,'\"You\'re so little!\", \"Human flesh - delicious!\", \"Crush the intruders!\"','paralyze, invisible',0,0,'blood','behemoth.gif'),(0,'Cyclops',490,150,260,1,0,'\"Il lorstok human!\", \"Toks utat.\", \"Human, uh whil dyh!\", \"Youh ah trak!\", \"Let da mashing begin!\"','',1,1,'blood','cyclops.gif'),(0,'Cyclops Drone',525,200,325,1,0,'\"Fee! Fie! Foe! Fum!\", \"Luttl pest!\", \"Me makking you pulp!\", \"Humy tasy! Hum hum!\"','',0,1,'blood','cyclopsdrone.gif'),(0,'Cyclops Smith',695,255,435,1,0,'\"Outis emoi g\' onoma.\", \"Whack da humy!\", \"Ai humy phary ty kaynon\"','',0,1,'blood','cyclopssmith.gif'),(0,'Frost Giant',490,150,270,1,0,'\"Hmm Humansoup\", \"Stand still ya tasy snack!\", \"Joh Thun!\", \"Brore Smode!\", \"Horre Sjan Flan!\", \"Forle Bramma!\"','',0,1,'blood','frostgiant.gif'),(0,'Frost Giantess',490,150,275,1,0,'\"Ymirs Mjalle!\", \"No run so much, must stay fat!\", \"Horre, Sjan Flan!\", \"Damned fast food.\", \"Come kiss the cook!\"','',0,1,'blood','frostgiantess.gif'),(0,'Yeti',0,460,950,25,0,'\"Yooodelaaahooohooo!\", \"Yooodelaaaheeeheee!\"','invisible',0,0,'blood','yeti.gif'),(0,'Goblin',290,25,50,1,0,'\"Me have him!\", \"Zig Zag! Gobo attack!\", \"Help! Goblinkiller!\", \"Bugga! Bugga!\", \"Me green, me mean!\"','',1,1,'blood','goblin.gif'),(0,'Goblin Assassin',360,52,75,1,0,'\"Goblin Powahhh!\"','',1,1,'blood','goblinassassin.gif'),(0,'Goblin Leader',290,50,75,1,0,'\"Go go, Gobo attack !!\", \"Me the greenest and the meanest!\", \"Me have power to crush you!\", \"Goblinkiller! Catch him !!\"','',1,1,'blood','goblinleader.gif'),(0,'Goblin Scavenger',310,37,60,1,0,'\"Shiny, Shiny!\", \"You mean!\", \"All mine!\", \"Uhh!\"','',1,1,'blood','goblinscavenger.gif'),(0,'Grynch Clan Goblin',0,4,80,325,1,'\"T\'was not me hand in your pocket!\", \"Look! Cool stuff in house. Let\'s get it!\", \"Uhh! Nobody home!\", \"Me just borrowed it!\", \"Me no steal! Me found it!\", \"Me had it for five minutes. It\'s family heirloom now!\", \"Nice human won\'t hurt little, good goblin?\", \"Gimmegimme!\", \"Invite me in you lovely house plx!\", \"Other Goblin stole it!\", \"All presents mine!\", \"Me got ugly ones purse\", \"Free itans plz!\", \"Not me! Not me!\", \"Guys, help me here! Guys? Guys???\", \"That only much dust in me pocket! Honest!\", \"Can me have your stuff?\", \"Halp, Big dumb one is after me!\", \"Uh, So many shiny things!\", \"Utani hur hur hur!\", \"Mee? Stealing? Never!!!\", \"Oh what fun it is to steal a one-horse open sleigh!\", \"Must have it! Must have it!\", \"Where me put me lockpick?\", \"Catch me if you can!\"','fire, invisible',0,0,'blood','grynchclangoblin.gif'),(0,'Ice Overlord',0,1950,2800,85,0,'','ice, fire, lifedrain, paralyze, invisible, drown',0,0,'undead','iceoverlord.gif'),(0,'Massive Water Elemental',0,1950,2350,85,0,'','fire, lifedrain, paralyze, outfit, drunk, invisible',0,0,'undead','massivewaterelemental.gif'),(0,'Roaring Water Elemental',0,1300,1750,85,0,'','fire, earth, ice, lifedrain, paralyze, invisible, drown',0,0,'undead','roaringwaterelemental.gif'),(0,'Slick Water Elemental',0,450,550,30,0,'\"Blubb\", \"Splipsh Splash\"','ice, drown',0,0,'undead','slickwaterelemental.gif'),(0,'Water Elemental',0,450,550,30,0,'','ice, fire, poison, paralyze, invisible',0,0,'undead','waterelemental.gif'),(0,'Ancient Scarab',0,720,1000,55,1,'','paralyze, invisible',0,0,'venom','ancientscarab.gif'),(0,'Butterfly',0,0,2,40,0,'','poison, paralyze, drunk',0,0,'venom','butterfly.gif'),(0,'Bug',250,18,29,10,0,'','',1,1,'venom','bug.gif'),(0,'Centipede',335,30,70,1,0,'','',1,1,'venom','centipede.gif'),(0,'Cockroach',0,0,1,1,0,'','',0,0,'venom','cockroach.gif'),(0,'Insect Swarm',0,40,50,1,0,'','earth',0,127,'venom','insectswarm.gif'),(0,'Lancer Beetle',0,250,400,1,0,'\"Crump!\"','earth, invisible, lifedrain, paralyze',0,127,'venom','lancerbeetle.gif'),(0,'Larva',355,40,70,1,0,'','paralyze',1,1,'venom','larva.gif'),(0,'Sandcrawler',0,20,30,1,0,'\"Chrk chrk!\"','',1,0,'venom','sandcrawler.gif'),(0,'Scarab',395,120,320,1,1,'','paralyze',1,1,'venom','scarab.gif'),(0,'Terramite',0,160,365,1,0,'\"Zrp zrp!\"','invisible',1,0,'venom','terramite.gif'),(0,'Wasp',280,25,35,120,0,'\"Bssssss\"','',1,1,'venom','wasp.gif'),(0,'Battlemaster Zunzu',0,2500,5000,100,0,'','earth, invisible',0,0,'blood','battlemasterzunzu.gif'),(0,'Lizard Chosen',0,2200,3050,10,0,'\"Grzzzzzzz!\"','earth, invisible',0,0,'blood','lizardchosen.gif'),(0,'Lizard Dragon Priest',0,1200,1450,50,0,'','earth, invisible',0,0,'blood','lizarddragonpriest.gif'),(0,'Lizard High Guard',0,1450,1800,60,0,'\"Grzzzzzzz!\"','earth, invisible',0,0,'blood','lizardhighguard.gif'),(0,'Lizard Legionnaire',0,1100,1400,1,0,'\"Tssss!\"','earth, invisible',0,0,'blood','lizardlegionnaire.gif'),(0,'Lizard Sentinel',0,110,265,10,0,'\"Tssss!\"','invisible',0,1,'blood','lizardsentinel.gif'),(0,'Lizard Snakecharmer',0,210,325,1,0,'\"I ssssmell warm blood!\", \"Shhhhhhhh\"','invisible',0,0,'blood','lizardsnakecharmer.gif'),(0,'Lizard Templar',0,115,410,1,0,'\"Hissss!\"','',0,0,'blood','lizardtemplar.gif'),(0,'Lizard Zaogun',0,1700,2955,100,0,'','earth, invisible',0,0,'blood','lizardzaogun.gif'),(0,'Wyvern',0,515,795,1,0,'\"Shriiiek\"','drunk, invisible',0,0,'blood','wyvern.gif'),(0,'Minotaur Archer',390,65,100,1,0,'\"Ruan Wihmpy!\", \"Kaplar!\"','',1,1,'blood','minotaurarcher.gif'),(0,'Minotaur Guard',550,160,185,1,0,'\"Kirll Karrrl!\", \"Kaplar!\"','',1,1,'blood','minotaurguard.gif'),(0,'Minotaur Mage',0,150,155,1,0,'\"Learrn tha secrret uf deathhh!\", \"Kaplar!\"','invisible',0,0,'blood','minotaurmage.gif'),(0,'Minotaur',330,50,100,1,0,'\"Kaplar!\"','',1,1,'blood','minotaur.gif'),(0,'Badger',200,5,20,1,0,'','',1,1,'blood','badger.gif'),(0,'Bat',250,10,30,1,0,'','',1,1,'blood','bat.gif'),(0,'Deer',260,0,25,1,0,'','',1,1,'blood','deer.gif'),(0,'Draken Spellweaver',0,2600,5000,10,0,'','fire, invisible',0,0,'blood','drakenspellweaver.gif'),(0,'Draken Warmaster',0,2400,4150,1,0,'','fire, invisibility',0,0,'blood','drakenwarmaster.gif'),(0,'Gnarlhound',0,60,198,1,0,'\"Gnarlll!\", \"Grrrrrr!\"','',127,0,'blood','gnarlhound.gif'),(0,'The Halloween Hare',0,0,2000,1,0,'','',0,0,'blood','thehalloweenhare.gif'),(0,'Hyaena',275,20,60,1,0,'','',1,1,'blood','hyaena.gif'),(0,'Pig',255,0,25,1,0,'','',1,1,'blood','pig.gif'),(0,'Rabbit',220,0,15,1,0,'','',1,1,'blood','rabbit.gif'),(0,'Silver Rabbit',220,0,15,1,0,'','',1,1,'blood','silverrabbit.gif'),(0,'Skunk',200,3,20,1,0,'','',1,1,'blood','skunk.gif'),(0,'Squirrel',220,0,20,135,0,'\"Chchch\"','',1,1,'blood','squirrel.gif'),(0,'Yalahari',0,5,150,1,0,'\"Welcome to Yalahar, outsider.\", \"Hail Yalahar.\", \"You can learn a lot from us.\", \"Our wisdom and knowledge are unequalled in this world.\", \"That knowledge would overburden your fragile mind.\", \"I wouldn\'t expect you to understand.\", \"One day Yalahar will return to its former glory.\"','',0,0,'blood','yalahari.gif'),(0,'Azerus',0,6000,7500,50,0,'\"The ultimate will finally consume this unworthy existence!\", \"My masters and I will tear down barriers and join the ultimate in its realm!\", \"The power of the Yalahari will all be mine!\", \"He who has returned from beyond has taught me secrets you can\'t even grasp!\", \"You can\'t hope to penetrate my shields!\", \"Do you really think you could beat me?\"','',0,0,'blood','azerus.gif'),(0,'Dark Monk',0,145,190,1,1,'\"You are no match to us!\", \"This is where your path will end!\", \"Your end has come!\"','invisible',0,1,'blood','darkmonk.gif'),(0,'Monk',600,200,240,1,1,'\"Repent Heretic!\", \"A prayer to the almighty one!\", \"I will punish the sinners!\"','invisible',1,0,'blood','monk.gif'),(0,'Training Monk',600,200,10000,1,1,'\"Repent Heretic!\", \"A prayer to the almighty one!\", \"I will punish the sinners!\"','invisible',1,0,'blood','trainingmonk.gif'),(0,'Mutated Bat',0,615,900,13,0,'','death, earth, drown, invisible, drunk',0,0,'blood','mutatedbat.gif'),(0,'Mutated Human',0,150,240,13,0,'\"Take that creature off my back!! I can fell it!\", \"HEEEEEEEELP!\", \"You will be the next infected one... GRAAAAAAAAARRR!\", \"Science... is a curse.\", \"Run as fast as you can.\", \"Oh by the gods! What is this... aaaaaargh!\"','death, earth, paralyze, lifedrain, drunk, drown, invisible',0,0,'blood','mutatedhuman.gif'),(0,'Mutated Rat',0,450,550,13,0,'\"Grrrrrrrrrrrrrr!\", \"Fcccccchhhhhh\"','death, earth, paralyze, lifedrain, drunk, drown, invisible',0,0,'blood','mutatedrat.gif'),(0,'Mutated Tiger',0,750,1100,13,0,'\"GRAAARRRRRR\", \"CHHHHHHHHHHH\"','paralyze, drunk, invisible',0,0,'blood','mutatedtiger.gif'),(0,'Necromancer',0,580,580,1,0,'\"Your corpse will be mine!\", \"Taste the sweetness of death!\"','invisible',0,0,'blood','necromancer.gif'),(0,'Priestess',0,420,390,1,0,'\"Your energy is mine.\", \"Now, your life has come to an end, hahahha!\", \"Throw the soul on the altar!\"','invisible',0,0,'blood','priestess.gif'),(0,'Baron Brute',0,3000,5025,35,0,'\"Mash\'n!\"','invisible',0,0,'blood','baronbrute.gif'),(0,'Coldheart',0,3500,7000,1,0,'','paralyze, invisible, ice, fire',0,0,'undead','coldheart.gif'),(0,'Doomhowl',0,3750,8500,50,1,'','paralyze, invisible',0,0,'blood','doomhowl.gif'),(0,'Dreadwing',0,3750,8500,13,0,'','death, earth',0,0,'blood','dreadwing.gif'),(0,'Fatality',0,3250,6000,1,0,'','earth',0,0,'blood','fatality.gif'),(0,'Haunter',0,4000,8500,25,1,'\"Surrender and I\'ll end it quick!\"','invisible',0,0,'blood','haunter.gif'),(0,'Incineron',0,3500,7000,20,0,'','paralyze, invisible, fire, ice',0,0,'fire','incineron.gif'),(0,'Menace',0,3250,6000,1,0,'','earth',0,0,'blood','menace.gif'),(0,'Rocko',590,3400,10000,1,0,'','paralyze, earth, death',0,1,'blood','rocko.gif'),(0,'The Dreadorian',0,4000,9000,15,0,'','invisible, fire',0,0,'blood','thedreadorian.gif'),(0,'Tirecz',0,6000,25000,1,0,'\"Hissss!\"','',0,0,'blood','tirecz.gif'),(0,'Tremorak',0,1300,10000,35,0,'\"STOMP STOMP!\"','earth',0,0,'undead','tremorak.gif'),(0,'Orc Berserker',590,195,210,15,1,'\"KRAK ORRRRRRK!\"','',1,1,'blood','orcberserker.gif'),(0,'Orc Leader',640,270,450,5,0,'\"Ulderek futgyr human!\"','',1,1,'blood','orcleader.gif'),(0,'Orc Marauder',0,220,235,85,1,'\"Grrrrrr\"','invisible',0,127,'blood','orcmarauder.gif'),(0,'Orc Rider',0,110,180,60,1,'\"Grrrrrrr\", \"Orc arga Huummmak!\"','',0,1,'blood','orcrider.gif'),(0,'Orc Shaman',0,110,115,1,0,'\"Huumans stinkk!\"','invisible',0,0,'blood','orcshaman.gif'),(0,'Orc Spearman',310,38,105,1,0,'\"Ugaar!\"','',1,1,'blood','orcspearman.gif'),(0,'Orc Warlord',0,670,950,35,0,'\"Ranat Ulderek!\", \"Orc buta bana!\", \"Ikem rambo zambo!\", \"Futchi maruk buta!\"','invisible',0,0,'blood','orcwarlord.gif'),(0,'Orc Warrior',360,50,125,1,0,'\"Grow truk grrrr.\", \"Trak grrrr brik.\", \"Alk!\"','',1,1,'blood','orcwarrior.gif'),(0,'Orc',300,25,70,1,0,'\"Grak brrretz!\", \"Grow truk grrrrr.\", \"Prek tars, dekklep zurk.\"','',1,1,'blood','orc.gif'),(0,'Assassin',450,105,175,2,1,'\"Die!\", \"Feel the hand of death!\", \"You are on my deathlist!\"','invisible',0,1,'blood','assassin.gif'),(0,'Bandit',450,65,245,1,0,'\"Your money or your life!\", \"Hand me your purse!\"','',1,1,'blood','bandit.gif'),(0,'Black Knight',0,1600,1800,115,0,'\"MINE!\", \"No prisoners!\", \"NO MERCY!\", \"By Bolg\'s Blood!\", \"You\'re no match for me!\"','paralyze, invisible',0,0,'blood','blackknight.gif'),(0,'Crazed Beggar',300,35,100,1,0,'\"Hehehe!\", \"Raahhh!\", \"You are one of THEM! Die!\", \"Wanna buy roses??\"','',1,1,'blood','crazedbeggar.gif'),(0,'Gang Member',420,70,295,1,0,'\"This is our territory!\", \"Help me guys!\", \"I don\'t like the way you look!\", \"You\'re wearing the wrong colours!\"','',1,1,'blood','gangmember.gif'),(0,'Gladiator',470,90,185,1,1,'\"You are no match for me!\", \"Feel my prowess\", \"Fight!\", \"Take this!\"','',0,1,'blood','gladiator.gif'),(0,'Hero',0,1200,1400,24,0,'\"Let\'s have a fight!\", \"Welcome to my battleground.\", \"Have you seen princess Lumelia?\", \"I will sing a tune at your grave.\"','paralyze, invisible',0,0,'blood','hero.gif'),(0,'Hunter',0,150,150,1,0,'\"Guess who we\'re hunting, haha!\", \"Guess who we are hunting!\", \"Bullseye!\", \"You\'ll make a nice trophy!\"','',0,1,'blood','hunter.gif'),(0,'Nomad',420,60,160,1,0,'\"We are the true sons of the desert!\", \"I will leave your remains to the vultures!\", \"We are swift as the wind of the desert!\"','',1,1,'blood','nomad.gif'),(0,'Smuggler',390,48,130,1,0,'\"I will silence you forever!\", \"You saw something you shouldn\'t!\"','',1,1,'blood','smuggler.gif'),(0,'Stalker',0,90,150,1,0,'','invisible',0,0,'blood','stalker.gif'),(0,'Poacher',530,70,90,1,0,'\"You will not live to tell anyone!\", \"You are my game today!\", \"Look what has stepped into my trap!\"','',0,1,'blood','poacher.gif'),(0,'Wild Warrior',420,55,120,1,1,'\"An enemy!\", \"Gimme your money!\"','',1,1,'blood','wildwarrior.gif'),(0,'Ashmunrah',0,3100,5000,50,0,'\"No mortal or undead will steal my secrets!\", \"Ahhhh all those long years.\"','lifedrain, paralyze, invisible',0,0,'undead','ashmunrah.gif'),(0,'Dipthrah',0,2900,4200,50,0,'\"Come closer to learn the final lesson.\", \"You can\'t escape death forever.\"','invisible',0,0,'undead','dipthrah.gif'),(0,'Mahrdis',0,3050,3900,60,0,'\"Ashes to ashes!\", \"Fire, Fire!\", \"The eternal flame demands its due!\", \"This is why I\'m hot.\", \"May my flames engulf you!\"','invisible',0,0,'undead','mahrdis.gif'),(0,'Morguthis',0,3000,4800,50,1,'\"Vengeance!\", \"You will make a fine trophy.\", \"Come and fight me, cowards!\", \"I am the supreme warrior!\", \"Let me hear the music of battle.\", \"Anotherone to bite the dust!\"','paralyze, invisible',0,0,'undead','morguthis.gif'),(0,'Omruc',0,2950,4300,75,0,'\"Now chhhou shhhee me ... Now chhhou don\'t!!\", \"Chhhhou are marked ashhh my prey.\", \"Psssst, I am over chhhere.\"','paralyze, invisible',0,0,'undead','omruc.gif'),(0,'Rahemos',0,3100,3700,50,0,'\"It\'s a kind of magic.\", \"Abrah Kadabrah!\", \"Nothing hidden in my wrappings.\", \"It\'s not a trick, it\'s Rahemos.\", \"Meet my friend from hell.\", \"I will make you believe in magic.\"','paralyze, invisible',0,0,'undead','rahemos.gif'),(0,'Thalas',0,2950,4100,50,0,'\"You will become a feast for my maggots.\"','invisible',0,0,'undead','thalas.gif'),(0,'Vashresamun',0,2950,4000,60,1,'\"Come my maidens, we have visitors!\", \"Are you enjoying my music?\", \"If music is the food of death, drop dead.\"','invisible',0,0,'undead','vashresamun.gif'),(0,'Pirate Buccaneer',595,250,425,5,0,'\"Give up!\", \"Hiyaa\", \"Plundeeeeer!\"','invisible',1,0,'blood','piratebuccaneer.gif'),(0,'Pirate Corsair',775,350,675,5,0,'\"Give up!\", \"Hiyaa!\", \"Plundeeeeer!\"','invisible',0,1,'blood','piratecorsair.gif'),(0,'Pirate Cutthroat',495,175,325,5,0,'\"Give up!\", \"Hiyaa!\", \"Plundeeeeer!\"','invisible',0,1,'blood','piratecutthroat.gif'),(0,'Pirate Marauder',490,125,210,5,0,'\"Plundeeeeer!\", \"Give up!\", \"Hiyaa!\"','invisible',0,1,'blood','piratemarauder.gif'),(0,'Blazing Fire Elemental',0,580,580,1,0,'','fire, holy',0,0,'fire','blazingfireelemental.gif'),(0,'Blistering Fire Elemental',0,1300,1500,5,0,'','fire',0,0,'fire','blisteringfireelemental.gif'),(0,'Fire Elemental',690,220,280,1,0,'','paralyze, invisible',1,1,'fire','fireelemental.gif'),(0,'Fire Overlord',0,2800,4000,40,0,'','fire, poison, lifedrain, paralyze, outfit, drunk, invisible',0,0,'fire','fireoverlord.gif'),(0,'Hellfire Fighter',0,3900,3800,20,0,'','paralyze, invisible',0,0,'fire','hellfirefighter.gif'),(0,'Massive Fire Elemental',0,950,1800,20,0,'','fire, lifedrain, paralyze, invisible',0,0,'fire','massivefireelemental.gif'),(0,'Quara Constrictor',670,250,450,150,0,'\"Gaaahhh!\", \"Gluh! Gluh!\", \"Tssss!\", \"Boohaa!\"','lifedrain, paralyze, drown',0,1,'blood','quaraconstrictor.gif'),(0,'Quara Constrictor Scout',670,250,450,35,0,'','fire, ice',0,1,'undead','quaraconstrictorscout.gif'),(0,'Quara Hydromancer',0,800,1100,150,0,'\"Qua hah tsh!\", \"Teech tsha tshul!\", \"Quara tsha Fach!\", \"Tssssha Quara!\", \"Blubber.\", \"Blup.\"','lifedrain, paralyze, invisible, drown',0,0,'blood','quarahydromancer.gif'),(0,'Quara Hydromancer Scout',0,800,1100,30,0,'\"Qua hah tsh!\"','ice, fire, lifedrain, paralyze, invisible',0,0,'undead','quarahydromancerscout.gif'),(0,'Quara Mantassin',480,400,800,150,0,'\"Zuerk Pachak!\", \"Shrrrr\"','lifedrain, drown',0,1,'blood','quaramantassin.gif'),(0,'Quara Mantassin Scout',480,100,220,25,0,'\"Zuerk Pachak!\", \"Shrrrr\"','ice, fire, lifedrain, paralyze, invisible',0,1,'blood','quaramantassinscout.gif'),(0,'Quara Pincher',0,1200,1800,160,0,'\"Clank clank!\", \"Clap!\", \"Crrrk! Crrrk!\"','lifedrain, invisible, drown',0,0,'blood','quarapincher.gif'),(0,'Quara Pincher Scout',0,600,775,15,0,'\"Clank clank!\", \"Clap!\"','ice, fire, poison, lifedrain, paralyze, outfit, drunk, invisible',0,0,'blood','quarapincherscout.gif'),(0,'Quara Predator',0,1600,2200,150,1,'\"Rrrah!\", \"Rraaar!\"','lifedrain, invisible, drown',0,0,'blood','quarapredator.gif'),(0,'Quara Predator Scout',0,400,890,35,0,'\"Gnarrr!\"','ice, fire, lifedrain, paralyze, invisible',0,0,'blood','quarapredatorscout.gif'),(0,'Cave Rat',250,10,30,1,0,'\"Meeeeep!\", \"Meep!\"','',1,1,'blood','caverat.gif'),(0,'Rat',200,5,20,1,0,'\"Meep!\"','',1,1,'blood','rat.gif'),(0,'Crocodile',350,40,105,10,0,'','',1,1,'blood','crocodile.gif'),(0,'Hydra',0,2100,2350,20,0,'\"FCHHHHH\", \"HISSSS\"','lifedrain, paralyze, invisible',0,0,'blood','hydra.gif'),(0,'Killer Caiman',350,800,1500,10,1,'','invisible',0,0,'blood','killercaiman.gif'),(0,'Rift Worm',0,1195,2800,1,0,'','lifedrain, paralyze, invisible',0,0,'blood','riftworm.gif'),(0,'Rift Scythe',0,2000,3600,75,0,'','lifedrain, paralyze, invisible',0,0,'undead','riftscythe.gif'),(0,'Rift Brood',0,1600,3000,40,0,'','ice, fire, energy, invisible',0,0,'energy','riftbrood.gif'),(0,'Cobra',275,30,65,1,0,'\"Zzzzzz\", \"Fsssss\"','drunk',1,1,'blood','cobra.gif'),(0,'Sea Serpent',390,2300,3200,219,0,'\"CHHHRRRR\", \"HISSSS\"','ice, paralyze, invisible, drown',0,0,'blood','seaserpent.gif'),(0,'Serpent Spawn',0,2350,3000,10,1,'\"Sssssouls for the one\", \"HISSSS\", \"Tsssse one will risssse again\", \"I bring your deathhh, mortalssss\"','paralyze, invisible',0,0,'venom','serpentspawn.gif'),(0,'Snake',205,10,15,1,0,'\"Zzzzzzt\"','',1,1,'blood','snake.gif'),(0,'Young Sea Serpent',390,1000,1050,65,0,'\"CHHHRRRR\", \"HISSSS\"','ice, paralyze, invisible, drown',0,0,'blood','youngseaserpent.gif'),(0,'Black Sheep',250,0,20,1,0,'\"Maeh\"','',1,1,'blood','blacksheep.gif'),(0,'Sheep',250,0,20,1,0,'\"Maeh\"','',1,1,'blood','sheep.gif'),(0,'Mimic',0,0,30,1,0,'','',0,0,'blood','mimic.gif'),(0,'Betrayed Wraith',0,3500,4200,45,1,'\"Rrrah!\", \"Gnarr!\", \"Tcharrr!\"','lifedrain, paralyze, invisible',0,0,'undead','betrayedwraith.gif'),(0,'Bonebeast',0,580,515,15,0,'\"Cccchhhhhhhhh!\", \"Knooorrrrr!\"','lifedrain, paralyze, invisible',0,0,'undead','bonebeast.gif'),(0,'Demon Skeleton',620,240,400,5,0,'','paralyze',1,1,'undead','demonskeleton.gif'),(0,'Dreadbeast',800,250,800,15,0,'','death, earth, lifedrain, paralyze, invisible',0,1,'undead','dreadbeast.gif'),(0,'Lost Soul',0,4000,5800,15,1,'\"Forgive Meeeee!\", \"Mouuuurn meeee!\"','paralyze, invisible',0,0,'undead','lostsoul.gif'),(0,'Pirate Skeleton',0,85,190,5,0,'','',0,0,'undead','pirateskeleton.gif'),(0,'Skeleton',300,35,50,1,0,'','',1,1,'undead','skeleton.gif'),(0,'Skeleton Warrior',350,65,45,1,0,'','death',1,1,'undead','skeletonwarrior.gif'),(0,'Undead Dragon',0,7200,8350,40,0,'\"FEEEED MY ETERNAL HUNGER!\", \"I SENSE LIFE\"','paralyze, invisible',0,0,'undead','undeaddragon.gif'),(0,'Undead Gladiator',0,800,1000,25,0,'\"Let\'s battle it out in a duel!\", \"Bring it!\", \"I\'ll fight here in eternity and beyond.\", \"I will not give up!\", \"Another foolish adventurer who tries to beat me.\"','invisible',0,0,'undead','undeadgladiator.gif'),(0,'Undead Mine Worker',0,45,65,1,0,'','',0,1,'undead','undeadmineworker.gif'),(0,'Dark Apprentice',0,100,225,1,0,'\"Outch!\", \"Oops, I did it again.\", \"From the spirits that I called Sir, deliver me!\", \"I must dispose of my masters enemies!\"','invisible',0,0,'blood','darkapprentice.gif'),(0,'Dark Magician',0,185,325,1,0,'\"Feel the power of my runes!\", \"Killing you is getting expensive!\", \"My secrets are mine alone!\"','invisible',0,0,'blood','darkmagician.gif'),(0,'Ice Witch',0,580,650,1,0,'\"So you think you are cool?\", \"I hope it is not too cold for you! HeHeHe.\", \"Freeze!\"','paralyze, invisible',0,0,'blood','icewitch.gif'),(0,'Infernalist',0,4000,3650,20,0,'\"Nothing will remain but your scorched bones!\", \"Some like it hot!\", \"It\'s cooking time!\", \"Feel the heat of battle!\"','energy, fire, paralyze, invisible',0,0,'blood','infernalist.gif'),(0,'Mad Scientist',0,205,325,1,0,'\"Die in the name of Science!\", \"You will regret interrupting my studies!\", \"Let me test this!\", \"I will study your corpse!\"','invisible',0,0,'blood','madscientist.gif'),(0,'Medusa',0,4050,4500,10,0,'\"You will ssuch a fine ssstatue!\", \"There isss no chhhanccce of esscape\", \"Are you tired or why are you moving thhat sslow\"','earth, paralyze, invisible',0,0,'blood','medusa.gif'),(0,'Warlock',0,4000,3500,1,0,'\"Learn the secret of our magic! YOUR death!\", \"Even a rat is a better mage than you.\", \"We don\'t like intruders!\"','paralyze, invisible',0,0,'blood','warlock.gif'),(0,'Witch',0,120,300,1,0,'\"Horax pokti! Hihihihi!\", \"Herba budinia ex!\"','invisible',0,0,'blood','witch.gif'),(0,'Thornback Tortoise',490,150,300,1,0,'','',0,1,'blood','thornbacktortoise.gif'),(0,'Tortoise',445,90,150,1,0,'','',0,1,'blood','tortoise.gif'),(0,'A Carved Stone Tile',0,0,9950,1,0,'','physical, energy, fire, poison, ice, holy, death, lifedrain, manadrain, paralyze, drunk, outfit, invisible',0,0,'undead','acarvedstonetile.gif'),(0,'Deaththrower',0,0,9950,1,0,'','physical, energy, fire, poison, ice, holy, death, lifedrain, manadrain, paralyze, drunk, outfit, invisible',0,0,'undead','deaththrower.gif'),(0,'Deathslicer',0,320,2000,1,0,'','physical, energy, fire, poison, ice, holy, death, lifedrain, manadrain, paralyze, drunk, outfit, invisible',0,0,'undead','deathslicer.gif'),(0,'Eye Of The Seven',0,0,1,1,0,'','physical, energy, fire, poison, ice, holy, death, lifedrain, manadrain, paralyze, drunk, outfit',0,0,'venom','eyeoftheseven.gif'),(0,'Flamethrower',0,0,9950,1,0,'','physical, energy, fire, poison, ice, holy, death, lifedrain, manadrain, paralyze, drunk, outfit, invisible',0,0,'undead','flamethrower.gif'),(0,'Lavahole',0,0,100,1,0,'','physical, energy, fire, poison, ice, holy, death, lifedrain, manadrain, paralyze, drunk, outfit, invisible',0,0,'undead','lavahole.gif'),(0,'Magicthrower',0,0,9950,1,0,'','physical, energy, fire, poison, ice, holy, death, lifedrain, manadrain, paralyze, drunk, outfit, invisible',0,0,'undead','magicthrower.gif'),(0,'Plaguethrower',0,0,9950,1,0,'','physical, energy, fire, poison, ice, holy, death, lifedrain, manadrain, paralyze, drunk, outfit, invisible',0,0,'undead','plaguethrower.gif'),(0,'Poisonthrower',0,0,9950,1,0,'','physical, energy, fire, poison, ice, holy, death, lifedrain, manadrain, paralyze, drunk, outfit, invisible',0,0,'undead','poisonthrower.gif'),(0,'Shredderthrower',0,0,9950,1,0,'','physical, energy, fire, poison, ice, holy, death, lifedrain, manadrain, paralyze, drunk, outfit, invisible',0,0,'undead','shredderthrower.gif'),(0,'Frost Troll',300,23,55,1,0,'\"Brrrr\", \"Broar!\"','',1,1,'blood','frosttroll.gif'),(0,'Island Troll',290,20,50,1,0,'\"Hmmm, turtles\", \"Hmmm, dogs\", \"Hmmm, wormds\", \"Groar\", \"Gruntz!\"','',1,0,'blood','islandtroll.gif'),(0,'Swamp Troll',320,65,55,1,0,'\"Grrrr\", \"Groar!\", \"Me strong! Me ate spinach!\"','',1,1,'venom','swamptroll.gif'),(0,'Troll',290,20,50,1,0,'\"Grrrr\", \"Groar\", \"Gruntz!\", \"Hmmm, bugs.\", \"Hmmm, dogs.\"','',1,1,'blood','troll.gif'),(0,'Troll Champion',340,30,75,1,0,'\"Meee maity!\", \"Grrrr\", \"Whaaaz up!?\", \"Gruntz!\"','',1,1,'blood','trollchampion.gif'),(0,'Banshee',0,900,1000,1,0,'\"Are you ready to rock?\", \"That\'s what I call easy listening!\", \"Let the music play!\", \"I will mourn your death!\", \"IIIIEEEeeeeeehhhHHHHH!\", \"Dance for me your dance of death!\", \"Feel my gentle kiss of death.\"','lifedrain, paralyze, invisible',0,0,'undead','banshee.gif'),(0,'Blightwalker',0,3350,8900,10,0,'\"I can see you decaying!\", \"Let me taste your mortality!\"','paralyze',0,0,'undead','blightwalker.gif'),(0,'Crypt Shambler',0,195,330,1,0,'\"Uhhhhhhh!\", \"Aaaaahhhh!\", \"Hoooohhh!\", \"Chhhhhhh!\"','lifedrain, paralyze',0,1,'undead','cryptshambler.gif'),(0,'Ghoul',450,85,100,1,0,'','lifedrain, paralyze, invisible',1,1,'blood','ghoul.gif'),(0,'Grim Reaper',0,5500,4100,90,0,'\"Death!\", \"Come a little closer!\", \"The end is near!\"','paralyze, invisible',0,0,'undead','grimreaper.gif'),(0,'Lich',0,900,880,50,0,'\"Doomed be the living!\", \"You will endure agony beyond thy death!\", \"Death awaits all!\", \"Thy living flesh offends me!\", \"Death and Decay!\"','paralyze, invisible',0,0,'undead','lich.gif'),(0,'Mummy',0,150,240,1,0,'\"I will ssswallow your sssoul!\", \"Mort ulhegh dakh visss.\", \"Flesssh to dussst!\", \"I will tassste life again!\", \"Ahkahra exura belil mort!\", \"Yohag Sssetham!\"','lifedrain, paralyze, invisible',0,0,'undead','mummy.gif'),(0,'Undead Prospector',0,85,100,1,0,'','lifedrain, paralyze, invisible',0,1,'blood','undeadprospector.gif'),(0,'Vampire',0,305,450,1,1,'\"BLOOD!\", \"Let me kiss your neck.\", \"I smell warm blood.\", \"I call you, my bats! Come!\"','lifedrain, paralyze, invisible',0,0,'blood','vampire.gif'),(0,'Vampire Bride',0,1050,1200,1,0,'\"Kneel before your Mistress!\", \"Dead is the new alive.\", \"Come, let me kiss you, darling. Oh wait, I meant kill.\", \"Enjoy the pain - I know you love it.\"','death, invisible',0,0,'blood','vampirebride.gif'),(0,'Zombie',0,280,500,1,0,'\"Mst.... klll....\", \"Whrrrr... ssss.... mmm.... grrrrl\", \"Dnnnt... cmmm... clsrrr....\", \"Httt.... hmnnsss...\"','death, energy, ice, earth, lifedrain, paralyze',0,0,'undead','zombie.gif'),(0,'Abomination Fury',0,900,1300,1,0,'\"Zrp zrp!\"','invisible',1,0,'venom','abominationfury.gif'),(0,'Brimstone Bug',0,900,1300,55,1,'','paralyze, invisible',0,0,'venom','brimstonebug.gif'),(0,'Butterfly Demon',0,900,1300,1,0,'\"Zrp zrp!\"','invisible',1,0,'venom','butterflydemon.gif'),(0,'Draken Abomination',0,900,1300,1,0,'\"Zrp zrp!\"','invisible',1,0,'venom','drakenabomination.gif'),(0,'Draken Elite',0,900,1300,1,0,'\"Zrp zrp!\"','invisible',1,0,'venom','drakenelite.gif'),(0,'Finger Killer',0,900,1300,1,0,'\"Zrp zrp!\"','invisible',1,0,'venom','fingerkiller.gif'),(0,'Living Plant',0,900,1300,1,0,'\"Zrp zrp!\"','invisible',1,0,'venom','livingplant.gif'),(0,'Lizard Abomination',0,900,1300,1,0,'\"Zrp zrp!\"','invisible',1,0,'venom','lizardabomination.gif'),(0,'Phantom Lord',0,900,1300,1,0,'\"Zrp zrp!\"','invisible',1,0,'venom','phantomlord.gif'),(0,'Purple Turtle',0,900,1300,1,0,'\"Zrp zrp!\"','invisible',1,0,'venom','purpleturtle.gif'),(0,'Snake God Essence',0,900,1300,1,0,'\"Zrp zrp!\"','invisible',1,0,'venom','snakegodessence.gif'),(0,'Souleater',0,900,1300,1,0,'\"Zrp zrp!\"','invisible',1,0,'venom','souleater.gif'),(0,'Rebel',0,900,1300,1,0,'\"Zrp zrp!\"','invisible',1,0,'venom','rebel.gif'),(0,'Chartan',0,900,1300,1,0,'\"Zrp zrp!\"','invisible',1,0,'venom','chartan.gif'),(0,'Ezean',0,900,1300,1,0,'\"Zrp zrp!\"','invisible',1,0,'venom','ezean.gif'),(0,'Zumtah',0,900,1300,1,0,'\"Zrp zrp!\"','invisible',1,0,'venom','zumtah.gif'),(0,'Zizzle',0,900,1300,1,0,'\"Zrp zrp!\"','invisible',1,0,'venom','zizzle.gif'),(0,'Izsh',0,900,1300,1,0,'\"Zrp zrp!\"','invisible',1,0,'fire','izsh.gif'),(0,'Zlak',0,900,1300,1,0,'\"Zrp zrp!\"','invisible',1,0,'venom','zlak.gif'),(0,'Awareness Of The Emperor',0,900,1300,1,0,'\"Zrp zrp!\"','invisible',1,0,'venom','awarenessoftheemperor.gif'),(0,'A Sleeping Dragon',0,900,1300,1,0,'\"Zrp zrp!\"','invisible',1,0,'venom','asleepingdragon.gif'),(0,'Triple Medusa',0,900,1300,1,0,'\"Zrp zrp!\"','invisible',1,0,'venom','triplemedusa.gif'),(0,'Eternal Guardian',0,900,1300,1,0,'\"Zrp zrp!\"','invisible',1,0,'venom','eternalguardian.gif');
/*!40000 ALTER TABLE `z_monsters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_network_box`
--

DROP TABLE IF EXISTS `z_network_box`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_network_box` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `network_name` varchar(10) NOT NULL,
  `network_link` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_network_box`
--

LOCK TABLES `z_network_box` WRITE;
/*!40000 ALTER TABLE `z_network_box` DISABLE KEYS */;
INSERT INTO `z_network_box` VALUES (1,'facebook','Wakeserv'),(2,'twitter','tibia');
/*!40000 ALTER TABLE `z_network_box` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_news_big`
--

DROP TABLE IF EXISTS `z_news_big`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_news_big` (
  `hide_news` tinyint(1) NOT NULL DEFAULT '0',
  `date` int(11) NOT NULL DEFAULT '0',
  `author` varchar(255) NOT NULL,
  `author_id` int(11) NOT NULL,
  `image_id` int(3) NOT NULL DEFAULT '0',
  `topic_df` varchar(255) NOT NULL,
  `text_df` text NOT NULL,
  `topic_ot` varchar(255) NOT NULL,
  `text_ot` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_news_big`
--

LOCK TABLES `z_news_big` WRITE;
/*!40000 ALTER TABLE `z_news_big` DISABLE KEYS */;
/*!40000 ALTER TABLE `z_news_big` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_news_tickers`
--

DROP TABLE IF EXISTS `z_news_tickers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_news_tickers` (
  `date` int(11) NOT NULL DEFAULT '1',
  `author` int(11) NOT NULL,
  `image_id` int(3) NOT NULL DEFAULT '0',
  `text` text NOT NULL,
  `hide_ticker` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_news_tickers`
--

LOCK TABLES `z_news_tickers` WRITE;
/*!40000 ALTER TABLE `z_news_tickers` DISABLE KEYS */;
INSERT INTO `z_news_tickers` VALUES (1557160483,1,1,'Bem-Vindo ao Gesior 2012 Edited by Natanael Beckman!',1),(1557161167,1,1,'Bem-Vindo ao Gesior 2012 Edited by Natanael Beckman!',1);
/*!40000 ALTER TABLE `z_news_tickers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_ots_comunication`
--

DROP TABLE IF EXISTS `z_ots_comunication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_ots_comunication` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `param1` varchar(255) NOT NULL,
  `param2` varchar(255) NOT NULL,
  `param3` varchar(255) NOT NULL,
  `param4` varchar(255) NOT NULL,
  `param5` varchar(255) NOT NULL,
  `param6` varchar(255) NOT NULL,
  `param7` varchar(255) NOT NULL,
  `delete_it` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_ots_comunication`
--

LOCK TABLES `z_ots_comunication` WRITE;
/*!40000 ALTER TABLE `z_ots_comunication` DISABLE KEYS */;
/*!40000 ALTER TABLE `z_ots_comunication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_ots_guildcomunication`
--

DROP TABLE IF EXISTS `z_ots_guildcomunication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_ots_guildcomunication` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `param1` varchar(255) NOT NULL,
  `param2` varchar(255) NOT NULL,
  `param3` varchar(255) NOT NULL,
  `param4` varchar(255) NOT NULL,
  `param5` varchar(255) NOT NULL,
  `param6` varchar(255) NOT NULL,
  `param7` varchar(255) NOT NULL,
  `delete_it` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_ots_guildcomunication`
--

LOCK TABLES `z_ots_guildcomunication` WRITE;
/*!40000 ALTER TABLE `z_ots_guildcomunication` DISABLE KEYS */;
/*!40000 ALTER TABLE `z_ots_guildcomunication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_polls`
--

DROP TABLE IF EXISTS `z_polls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_polls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(255) NOT NULL,
  `end` int(11) NOT NULL,
  `start` int(11) NOT NULL,
  `answers` int(11) NOT NULL,
  `votes_all` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_polls`
--

LOCK TABLES `z_polls` WRITE;
/*!40000 ALTER TABLE `z_polls` DISABLE KEYS */;
/*!40000 ALTER TABLE `z_polls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_polls_answers`
--

DROP TABLE IF EXISTS `z_polls_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_polls_answers` (
  `poll_id` int(11) NOT NULL,
  `answer_id` int(11) NOT NULL,
  `answer` varchar(255) NOT NULL,
  `votes` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_polls_answers`
--

LOCK TABLES `z_polls_answers` WRITE;
/*!40000 ALTER TABLE `z_polls_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `z_polls_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_shop_history_item`
--

DROP TABLE IF EXISTS `z_shop_history_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_shop_history_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `to_name` varchar(255) NOT NULL DEFAULT '0',
  `to_account` int(11) NOT NULL DEFAULT '0',
  `from_nick` varchar(255) NOT NULL,
  `from_account` int(11) NOT NULL DEFAULT '0',
  `price` int(11) NOT NULL DEFAULT '0',
  `offer_id` int(11) NOT NULL DEFAULT '0',
  `offer_desc` varchar(255) DEFAULT NULL,
  `trans_state` varchar(255) NOT NULL,
  `trans_start` int(11) NOT NULL DEFAULT '0',
  `trans_real` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_shop_history_item`
--

LOCK TABLES `z_shop_history_item` WRITE;
/*!40000 ALTER TABLE `z_shop_history_item` DISABLE KEYS */;
INSERT INTO `z_shop_history_item` VALUES (2,'GM Wake',4,'Anonymous',4,5,10,NULL,'realized',1543577689,1543578482),(1,'GM Wake',4,'Anonymous',4,10,30,NULL,'realized',1543577781,1543577791),(3,'GM Wake',4,'Anonymous',4,10,0,NULL,'realized',1543578568,1543578574),(4,'GM Wake',4,'Anonymous',4,10,0,NULL,'realized',1543578720,1543578737),(5,'GM Bogo',7,'Anonymous',7,10,0,NULL,'realized',1545530849,1545530867);
/*!40000 ALTER TABLE `z_shop_history_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_shop_history_pacc`
--

DROP TABLE IF EXISTS `z_shop_history_pacc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_shop_history_pacc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `to_name` varchar(255) NOT NULL DEFAULT '0',
  `to_account` int(11) NOT NULL DEFAULT '0',
  `from_nick` varchar(255) NOT NULL,
  `from_account` int(11) NOT NULL DEFAULT '0',
  `price` int(11) NOT NULL DEFAULT '0',
  `pacc_days` int(11) NOT NULL DEFAULT '0',
  `trans_state` varchar(255) NOT NULL,
  `trans_start` int(11) NOT NULL DEFAULT '0',
  `trans_real` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_shop_history_pacc`
--

LOCK TABLES `z_shop_history_pacc` WRITE;
/*!40000 ALTER TABLE `z_shop_history_pacc` DISABLE KEYS */;
/*!40000 ALTER TABLE `z_shop_history_pacc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_shop_offer`
--

DROP TABLE IF EXISTS `z_shop_offer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_shop_offer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `points` int(11) NOT NULL DEFAULT '0',
  `itemid1` int(11) NOT NULL DEFAULT '0',
  `count1` int(11) NOT NULL DEFAULT '0',
  `itemid2` int(11) NOT NULL DEFAULT '0',
  `count2` int(11) NOT NULL DEFAULT '0',
  `offer_type` varchar(255) DEFAULT NULL,
  `offer_description` text NOT NULL,
  `offer_name` varchar(255) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0',
  `offer_category` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=74 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_shop_offer`
--

LOCK TABLES `z_shop_offer` WRITE;
/*!40000 ALTER TABLE `z_shop_offer` DISABLE KEYS */;
INSERT INTO `z_shop_offer` VALUES (1,10,12679,1,0,0,'item','Arm:15, club fighting +15, sword fighting +15, axe fighting +15, protection physical +5%, energy +5%, earth +5%, fire +5%, mana drain +5%, ice +5%, holy +5%, death +5%.','Strong Knight Helmet',0,3),(2,10,12680,1,0,0,'item','Arm:18, club fighting +15, sword fighting +15, axe fighting +15, protection physical +5%, energy +5%, earth +5%, fire +5%, mana drain +5%, ice +5%, holy +5%, death +5%.','Strong Knight Armor',0,3),(3,10,12681,1,0,0,'item','Arm:13, club fighting +15, sword fighting +15, axe fighting +15, protection physical +5%, energy +5%, earth +5%, fire +5%, mana drain +5%, ice +5%, holy +5%, death +5%','Strong Knight Legs',0,3),(4,10,12733,1,0,0,'item','Def:65, shielding +40, protection physical +5%, energy +5%, earth +5%, fire +5%, mana drain +5%, ice +5%, holy +5%, death +5%','Strong Knight Shield',0,3),(5,10,12707,1,0,0,'item','Arm:13, magic level +8, protection physical +5%, energy +5%, earth +5%, fire +5%, mana drain +5%, ice +5%, holy +5%, death +5%.','Strong Mage Hat',0,3),(6,10,12708,1,0,0,'item','Arm:16, magic level +8, protection physical +5%, energy +5%, earth +5%, fire +5%, mana drain +5%, ice +5%, holy +5%, death +5%.','Strong Mage robe',0,3),(7,10,12709,1,0,0,'item','Arm:11, magic level +8, protection physical +5%, energy +5%, earth +5%, fire +5%, mana drain +5%, ice +5%, holy +5%, death +5%.','Strong Mage legs',0,3),(8,10,12731,1,0,0,'item','Def:50, magic level +8, protection physical +5%, energy +5%, earth +5%, fire +5%, mana drain +5%, ice +5%, holy +5%, death +5%.','Strong Mage Shield',0,3),(9,10,12703,1,0,0,'item','Arm:15, distance fighting +15, protection physical +5%, energy +5%, earth +5%, fire +5%, mana drain +5%, ice +5%, holy +5%, death +5%.','Strong Pally Helmet',0,3),(10,10,12704,1,0,0,'item','Arm:18, distance fighting +15, protection physical +5%, energy +5%, earth +5%, fire +5%, mana drain +5%, ice +5%, holy +5%, death +5%.','Strong Pally armor',0,3),(11,10,12705,1,0,0,'item','Arm:12, distance fighting +15, protection physical +5%, energy +5%, earth +5%, fire +5%, mana drain +5%, ice +5%, holy +5%, death +5%','Strong Pally legs',0,3),(12,10,12732,1,0,0,'item','Def:50, distance fighting +10, protection physical +5%, energy +5%, earth +5%, fire +5%, mana drain +5%, ice +5%, holy +5%, death +5%.','Strong Pally Shield',0,3),(50,5,12670,1,0,0,'item','10 Days of Premium/VIP to all account.','10 Days of Premium',0,1),(51,10,12671,1,0,0,'item','30 Days of Premium/VIP to all account.','30 Days of Premium',0,1),(52,25,12673,1,0,0,'item','90 Days of Premium/VIP to all account.','90 Days of Premium',0,1),(53,10,12710,1,0,0,'item','Arm:4, speed +40, faster regeneration','Super Boots',0,3),(54,15,12726,1,0,0,'item','Faster regeneration.\r\nEnquanto usar o ring sua HP/MANA tera +1500.','VIP Ring',0,3),(55,10,12728,1,0,0,'item','Protection physical +7%, energy +7%, earth +7%, fire +7%, mana drain +7%, ice +7%, holy +7%, death +7%, speed +20.','VIP Amulet',0,3),(56,3,12701,1,0,0,'item','30 Minutos de double exp.','Double Exp Potion',0,2),(57,20,2366,1,0,0,'item','Use para restaurar sua Stamina.\r\n<b>(Infinito).</b>','Stamina Feather',0,3),(58,5,12759,1,0,0,'item','6 horas de acesso a uma cave exclusiva.\r\n<b>level maximo: 600<b>','Cave Exclusiva Doll',0,3),(59,10,12677,1,0,0,'item','Atk:108, Def:60','Elite Axe',0,2),(60,10,12724,1,0,0,'item','Atk:108, Def:60','Elite Sword',0,2),(61,10,12721,1,0,0,'item','Atk:108, Def:60','Elite Club',0,2),(62,10,12729,1,0,0,'item','Atk:110','Elite Slingshot',0,2),(63,10,12727,1,0,0,'item','Atk: 700~750','Elite Wand',0,2),(64,20,12695,1,0,0,'itemvip','Atk: 800~845','Super Wand',0,3),(65,20,12706,1,0,0,'itemvip','Atk:118','Super Crossbow',0,3),(66,20,12725,1,0,0,'itemvip','Atk:120, Def:65 +3','Super Axe',0,3),(67,20,12723,1,0,0,'itemvip','Atk:120, Def:65 +3','Super Sword',0,3),(68,20,12719,1,0,0,'itemvip','Atk:120, Def:65 +3','Super Club',0,3),(69,25,11144,1,0,0,'item','<b>Clique para receber todos os addons.</b>','Super addon doll',0,3),(70,15,12692,1,0,0,'item','Clicando voce recebe todas as bless. <br><b>(Item Infinito)</b>','Book of Bless',0,3),(71,25,12713,40,0,0,'item','40x critical feather. <br>\r\n<b>!critical</b>','40x critical feather',0,2),(72,25,12718,40,0,0,'item','40x dodge stone. <br>\r\n<b>!dodge</b>','40x dodge stone',0,2),(73,100,0,0,0,0,'outfit','','Citizen',0,1);
/*!40000 ALTER TABLE `z_shop_offer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_shop_points_bought`
--

DROP TABLE IF EXISTS `z_shop_points_bought`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_shop_points_bought` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `amount` int(15) NOT NULL,
  `type` varchar(255) NOT NULL,
  `accountid` int(15) NOT NULL,
  `code` varchar(255) NOT NULL,
  `paypalmail` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_shop_points_bought`
--

LOCK TABLES `z_shop_points_bought` WRITE;
/*!40000 ALTER TABLE `z_shop_points_bought` DISABLE KEYS */;
/*!40000 ALTER TABLE `z_shop_points_bought` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_shopguild_history_item`
--

DROP TABLE IF EXISTS `z_shopguild_history_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_shopguild_history_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `to_name` varchar(255) NOT NULL DEFAULT '0',
  `to_account` int(11) NOT NULL DEFAULT '0',
  `from_nick` varchar(255) NOT NULL,
  `from_account` int(11) NOT NULL DEFAULT '0',
  `price` int(11) NOT NULL DEFAULT '0',
  `offer_id` int(11) NOT NULL DEFAULT '0',
  `trans_state` varchar(255) NOT NULL,
  `trans_start` int(11) NOT NULL DEFAULT '0',
  `trans_real` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13118 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_shopguild_history_item`
--

LOCK TABLES `z_shopguild_history_item` WRITE;
/*!40000 ALTER TABLE `z_shopguild_history_item` DISABLE KEYS */;
INSERT INTO `z_shopguild_history_item` VALUES (13107,'GM Bogo',7,'',7,10,12669,'realized',1545530356,1545530357),(13108,'GM Bogo',7,'',7,10,12669,'realized',1545531076,1545531079),(13109,'GM Bogo',7,'',7,10,12669,'wait',1545531105,0),(13110,'GM Bogo',7,'',7,10,12669,'wait',1545532263,0),(13111,'GM Bogo',7,'',7,5,2160,'wait',1545532280,0),(13112,'GM Bogo',7,'',7,10,12677,'wait',1545532343,0),(13113,'GM Bogo',7,'',7,10,12677,'wait',1545533450,0),(13114,'GM Bogo',7,'',7,10,12677,'realized',1545533606,1545533611),(13115,'GM Bogo',7,'',7,10,12677,'realized',1545533718,1545533730),(13116,'GM Bogo',7,'',7,20,12677,'realized',1545978890,1545978911),(13117,'GM Bogo',7,'',7,30,0,'realized',1545978928,1545978941);
/*!40000 ALTER TABLE `z_shopguild_history_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_shopguild_history_pacc`
--

DROP TABLE IF EXISTS `z_shopguild_history_pacc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_shopguild_history_pacc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `to_name` varchar(255) NOT NULL DEFAULT '0',
  `to_account` int(11) NOT NULL DEFAULT '0',
  `from_nick` varchar(255) NOT NULL,
  `from_account` int(11) NOT NULL DEFAULT '0',
  `price` int(11) NOT NULL DEFAULT '0',
  `pacc_days` int(11) NOT NULL DEFAULT '0',
  `trans_state` varchar(255) NOT NULL,
  `trans_start` int(11) NOT NULL DEFAULT '0',
  `trans_real` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_shopguild_history_pacc`
--

LOCK TABLES `z_shopguild_history_pacc` WRITE;
/*!40000 ALTER TABLE `z_shopguild_history_pacc` DISABLE KEYS */;
/*!40000 ALTER TABLE `z_shopguild_history_pacc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_shopguild_offer`
--

DROP TABLE IF EXISTS `z_shopguild_offer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_shopguild_offer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `points` int(11) NOT NULL DEFAULT '0',
  `itemid1` int(11) NOT NULL DEFAULT '0',
  `count1` int(11) NOT NULL DEFAULT '0',
  `itemid2` int(11) NOT NULL DEFAULT '0',
  `count2` int(11) NOT NULL DEFAULT '0',
  `offer_type` varchar(255) DEFAULT NULL,
  `offer_description` text NOT NULL,
  `offer_name` varchar(255) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_shopguild_offer`
--

LOCK TABLES `z_shopguild_offer` WRITE;
/*!40000 ALTER TABLE `z_shopguild_offer` DISABLE KEYS */;
INSERT INTO `z_shopguild_offer` VALUES (6,20,12727,1,0,0,'item','Atk: 700~750','Elite Wand',0),(7,20,12729,1,0,0,'item','Atk:110','Elite Slingshot',0),(8,20,12724,1,0,0,'item','Atk:108, Def:60','Elite Sword',0),(9,20,12721,1,0,0,'item','Atk:108, Def:60','Elite Club',0),(10,20,12677,1,0,0,'item','Atk:108, Def:60','Elite Axe',0),(12,30,12710,1,0,0,'itemvip','Arm:4, speed +40, faster regeneration','Super Boots',0);
/*!40000 ALTER TABLE `z_shopguild_offer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_spells`
--

DROP TABLE IF EXISTS `z_spells`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_spells` (
  `name` varchar(255) NOT NULL,
  `spell` varchar(255) NOT NULL,
  `spell_type` varchar(255) NOT NULL,
  `mana` int(11) NOT NULL DEFAULT '0',
  `lvl` int(11) NOT NULL DEFAULT '0',
  `mlvl` int(11) NOT NULL DEFAULT '0',
  `soul` int(11) NOT NULL DEFAULT '0',
  `pacc` varchar(255) NOT NULL,
  `vocations` varchar(255) NOT NULL,
  `conj_count` int(11) NOT NULL DEFAULT '0',
  `hide_spell` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_spells`
--

LOCK TABLES `z_spells` WRITE;
/*!40000 ALTER TABLE `z_spells` DISABLE KEYS */;
INSERT INTO `z_spells` VALUES ('Conjure Arrow','exevo con','conjure',100,13,0,1,'no','',10,0),('Poisoned Arrow','exevo con pox','conjure',130,16,0,2,'no','',7,0),('Conjure Bolt','exevo con mort','conjure',140,17,0,2,'no','',5,0),('Conjure Sniper Arrow','exevo con hur','conjure',160,24,0,3,'no','',5,0),('Explosive Arrow','exevo con flam','conjure',290,25,0,3,'no','',8,0),('Conjure Piercing Bolt','exevo con grav','conjure',180,33,0,3,'no','',5,0),('Enchant Staff','exeta vis','conjure',80,41,0,0,'no','',0,0),('Enchant Spear','exeta con','conjure',350,45,0,3,'no','',0,0),('Power Bolt','exevo con vis','conjure',800,59,0,4,'no','',10,0),('Poison Field','adevo grav pox','conjure',200,14,0,1,'no','',3,0),('Light Magic Missile','adori min vis','conjure',120,15,0,1,'no','',10,0),('Fire Field','adevo grav flam','conjure',240,15,0,1,'no','',3,0),('Fireball','adori flam','conjure',460,27,0,3,'no','',5,0),('Energy Field','adevo grav vis','conjure',320,18,0,2,'no','',3,0),('Stalagmite','adori tera','conjure',400,24,0,2,'no','',10,0),('Great Fireball','adori mas flam','conjure',530,30,0,3,'no','',4,0),('Heavy Magic Missile','adori vis','conjure',350,25,0,2,'no','',10,0),('Poison Bomb','adevo mas pox','conjure',520,25,0,2,'no','',2,0),('Firebomb','adevo mas flam','conjure',600,27,0,4,'no','',2,0),('Soulfire','adevo res flam','conjure',600,27,0,3,'no','',3,0),('Poison Wall','adevo mas grav pox','conjure',640,29,0,3,'no','',4,0),('Explosion','adevo mas hur','conjure',570,31,0,4,'no','',6,0),('Fire Wall','adevo mas grav flam','conjure',780,33,0,4,'no','',4,0),('Energybomb','adevo mas vis','conjure',880,37,0,5,'no','',2,0),('Energy Wall','adevo mas grav vis','conjure',1000,41,0,5,'no','',4,0),('Sudden Death','adori gran mort','conjure',985,45,0,5,'no','',4,0),('Antidote Rune','adana pox','conjure',200,15,0,1,'no','',1,0),('Intense Healing Rune','adura gran','conjure',240,15,0,2,'no','',3,0),('Ultimate Healing Rune','adura vita','conjure',400,24,0,3,'no','',3,0),('Convince Creature','adeta sio','conjure',200,16,0,3,'no','',1,0),('Animate Dead','adana mort','conjure',600,27,0,5,'no','',1,0),('Chameleon','adevo ina','conjure',600,27,0,2,'no','',1,0),('Destroy Field','adito grav','conjure',120,17,0,2,'no','',3,0),('Desintegrate','adito tera','conjure',200,21,0,3,'no','',3,0),('Magic Wall','adevo grav tera','conjure',750,32,0,5,'no','',4,0),('Wild Growth','adevo grav vita','conjure',600,27,0,5,'no','',2,0),('Paralyze','adana ani','conjure',1400,54,0,3,'no','',2,0),('Icicle','adori frigo','conjure',460,28,0,3,'no','',5,0),('Avalanche','adori mas frigo','conjure',530,30,0,3,'no','',4,0),('Stone Shower','adori mas tera','conjure',430,28,0,3,'no','',4,0),('Thunderstorm','adori mas vis','conjure',430,28,0,3,'no','',4,0),('Holy Missile','adori san','conjure',350,27,0,3,'no','',5,0),('Death Strike','exori mort','instant',20,16,0,0,'no','',0,0),('Flame Strike','exori flam','instant',20,12,0,0,'no','',0,0),('Energy Strike','exori vis','instant',20,12,0,0,'no','',0,0),('Whirlwind Throw','exori hur','instant',40,15,0,0,'no','',0,0),('Fire Wave','exevo flam hur','instant',25,18,0,0,'no','',0,0),('Ethereal Spear','exori con','instant',25,23,0,0,'no','',0,0),('Energy Beam','exevo vis lux','instant',40,23,0,0,'no','',0,0),('Great Energy Beam','exevo gran vis lux','instant',110,29,0,0,'no','',0,0),('Groundshaker','exori mas','instant',160,33,0,0,'no','',0,0),('Berserk','exori','instant',115,35,0,0,'no','',0,0),('Energy Wave','exevo vis hur','instant',170,38,0,0,'no','',0,0),('Rage of the Skies','exevo gran mas vis','instant',650,55,0,0,'no','',0,0),('Fierce Berserk','exori gran','instant',340,70,0,0,'no','',0,0),('Hells Core','exevo gran mas flam','instant',1200,60,0,0,'no','',0,0),('Divine Missile','exori san','instant',20,40,0,0,'no','',0,0),('Divine Caldera','exevo mas san','instant',160,50,0,0,'no','',0,0),('Eternal Winter','exevo gran mas frigo','instant',1200,60,0,0,'no','',0,0),('Ice Strike','exori frigo','instant',20,15,0,0,'no','',0,0),('Ice Wave','exevo frigo hur','instant',25,18,0,0,'no','',0,0),('Terra Strike','exori tera','instant',20,13,0,0,'no','',0,0),('Terra Wave','exevo tera hur','instant',210,38,0,0,'no','',0,0),('Wrath of Nature','exevo gran mas tera','instant',770,55,0,0,'no','',0,0),('Light Healing','exura','instant',20,9,0,0,'no','',0,0),('Antidote','exana pox','instant',30,10,0,0,'no','',0,0),('Intense Healing','exura gran','instant',70,11,0,0,'no','',0,0),('Heal Friend','exura sio','instant',140,18,0,0,'no','',0,0),('Ultimate Healing','exura vita','instant',160,20,0,0,'no','',0,0),('Mass Healing','exura gran mas res','instant',150,36,0,0,'no','',0,0),('Divine Healing','exura san','instant',210,35,0,0,'no','',0,0),('Wound Cleansing','exana mort','instant',65,30,0,0,'no','',0,0),('Light','utevo lux','instant',20,8,0,0,'no','',0,0),('Find Person','exiva','instant',20,8,0,0,'no','',0,0),('Magic Rope','exani tera','instant',20,9,0,0,'no','',0,0),('Levitate','exani hur','instant',50,12,0,0,'no','',0,0),('Great Light','utevo gran lux','instant',60,13,0,0,'no','',0,0),('Magic Shield','utamo vita','instant',50,14,0,0,'no','',0,0),('Haste','utani hur','instant',60,14,0,0,'no','',0,0),('Charge','utani tempo hur','instant',100,25,0,0,'no','',0,0),('Swift Foot','utamo tempo san','instant',400,55,0,0,'no','',0,0),('Challenge','exeta res','instant',30,20,0,0,'no','',0,0),('Strong Haste','utani gran hur','instant',100,20,0,0,'no','',0,0),('Creature Illusion','utevo res ina','instant',100,23,0,0,'no','',0,0),('Ultimate Light','utevo vis lux','instant',140,26,0,0,'no','',0,0),('Cancel Invisibility','exana ina','instant',200,26,0,0,'no','',0,0),('Invisibility','utana vid','instant',440,35,0,0,'no','',0,0),('Sharpshooter','utito tempo san','instant',450,60,0,0,'no','',0,0),('Protector','utamo tempo','instant',200,55,0,0,'no','',0,0),('Blood Rage','utito tempo','instant',290,60,0,0,'no','',0,0),('Train Party','utito mas sio','instant',60,32,0,0,'no','',0,0),('Protect Party','utamo mas sio','instant',90,32,0,0,'no','',0,0),('Heal Party','utura mas sio','instant',120,32,0,0,'no','',0,0),('Enchant Party','utori mas sio','instant',120,32,0,0,'no','',0,0),('Summon Creature','utevo res','instant',0,25,0,0,'no','',0,0),('Undead Legion','exana mas mort','instant',500,30,0,0,'no','',0,0),('Food','exevo pan','instant',120,14,0,0,'no','',0,0);
/*!40000 ALTER TABLE `z_spells` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_tracker`
--

DROP TABLE IF EXISTS `z_tracker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_tracker` (
  `account` varchar(255) NOT NULL,
  `type` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `text` text NOT NULL,
  `id` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `typetracker` int(11) NOT NULL,
  `tag` int(11) NOT NULL,
  `priority` int(11) NOT NULL,
  `reply` int(11) NOT NULL,
  `who` int(11) NOT NULL,
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_tracker`
--

LOCK TABLES `z_tracker` WRITE;
/*!40000 ALTER TABLE `z_tracker` DISABLE KEYS */;
/*!40000 ALTER TABLE `z_tracker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zaypay_payment`
--

DROP TABLE IF EXISTS `zaypay_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zaypay_payment` (
  `payID` bigint(30) NOT NULL,
  `account_id` int(20) NOT NULL,
  `status` varchar(255) NOT NULL,
  PRIMARY KEY (`payID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zaypay_payment`
--

LOCK TABLES `zaypay_payment` WRITE;
/*!40000 ALTER TABLE `zaypay_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `zaypay_payment` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-07  5:00:06
