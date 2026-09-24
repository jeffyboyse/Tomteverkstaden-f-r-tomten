-- --------------------------------------------------------
-- Värd:                         127.0.0.1
-- Serverversion:                8.0.46 - MySQL Community Server - GPL
-- Server-OS:                    Linux
-- HeidiSQL Version:             12.21.0.7344
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumpar databasstruktur för Tomteverkstaden
CREATE DATABASE IF NOT EXISTS `Tomteverkstaden` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `Tomteverkstaden`;

-- Dumpar struktur för tabell Tomteverkstaden.Address
DROP TABLE IF EXISTS `Address`;
CREATE TABLE IF NOT EXISTS `Address` (
  `AddressID` int NOT NULL AUTO_INCREMENT,
  `POSTNUMMER` int NOT NULL,
  `Address` varchar(100) NOT NULL,
  PRIMARY KEY (`AddressID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumpar data för tabell Tomteverkstaden.Address: ~0 rows (ungefär)

-- Dumpar struktur för tabell Tomteverkstaden.Barn
DROP TABLE IF EXISTS `Barn`;
CREATE TABLE IF NOT EXISTS `Barn` (
  `BarnId` int NOT NULL AUTO_INCREMENT,
  `Namn` varchar(100) NOT NULL,
  `Personnummer` varchar(12) NOT NULL,
  `Snallhet` smallint NOT NULL,
  PRIMARY KEY (`BarnId`),
  CONSTRAINT `chk_snallhet` CHECK ((`Snallhet` between -(100000) and 500000))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumpar data för tabell Tomteverkstaden.Barn: ~0 rows (ungefär)

-- Dumpar struktur för tabell Tomteverkstaden.Land
DROP TABLE IF EXISTS `Land`;
CREATE TABLE IF NOT EXISTS `Land` (
  `Namn` varchar(40) NOT NULL,
  PRIMARY KEY (`Namn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumpar data för tabell Tomteverkstaden.Land: ~0 rows (ungefär)

-- Dumpar struktur för tabell Tomteverkstaden.Onskning
DROP TABLE IF EXISTS `Onskning`;
CREATE TABLE IF NOT EXISTS `Onskning` (
  `OnskningId` int NOT NULL AUTO_INCREMENT,
  `BarnId` int NOT NULL,
  `PresentId` int NOT NULL,
  `Prioritet` tinyint NOT NULL,
  `Given` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`OnskningId`) USING BTREE,
  KEY `FK_Onskning_Present` (`PresentId`),
  KEY `FK_Onskning_Barn` (`BarnId`),
  CONSTRAINT `FK_Onskning_Barn` FOREIGN KEY (`BarnId`) REFERENCES `Barn` (`BarnId`) ON UPDATE CASCADE,
  CONSTRAINT `FK_Onskning_Present` FOREIGN KEY (`PresentId`) REFERENCES `Present` (`PresentId`),
  CONSTRAINT `chk_prio` CHECK ((`Prioritet` between 1 and 10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumpar data för tabell Tomteverkstaden.Onskning: ~0 rows (ungefär)

-- Dumpar struktur för tabell Tomteverkstaden.Present
DROP TABLE IF EXISTS `Present`;
CREATE TABLE IF NOT EXISTS `Present` (
  `PresentId` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`PresentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumpar data för tabell Tomteverkstaden.Present: ~0 rows (ungefär)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
