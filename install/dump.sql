-- MariaDB dump 10.18  Distrib 10.5.8-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: db.local.craftcmstest.com    Database: craftcmstest
-- ------------------------------------------------------
-- Server version	10.5.8-MariaDB-1:10.5.8+maria~focal

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `assetindexdata`
--

DROP TABLE IF EXISTS `assetindexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetindexdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sessionId` varchar(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `volumeId` int(11) NOT NULL,
  `uri` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `recordId` int(11) DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT 0,
  `completed` tinyint(1) DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_mycxmvtmufkmlvfdnohtjhmvijlgdrbblxrp` (`sessionId`,`volumeId`),
  KEY `idx_powyefcjtkufwunxbxeabigcsjggpzvpwngc` (`volumeId`),
  CONSTRAINT `fk_zvzhteecfxvuagosgphtbobraduokwhmppqq` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assetindexdata`
--

LOCK TABLES `assetindexdata` WRITE;
/*!40000 ALTER TABLE `assetindexdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `assetindexdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `uploaderId` int(11) DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `kind` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `focalPoint` varchar(13) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_mozupikcmdceyjwfsdgzxhdinubjvnimvncc` (`filename`,`folderId`),
  KEY `idx_ntlbshtqnhihsincvzrsxswusccafirlrqdp` (`folderId`),
  KEY `idx_azbgonzpjixljbydyiknpdirkdfzxrnxraor` (`volumeId`),
  KEY `fk_xnvtfapoajenjfsdmczxxrncmojqjaxynsat` (`uploaderId`),
  CONSTRAINT `fk_semygevxhephzhrywvgtmpybpkkhxkcuiqcm` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_uurhdiizntgbbswwloiorvheneeoiqybkirh` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wvowademnauwaiodlgwervuotrtaofuusxml` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xnvtfapoajenjfsdmczxxrncmojqjaxynsat` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assettransformindex`
--

DROP TABLE IF EXISTS `assettransformindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assettransformindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assetId` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT 0,
  `inProgress` tinyint(1) NOT NULL DEFAULT 0,
  `error` tinyint(1) NOT NULL DEFAULT 0,
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_yenckppmtixdbhxcvrhcbccyerlczxnoxgse` (`volumeId`,`assetId`,`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assettransformindex`
--

LOCK TABLES `assettransformindex` WRITE;
/*!40000 ALTER TABLE `assettransformindex` DISABLE KEYS */;
/*!40000 ALTER TABLE `assettransformindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assettransforms`
--

DROP TABLE IF EXISTS `assettransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assettransforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mode` enum('stretch','fit','crop') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'center-center',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_qfhxqjhsvfojyytammffriubqnnpbckjgrdp` (`name`),
  KEY `idx_ckuxhmevtaqggpqaivksleizxcyrxvrumypu` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assettransforms`
--

LOCK TABLES `assettransforms` WRITE;
/*!40000 ALTER TABLE `assettransforms` DISABLE KEYS */;
/*!40000 ALTER TABLE `assettransforms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_bgbbyseknqhopiouasgtyjbnghahqybzrpaz` (`groupId`),
  KEY `fk_lxxwakkffopqmdgwvuflosjfjeuvxzjmifke` (`parentId`),
  CONSTRAINT `fk_lxxwakkffopqmdgwvuflosjfjeuvxzjmifke` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_rrazqwawnadonabjmwwufqzrhueuuqyjbaxa` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tvrmbiybbpdcqdxklmaovmajowahtdhcwyqa` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorygroups`
--

DROP TABLE IF EXISTS `categorygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ftfvxbehcqzcqqylveeomteugzsbiapkioxc` (`name`),
  KEY `idx_rjaxfojalworoscnsxznwyoatxtkznecdxpu` (`handle`),
  KEY `idx_jxdwcufckgexrozblivsqtxggxxdmdortpve` (`structureId`),
  KEY `idx_zqulpotyhjafzscowjbqpdfcythwglrkzfer` (`fieldLayoutId`),
  KEY `idx_duzifuphbgnqkvdqvaasacuznkbkptygfwbo` (`dateDeleted`),
  CONSTRAINT `fk_pcgzeuhsxcjoztdpfrreaqdpfknjkmemsizz` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_qpmfvigmspeimcybtzqrdnolgqohwtahkkwt` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorygroups`
--

LOCK TABLES `categorygroups` WRITE;
/*!40000 ALTER TABLE `categorygroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorygroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorygroups_sites`
--

DROP TABLE IF EXISTS `categorygroups_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `uriFormat` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_nsvkzeimtaidrhramwnepmfvgnvhnghoaiwp` (`groupId`,`siteId`),
  KEY `idx_jfznsqlrkkivywxtxnpdygcfvdgpjuyhotms` (`siteId`),
  CONSTRAINT `fk_mhkjollqrfkafdwclbulbyrrmsomucyfehbs` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_salqwckivuytctwdkzhqwhoctlzpzomsapwv` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorygroups_sites`
--

LOCK TABLES `categorygroups_sites` WRITE;
/*!40000 ALTER TABLE `categorygroups_sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorygroups_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changedattributes`
--

DROP TABLE IF EXISTS `changedattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedattributes` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `attribute` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `idx_lpnjaybvshecsfehymylykboihqctbwgasfw` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_tyetdbdcvgfxouekjbjvbmzbiokannrgbtdv` (`siteId`),
  KEY `fk_xyzyoprqxtxkddoknnotcutmxtxuqgcfqvqc` (`userId`),
  CONSTRAINT `fk_rorqdarhgumbfbrueuqmhdwnuupjyjkjmdnp` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tyetdbdcvgfxouekjbjvbmzbiokannrgbtdv` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_xyzyoprqxtxkddoknnotcutmxtxuqgcfqvqc` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changedattributes`
--

LOCK TABLES `changedattributes` WRITE;
/*!40000 ALTER TABLE `changedattributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `changedattributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changedfields`
--

DROP TABLE IF EXISTS `changedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedfields` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  KEY `idx_hwstedflftwiwzrrcmqlzujebuhydpwtqnhd` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_mwrxsfomotoefwowwqrdzkfufidaezlylybb` (`siteId`),
  KEY `fk_ilshcsywvmuuwsvmtcesrfpvmarofcxqwrgg` (`fieldId`),
  KEY `fk_slgpfwiuohvcnvfyjdgdjxyslrdyfrfqxjck` (`userId`),
  CONSTRAINT `fk_ilshcsywvmuuwsvmtcesrfpvmarofcxqwrgg` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_kwwgcwgyvntbkvhuuwfjapfbzhbxkjxutjuw` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_mwrxsfomotoefwowwqrdzkfufidaezlylybb` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_slgpfwiuohvcnvfyjdgdjxyslrdyfrfqxjck` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changedfields`
--

LOCK TABLES `changedfields` WRITE;
/*!40000 ALTER TABLE `changedfields` DISABLE KEYS */;
/*!40000 ALTER TABLE `changedfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ryggwnmzdzyjermxngljxcmflvvuefuwglbs` (`elementId`,`siteId`),
  KEY `idx_cooypbhtxssfhxqrxxbtjuullnrozkyxuykk` (`siteId`),
  KEY `idx_mjzvwatqfaaqwmssipadimclssnyiiexcowh` (`title`),
  CONSTRAINT `fk_iyrwyutknbvwphzajdectsmucfwkhbqkaket` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_umslopgbcizwthfincdzvmoafnwrhcujicun` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
INSERT INTO `content` VALUES (1,1,1,NULL,'2021-03-10 05:00:59','2021-03-10 05:00:59','8bc17bfb-8402-4002-adf7-c0d504db0a3f');
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craftidtokens`
--

DROP TABLE IF EXISTS `craftidtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craftidtokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `accessToken` text COLLATE utf8_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_vrwinbtgurzwfnsknwismfybacduwsvdlhef` (`userId`),
  CONSTRAINT `fk_vrwinbtgurzwfnsknwismfybacduwsvdlhef` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craftidtokens`
--

LOCK TABLES `craftidtokens` WRITE;
/*!40000 ALTER TABLE `craftidtokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `craftidtokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deprecationerrors`
--

DROP TABLE IF EXISTS `deprecationerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deprecationerrors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fingerprint` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `line` smallint(6) unsigned DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `traces` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_otadnauhsbkxfufdhcbbppuxnwrjbhoxgxbb` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deprecationerrors`
--

LOCK TABLES `deprecationerrors` WRITE;
/*!40000 ALTER TABLE `deprecationerrors` DISABLE KEYS */;
/*!40000 ALTER TABLE `deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drafts`
--

DROP TABLE IF EXISTS `drafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drafts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sourceId` int(11) DEFAULT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `trackChanges` tinyint(1) NOT NULL DEFAULT 0,
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `idx_zytkepfbppfmgpcxhiqdttkfmduqghmzgwtt` (`saved`),
  KEY `fk_cqndppdlkebchtlczjesjtwkipkuxhkdrqyp` (`creatorId`),
  KEY `fk_intlnglgpzynktjjeerovjizcbynwdfyrzex` (`sourceId`),
  CONSTRAINT `fk_cqndppdlkebchtlczjesjtwkipkuxhkdrqyp` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_intlnglgpzynktjjeerovjizcbynwdfyrzex` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drafts`
--

LOCK TABLES `drafts` WRITE;
/*!40000 ALTER TABLE `drafts` DISABLE KEYS */;
/*!40000 ALTER TABLE `drafts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elementindexsettings`
--

DROP TABLE IF EXISTS `elementindexsettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elementindexsettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_gkboojltgyfragojkcfjvpsduawnpwnigwap` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elementindexsettings`
--

LOCK TABLES `elementindexsettings` WRITE;
/*!40000 ALTER TABLE `elementindexsettings` DISABLE KEYS */;
/*!40000 ALTER TABLE `elementindexsettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `draftId` int(11) DEFAULT NULL,
  `revisionId` int(11) DEFAULT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `archived` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_bcdiuukmhkcbxtlzykkfyoqkwqgrgsjiwghk` (`dateDeleted`),
  KEY `idx_eppmaikzplblxklakraolefmgjkhfzgiobmr` (`fieldLayoutId`),
  KEY `idx_xqxppthszqmcvyobvcnvdevcofrczmgffdlq` (`type`),
  KEY `idx_uduxmbooeuzpfjtmhbemcpklbxycfajkmawe` (`enabled`),
  KEY `idx_xvanujhoytsoqiqfzgnroyziespejmbgrqxb` (`archived`,`dateCreated`),
  KEY `idx_butptwziqbpltnbttktsusajqiyspqfgzvhw` (`archived`,`dateDeleted`,`draftId`,`revisionId`),
  KEY `fk_fpavbpjxwaqjnqjkdplbleigaypjzpnkpmbk` (`draftId`),
  KEY `fk_ifdunglbzanyhxojojobukdaavszidevbccc` (`revisionId`),
  CONSTRAINT `fk_fpavbpjxwaqjnqjkdplbleigaypjzpnkpmbk` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ifdunglbzanyhxojojobukdaavszidevbccc` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rqatqiplpjeqtwtafzprggosuondndwkvhwo` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
INSERT INTO `elements` VALUES (1,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2021-03-10 05:00:59','2021-03-10 05:00:59',NULL,'d03f8edd-9056-4630-8dba-d95e5c1caddc');
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elements_sites`
--

DROP TABLE IF EXISTS `elements_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_gppnxfgzucabeeciivmmshmsuygkrcjngbla` (`elementId`,`siteId`),
  KEY `idx_gvxirbllivpwyfymknukqypyxraxiyomjmbg` (`siteId`),
  KEY `idx_gquuckciuruimpvbrqyvbwtupuibfkizstha` (`slug`,`siteId`),
  KEY `idx_doegwguhomzgghfwekcpxyxnqfnnfrhojipj` (`enabled`),
  KEY `idx_lwxzkvtwpicnqvkhlwuogbgwsioudiwzzdxn` (`uri`,`siteId`),
  CONSTRAINT `fk_sjnsjjntchagichybaxdgifpeoqbgualswdc` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_uvoqbnegkmxlampckdmeikrhidsriupsaijm` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elements_sites`
--

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;
INSERT INTO `elements_sites` VALUES (1,1,1,NULL,NULL,1,'2021-03-10 05:00:59','2021-03-10 05:00:59','b56cd075-2a63-47df-9719-3bf4bcdc447d');
/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entries`
--

DROP TABLE IF EXISTS `entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_akysdjnjwqpanjmxmmsdcqqsrlfwptpkkwat` (`postDate`),
  KEY `idx_uhvoitktnvdigovlkpakmqzjyonksautxrir` (`expiryDate`),
  KEY `idx_mrlobygigtcsobeihukkzvfamyydhmvsmvuv` (`authorId`),
  KEY `idx_psoepwgcvrxiuashchgohklqbbhprjkgmqhp` (`sectionId`),
  KEY `idx_vthsvhtwpupscdmqojnmlouytpwtazmtotuc` (`typeId`),
  KEY `fk_knfmztogxrcdukpxxwxdxbgxzunfmjefunod` (`parentId`),
  CONSTRAINT `fk_hqvckdfavmirafwufvdgzrfpyquyyfzmwfgq` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_knfmztogxrcdukpxxwxdxbgxzunfmjefunod` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_lsxzyrblcwlzzlgusqhtkrmkinaalmhhgiwz` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_slvhawlyilvokqokxsydafwthwuvayjcogcx` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_sorwujtwbgzizxwrhwzsasopclfgbvaphuiu` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrytypes`
--

DROP TABLE IF EXISTS `entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entrytypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT 1,
  `titleTranslationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `titleFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_kfeajizlxehmrzlxruisbkudfhptlahkebdb` (`name`,`sectionId`),
  KEY `idx_xejcfdhsbfvlnfptlrdrrzmzukjhctwzvuen` (`handle`,`sectionId`),
  KEY `idx_ejsbervnokhgypnroqjmstbzslvmrhnnemfl` (`sectionId`),
  KEY `idx_hwqrjaaajrrjslgkgnclxncfgecfleylvkyv` (`fieldLayoutId`),
  KEY `idx_enfrosokfdurjupongohwlxkupljriylwetj` (`dateDeleted`),
  CONSTRAINT `fk_mfebxprmbfxeyjfszjwshpbcvgyxgatnkalt` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_xksoskkqfeeksvzedkfreiauntybqwzjqwci` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrytypes`
--

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `entrytypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldgroups`
--

DROP TABLE IF EXISTS `fieldgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_glgrecdotsuwswvydpcogdblexqqptltdpim` (`name`),
  KEY `idx_hhdksogsqxuuwgbgeamwfqdolhhffuuwnuqu` (`dateDeleted`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldgroups`
--

LOCK TABLES `fieldgroups` WRITE;
/*!40000 ALTER TABLE `fieldgroups` DISABLE KEYS */;
INSERT INTO `fieldgroups` VALUES (1,'Common','2021-03-10 05:00:58','2021-03-10 05:00:58',NULL,'6bed46da-fc31-427a-bb4e-74ba6bb29e50');
/*!40000 ALTER TABLE `fieldgroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldlayoutfields`
--

DROP TABLE IF EXISTS `fieldlayoutfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayoutfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_hotxkdueldlqcufcgccrasenwtbsqjfphqmh` (`layoutId`,`fieldId`),
  KEY `idx_rrsxstylzevpqgxlhvzdchvfiynsgwfhrxxz` (`sortOrder`),
  KEY `idx_kysyhuslklczlfuddxcsrufuonfkzmqmbkea` (`tabId`),
  KEY `idx_jlgtercdlbwesedzxnaqaekdxxoxsmswwtct` (`fieldId`),
  CONSTRAINT `fk_afapyjezddlpxdiltoqsvpecbdqfhdlucygp` FOREIGN KEY (`tabId`) REFERENCES `fieldlayouttabs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_hraqwbajnpmjqdzjtoyntdmacbarwgdgwujs` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ynrfuixvyytsklysnubztxcnwndzqgawbgfg` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldlayoutfields`
--

LOCK TABLES `fieldlayoutfields` WRITE;
/*!40000 ALTER TABLE `fieldlayoutfields` DISABLE KEYS */;
/*!40000 ALTER TABLE `fieldlayoutfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldlayouts`
--

DROP TABLE IF EXISTS `fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_svtxuxhbmpymztuvuizutdiqsrsbpvlvxuzr` (`dateDeleted`),
  KEY `idx_pebbixzxdupqcsmogejmdazzqkilmihbllkw` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldlayouts`
--

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;
/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldlayouttabs`
--

DROP TABLE IF EXISTS `fieldlayouttabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayouttabs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `elements` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_wmquvengvaycwbklbhjuotzdwacuwagpfmcl` (`sortOrder`),
  KEY `idx_ijjwlvbybuiwetjvlgoftkrhpgnywedivpaq` (`layoutId`),
  CONSTRAINT `fk_rddabqwenacszfkuojozpqgucfjzgcckrxvy` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldlayouttabs`
--

LOCK TABLES `fieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `fieldlayouttabs` DISABLE KEYS */;
/*!40000 ALTER TABLE `fieldlayouttabs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `context` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'global',
  `instructions` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `searchable` tinyint(1) NOT NULL DEFAULT 1,
  `translationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `translationKeyFormat` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_fvtsuvbhzsugwdykrazugfytozgebgpcasgf` (`handle`,`context`),
  KEY `idx_oxxgubusrhsacnsmtbvmznlxtoyfeotobels` (`groupId`),
  KEY `idx_uygtiiwywtocvvhnpahxatbgpqlolebzpyzp` (`context`),
  CONSTRAINT `fk_qksadikndsantkotyeqnmaglvyjrjhdksudj` FOREIGN KEY (`groupId`) REFERENCES `fieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `globalsets`
--

DROP TABLE IF EXISTS `globalsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `globalsets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_aynjlewbhxiffeflebghtjqapvpbhmkuekxb` (`name`),
  KEY `idx_fpxgbimpkhicbwtwmlrnqkclvuncsbqwvrlz` (`handle`),
  KEY `idx_rdqvyklptvrxfevklrchfiolpzywrqabhqdn` (`fieldLayoutId`),
  CONSTRAINT `fk_teoqefzarmmbaheeyqjqnutqcbrytkqmzygy` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_zbamuywrmkxpyugltmjjentkfvzmuembckrb` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `globalsets`
--

LOCK TABLES `globalsets` WRITE;
/*!40000 ALTER TABLE `globalsets` DISABLE KEYS */;
/*!40000 ALTER TABLE `globalsets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gqlschemas`
--

DROP TABLE IF EXISTS `gqlschemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqlschemas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `scope` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `isPublic` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gqlschemas`
--

LOCK TABLES `gqlschemas` WRITE;
/*!40000 ALTER TABLE `gqlschemas` DISABLE KEYS */;
/*!40000 ALTER TABLE `gqlschemas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gqltokens`
--

DROP TABLE IF EXISTS `gqltokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqltokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `accessToken` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ykvzzltlkwuzafwztrfliycjistpgvdinqma` (`accessToken`),
  UNIQUE KEY `idx_ysnanbhsirtrucnofheraflmufttdqbmiubq` (`name`),
  KEY `fk_wsvmbejygqdjmuoqvnapagvsrbvypwlnufed` (`schemaId`),
  CONSTRAINT `fk_wsvmbejygqdjmuoqvnapagvsrbvypwlnufed` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gqltokens`
--

LOCK TABLES `gqltokens` WRITE;
/*!40000 ALTER TABLE `gqltokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `gqltokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `schemaVersion` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT 0,
  `configVersion` char(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
INSERT INTO `info` VALUES (1,'3.6.9','3.6.6',0,'yjuvemoxmxvy','psomejpubezv','2021-03-10 05:00:57','2021-03-10 05:01:01','8ff68560-4b82-4495-9482-c2db0c6f6e10');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matrixblocks`
--

DROP TABLE IF EXISTS `matrixblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_rmfiktgupxuedsitbrjfguvxmhehqzqqygke` (`ownerId`),
  KEY `idx_ccnttxiagqqokomlawjfuvsqcrwushvowfzm` (`fieldId`),
  KEY `idx_qefwteqmkoxuczueuhsslbrvqfmqjraqcklm` (`typeId`),
  KEY `idx_bzzjgwsokyknexpodpfowrxordixwshthgju` (`sortOrder`),
  CONSTRAINT `fk_mcnwetyturvxjznunlbkibmzpfuyclkabnji` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_udykygltulesrstpncjrmxgzcbjqnldislrf` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vcpicbooniyzknlwvbwjsbivodyudvkwdivj` FOREIGN KEY (`typeId`) REFERENCES `matrixblocktypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wrurgoqtljhyqpczomenjwitvwkklixwqjus` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matrixblocks`
--

LOCK TABLES `matrixblocks` WRITE;
/*!40000 ALTER TABLE `matrixblocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `matrixblocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matrixblocktypes`
--

DROP TABLE IF EXISTS `matrixblocktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_wrquungfvtuenqukldnnzoxkjitjxaznlqvz` (`name`,`fieldId`),
  KEY `idx_unzoviiojxzvlbvrxlpccjfzashrklpfdwjl` (`handle`,`fieldId`),
  KEY `idx_ddvwxxscdpfdiwrzbdevtpabonxgpqznxfpq` (`fieldId`),
  KEY `idx_eshgsmxbhcduekbwwclylzxirbeistmjelzp` (`fieldLayoutId`),
  CONSTRAINT `fk_wgegcezjfuzpszruktfrodxzyaqxfcyrewsr` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xrtlkuocyhdtwhyzinlyrnxodgnuwpdargtf` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matrixblocktypes`
--

LOCK TABLES `matrixblocktypes` WRITE;
/*!40000 ALTER TABLE `matrixblocktypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `matrixblocktypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `track` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_pksqpsyhwisunymgygnibribkynxaizizkii` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=183 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'craft','Install','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','f49d6db3-147a-4923-8caa-43e0e21bb423'),(2,'craft','m150403_183908_migrations_table_changes','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','a6bf0cd1-aa64-40f8-916a-55f8303d60ab'),(3,'craft','m150403_184247_plugins_table_changes','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','0cea29b5-b024-4485-b91b-3e307347e66f'),(4,'craft','m150403_184533_field_version','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','c69dbc3b-e72a-45d4-a037-55487c9cddf8'),(5,'craft','m150403_184729_type_columns','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','58184ba2-4d20-4a77-a264-6ce1e64cee49'),(6,'craft','m150403_185142_volumes','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','f9fe4653-e5c0-4a0a-9393-00bdfac1be44'),(7,'craft','m150428_231346_userpreferences','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','918e28be-5ee8-4c6b-9242-48d64dc0884b'),(8,'craft','m150519_150900_fieldversion_conversion','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','3b8c6adb-687d-448c-9ba6-deda1a30fade'),(9,'craft','m150617_213829_update_email_settings','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','f018eeb9-e47b-4982-97c9-d914620cdd59'),(10,'craft','m150721_124739_templatecachequeries','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','8a9ba8d2-5f3a-47ee-a5d6-e29b77ab5f39'),(11,'craft','m150724_140822_adjust_quality_settings','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','0698d4ea-1794-4315-84f4-fb5811b182b1'),(12,'craft','m150815_133521_last_login_attempt_ip','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','cea43701-a93f-43e0-8d01-8f12af669309'),(13,'craft','m151002_095935_volume_cache_settings','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','ce5e3b58-7238-40ff-9460-49488b2dabf7'),(14,'craft','m151005_142750_volume_s3_storage_settings','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','58c914a1-c5c6-436d-bfcd-d367dbcd47ec'),(15,'craft','m151016_133600_delete_asset_thumbnails','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','10884119-7a88-49ae-baa6-249fec3c0719'),(16,'craft','m151209_000000_move_logo','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','52f06735-c3a5-46be-a41d-5614c6e0c2e8'),(17,'craft','m151211_000000_rename_fileId_to_assetId','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','1d8f721a-552f-4277-b72c-db3ef3ca106f'),(18,'craft','m151215_000000_rename_asset_permissions','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','b6f22fe8-5b01-43eb-90ee-8087fa45df2e'),(19,'craft','m160707_000001_rename_richtext_assetsource_setting','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','33bcc125-4c6f-4850-8b10-1417bcab3b77'),(20,'craft','m160708_185142_volume_hasUrls_setting','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','f85612b2-c2f5-49ad-a194-0b91856d36ce'),(21,'craft','m160714_000000_increase_max_asset_filesize','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','4b958d61-f006-42be-a784-9c8f7d05e39e'),(22,'craft','m160727_194637_column_cleanup','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','041e3276-1602-403a-8710-16c877efaa64'),(23,'craft','m160804_110002_userphotos_to_assets','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','37d68c56-5d26-49f6-aec7-7d153ba7c37f'),(24,'craft','m160807_144858_sites','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','9ac20827-8309-4fc9-aeab-c45e8a5bb2ae'),(25,'craft','m160829_000000_pending_user_content_cleanup','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','ce130757-515a-40b9-867e-80467cb90b60'),(26,'craft','m160830_000000_asset_index_uri_increase','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','29355591-ec80-4712-ac6d-f149715314b7'),(27,'craft','m160912_230520_require_entry_type_id','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','c43c1725-328b-40e9-8aad-b42f89b738f5'),(28,'craft','m160913_134730_require_matrix_block_type_id','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','a9a47054-1a55-4211-baef-884c549ad3fb'),(29,'craft','m160920_174553_matrixblocks_owner_site_id_nullable','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','4d409b88-22cd-410a-a443-adc1fe76637c'),(30,'craft','m160920_231045_usergroup_handle_title_unique','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','e3ebd3d5-5b71-4c85-a6d9-2cde03bcc803'),(31,'craft','m160925_113941_route_uri_parts','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','f0115039-9b22-4477-9b36-0966b478f07f'),(32,'craft','m161006_205918_schemaVersion_not_null','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','a8cce3a3-c785-4eca-8776-60e9d8312c8a'),(33,'craft','m161007_130653_update_email_settings','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','b8928648-2971-4fce-8a6a-28d0189dc3b5'),(34,'craft','m161013_175052_newParentId','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','0f712be6-6850-44ad-8db7-ae4fbf404a54'),(35,'craft','m161021_102916_fix_recent_entries_widgets','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','b5e73343-2c80-4c83-b592-4c2bf9dc3baa'),(36,'craft','m161021_182140_rename_get_help_widget','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','7904db58-8d14-49af-ae71-feb90ba04941'),(37,'craft','m161025_000000_fix_char_columns','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','121ef30f-8e28-4423-a290-b4dce3c49e02'),(38,'craft','m161029_124145_email_message_languages','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','573c5ca1-3518-43ac-a50b-1fd23fb448b3'),(39,'craft','m161108_000000_new_version_format','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','472dcfb7-1b25-4f21-b3c9-59ef38e8ecbc'),(40,'craft','m161109_000000_index_shuffle','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','d8e66148-1a91-4eea-a428-899a5cbd812b'),(41,'craft','m161122_185500_no_craft_app','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','48aa298b-fc09-4f27-8534-380572c9a01a'),(42,'craft','m161125_150752_clear_urlmanager_cache','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','b425b22e-278a-44ec-bd46-d83dd28e2c7a'),(43,'craft','m161220_000000_volumes_hasurl_notnull','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','55a8a4e7-6a36-4427-9e0b-ae19ff5b9d0b'),(44,'craft','m170114_161144_udates_permission','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','1829ed35-6821-498e-b566-04abb1ce3605'),(45,'craft','m170120_000000_schema_cleanup','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','051e37fd-cf62-444a-95f5-6effe47aadae'),(46,'craft','m170126_000000_assets_focal_point','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','6f96a2cf-858f-4420-bc43-179eaf188a82'),(47,'craft','m170206_142126_system_name','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','20d1ff2d-f716-4386-967d-5e3bf6d97612'),(48,'craft','m170217_044740_category_branch_limits','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','50ebbe4f-5d02-4364-910e-469b3080f305'),(49,'craft','m170217_120224_asset_indexing_columns','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','10c36b2e-fec3-4439-8dd0-44a0bada4dc7'),(50,'craft','m170223_224012_plain_text_settings','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','3dbcfa3a-0008-4d43-aff8-f7ff16c6bc48'),(51,'craft','m170227_120814_focal_point_percentage','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','1d768e6b-d0fa-4dd8-af47-f15953cdeae4'),(52,'craft','m170228_171113_system_messages','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','31e97a71-c738-4a45-bd9e-93400b9ae3bd'),(53,'craft','m170303_140500_asset_field_source_settings','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','401f2c60-0c88-42f8-93c3-32f11840b95d'),(54,'craft','m170306_150500_asset_temporary_uploads','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','ceb3457c-a7e8-4347-92d9-ccf856630a49'),(55,'craft','m170523_190652_element_field_layout_ids','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','29c9e673-f79a-46f0-9718-ade244e15eec'),(56,'craft','m170621_195237_format_plugin_handles','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','3883cdd0-1a06-4a33-b069-e28d97e7fcb2'),(57,'craft','m170630_161027_deprecation_line_nullable','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','bc45c8ad-d9a1-41cc-9ec3-3c8668fe1d00'),(58,'craft','m170630_161028_deprecation_changes','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','4ba875ec-f6ce-44ce-928d-2e448580e609'),(59,'craft','m170703_181539_plugins_table_tweaks','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','4e234fdf-250c-440d-87bf-78e6e17d22b1'),(60,'craft','m170704_134916_sites_tables','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','6de332a8-c8bb-4f58-8ed8-36233d6e6a87'),(61,'craft','m170706_183216_rename_sequences','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','b13ffdf7-1c69-4247-9318-281b997e144b'),(62,'craft','m170707_094758_delete_compiled_traits','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','5fb13d02-2b2a-4025-9aef-47d87c0a28ce'),(63,'craft','m170731_190138_drop_asset_packagist','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','488fb9c4-77f4-4aeb-89ea-d4715db92c58'),(64,'craft','m170810_201318_create_queue_table','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','195c9119-2ea5-4cb3-85c0-8a7ff39a2739'),(65,'craft','m170903_192801_longblob_for_queue_jobs','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','094731e9-661b-459c-aebf-5a4f928ad42e'),(66,'craft','m170914_204621_asset_cache_shuffle','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','9a024b99-7df3-4095-84fd-4ed7702a9143'),(67,'craft','m171011_214115_site_groups','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','1f62eab9-71ba-4e81-93fe-bc3855c996d7'),(68,'craft','m171012_151440_primary_site','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','884ce04b-d305-42c6-bf19-f24a261a5be9'),(69,'craft','m171013_142500_transform_interlace','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','5679a3b1-8ba2-4ef3-960f-589c2facc29b'),(70,'craft','m171016_092553_drop_position_select','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','c88ba6d6-9278-4504-bea4-ede145b8157a'),(71,'craft','m171016_221244_less_strict_translation_method','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','0854107e-4c57-4ba2-b948-5eaf62214c7d'),(72,'craft','m171107_000000_assign_group_permissions','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','3815a1a3-8c5c-476c-9f03-f358a7f55473'),(73,'craft','m171117_000001_templatecache_index_tune','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','432e0d7c-8ab4-45ac-9ee3-b03d6b9157d0'),(74,'craft','m171126_105927_disabled_plugins','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','ac95969f-b3cb-40e6-ab2f-0c80870af771'),(75,'craft','m171130_214407_craftidtokens_table','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','5bdf7b8f-2cc3-406b-a676-e6d2dc95165b'),(76,'craft','m171202_004225_update_email_settings','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','c476dfd3-dde4-4872-9e7f-145c9d3b042e'),(77,'craft','m171204_000001_templatecache_index_tune_deux','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','4ee9cf98-f228-4cf0-bb98-5351d010c43c'),(78,'craft','m171205_130908_remove_craftidtokens_refreshtoken_column','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','34e5f5ab-6476-4ac8-9119-4ef558f0b9f6'),(79,'craft','m171218_143135_longtext_query_column','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','e5a431e8-f3de-4acd-863b-41e5eb8e6419'),(80,'craft','m171231_055546_environment_variables_to_aliases','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','bd95ee28-f6c3-41fa-a6f5-d6391d7afe8e'),(81,'craft','m180113_153740_drop_users_archived_column','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','712917cf-611f-4e88-a9ed-f5b0f87d57f7'),(82,'craft','m180122_213433_propagate_entries_setting','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','c8f2c6bf-c21c-45b1-a15e-0b918e43f7bd'),(83,'craft','m180124_230459_fix_propagate_entries_values','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','e18e7cdc-7b14-4d1e-8af6-08559539093b'),(84,'craft','m180128_235202_set_tag_slugs','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','b6beebf1-9c7f-4415-ab16-3d61e0bf2aad'),(85,'craft','m180202_185551_fix_focal_points','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','ec24aded-c2c0-4bae-89a9-c4d8af25d9dc'),(86,'craft','m180217_172123_tiny_ints','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','41402a83-01eb-4a1b-9da8-903b05973b15'),(87,'craft','m180321_233505_small_ints','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','7c9a1200-4615-484a-a8d5-462a3797f1c2'),(88,'craft','m180404_182320_edition_changes','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','687959ed-fd89-475d-b662-6b7248b4bf14'),(89,'craft','m180411_102218_fix_db_routes','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','b3114721-f33f-4a51-975d-1f4cb5103803'),(90,'craft','m180416_205628_resourcepaths_table','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','15168ce4-29fe-4c6f-b4cf-a36c86d5ddc3'),(91,'craft','m180418_205713_widget_cleanup','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','96c345a1-59be-4e34-a22a-91ea93914148'),(92,'craft','m180425_203349_searchable_fields','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','4bd1d821-8aae-4466-9220-ff8bb00b6f5e'),(93,'craft','m180516_153000_uids_in_field_settings','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','efd4010a-c89f-4795-a7d3-6b57c67b7fb2'),(94,'craft','m180517_173000_user_photo_volume_to_uid','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','9c9ab427-02f5-4573-8c63-3bef71ffb38a'),(95,'craft','m180518_173000_permissions_to_uid','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','fda6a2c8-92fb-4032-a16b-b7db321aaffb'),(96,'craft','m180520_173000_matrix_context_to_uids','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','00728360-a534-43cf-b66d-b5a0abf8b1c7'),(97,'craft','m180521_172900_project_config_table','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','8df24140-c1f6-4d14-a172-0b288b4a21e4'),(98,'craft','m180521_173000_initial_yml_and_snapshot','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','65622d33-b155-4b68-bf03-9858f33b2f98'),(99,'craft','m180731_162030_soft_delete_sites','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','6c35dccb-63d9-4fce-8064-8d1f636a1f59'),(100,'craft','m180810_214427_soft_delete_field_layouts','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','0d06fa35-d2d0-4640-9b02-bbfb32cae1bc'),(101,'craft','m180810_214439_soft_delete_elements','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','6c1dc67b-60a3-43da-88ea-899f2705d630'),(102,'craft','m180824_193422_case_sensitivity_fixes','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','2c8bdb0b-1c37-4dbc-8545-2a5f64a59376'),(103,'craft','m180901_151639_fix_matrixcontent_tables','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','159fbf5b-5b93-47d6-9b2e-6e78c8e161e4'),(104,'craft','m180904_112109_permission_changes','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','444bb64c-2a0f-4064-8104-fcb94908380b'),(105,'craft','m180910_142030_soft_delete_sitegroups','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','617bbe08-1678-4740-b2e6-ef479f8c26c4'),(106,'craft','m181011_160000_soft_delete_asset_support','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','124b17dd-81b8-4175-a279-07e8a770171b'),(107,'craft','m181016_183648_set_default_user_settings','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','d0e60d33-3cbc-4918-ab3e-24645bb67d4f'),(108,'craft','m181017_225222_system_config_settings','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','4f29327d-aa6a-4fb5-b9c3-9614a6983aa0'),(109,'craft','m181018_222343_drop_userpermissions_from_config','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','339c3354-93b8-476a-bc18-41e31dab819f'),(110,'craft','m181029_130000_add_transforms_routes_to_config','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','56290fc5-6e21-4888-a6bb-2a176ca87dd0'),(111,'craft','m181112_203955_sequences_table','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','2359365f-32a5-4133-9d2e-0e6df636da40'),(112,'craft','m181121_001712_cleanup_field_configs','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','3fab802a-c67d-4c1c-92a9-1bed487aeb58'),(113,'craft','m181128_193942_fix_project_config','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','961689b6-c2cb-4671-ae86-7f58cc501e1b'),(114,'craft','m181130_143040_fix_schema_version','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','dca38d74-4be3-44bc-b435-dc708fdd99dc'),(115,'craft','m181211_143040_fix_entry_type_uids','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','a2abdfee-85e8-428e-bec3-1b36abd47911'),(116,'craft','m181217_153000_fix_structure_uids','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','dba87a6d-4e4a-400d-81cc-eb263f99796c'),(117,'craft','m190104_152725_store_licensed_plugin_editions','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','88f50f32-409c-4902-8dca-4d4d0da4b13e'),(118,'craft','m190108_110000_cleanup_project_config','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','4bc9e768-21de-460c-8885-d7652b0045ca'),(119,'craft','m190108_113000_asset_field_setting_change','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','d320cbb7-8598-4a31-bea4-b512f32895ad'),(120,'craft','m190109_172845_fix_colspan','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','6cbc24a2-b34a-4ee9-9784-70b9f21f9b66'),(121,'craft','m190110_150000_prune_nonexisting_sites','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','32e44d74-0cfe-4396-8d21-5091be608e80'),(122,'craft','m190110_214819_soft_delete_volumes','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','87c7269d-ca88-4dbd-922f-85846b25756f'),(123,'craft','m190112_124737_fix_user_settings','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','b1c49cf5-ffa4-463f-9b91-6e8520ea5ac1'),(124,'craft','m190112_131225_fix_field_layouts','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','9a906faf-cfd5-437c-be00-d4ba3622e593'),(125,'craft','m190112_201010_more_soft_deletes','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','3f99f363-3223-44ec-8d4f-8c1a0796c799'),(126,'craft','m190114_143000_more_asset_field_setting_changes','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','e4389193-e8f8-41c4-b5ee-f5b950a6324d'),(127,'craft','m190121_120000_rich_text_config_setting','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','889a004a-7c13-4996-a0ad-e3a6eb5f4eed'),(128,'craft','m190125_191628_fix_email_transport_password','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','9d9484f2-8f08-4708-8950-1c2d9abec8e8'),(129,'craft','m190128_181422_cleanup_volume_folders','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','3ef25ffb-b066-4765-9396-a5076592a97f'),(130,'craft','m190205_140000_fix_asset_soft_delete_index','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','660b5948-7379-4e34-9eeb-851c6b2c0872'),(131,'craft','m190218_143000_element_index_settings_uid','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','8a0a93d3-015a-4d9c-a276-a989f2cb18ba'),(132,'craft','m190312_152740_element_revisions','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','03cf2ccc-0f9c-46a2-aeb5-4550776558ca'),(133,'craft','m190327_235137_propagation_method','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','dcb33dee-3513-45c2-985e-59cf91d81213'),(134,'craft','m190401_223843_drop_old_indexes','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','4d6ac606-85bd-4c69-a6cd-8626965acfd1'),(135,'craft','m190416_014525_drop_unique_global_indexes','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','99f24256-c44b-47fa-aadc-aeb78cda17db'),(136,'craft','m190417_085010_add_image_editor_permissions','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','843791f4-f679-4355-ada9-42382be57a88'),(137,'craft','m190502_122019_store_default_user_group_uid','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','bebfbfcb-0f9d-46ae-8490-491cf82d46b6'),(138,'craft','m190504_150349_preview_targets','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','f3246089-22ef-422a-ad1f-e9c0ade2bad1'),(139,'craft','m190516_184711_job_progress_label','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','1a7a82b7-7104-4e66-aa9e-d54a97c2a226'),(140,'craft','m190523_190303_optional_revision_creators','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','451d966b-d641-4e64-8cb1-9483d25cb2c4'),(141,'craft','m190529_204501_fix_duplicate_uids','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','98664513-c7de-4c21-80a5-b7dacc9f8db1'),(142,'craft','m190605_223807_unsaved_drafts','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','f94202b4-1f1c-4745-935e-7596620261f4'),(143,'craft','m190607_230042_entry_revision_error_tables','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','a99886db-6525-48cc-8ca7-45e1df2a62f9'),(144,'craft','m190608_033429_drop_elements_uid_idx','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','cbab2978-06ae-4fed-a8f2-80fabb5a14f2'),(145,'craft','m190617_164400_add_gqlschemas_table','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','d52fd5d4-f507-44f9-b56e-a0160433c94b'),(146,'craft','m190624_234204_matrix_propagation_method','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','a4fcca63-edf7-4f73-b63f-53db2aa61c4d'),(147,'craft','m190711_153020_drop_snapshots','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','91f8272f-2ba9-421c-832c-6de203ee7da3'),(148,'craft','m190712_195914_no_draft_revisions','2021-03-10 05:01:00','2021-03-10 05:01:00','2021-03-10 05:01:00','42656d8b-c2c7-4f83-ac1f-976924b1f879'),(149,'craft','m190723_140314_fix_preview_targets_column','2021-03-10 05:01:01','2021-03-10 05:01:01','2021-03-10 05:01:01','00ca743b-2faf-410c-bdc5-ae162c830953'),(150,'craft','m190820_003519_flush_compiled_templates','2021-03-10 05:01:01','2021-03-10 05:01:01','2021-03-10 05:01:01','6cdbbba6-7250-4c02-8147-22b3374640fb'),(151,'craft','m190823_020339_optional_draft_creators','2021-03-10 05:01:01','2021-03-10 05:01:01','2021-03-10 05:01:01','353a2fb2-3306-44ff-9bef-f3274810631e'),(152,'craft','m190913_152146_update_preview_targets','2021-03-10 05:01:01','2021-03-10 05:01:01','2021-03-10 05:01:01','470eba71-daa3-422d-a509-a3a887e721e6'),(153,'craft','m191107_122000_add_gql_project_config_support','2021-03-10 05:01:01','2021-03-10 05:01:01','2021-03-10 05:01:01','e88383e3-0093-4135-b7bc-c2e531bc659b'),(154,'craft','m191204_085100_pack_savable_component_settings','2021-03-10 05:01:01','2021-03-10 05:01:01','2021-03-10 05:01:01','f5f36a97-e0fe-441f-9e6b-bfd1923a5709'),(155,'craft','m191206_001148_change_tracking','2021-03-10 05:01:01','2021-03-10 05:01:01','2021-03-10 05:01:01','c44cf33d-1a23-4229-a2e6-0016f5edc48e'),(156,'craft','m191216_191635_asset_upload_tracking','2021-03-10 05:01:01','2021-03-10 05:01:01','2021-03-10 05:01:01','66af8237-9c45-4859-b18d-5304da161c54'),(157,'craft','m191222_002848_peer_asset_permissions','2021-03-10 05:01:01','2021-03-10 05:01:01','2021-03-10 05:01:01','507a6152-2e4e-4351-96b8-63c9237df41e'),(158,'craft','m200127_172522_queue_channels','2021-03-10 05:01:01','2021-03-10 05:01:01','2021-03-10 05:01:01','44d0a889-0328-4562-b2e0-b3c317041792'),(159,'craft','m200211_175048_truncate_element_query_cache','2021-03-10 05:01:01','2021-03-10 05:01:01','2021-03-10 05:01:01','4a949e17-fdc0-4739-b5fb-ed1ec47de89d'),(160,'craft','m200213_172522_new_elements_index','2021-03-10 05:01:01','2021-03-10 05:01:01','2021-03-10 05:01:01','71d6d162-d019-45bb-9e3f-20686fb1aa2b'),(161,'craft','m200228_195211_long_deprecation_messages','2021-03-10 05:01:01','2021-03-10 05:01:01','2021-03-10 05:01:01','5c997033-f2ee-4dcb-bd69-3ba9bd30656f'),(162,'craft','m200306_054652_disabled_sites','2021-03-10 05:01:01','2021-03-10 05:01:01','2021-03-10 05:01:01','5196b438-5b46-46c1-a7fd-3f4c9595dc61'),(163,'craft','m200522_191453_clear_template_caches','2021-03-10 05:01:01','2021-03-10 05:01:01','2021-03-10 05:01:01','92e3d4be-1a5c-496d-8ffe-052052ad4375'),(164,'craft','m200606_231117_migration_tracks','2021-03-10 05:01:01','2021-03-10 05:01:01','2021-03-10 05:01:01','02d6e1f4-e450-4431-bfb1-e54b19625761'),(165,'craft','m200619_215137_title_translation_method','2021-03-10 05:01:01','2021-03-10 05:01:01','2021-03-10 05:01:01','489cdb4c-c7ca-4e94-8eda-471b0e56325b'),(166,'craft','m200620_005028_user_group_descriptions','2021-03-10 05:01:01','2021-03-10 05:01:01','2021-03-10 05:01:01','cafef99e-8b34-48a0-bb6e-6b7c83f675af'),(167,'craft','m200620_230205_field_layout_changes','2021-03-10 05:01:01','2021-03-10 05:01:01','2021-03-10 05:01:01','c9ea5206-0364-4390-8a02-e8c6161f209a'),(168,'craft','m200625_131100_move_entrytypes_to_top_project_config','2021-03-10 05:01:01','2021-03-10 05:01:01','2021-03-10 05:01:01','890f1579-c922-4cac-a5ae-8fafc2a39777'),(169,'craft','m200629_112700_remove_project_config_legacy_files','2021-03-10 05:01:01','2021-03-10 05:01:01','2021-03-10 05:01:01','246c3367-0f2c-4950-bfb5-11958b646009'),(170,'craft','m200630_183000_drop_configmap','2021-03-10 05:01:01','2021-03-10 05:01:01','2021-03-10 05:01:01','0981a48a-734f-4904-b9cc-fb23f17823e8'),(171,'craft','m200715_113400_transform_index_error_flag','2021-03-10 05:01:01','2021-03-10 05:01:01','2021-03-10 05:01:01','023bd31b-4c25-44df-919e-b81c1905073e'),(172,'craft','m200716_110900_replace_file_asset_permissions','2021-03-10 05:01:01','2021-03-10 05:01:01','2021-03-10 05:01:01','0853be95-1400-4f19-b4c8-4f1eb59fabe6'),(173,'craft','m200716_153800_public_token_settings_in_project_config','2021-03-10 05:01:01','2021-03-10 05:01:01','2021-03-10 05:01:01','7412ca67-7c4c-45df-995e-3d51a09deed1'),(174,'craft','m200720_175543_drop_unique_constraints','2021-03-10 05:01:01','2021-03-10 05:01:01','2021-03-10 05:01:01','7af7e16a-8cec-4ba4-b978-34b3b64d332b'),(175,'craft','m200825_051217_project_config_version','2021-03-10 05:01:01','2021-03-10 05:01:01','2021-03-10 05:01:01','a97bd627-39b5-4ad2-90e6-b7c694bd633f'),(176,'craft','m201116_190500_asset_title_translation_method','2021-03-10 05:01:01','2021-03-10 05:01:01','2021-03-10 05:01:01','88664f03-225d-47e2-855f-57137668516c'),(177,'craft','m201124_003555_plugin_trials','2021-03-10 05:01:01','2021-03-10 05:01:01','2021-03-10 05:01:01','8ed4ba98-c377-41a1-9b6d-992b061bd5e1'),(178,'craft','m210209_135503_soft_delete_field_groups','2021-03-10 05:01:01','2021-03-10 05:01:01','2021-03-10 05:01:01','82467f31-f226-4802-a6f2-92963a11a22d'),(179,'craft','m210212_223539_delete_invalid_drafts','2021-03-10 05:01:01','2021-03-10 05:01:01','2021-03-10 05:01:01','58f0ff10-00b6-4fd2-825d-f91f8a8901a1'),(180,'craft','m210214_202731_track_saved_drafts','2021-03-10 05:01:01','2021-03-10 05:01:01','2021-03-10 05:01:01','3189b46a-99a0-48f3-bc59-5841d3a620ca'),(181,'craft','m210223_150900_add_new_element_gql_schema_components','2021-03-10 05:01:01','2021-03-10 05:01:01','2021-03-10 05:01:01','642b1338-5a15-4936-96d3-9e93100c9ec2'),(182,'craft','m210224_162000_add_projectconfignames_table','2021-03-10 05:01:01','2021-03-10 05:01:01','2021-03-10 05:01:01','8e4ee5af-c729-423c-8a69-d4f17c92cadf');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `schemaVersion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `licenseKeyStatus` enum('valid','trial','invalid','mismatched','astray','unknown') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `licensedEdition` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_mbxdkkucgawdouznduixmmwquszrsabqaxnt` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectconfig`
--

DROP TABLE IF EXISTS `projectconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projectconfig` (
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectconfig`
--

LOCK TABLES `projectconfig` WRITE;
/*!40000 ALTER TABLE `projectconfig` DISABLE KEYS */;
INSERT INTO `projectconfig` VALUES ('dateModified','1615352458'),('email.fromEmail','\"craftcmstest@mailinator.com\"'),('email.fromName','\"CraftCMS Test\"'),('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),('fieldGroups.6bed46da-fc31-427a-bb4e-74ba6bb29e50.name','\"Common\"'),('siteGroups.933c58a0-430e-4f1f-b955-f7258f9cc0bc.name','\"CraftCMS Test\"'),('sites.e4eac3dd-aba9-4463-ba74-61f77d751978.baseUrl','\"$PRIMARY_SITE_URL\"'),('sites.e4eac3dd-aba9-4463-ba74-61f77d751978.enabled','true'),('sites.e4eac3dd-aba9-4463-ba74-61f77d751978.handle','\"default\"'),('sites.e4eac3dd-aba9-4463-ba74-61f77d751978.hasUrls','true'),('sites.e4eac3dd-aba9-4463-ba74-61f77d751978.language','\"pt\"'),('sites.e4eac3dd-aba9-4463-ba74-61f77d751978.name','\"CraftCMS Test\"'),('sites.e4eac3dd-aba9-4463-ba74-61f77d751978.primary','true'),('sites.e4eac3dd-aba9-4463-ba74-61f77d751978.siteGroup','\"933c58a0-430e-4f1f-b955-f7258f9cc0bc\"'),('sites.e4eac3dd-aba9-4463-ba74-61f77d751978.sortOrder','1'),('system.edition','\"solo\"'),('system.live','true'),('system.name','\"CraftCMS Test\"'),('system.retryDuration','null'),('system.schemaVersion','\"3.6.6\"'),('system.timeZone','\"America/Recife\"'),('users.allowPublicRegistration','false'),('users.defaultGroup','null'),('users.photoSubpath','null'),('users.photoVolumeUid','null'),('users.requireEmailVerification','true');
/*!40000 ALTER TABLE `projectconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectconfignames`
--

DROP TABLE IF EXISTS `projectconfignames`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projectconfignames` (
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectconfignames`
--

LOCK TABLES `projectconfignames` WRITE;
/*!40000 ALTER TABLE `projectconfignames` DISABLE KEYS */;
INSERT INTO `projectconfignames` VALUES ('6bed46da-fc31-427a-bb4e-74ba6bb29e50','Common'),('933c58a0-430e-4f1f-b955-f7258f9cc0bc','CraftCMS Test'),('e4eac3dd-aba9-4463-ba74-61f77d751978','CraftCMS Test');
/*!40000 ALTER TABLE `projectconfignames` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT 0,
  `priority` int(11) unsigned NOT NULL DEFAULT 1024,
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT 0,
  `progressLabel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT 0,
  `dateFailed` datetime DEFAULT NULL,
  `error` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_buxkwztxyqbdfxsgxqxwxqlnzalhwlmhagfn` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `idx_qibcmzmnuhkowhsaxskzzibrdydhxcxbadkw` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relations`
--

DROP TABLE IF EXISTS `relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_wuyjfldnuwwlhydfbnudjvpswkfrecjxkgzy` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `idx_sjmtwqrohgvfspzlzuciswcunamvxgaysosl` (`sourceId`),
  KEY `idx_kubxghoroazojjnuqfoondcjqfzozvehescc` (`targetId`),
  KEY `idx_mzgfxmgsvhtonrnteioxoxljnasabbgnrseb` (`sourceSiteId`),
  CONSTRAINT `fk_dpqfdihtypperkzriavmzycwzjfmcfosdarl` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_uzbwoaeibqlxmliplisuubfkddesgqbtsmra` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_vqpsndrzkzopkfnqpjfptsakglkbljrkfihz` FOREIGN KEY (`targetId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vzzvuapalmldxklwwuwajymtrofvmdzpsguf` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relations`
--

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resourcepaths`
--

DROP TABLE IF EXISTS `resourcepaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resourcepaths` (
  `hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resourcepaths`
--

LOCK TABLES `resourcepaths` WRITE;
/*!40000 ALTER TABLE `resourcepaths` DISABLE KEYS */;
INSERT INTO `resourcepaths` VALUES ('10344b9e','@bower/jquery/dist'),('1bbbce3','@lib/velocity'),('1d9c130b','@lib/jquery.payment'),('354b4bc3','@craft/web/assets/dashboard/dist'),('3fa4e06b','@lib/element-resize-detector'),('45c5670f','@lib/axios'),('4f122746','@lib/jquery-ui'),('731d504c','@craft/web/assets/craftsupport/dist'),('847676e7','@lib/fileupload'),('88d549f0','@lib/iframe-resizer'),('923b5748','@lib/d3'),('9b3a4bdb','@lib/jquery-touch-events'),('9c9e7719','@lib/picturefill'),('a18640ce','@lib/garnishjs'),('b4c094f0','@lib/fabric'),('c28c1e17','@lib/xregexp'),('c3b32402','@craft/web/assets/installer/dist'),('c8e05a9d','@lib/selectize'),('cecf7fd4','@craft/web/assets/cp/dist'),('d143fd81','@lib/datepicker-i18n'),('d4b1a645','@craft/web/assets/updateswidget/dist'),('ea0be42b','@craft/web/assets/recententries/dist');
/*!40000 ALTER TABLE `resourcepaths` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `revisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sourceId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `notes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_szvwzqwlytmuraxxgmqtdmlyqzqwhymaxyzw` (`sourceId`,`num`),
  KEY `fk_brwxvobzdcyainiejhcjlxvhykhzfvexmwwb` (`creatorId`),
  CONSTRAINT `fk_brwxvobzdcyainiejhcjlxvhykhzfvexmwwb` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_oizyycjwcwzzbzmwtpxctuwfhsfqjcyfurhb` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `searchindex`
--

DROP TABLE IF EXISTS `searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `idx_hrsfiwdrwkkgzzatavylwrdxtbiuznpehqjx` (`keywords`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
INSERT INTO `searchindex` VALUES (1,'email',0,1,' craftcmstest mailinator com '),(1,'firstname',0,1,''),(1,'fullname',0,1,''),(1,'lastname',0,1,''),(1,'slug',0,1,''),(1,'username',0,1,' craftcmstest ');
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('single','channel','structure') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT 0,
  `propagationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'all',
  `previewTargets` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_wexjopstmnpfiezozmbnoqrrbekbvoelpclf` (`handle`),
  KEY `idx_rjhohidfvvkxiwshahrwtelbomlxhjarwvsj` (`name`),
  KEY `idx_wujldkssmqrwbpmkorqnjwatzluewqljgqjw` (`structureId`),
  KEY `idx_bzbaazxpobgmubpbxjmbpnsofmxvuipbsiye` (`dateDeleted`),
  CONSTRAINT `fk_didghunyoulyyuqnsybbeewgbhnijkglmtiu` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections_sites`
--

DROP TABLE IF EXISTS `sections_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `uriFormat` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ivscbibnhqbcqgwnyysqkbgxkwjjvhbhzqnt` (`sectionId`,`siteId`),
  KEY `idx_cphdypirwxofoikzuxyccahuyhzgnfzomlpd` (`siteId`),
  CONSTRAINT `fk_cvlgiskwypabvfvbykesxsfxjzfpshymcyzo` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_dxiwdetylooaoookzwrlakmllbyfvgqysehv` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections_sites`
--

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `sections_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequences`
--

DROP TABLE IF EXISTS `sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequences` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `next` int(11) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequences`
--

LOCK TABLES `sequences` WRITE;
/*!40000 ALTER TABLE `sequences` DISABLE KEYS */;
/*!40000 ALTER TABLE `sequences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `token` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_tuyqenowsnwyqgkbzqtvmionbuznjvalejgs` (`uid`),
  KEY `idx_zernxflrrtnnildewkshuvozhafkvqovyekh` (`token`),
  KEY `idx_luvkbewopttutctqcviwrnfjcfdvgffryiuk` (`dateUpdated`),
  KEY `idx_jhdkmvskhrdrjfvbbcxmlkzwvubmucrppukr` (`userId`),
  CONSTRAINT `fk_fmgtxsiynpaksywlnuyweikptnzdodhwqshg` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES (1,1,'SmRTo5_HxF7Dbk3cdJ_xU03Cxpv_b7HYiNGJaAgAU3kaiMnIOusA-fhtQsXFilWG6qYeT-6a3xeHOkfV2h_HQ8yPWOn3CoDODjet','2021-03-10 05:01:00','2021-03-10 05:01:20','1bee4eac-64d8-4b4d-af9a-7d7cb4e77aff');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shunnedmessages`
--

DROP TABLE IF EXISTS `shunnedmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shunnedmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_pnpaylpoetbngmolpetmxpwktfjvtgkcvnln` (`userId`,`message`),
  CONSTRAINT `fk_phaxteerlipfintyskldfjxetqxqowbwvngd` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shunnedmessages`
--

LOCK TABLES `shunnedmessages` WRITE;
/*!40000 ALTER TABLE `shunnedmessages` DISABLE KEYS */;
/*!40000 ALTER TABLE `shunnedmessages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sitegroups`
--

DROP TABLE IF EXISTS `sitegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sitegroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_hufthzhbfqowxhbuwrjfvqtebghxjjnnkjlm` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sitegroups`
--

LOCK TABLES `sitegroups` WRITE;
/*!40000 ALTER TABLE `sitegroups` DISABLE KEYS */;
INSERT INTO `sitegroups` VALUES (1,'CraftCMS Test','2021-03-10 05:00:58','2021-03-10 05:00:58',NULL,'933c58a0-430e-4f1f-b955-f7258f9cc0bc');
/*!40000 ALTER TABLE `sitegroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `language` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 0,
  `baseUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_jxxcfqiqzjbcfteabbhxtrcrsrmddsgqhdor` (`dateDeleted`),
  KEY `idx_jzoqpdkpveuwcrolwlzmtponwiiwucerpvmu` (`handle`),
  KEY `idx_kpifdeenfzmypsscbutgmsckwfbsolrahowe` (`sortOrder`),
  KEY `fk_znfaiobfmktfllcdjwibzgwtjtwnqfhrgwcj` (`groupId`),
  CONSTRAINT `fk_znfaiobfmktfllcdjwibzgwtjtwnqfhrgwcj` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
INSERT INTO `sites` VALUES (1,1,1,1,'CraftCMS Test','default','pt',1,'$PRIMARY_SITE_URL',1,'2021-03-10 05:00:58','2021-03-10 05:00:58',NULL,'e4eac3dd-aba9-4463-ba74-61f77d751978');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `structureelements`
--

DROP TABLE IF EXISTS `structureelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structureelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) unsigned DEFAULT NULL,
  `lft` int(11) unsigned NOT NULL,
  `rgt` int(11) unsigned NOT NULL,
  `level` smallint(6) unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_akpxinzohektploimuoklptgrzehulfygdcz` (`structureId`,`elementId`),
  KEY `idx_kojzuwszzgdetuogcvfjcuevtkdxiseshnql` (`root`),
  KEY `idx_ilhfipslxgmsiabstkltpjbazdjtajriobaf` (`lft`),
  KEY `idx_eookmeshhhuvnpbsgiurxxktibyuewnmtcgx` (`rgt`),
  KEY `idx_adgccxgiiqxcabbvrxqybkspwtatfoboasbp` (`level`),
  KEY `idx_umkkbgqxmvyvahiucbnurktkmtrsmtxxkrvg` (`elementId`),
  CONSTRAINT `fk_gptgrlspqtrjmmyvctfuczezftiyruaihill` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xonatazpcdamaumbeoymrvxtxiqawoigvwny` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `structureelements`
--

LOCK TABLES `structureelements` WRITE;
/*!40000 ALTER TABLE `structureelements` DISABLE KEYS */;
/*!40000 ALTER TABLE `structureelements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `structures`
--

DROP TABLE IF EXISTS `structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_vvasdlpcinrkdsvevqhdkfwkczjmymscnhdm` (`dateDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `structures`
--

LOCK TABLES `structures` WRITE;
/*!40000 ALTER TABLE `structures` DISABLE KEYS */;
/*!40000 ALTER TABLE `structures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `systemmessages`
--

DROP TABLE IF EXISTS `systemmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systemmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subject` text COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_bkszqhfvbzlcfvckvrezbsdddxhzlkhvzhgb` (`key`,`language`),
  KEY `idx_edwvvxaatsaitlmabkwnnfwcjjalcnlhromv` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `systemmessages`
--

LOCK TABLES `systemmessages` WRITE;
/*!40000 ALTER TABLE `systemmessages` DISABLE KEYS */;
/*!40000 ALTER TABLE `systemmessages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taggroups`
--

DROP TABLE IF EXISTS `taggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_subepcbhrwnbedapmtnmqootoorbvgzkjxma` (`name`),
  KEY `idx_kfeiproiadqmpceohwckkimikbknpxdlfbxy` (`handle`),
  KEY `idx_qhxzuaqgxqwplywvlenhxpdpfhfqxxddlbot` (`dateDeleted`),
  KEY `fk_prsfcjokcquiddolginjbmprymqmrvlqrfjt` (`fieldLayoutId`),
  CONSTRAINT `fk_prsfcjokcquiddolginjbmprymqmrvlqrfjt` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggroups`
--

LOCK TABLES `taggroups` WRITE;
/*!40000 ALTER TABLE `taggroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `taggroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_wjawvqybwnzuhmnusgszmpwmesalqgrcvupm` (`groupId`),
  CONSTRAINT `fk_wkehcmthykynbkexnjgddcajrfbltwwbgdbl` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zbsowtohkhvrenxitcuaaisgigavrqebvrwo` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templatecacheelements`
--

DROP TABLE IF EXISTS `templatecacheelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templatecacheelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cacheId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_xeoochkjekdyijxzcudhpyhjqbrwbszkfwut` (`cacheId`),
  KEY `idx_furhtkpyzymiqbiqmtqldqqsbmxrmszgzxfk` (`elementId`),
  CONSTRAINT `fk_hyjkexwbjuahqfaoshzydvtxkspnvuaoqspy` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_kxltzyxdgkytmotgqsslykhkrkvjiujevfux` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templatecacheelements`
--

LOCK TABLES `templatecacheelements` WRITE;
/*!40000 ALTER TABLE `templatecacheelements` DISABLE KEYS */;
/*!40000 ALTER TABLE `templatecacheelements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templatecachequeries`
--

DROP TABLE IF EXISTS `templatecachequeries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templatecachequeries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cacheId` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `query` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_zuefchnutevklhtlhwklxndavjeajvlbumwa` (`cacheId`),
  KEY `idx_tmfqjbpfdwjccgfbjyqxbaltcgrfivyivqzb` (`type`),
  CONSTRAINT `fk_cenvuwhsfyvenymksktwphorifnncqrpbfty` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templatecachequeries`
--

LOCK TABLES `templatecachequeries` WRITE;
/*!40000 ALTER TABLE `templatecachequeries` DISABLE KEYS */;
/*!40000 ALTER TABLE `templatecachequeries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templatecaches`
--

DROP TABLE IF EXISTS `templatecaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templatecaches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteId` int(11) NOT NULL,
  `cacheKey` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `body` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_odppnalyhnzprbrexetqipkxmbccdoqnvyoz` (`cacheKey`,`siteId`,`expiryDate`,`path`),
  KEY `idx_zbitfvefmuonugrljidzvjifgpznnvnyzmxr` (`cacheKey`,`siteId`,`expiryDate`),
  KEY `idx_lkqfyhwiytjkkjyjnpztccpodvpokyjovsaw` (`siteId`),
  CONSTRAINT `fk_lnxlpebwdxnmfrgdrdruuefcuiobsljdyniv` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templatecaches`
--

LOCK TABLES `templatecaches` WRITE;
/*!40000 ALTER TABLE `templatecaches` DISABLE KEYS */;
/*!40000 ALTER TABLE `templatecaches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `route` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `usageLimit` tinyint(3) unsigned DEFAULT NULL,
  `usageCount` tinyint(3) unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_mbbeguduscboudxaqkaasuinsdkvjyuqcmgj` (`token`),
  KEY `idx_gqfeqrccgcjfdvptacvpxltmsbsbhdmakqlk` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroups`
--

DROP TABLE IF EXISTS `usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_vtjjfalkqkajreffcrfxdecmiypfsacknfbs` (`handle`),
  KEY `idx_dyarxfrnyxzbxyexetoegyvphprnmhxnokgt` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroups`
--

LOCK TABLES `usergroups` WRITE;
/*!40000 ALTER TABLE `usergroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroups_users`
--

DROP TABLE IF EXISTS `usergroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_kpnrnehvkwkdycwvemighguwqfgthlapmgrs` (`groupId`,`userId`),
  KEY `idx_awcokkuxkmayxcrchwnbeynzuwynogjulgnz` (`userId`),
  CONSTRAINT `fk_dxhmrodlouprzrylwfdjxsjasispeiiubbxi` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_jdlfokgfdxespcihiaekkbcxkorrblrrauvf` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroups_users`
--

LOCK TABLES `usergroups_users` WRITE;
/*!40000 ALTER TABLE `usergroups_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergroups_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpermissions`
--

DROP TABLE IF EXISTS `userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_zpgzriwsjybguacjjioukdxtvqnanxqlujgg` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpermissions`
--

LOCK TABLES `userpermissions` WRITE;
/*!40000 ALTER TABLE `userpermissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `userpermissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpermissions_usergroups`
--

DROP TABLE IF EXISTS `userpermissions_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_rnfwionfhwwjtbgumzqjftwweprdjnpwnsyb` (`permissionId`,`groupId`),
  KEY `idx_swkhkzzxrijyclhdjjvexescedpnbgiijinn` (`groupId`),
  CONSTRAINT `fk_vtiirpyweqlywpckhntwrsilqdyzhvyfxdqq` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xkdmvbdzeaofiyodbozlcrxfromxdmctpolj` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpermissions_usergroups`
--

LOCK TABLES `userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `userpermissions_usergroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpermissions_users`
--

DROP TABLE IF EXISTS `userpermissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_hfqfocawsxjoiixdcujplyobgkkoeqknshut` (`permissionId`,`userId`),
  KEY `idx_sftovrtnvqpwczggmwhvlcsjkqtkvcrdahqx` (`userId`),
  CONSTRAINT `fk_lxzzamncsgikpoomfbwgcflwegjxjfesbjaa` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_sicbzztbrztgxcdmpcykwrkcfpfocdysumau` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpermissions_users`
--

LOCK TABLES `userpermissions_users` WRITE;
/*!40000 ALTER TABLE `userpermissions_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `userpermissions_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpreferences`
--

DROP TABLE IF EXISTS `userpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpreferences` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `preferences` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`userId`),
  CONSTRAINT `fk_gejahaauwffejfpcezokacvvhpaszesmiknu` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpreferences`
--

LOCK TABLES `userpreferences` WRITE;
/*!40000 ALTER TABLE `userpreferences` DISABLE KEYS */;
INSERT INTO `userpreferences` VALUES (1,'{\"language\":\"pt\"}');
/*!40000 ALTER TABLE `userpreferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `photoId` int(11) DEFAULT NULL,
  `firstName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT 0,
  `locked` tinyint(1) NOT NULL DEFAULT 0,
  `suspended` tinyint(1) NOT NULL DEFAULT 0,
  `pending` tinyint(1) NOT NULL DEFAULT 0,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT 0,
  `verificationCode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT 0,
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_mdxyvoclhjsnuqgoloddcmppknmvnyseienb` (`uid`),
  KEY `idx_cahhtgutikbvzoebzosspwjkuldmmhrlwkqs` (`verificationCode`),
  KEY `idx_mzjluakqvxixhoyvjwhuwfjlvbszzxfdgcpf` (`email`),
  KEY `idx_uokhstmbzirlciugywyefresnsvsjuoczhuu` (`username`),
  KEY `fk_lmuuurabyfihmesuqacnejlrxqqoxmynbzoo` (`photoId`),
  CONSTRAINT `fk_lmuuurabyfihmesuqacnejlrxqqoxmynbzoo` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_nhuhtodhxpxhvhmmpkhnlwndkqqfjaadtzzh` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'craftcmstest',NULL,NULL,NULL,'craftcmstest@mailinator.com','$2y$13$r/kjM4wuGuRo80wit2t69OCJFLC1q7dulbJ3dFC.0gXy4DBD3u2KW',1,0,0,0,'2021-03-10 05:01:00',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'2021-03-10 05:00:59','2021-03-10 05:00:59','2021-03-10 05:01:05','4c4e5b1c-e41c-4013-9665-a29624308e4d');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volumefolders`
--

DROP TABLE IF EXISTS `volumefolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumefolders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_hiciskquswghasgifhwkzemwjnucqdplptrl` (`name`,`parentId`,`volumeId`),
  KEY `idx_btwmhafudtrjrhcrpvysvgpulglpmljhsqkg` (`parentId`),
  KEY `idx_zwqixqfhekclyqohkydcbpwckxjojhdqrfcy` (`volumeId`),
  CONSTRAINT `fk_igjbpdmfmuztwnjyyhiehadctihifougnvrc` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_inutksxvpncfuopcfdizfynhtlnnpbqvceqe` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volumefolders`
--

LOCK TABLES `volumefolders` WRITE;
/*!40000 ALTER TABLE `volumefolders` DISABLE KEYS */;
/*!40000 ALTER TABLE `volumefolders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volumes`
--

DROP TABLE IF EXISTS `volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `titleTranslationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_omttpfviflmaytfkwflhhjchxuocgviyvbgk` (`name`),
  KEY `idx_mwremritcpmqyptsdjsgzqrvzxjiisjgylcp` (`handle`),
  KEY `idx_kdwyffwqunxnmykhpcbshcjbgzydukldffzs` (`fieldLayoutId`),
  KEY `idx_ddrabvnovmihjumzrvziqbkbkuicoaclhwjm` (`dateDeleted`),
  CONSTRAINT `fk_cnhzttjhhhgfjcoirmtogkauyzsupqtuinez` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volumes`
--

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;
/*!40000 ALTER TABLE `volumes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `colspan` tinyint(3) DEFAULT NULL,
  `settings` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_fpcubzqwsmonrstbctpunamrnqimxxhvuuqm` (`userId`),
  CONSTRAINT `fk_pqiebcbsgxbyrmjvzcofqppwsxddfyjuhaia` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
INSERT INTO `widgets` VALUES (1,1,'craft\\widgets\\RecentEntries',1,NULL,'{\"siteId\":1,\"section\":\"*\",\"limit\":10}',1,'2021-03-10 05:01:05','2021-03-10 05:01:05','f9685f15-1a34-40a8-92c8-aa753f0263de'),(2,1,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2021-03-10 05:01:05','2021-03-10 05:01:05','4270a25a-ffb4-40ac-b29e-aa240e729573'),(3,1,'craft\\widgets\\Updates',3,NULL,'[]',1,'2021-03-10 05:01:05','2021-03-10 05:01:05','322827c0-c215-48d8-ad85-d8a5c3e7f63d'),(4,1,'craft\\widgets\\Feed',4,NULL,'{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}',1,'2021-03-10 05:01:05','2021-03-10 05:01:05','a92f454f-48fd-4eeb-b1c9-22894e417f7d');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-10  5:28:12
