-- phpMyAdmin SQL Dump
-- version 4.2.0
-- http://www.phpmyadmin.net
--
-- Värd: localhost
-- Tid vid skapande: 01 dec 2014 kl 12:52
-- Serverversion: 5.6.17
-- PHP-version: 5.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Databas: `Bookstore22`
--

-- --------------------------------------------------------

--
-- Tabellstruktur `authors`
--

CREATE TABLE IF NOT EXISTS `authors` (
`authorsID` int(11) NOT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellstruktur `books`
--

CREATE TABLE IF NOT EXISTS `books` (
  `ISBN` bigint(13) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `authorsID` int(11) DEFAULT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellstruktur `booksByShelves`
--

CREATE TABLE IF NOT EXISTS `booksByShelves` (
  `ISBN` bigint(13) NOT NULL,
  `shelfID` varchar(255) NOT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellstruktur `deliveries`
--

CREATE TABLE IF NOT EXISTS `deliveries` (
`deliveryID` int(11) NOT NULL,
  `deliveryDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellstruktur `deliveryRow`
--

CREATE TABLE IF NOT EXISTS `deliveryRow` (
  `deliveryID` int(11) NOT NULL,
  `price` int(11) DEFAULT NULL,
  `ISBN` bigint(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellstruktur `saleRow`
--

CREATE TABLE IF NOT EXISTS `saleRow` (
  `saleID` int(11) NOT NULL,
  `ISBN` bigint(13) NOT NULL,
  `price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellstruktur `sales`
--

CREATE TABLE IF NOT EXISTS `sales` (
`saleID` int(11) NOT NULL,
  `saleDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellstruktur `shelves`
--

CREATE TABLE IF NOT EXISTS `shelves` (
  `shelfID` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index för dumpade tabeller
--

--
-- Index för tabell `authors`
--
ALTER TABLE `authors`
 ADD PRIMARY KEY (`authorsID`);

--
-- Index för tabell `books`
--
ALTER TABLE `books`
 ADD PRIMARY KEY (`ISBN`), ADD KEY `authorsID` (`authorsID`);

--
-- Index för tabell `booksByShelves`
--
ALTER TABLE `booksByShelves`
 ADD KEY `ISBN` (`ISBN`), ADD KEY `shelfID` (`shelfID`);

--
-- Index för tabell `deliveries`
--
ALTER TABLE `deliveries`
 ADD PRIMARY KEY (`deliveryID`);

--
-- Index för tabell `deliveryRow`
--
ALTER TABLE `deliveryRow`
 ADD KEY `deliveryID` (`deliveryID`), ADD KEY `ISBN` (`ISBN`);

--
-- Index för tabell `saleRow`
--
ALTER TABLE `saleRow`
 ADD KEY `saleID` (`saleID`), ADD KEY `ISBN` (`ISBN`);

--
-- Index för tabell `sales`
--
ALTER TABLE `sales`
 ADD PRIMARY KEY (`saleID`);

--
-- Index för tabell `shelves`
--
ALTER TABLE `shelves`
 ADD PRIMARY KEY (`shelfID`), ADD UNIQUE KEY `shelfID` (`shelfID`);

--
-- AUTO_INCREMENT för dumpade tabeller
--

--
-- AUTO_INCREMENT för tabell `authors`
--
ALTER TABLE `authors`
MODIFY `authorsID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT för tabell `deliveries`
--
ALTER TABLE `deliveries`
MODIFY `deliveryID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT för tabell `sales`
--
ALTER TABLE `sales`
MODIFY `saleID` int(11) NOT NULL AUTO_INCREMENT;
--
-- Restriktioner för dumpade tabeller
--

--
-- Restriktioner för tabell `books`
--
ALTER TABLE `books`
ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`authorsID`) REFERENCES `authors` (`authorsID`);

--
-- Restriktioner för tabell `booksByShelves`
--
ALTER TABLE `booksByShelves`
ADD CONSTRAINT `booksbyshelves_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `books` (`ISBN`),
ADD CONSTRAINT `booksbyshelves_ibfk_2` FOREIGN KEY (`shelfID`) REFERENCES `shelves` (`shelfID`);

--
-- Restriktioner för tabell `deliveryRow`
--
ALTER TABLE `deliveryRow`
ADD CONSTRAINT `deliveryrow_ibfk_1` FOREIGN KEY (`deliveryID`) REFERENCES `deliveries` (`deliveryID`),
ADD CONSTRAINT `deliveryrow_ibfk_2` FOREIGN KEY (`ISBN`) REFERENCES `books` (`ISBN`);

--
-- Restriktioner för tabell `saleRow`
--
ALTER TABLE `saleRow`
ADD CONSTRAINT `salerow_ibfk_1` FOREIGN KEY (`saleID`) REFERENCES `sales` (`saleID`),
ADD CONSTRAINT `salerow_ibfk_2` FOREIGN KEY (`ISBN`) REFERENCES `books` (`ISBN`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
