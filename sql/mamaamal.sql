-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 25 يوليو 2019 الساعة 21:29
-- إصدار الخادم: 10.1.36-MariaDB
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mamaamal`
--

-- --------------------------------------------------------

--
-- بنية الجدول `theadministrator`
--

CREATE TABLE `theadministrator` (
  `AdminNo` int(9) NOT NULL,
  `AdminName` varchar(9) CHARACTER SET utf8 NOT NULL,
  `AdminPassword` varchar(9) CHARACTER SET ucs2 COLLATE ucs2_unicode_ci NOT NULL,
  `theopject_FK` int(9) NOT NULL,
  `theuser_FK` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- بنية الجدول `theopject`
--

CREATE TABLE `theopject` (
  `ObjNo` int(9) NOT NULL,
  `ObjName` varchar(9) CHARACTER SET utf8 NOT NULL,
  `ObjImage` blob NOT NULL,
  `OpjSound` blob NOT NULL,
  `Objtype` varchar(9) CHARACTER SET utf8 NOT NULL,
  `TheUser_FK` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- بنية الجدول `theuser`
--

CREATE TABLE `theuser` (
  `UserID` int(8) NOT NULL,
  `Password` varchar(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `MomsPhoneNo` int(9) NOT NULL,
  `Name` varchar(9) CHARACTER SET utf8 NOT NULL,
  `DateofBrith` date NOT NULL,
  `theobject_FK` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `theadministrator`
--
ALTER TABLE `theadministrator`
  ADD PRIMARY KEY (`AdminNo`),
  ADD KEY `theopject_FK` (`theopject_FK`),
  ADD KEY `theuser_FK` (`theuser_FK`);

--
-- Indexes for table `theopject`
--
ALTER TABLE `theopject`
  ADD PRIMARY KEY (`ObjNo`),
  ADD KEY `TheUser_FK` (`TheUser_FK`);

--
-- Indexes for table `theuser`
--
ALTER TABLE `theuser`
  ADD PRIMARY KEY (`UserID`),
  ADD KEY `theobject_FK` (`theobject_FK`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `theadministrator`
--
ALTER TABLE `theadministrator`
  MODIFY `AdminNo` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `theopject`
--
ALTER TABLE `theopject`
  MODIFY `ObjNo` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `theuser`
--
ALTER TABLE `theuser`
  MODIFY `UserID` int(8) NOT NULL AUTO_INCREMENT;

--
-- قيود الجداول المحفوظة
--

--
-- القيود للجدول `theadministrator`
--
ALTER TABLE `theadministrator`
  ADD CONSTRAINT `theadministrator_ibfk_1` FOREIGN KEY (`theopject_FK`) REFERENCES `theopject` (`ObjNo`),
  ADD CONSTRAINT `theadministrator_ibfk_2` FOREIGN KEY (`theuser_FK`) REFERENCES `theuser` (`UserID`);

--
-- القيود للجدول `theopject`
--
ALTER TABLE `theopject`
  ADD CONSTRAINT `theopject_ibfk_1` FOREIGN KEY (`TheUser_FK`) REFERENCES `theuser` (`UserID`);

--
-- القيود للجدول `theuser`
--
ALTER TABLE `theuser`
  ADD CONSTRAINT `theuser_ibfk_1` FOREIGN KEY (`theobject_FK`) REFERENCES `theopject` (`ObjNo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
