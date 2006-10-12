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
 ('HansDampf@test.net','Dampfgasse 31','Haupstadt','12345','Deutschland',0,'12345','Hans','Dampf'),
 ('jochen@sportriedel.de','Pragerstrasse 28','Hechingen','72379','Deutschland',1,'test','Jochen','Riedel'),
 ('mym22_90@gmx.de','Jos-Niklas-Weg 9','Hechingen','72379','Deutschland',0,'12345','Martina','Maas');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
