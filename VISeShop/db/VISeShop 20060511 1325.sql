-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.19-nt


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
INSERT INTO `account` (`email`,`street`,`city`,`zipcode`,`country`,`administrator`,`password`,`firstname`,`lastname`) VALUES 
 ('av2@freenet.de','','','','',0,'passwort','Andreas','V'),
 ('enrico.mayer@web.de','Schanzenstr. 18','Philippsburg','76661','Deutschland',1,'geheim','Enrico','Mayer'),
 ('HansDampf@test.net','Dampfgasse 31','Haupstadt','12345','Deutschland',0,'12345','Hans','Dampf'),
 ('jochen@sportriedel.de','Pragerstrasse 28','Hechingen','72379','Deutschland',1,'test','Jochen','Riedel');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;


--
-- Table structure for table `vislabshop`.`commoditygroup`
--

DROP TABLE IF EXISTS `commoditygroup`;
CREATE TABLE `commoditygroup` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(45) NOT NULL default '',
  `description` varchar(1024) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Warengruppe';

--
-- Dumping data for table `vislabshop`.`commoditygroup`
--

/*!40000 ALTER TABLE `commoditygroup` DISABLE KEYS */;
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
  `ordernumber` int(10) unsigned NOT NULL default '0',
  `supplier_id` int(10) unsigned NOT NULL default '0',
  `commoditygroup_id` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `FK_item_1` (`ordernumber`),
  KEY `FK_item_2` (`supplier_id`),
  KEY `FK_item_3` (`commoditygroup_id`),
  CONSTRAINT `FK_item_3` FOREIGN KEY (`commoditygroup_id`) REFERENCES `commoditygroup` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_item_1` FOREIGN KEY (`ordernumber`) REFERENCES `order` (`odernumber`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_item_2` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Artikel; InnoDB free: 3072 kB; (`supplier_id`) REFER `vislab';

--
-- Dumping data for table `vislabshop`.`item`
--

/*!40000 ALTER TABLE `item` DISABLE KEYS */;
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
/*!40000 ALTER TABLE `order` ENABLE KEYS */;


--
-- Table structure for table `vislabshop`.`supplier`
--

DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(64) NOT NULL default '',
  `address` varchar(128) NOT NULL default '',
  `contact` varchar(64) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Lieferant';

--
-- Dumping data for table `vislabshop`.`supplier`
--

/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
