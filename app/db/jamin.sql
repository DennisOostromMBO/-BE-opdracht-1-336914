-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Gegenereerd op: 26 sep 2024 om 09:49
-- Serverversie: 9.0.1
-- PHP-versie: 8.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jamin`
--
CREATE DATABASE IF NOT EXISTS `jamin` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `jamin`;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `country`
--

DROP TABLE IF EXISTS `country`;
CREATE TABLE IF NOT EXISTS `country` (
  `Id`          int UNSIGNED NOT NULL AUTO_INCREMENT,
  `Name`        varchar(250) NOT NULL,
  `CapitalCity` varchar(250) NOT NULL,
  `Continent`   varchar(250) NOT NULL,
  `Population`  int UNSIGNED NOT NULL,
  `Zipcode`     varchar(6)   NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `country`
--

INSERT INTO `country` (`Id`, `Name`, `CapitalCity`, `Continent`, `Population`, `Zipcode`) VALUES
(2, 'Tanzania', 'Dodoma', 'Afrika', 63590000, '1234SD'),
(4, 'Japan', 'Tokio', 'Azi&euml;', 125700000, '2345BA'),
(5, 'Zwitserlandd', 'Bern', 'Europa', 8703000, '6712AS'),
(6, 'Noorwegen', 'Oslo', 'Europa', 5550203, '6782BA'),
(11, 'Litouwen', 'Vilnius', 'Europa', 340000000, '3456AZ'),
(15, 'Marokko', 'Rabat', 'Afrika', 37500000, '8132AS'),
(16, 'Nepal', 'Kathmandu', 'Azi&euml;', 30000000, '6789BA'),
(17, 'Chili', 'Santiago', 'Zuid-Amerika', 18276870, '3721AB');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `reuzenrad`
--

DROP TABLE IF EXISTS `reuzenrad`;
CREATE TABLE IF NOT EXISTS `reuzenrad` (
  `Id`               tinyint UNSIGNED NOT NULL AUTO_INCREMENT,
  `Naam`             varchar(100)    NOT NULL,
  `Hoogte`           smallint        NOT NULL,
  `Land`             varchar(100)    NOT NULL,
  `Kosten`           int             NOT NULL,
  `AantalPassagiers` int             NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `reuzenrad`
--

INSERT INTO `reuzenrad` (`Id`, `Naam`, `Hoogte`, `Land`, `Kosten`, `AantalPassagiers`) VALUES
(6, 'Ain Dubai', 250, 'Verenigde Arabische Emiraten', 270, 1750),
(7, 'High Roller', 168, 'Verenigde Staten', 203, 1120),
(8, 'Singapore Flyer', 165, 'Singapore', 240, 784),
(9, 'Star of Nanchang', 160, 'China', 57, 480),
(10, 'London Eye', 135, 'Engeland', 65, 320);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `zangeres`
--

DROP TABLE IF EXISTS `zangeres`;
CREATE TABLE IF NOT EXISTS `zangeres` (
  `Id`            tinyint UNSIGNED NOT NULL AUTO_INCREMENT,
  `Naam`          varchar(100)     NOT NULL,
  `NettoWaarde`   smallint         NOT NULL,
  `Land`          varchar(100)     NOT NULL,
  `Mobiel`        varchar(20)      NOT NULL,
  `Leeftijd`      tinyint          NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `zangeres`
--

INSERT INTO `zangeres` (`Id`, `Naam`, `NettoWaarde`, `Land`, `Mobiel`, `Leeftijd`) VALUES
(1, 'Rihanna', 1400, 'Barbados', '+1246240001862400', 36),
(2, 'Madonna', 575, 'Verenigde Staten', '+1 3425 185876', 65),
(3, 'Taylor', 570, 'Verenigde Staten', '+1 5876 236512', 34),
(4, 'Beyoncé', 420, 'Verenigde Staten', '+1 6794908465', 42),
(5, 'Jennifer Lopez', 400, 'Verenigde Staten', '+1 3131 857345', 54);
COMMIT;

-- Verwijder tabellen indien ze al bestaan om fouten te voorkomen
DROP TABLE IF EXISTS `ProductPerAllergeen`;
DROP TABLE IF EXISTS `ProductPerLeverancier`;
DROP TABLE IF EXISTS `Leverancier`;
DROP TABLE IF EXISTS `Magazijn`;
DROP TABLE IF EXISTS `Product`;
DROP TABLE IF EXISTS `Allergeen`;

-- Maak de Allergeen tabel aan
CREATE TABLE IF NOT EXISTS `Allergeen` (
    `Id`          MEDIUMINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `Naam`        VARCHAR(255)       NOT NULL,
    `Omschrijving` VARCHAR(255)      NOT NULL,
    CONSTRAINT PK_Allergeen_Id PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Voeg gegevens toe aan de Allergeen tabel
INSERT INTO `Allergeen` (`Naam`, `Omschrijving`) VALUES
('Gluten', 'Dit product bevat gluten'),
('Gelatine', 'Dit product bevat gelatine'),
('AZO-Kleurstof', 'Dit product bevat AZO-kleurstoffen'),
('Lactose', 'Dit product bevat lactose'),
('Soja', 'Dit product bevat soja');

-- Maak de Product tabel aan
CREATE TABLE IF NOT EXISTS `Product` (
    `Id`              MEDIUMINT UNSIGNED   NOT NULL AUTO_INCREMENT,
    `Naam`            VARCHAR(255)         NOT NULL,
    `Barcode`         VARCHAR(13)          NOT NULL,
    `IsActief`        BIT                  NOT NULL DEFAULT 1,
    `Opmerking`       VARCHAR(255)            NULL DEFAULT NULL,
    `DatumAangemaakt` DATETIME(6)          NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `DatumGewijzigd`  DATETIME(6)          NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
    CONSTRAINT PK_Product_Id PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Voeg gegevens toe aan de Product tabel
INSERT INTO `Product` (`Naam`, `Barcode`, `IsActief`, `Opmerking`, `DatumAangemaakt`, `DatumGewijzigd`) VALUES
('Mintnopjes', '8719587231278', 1, NULL, SYSDATE(6), SYSDATE(6)),
('Schoolkrijt', '8719587326713', 1, NULL, SYSDATE(6), SYSDATE(6)),
('Honingdrop', '8719587327836', 1, NULL, SYSDATE(6), SYSDATE(6)),
('Zure Beren', '8719587321441', 1, NULL, SYSDATE(6), SYSDATE(6)),
('Cola Flesjes', '8719587321237', 1, NULL, SYSDATE(6), SYSDATE(6)),
('Turtles', '8719587322245', 1, NULL, SYSDATE(6), SYSDATE(6)),
('Witte Muizen', '8719587328256', 1, NULL, SYSDATE(6), SYSDATE(6)),
('Reuzen Slangen', '8719587325641', 1, NULL, SYSDATE(6), SYSDATE(6)),
('Zoute Rijen', '8719587322739', 1, NULL, SYSDATE(6), SYSDATE(6)),
('Winegums', '8719587327527', 1, NULL, SYSDATE(6), SYSDATE(6)),
('Drop Munten', '8719587322345', 1, NULL, SYSDATE(6), SYSDATE(6)),
('Kruis Drop', '8719587322265', 1, NULL, SYSDATE(6), SYSDATE(6)),
('Zoute Ruitjes', '8719587323256', 1, NULL, SYSDATE(6), SYSDATE(6));

-- Maak de Magazijn tabel aan
CREATE TABLE IF NOT EXISTS `Magazijn` (
    `Id`                    MEDIUMINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `ProductId`             MEDIUMINT UNSIGNED NOT NULL,
    `VerpakkingsEenheid`    DECIMAL(4,1)       NOT NULL,
    `AantalAanwezig`        SMALLINT UNSIGNED  NOT NULL,
    `IsActief`              BIT                NOT NULL DEFAULT 1,
    `Opmerking`             VARCHAR(255)       NULL DEFAULT NULL,
    `DatumAangemaakt`       DATETIME(6)        NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `DatumGewijzigd`        DATETIME(6)        NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
    CONSTRAINT PK_Magazijn_Id PRIMARY KEY (`Id`),
    CONSTRAINT FK_Magazijn_ProductId_Product_Id FOREIGN KEY (`ProductId`) REFERENCES `Product`(`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Voeg gegevens toe aan de Magazijn tabel
