-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 27, 2025 at 12:55 PM
-- Server version: 8.0.21
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bookstoredb`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookcategories`
--

DROP TABLE IF EXISTS `bookcategories`;
CREATE TABLE IF NOT EXISTS `bookcategories` (
  `CategoryID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Description` text,
  `CreatedAt` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`CategoryID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `bookcategories`
--

INSERT INTO `bookcategories` (`CategoryID`, `Name`, `Description`, `CreatedAt`) VALUES
(1, 'category a', 'selling the book', '2025-09-26 14:50:08'),
(3, 'english', 'blinding', '2025-09-26 17:29:01');

-- --------------------------------------------------------

--
-- Table structure for table `bookreviews`
--

DROP TABLE IF EXISTS `bookreviews`;
CREATE TABLE IF NOT EXISTS `bookreviews` (
  `ReviewID` int NOT NULL AUTO_INCREMENT,
  `BookID` int NOT NULL,
  `UserID` int NOT NULL,
  `Rating` int DEFAULT NULL,
  `Comment` text,
  `CreatedAt` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ReviewID`),
  KEY `BookID` (`BookID`),
  KEY `UserID` (`UserID`)
) ;

--
-- Dumping data for table `bookreviews`
--

INSERT INTO `bookreviews` (`ReviewID`, `BookID`, `UserID`, `Rating`, `Comment`, `CreatedAt`) VALUES
(1, 1, 12, 2, 'the service you provided need to be mproved please', '2025-09-26 17:12:03'),
(2, 1, 1, 4, 'you did good job', '2025-09-26 17:29:47'),
(3, 1, 1, 4, 'you did good job', '2025-09-26 17:31:55');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
CREATE TABLE IF NOT EXISTS `books` (
  `BookID` int NOT NULL AUTO_INCREMENT,
  `Title` varchar(150) NOT NULL,
  `Description` text,
  `Author` varchar(100) DEFAULT NULL,
  `Genre` varchar(50) DEFAULT NULL,
  `Price` decimal(10,2) NOT NULL,
  `Stock` int DEFAULT '0',
  `CreatedAt` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`BookID`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`BookID`, `Title`, `Description`, `Author`, `Genre`, `Price`, `Stock`, `CreatedAt`) VALUES
(5, 'eng', 'rentin1', 'muyumba', 'kagabo', '12000.00', 100, '2025-09-26 17:16:32'),
(6, 'eng', 'widthraw', 'muyumba', 'kagabo', '12000.00', 100, '2025-09-26 17:16:35');

-- --------------------------------------------------------

--
-- Table structure for table `orderitems`
--

DROP TABLE IF EXISTS `orderitems`;
CREATE TABLE IF NOT EXISTS `orderitems` (
  `OrderItemID` int NOT NULL AUTO_INCREMENT,
  `OrderID` int NOT NULL,
  `BookID` int NOT NULL,
  `Quantity` int NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`OrderItemID`),
  KEY `OrderID` (`OrderID`),
  KEY `BookID` (`BookID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `OrderID` int NOT NULL AUTO_INCREMENT,
  `UserID` int NOT NULL,
  `TotalAmount` decimal(10,2) NOT NULL,
  `OrderDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `Status` varchar(20) DEFAULT 'Pending',
  PRIMARY KEY (`OrderID`),
  KEY `UserID` (`UserID`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`OrderID`, `UserID`, `TotalAmount`, `OrderDate`, `Status`) VALUES
(1, 1, '10000.00', '2025-09-26 17:08:56', 'derivering'),
(2, 1, '10000.00', '2025-09-26 17:12:31', 'deriverin1'),
(3, 100, '10000.00', '2025-09-26 17:12:45', 'good'),
(4, 2, '333.00', '2025-09-26 17:29:20', 'asd');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `UserID` int NOT NULL AUTO_INCREMENT,
  `Username` varchar(50) NOT NULL,
  `PasswordHash` varchar(255) NOT NULL,
  `Role` varchar(20) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `CreatedAt` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UserID`, `Username`, `PasswordHash`, `Role`, `Email`, `CreatedAt`) VALUES
(1, 'mugisha', '123', 'Staff', 'niyigenaeric532gmail.com', NULL),
(4, 'eric', '1234', 'Staff', 'niyige21@gmail.com', '2025-09-26 14:18:01'),
(3, 'dd', '123', 'Admin', 'niyigenaeric', '2025-09-09 13:27:08'),
(5, 'a', '1', 'admin', 'niyigenaeri@gmail.com', '2025-09-17 14:39:15'),
(6, 'eric', '1', 'Staff', 'qwer', '2025-09-26 17:14:50'),
(7, '1', '1', 'Customer', 'qwert', '2025-09-26 17:15:10'),
(8, 'smuel', 'samuel', 'Staff', 'samu', '2025-09-26 17:20:35');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
