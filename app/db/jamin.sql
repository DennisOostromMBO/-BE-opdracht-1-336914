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
  `Id`               tinyint UNSIGNEDNOT NULL AUTO_INCREMENT,
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

-- Tabelstructuur voor tabel `product`
DROP TABLE IF EXISTS `Magazijn`;
DROP TABLE IF EXISTS `Product`;

CREATE TABLE IF NOT EXISTS `Product` (
    `Id`              MEDIUMINT UNSIGNED   NOT NULL AUTO_INCREMENT
   ,`Naam`            VARCHAR(255)         NOT NULL
   ,`Barcode`         VARCHAR(13)          NOT NULL
   ,`IsActief`        BIT                  NOT NULL   DEFAULT 1
   ,`Opmerking`       VARCHAR(255)            NULL   DEFAULT NULL
   ,`DatumAangemaakt` Datetime(6)          NOT NULL  
   ,`DatumGewijzigd`  Datetime(6)          NOT NULL   
   ,CONSTRAINT  PK_Porduct_Id              PRIMARY KEY CLUSTERED (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
COMMIT;

CREATE TABLE IF NOT EXISTS `Magazijn` (
   `Id`                    mediumint          UNSIGNED NOT NULL AUTO_INCREMENT
  ,`ProductId`             mediumint          UNSIGNED NOT NULL
  ,`VerpakkingsEenheid`    DECIMAL(4,1)                NOT NULL
  ,`AantalAanwezig`        SMALLINT           UNSIGNED NOT NULL
  ,`IsActief`              BIT                         NOT NULL   DEFAULT 1
  ,`Opmerking`             VARCHAR(255)                    NULL   DEFAULT NULL
  ,`DatumAangemaakt`       Datetime(6)                 NOT NULL  
  ,`DatumGewijzigd`        Datetime(6)                 NOT NULL 
  ,CONSTRAINT              PK_Magazijn_Id     PRIMARY KEY CLUSTERED(Id)
  ,CONSTRAINT              FK_Magazijn_ProductId_Product_Id   FOREIGN KEY (ProductID) REFERENCES Product(Id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `Magazijn` (`ProductId`, `VerpakkingsEenheid`, `AantalAanwezig`, `IsActief`, `Opmerking`, `DatumAangemaakt`, `DatumGewijzigd`) VALUES
 (1,  5,    453, 1, NULL, SYSDATE(6), SYSDATE(6))
,(2,  2.5,  400, 1, NULL, SYSDATE(6), SYSDATE(6))
,(3,  5,    1,   1, NULL, SYSDATE(6), SYSDATE(6))
,(4,  1,    800, 1, NULL, SYSDATE(6), SYSDATE(6))
,(5,  3,    234, 1, NULL, SYSDATE(6), SYSDATE(6))
,(6,  2,    345, 1, NULL, SYSDATE(6), SYSDATE(6))
,(7,  1,    795, 1, NULL, SYSDATE(6), SYSDATE(6))
,(8,  10,   233, 1, NULL, SYSDATE(6), SYSDATE(6))
,(9,  2.5,  123, 1, NULL, SYSDATE(6), SYSDATE(6))
,(10, 3,    0,   1, NULL, SYSDATE(6), SYSDATE(6))
,(11, 12,   367, 1, NULL, SYSDATE(6), SYSDATE(6))
,(12, 1,    467, 1, NULL, SYSDATE(6), SYSDATE(6))
,(13, 5,    20,  1, NULL, SYSDATE(6), SYSDATE(6));




