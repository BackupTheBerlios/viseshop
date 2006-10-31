-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.24a-Debian_9-log


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema vislabshop
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ vislabshop;
USE vislabshop;

--
-- Table structure for table `vislabshop`.`account`
--

DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `email` varchar(128) NOT NULL default '',
  `street` varchar(45) default NULL,
  `city` varchar(45) default NULL,
  `zipcode` varchar(45) default NULL,
  `country` varchar(45) default NULL,
  `administrator` tinyint(1) NOT NULL default '0',
  `password` varchar(45) NOT NULL default '',
  `firstname` varchar(45) NOT NULL default '',
  `lastname` varchar(45) NOT NULL default '',
  PRIMARY KEY  (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vislabshop`.`account`
--

/*!40000 ALTER TABLE `account` DISABLE KEYS */;
LOCK TABLES `account` WRITE;
INSERT INTO `account` VALUES  ('av2@freenet.de','','','','',0,'passwort','Andreas','V'),
 ('enrico.mayer@web.de','Schanzenstr. 18','Philippsburg','76661','Deutschland',1,'geheim','Enrico','Mayer'),
 ('HansDampf@test.net','Dampfgasse 31','Haupstadt','12345','Deutschland',0,'12345','Hans','Dampf'),
 ('jochen@sportriedel.de','Pragerstrasse 28','Hechingen','72379','Deutschland',1,'test','Jochen','Riedel');
UNLOCK TABLES;
/*!40000 ALTER TABLE `account` ENABLE KEYS */;


--
-- Table structure for table `vislabshop`.`commoditygroup`
--

DROP TABLE IF EXISTS `commoditygroup`;
CREATE TABLE `commoditygroup` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(45) NOT NULL default '',
  `description` varchar(1024) default NULL,
  `supergroup` int(10) unsigned default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_commoditygroup_1` (`supergroup`),
  CONSTRAINT `FK_commoditygroup_1` FOREIGN KEY (`supergroup`) REFERENCES `commoditygroup` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Warengruppe; InnoDB free: 3072 kB; (`subgroup`) REFER `visla';

--
-- Dumping data for table `vislabshop`.`commoditygroup`
--

/*!40000 ALTER TABLE `commoditygroup` DISABLE KEYS */;
LOCK TABLES `commoditygroup` WRITE;
INSERT INTO `commoditygroup` VALUES  (1,'Tinten, Toner, Farbbänder','Hier finden Sie Tinten, Toner und Farbbänder passend für ihren Drucker oder ihr Faxgerät.',NULL),
 (2,'Hewlett Packard','Tinten für HP Drucker und All-In-One Geräte.',1),
 (3,'Epson','Tinten für Epson Drucker.',1),
 (4,'Canon','Tinte für Canon Drucker.',1),
 (5,'Papier und Folien','Hier finden Sie alle möglichen Papiere und Folien.',NULL),
 (6,'Papier weiß','Weiße Papiere',5),
 (7,'Buntes Papier','Bunte Papiere',5),
 (8,'Inkjetfolien','Folien passend für ihren Tintenstrahler',5),
 (9,'Laserfolien','Folien passend für ihren Laser oder Kopierer',5);
UNLOCK TABLES;
/*!40000 ALTER TABLE `commoditygroup` ENABLE KEYS */;


--
-- Table structure for table `vislabshop`.`item`
--

DROP TABLE IF EXISTS `item`;
CREATE TABLE `item` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(64) NOT NULL default '',
  `current_amount` int(10) unsigned NOT NULL default '0',
  `critical_amount` int(10) unsigned NOT NULL default '0',
  `description` varchar(1024) default NULL,
  `commoditygroup_id` int(10) unsigned NOT NULL default '0',
  `price` float NOT NULL default '0',
  `imgurl` varchar(1024) NOT NULL default 'NULL',
  PRIMARY KEY  (`id`),
  KEY `FK_item_1` (`commoditygroup_id`),
  CONSTRAINT `FK_item_1` FOREIGN KEY (`commoditygroup_id`) REFERENCES `commoditygroup` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Artikel; InnoDB free: 3072 kB; (`supplier_id`) REFER `vislab';

--
-- Dumping data for table `vislabshop`.`item`
--

/*!40000 ALTER TABLE `item` DISABLE KEYS */;
LOCK TABLES `item` WRITE;
INSERT INTO `item` VALUES  (1,'5-Star BCI-3BK schwarz',100,10,'Hersteller:  	5*\r\nFarbe: 	schwarz\r\nAusführung: 	Canon BJC 6000 / BJC 6100\r\nGewicht: 	BCI-3BK\r\nInhalt: 	31 ml\r\nLiefereinheit: 	1 Stück\r\nBJC-3000\r\nBJC-6000\r\nS 400\r\nS 450',4,4.42,'pages/img/tintenpatrone.gif'),
 (2,'5-Star BCI-3C cyan',100,10,'Hersteller:  	5*\r\nFarbe: 	cyan\r\nAusführung: 	Canon BJC 6000 / BJC 6100\r\nGewicht: 	BCI-3C\r\nInhalt: 	17 ml\r\nLiefereinheit: 	1 Stück\r\nBJC-3000\r\nBJC-6000\r\nS 400\r\nS 450',4,4.8,'pages/img/tintenpatrone.gif'),
 (3,'5-Star BCI-3M magenta',100,10,'Hersteller:  	5*\r\nFarbe: 	magenta\r\nAusführung: 	Canon BJC 6000 / BJC 6100\r\nGewicht: 	BCI-3M\r\nInhalt: 	17 ml\r\nLiefereinheit: 	1 Stück\r\nBJC-3000\r\nBJC-6000\r\nS 400\r\nS 450\r\n',4,4.8,'pages/img/tintenpatrone.gif'),
 (4,'5-Star BCI-3Y yellow',100,10,'Hersteller:  	5*\r\nFarbe: 	gelb\r\nAusführung: 	Canon BJC 6000 / BJC 6100\r\nGewicht: 	BCI-3Y\r\nInhalt: 	17 ml\r\nLiefereinheit: 	1 Stück\r\nBJC-3000\r\nBJC-6000\r\nS 400\r\nS 450',4,4.8,'pages/img/tintenpatrone.gif'),
 (5,'Canon 4479A002 Patrone InkJet BCI-3E Bk schwarz',20,5,'Hersteller:  	Canon\r\nHersteller Nr.: 	BCI-3EBk\r\nFarbe: 	schwarz\r\nLiefereinheit: 	1 Stück',4,12.46,'pages/img/tintenpatrone.gif');
INSERT INTO `item` VALUES  (6,'Canon 4480A002 Patrone InkJet BCI-3C BJC 6000 cyan',20,5,'Hersteller:  	Canon\r\nHersteller Nr.: 	BCI-3C\r\nFarbe: 	cyan\r\nLiefereinheit: 	1 Stück\r\nBJC 6000',4,9.91,'pages/img/tintenpatrone.gif'),
 (7,'Canon 4481A002 Patrone InkJet BCI-3M BJC 6000 magenta',20,5,'Hersteller:  	Canon\r\nHersteller Nr.: 	BCI-3M\r\nFarbe: 	magenta\r\nLiefereinheit: 	1 Stück\r\nBJC 6000',4,9.91,'pages/img/tintenpatrone.gif'),
 (8,'Canon 4482A002 Patrone InkJet BCI-3Y BJC 6000 gelb',20,5,'Hersteller:  	Canon\r\nHersteller Nr.: 	BCI-3Y\r\nFarbe: 	gelb\r\nLiefereinheit: 	1 Stück',4,9.91,'pages/img/tintenpatrone.gif'),
 (9,'Canon Druckkopf InkJet BC-30E BJC 6000 schwarz ca. 5.000 Seiten',10,2,'Hersteller:  	Canon\r\nHersteller Nr.: 	BC-30\r\nFarbe: 	schwarz\r\nLiefereinheit: 	1 Stück\r\nBJC 6000.\r\n4608A002\r\nBC30E',4,39.85,'pages/img/tintenpatrone.gif'),
 (10,'Hewlett-Packard Patrone InkJet Nr.15 schwarz 25ml C6615DE',100,10,'Hersteller:  	Hewlett-Packard\r\nHersteller Nr.: 	C6615DE\r\nFarbe: 	schwarz\r\nAusführung: 	25ml\r\nLiefereinheit: 	1 Stück\r\nDeskJet 840 C',2,26.99,'pages/img/tintenpatrone.gif'),
 (11,'Hewlett-Packard Tintenpatrone InkJet Nr.78 farbig 19ml C6578DE',60,8,'Hersteller:  	Hewlett-Packard\r\nHersteller Nr.: 	C6578DE\r\nFarbe: 	farbig cyan magenta gelb\r\nInhalt: 	19ml\r\nLiefereinheit: 	1 Stück\r\nHP Nr. 78 Dreikammer-Farbdruckpatrone (C/M/Y) Nr. 78 (19 ml)\r\nfür HP DeskJet 930C/940C/950C/970Cxi/1220C, OfficeJet G55/G85/G95/K60/K80',2,31.36,'pages/img/tintenpatrone.gif');
INSERT INTO `item` VALUES  (12,'Hewlett-Packard SA310AE Tinten-Kombi-Pack Nr.15 + Nr.78',30,5,'Hersteller:  	Hewlett-Packard\r\nHersteller Nr.: 	SA310AE\r\nFarbe: 	schwarz + CMY\r\nInhalt: 	25ml + 19ml\r\nLiefereinheit: 	1 Packung\r\nDruckkosten sparen im Doppelpack: Je einmal die schwarze HP Patrone Nr.15 (C6615DE) und die Farbpatrone HP Nr.78 (C6578DE).',2,53.84,'pages/img/tintenpatrone.gif'),
 (13,'Brother Tonerset TN11 C/M/Y für HL-4000CN',10,3,'Hersteller:  	Brother\r\nHersteller Nr.: 	TN11\r\nFarbe: 	Cyan, Magenta, Yellow\r\nLiefereinheit: 	3 Toner\r\nTN-11 Toner Set.\r\n\r\nBestehend aus je einer Tonerkartusche cyan, magenta und gelb.\r\n\r\nDruckkapazität pro Toner ca. 6.000 Seiten bei 5% Deckung.',3,451.24,'pages/img/toner.gif'),
 (14,'Brother Toner für HL-4000CN TN-11BK schwarz',20,10,'Hersteller:  	Brother\r\nHersteller Nr.: 	TN11BK\r\nFarbe: 	schwarz\r\nAusführung: 	Brother\r\nInhalt: 	ca. 8500 Seiten bei\r\nLiefereinheit: 	1 Stück\r\nTN-11BK Toner Schwarz für HL-4000CN. Druckkapazität ca. 8.500 Seiten.',3,64.38,'pages/img/toner.gif'),
 (15,'Multifunktionspapier Presentation',100,40,'DIN A4, weiß, 100g, 250 Blatt',6,4.59,'pages/img/papier.jpg');
INSERT INTO `item` VALUES  (16,'Multifunktionspapier Universal A3',30,10,'DIN A3, weiß, 80g, 500 Blatt',6,14.46,'pages/img/papier.jpg'),
 (17,'Multifunktionspapier Universal A4',300,100,'DIN A4, weiß, 80g, 500 Blatt',6,7.23,'pages/img/papier.jpg'),
 (18,'Clairfontaine A4 kirschrot',30,10,'DIN A4, kirschrot, 120g, 250 Blatt',7,8.26,'pages/img/buntespapier.jpg'),
 (19,'Clairfontaine A4 fuchsia',30,10,'DIN A4, fuchsia, 120g, 250 Blatt',7,8.26,'pages/img/buntespapier.jpg'),
 (20,'Clairfontaine A4 sonnengelb',30,10,'DIN A4, sonnengelb, 120g, 250 Blatt',7,8.26,'pages/img/buntespapier.jpg'),
 (21,'3M Kopierfolie DIN A4',10,5,'3M Kopierfolie DIN A4, mit Sensorfilter, 100 Blatt 002280',9,35.55,'pages/img/folien.jpg'),
 (22,'3M InkJet Folie HP-Modelle',20,10,'3M InkJet Folie HP-Modelle, DIN A4, abziehbarer Sensorstreifen, 50 Stück 3460-50',8,45.88,'pages/img/folien.jpg');
UNLOCK TABLES;
/*!40000 ALTER TABLE `item` ENABLE KEYS */;


--
-- Table structure for table `vislabshop`.`order`
--

DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `odernumber` int(10) unsigned NOT NULL auto_increment,
  `delivered` tinyint(1) NOT NULL default '0',
  `total` float default NULL,
  `date` datetime default NULL,
  `email` varchar(128) NOT NULL default '',
  PRIMARY KEY  (`odernumber`),
  KEY `FK_order_1` (`email`),
  CONSTRAINT `FK_order_1` FOREIGN KEY (`email`) REFERENCES `account` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Bestellungen; InnoDB free: 4096 kB; (`acocunt`) REFER `visla';

--
-- Dumping data for table `vislabshop`.`order`
--

/*!40000 ALTER TABLE `order` DISABLE KEYS */;
LOCK TABLES `order` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