INSERT INTO `Magazijn` (`ProductId`, `VerpakkingsEenheid`, `AantalAanwezig`, `IsActief`, `Opmerking`, `DatumAangemaakt`, `DatumGewijzigd`) VALUES
(1, 5, 453, 1, NULL, SYSDATE(6), SYSDATE(6)),
(2, 2.5, 400, 1, NULL, SYSDATE(6), SYSDATE(6)),
(3, 5, 1, 1, NULL, SYSDATE(6), SYSDATE(6)),
(4, 1, 800, 1, NULL, SYSDATE(6), SYSDATE(6)),
(5, 3, 234, 1, NULL, SYSDATE(6), SYSDATE(6)),
(6, 2, 345, 1, NULL, SYSDATE(6), SYSDATE(6)),
(7, 1, 795, 1, NULL, SYSDATE(6), SYSDATE(6)),
(8, 10, 233, 1, NULL, SYSDATE(6), SYSDATE(6)),
(9, 2.5, 123, 1, NULL, SYSDATE(6), SYSDATE(6)),
(10, 3, 0, 1, NULL, SYSDATE(6), SYSDATE(6)),
(11, 12, 367, 1, NULL, SYSDATE(6), SYSDATE(6)),
(12, 1, 467, 1, NULL, SYSDATE(6), SYSDATE(6)),
(13, 5, 20, 1, NULL, SYSDATE(6), SYSDATE(6));

-- Maak de ProductPerAllergeen tabel aan
CREATE TABLE IF NOT EXISTS `ProductPerAllergeen` (
    `Id`           MEDIUMINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `ProductId`    MEDIUMINT UNSIGNED NOT NULL,
    `AllergeenId`  MEDIUMINT UNSIGNED NOT NULL,
    `IsActief`              BIT                NOT NULL DEFAULT 1,
    `Opmerking`             VARCHAR(255)       NULL DEFAULT NULL,
    `DatumAangemaakt`       DATETIME(6)        NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `DatumGewijzigd`        DATETIME(6)        NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
    CONSTRAINT PK_ProductPerAllergeen_Id PRIMARY KEY (`Id`),
    CONSTRAINT FK_ProductPerAllergeen_ProductId FOREIGN KEY (`ProductId`) REFERENCES `Product`(`Id`) ON DELETE CASCADE,
    CONSTRAINT FK_ProductPerAllergeen_AllergeenId FOREIGN KEY (`AllergeenId`) REFERENCES `Allergeen`(`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Voeg gegevens toe aan de ProductPerAllergeen tabel
INSERT INTO `ProductPerAllergeen` (`ProductId`, `AllergeenId`) VALUES
(1, 1),
(2, 1),
(2, 3),
(3, 4),
(6, 4),
(9, 2),
(9, 5),
(10, 2),
(12, 4),
(13, 1),
(13, 4),
(13, 5);

CREATE TABLE IF NOT EXISTS `Leverancier` (
    `Id`                MEDIUMINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `Naam`              VARCHAR(100)       NOT NULL,
    `ContactPersoon`    VARCHAR(100)       NOT NULL,
    `LeverancierNummer` VARCHAR(20)        NOT NULL,
    `Mobiel`            VARCHAR(15)        NOT NULL,
    `IsActief`              BIT                NOT NULL DEFAULT 1,
    `Opmerking`             VARCHAR(255)       NULL DEFAULT NULL,
    `DatumAangemaakt`       DATETIME(6)        NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `DatumGewijzigd`        DATETIME(6)        NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
    CONSTRAINT PK_Leverancier_Id PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `Leverancier` (`Naam`, `ContactPersoon`, `LeverancierNummer`, `Mobiel`)
VALUES
('Venco', 'Bert van Linge', 'L1029384719', '06-28493827'),
('Astra Sweets', 'Jasper del Monte', 'L1029284315', '06-39398734'),
('Haribo', 'Sven Stalman', 'L1029324748', '06-24383291'),
('Basset', 'Joyce Stelterberg', 'L1023845773', '06-48293823'),
('De Bron', 'Remco Veenstra', 'L1023857736', '06-34291234');


-- Maak de ProductPerLeverancier tabel aan
CREATE TABLE IF NOT EXISTS `ProductPerLeverancier` (
    `Id`                         MEDIUMINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `LeverancierId`              MEDIUMINT UNSIGNED NOT NULL,
    `ProductId`                  MEDIUMINT UNSIGNED NOT NULL,
    `DatumLevering`              DATE               NOT NULL,
    `Aantal`                     INT                NOT NULL,
    `DatumEerstVolgendeLevering` DATE               NOT NULL,
   `IsActief`              BIT                NOT NULL DEFAULT 1,
    `Opmerking`             VARCHAR(255)       NULL DEFAULT NULL,
    `DatumAangemaakt`       DATETIME(6)        NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `DatumGewijzigd`        DATETIME(6)        NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
    CONSTRAINT PK_ProductPerLeverancier_Id PRIMARY KEY (`Id`),
    CONSTRAINT FK_ProductPerLeverancier_ProductId FOREIGN KEY (`ProductId`) REFERENCES `Product`(`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `ProductPerLeverancier` (`LeverancierId`, `ProductId`, `DatumLevering`, `Aantal`, `DatumEerstVolgendeLevering`)
VALUES 
(1, 1, '2024-10-09', 23, '2024-10-16'),
(1, 1, '2024-10-18', 21, '2024-10-25'),
(1, 2, '2024-10-09', 12, '2024-10-16'),
(1, 3, '2024-10-10', 11, '2024-10-17'),
(2, 4, '2024-10-14', 16, '2024-10-21'),
(2, 4, '2024-10-21', 23, '2024-10-28'),
(2, 5, '2024-10-14', 45, '2024-10-21'),
(3, 6, '2024-10-10', 30, '2024-10-17'),
(3, 7, '2024-10-12', 12, '2024-10-19'),
(3, 7, '2024-10-19', 18, '2024-10-26'),
(3, 8, '2024-10-10', 12, '2024-10-17'),
(3, 9, '2024-10-11', 1, '2024-10-18'),
(4, 10, '2024-10-16', NULL, '2024-04-30'),
(5, 11, '2024-10-10', 47, '2024-10-17'),
(5, 11, '2024-10-19', 60, '2024-10-26'),
(5, 12, '2024-10-11', 45, NULL),
(5, 13, '2024-10-12', 23, NULL);










COMMIT;





