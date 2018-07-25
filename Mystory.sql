-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Feb 04, 2018 at 11:24 PM
-- Server version: 5.6.35
-- PHP Version: 7.0.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Mystory`
--
CREATE DATABASE IF NOT EXISTS `Mystory` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `Mystory`;

-- --------------------------------------------------------

--
-- Table structure for table `AlternateScripts`
--

DROP TABLE IF EXISTS `AlternateScripts`;
CREATE TABLE `AlternateScripts` (
  `OriginalScriptName` varchar(100) NOT NULL,
  `altscriptname` varchar(100) NOT NULL,
  `title` varchar(30) NOT NULL,
  `cast` int(255) NOT NULL,
  `genre` int(11) NOT NULL,
  `username` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Cast`
--

DROP TABLE IF EXISTS `Cast`;
CREATE TABLE `Cast` (
  `scriptname` varchar(100) NOT NULL,
  `character_name` varchar(30) NOT NULL,
  `chID` int(255) NOT NULL,
  `photo` blob,
  `Height` varchar(10) DEFAULT NULL,
  `Weight` varchar(10) DEFAULT NULL,
  `Gender` varchar(15) DEFAULT NULL,
  `Des` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Genre`
--

DROP TABLE IF EXISTS `Genre`;
CREATE TABLE `Genre` (
  `name` varchar(50) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `OriginalScript`
--

DROP TABLE IF EXISTS `OriginalScript`;
CREATE TABLE `OriginalScript` (
  `Title` varchar(50) NOT NULL,
  `cast` int(255) NOT NULL,
  `genre` int(11) NOT NULL,
  `scriptname` varchar(100) NOT NULL,
  `UserName` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `People`
--

DROP TABLE IF EXISTS `People`;
CREATE TABLE `People` (
  `Email` varchar(50) NOT NULL,
  `Pswd` varchar(20) NOT NULL,
  `Username` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `scriptAttributes`
--

DROP TABLE IF EXISTS `scriptAttributes`;
CREATE TABLE `scriptAttributes` (
  `scriptname` varchar(100) NOT NULL,
  `likes` int(11) NOT NULL DEFAULT '0',
  `commnets` int(11) NOT NULL DEFAULT '0',
  `dislikes` int(11) NOT NULL DEFAULT '0',
  `noviews` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ScriptComments`
--

DROP TABLE IF EXISTS `ScriptComments`;
CREATE TABLE `ScriptComments` (
  `UserName` varchar(10) NOT NULL,
  `scriptname` varchar(100) NOT NULL,
  `Comments` varchar(100) NOT NULL,
  `Times` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Scriptlikes`
--

DROP TABLE IF EXISTS `Scriptlikes`;
CREATE TABLE `Scriptlikes` (
  `scriptname` varchar(100) NOT NULL,
  `username` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `AlternateScripts`
--
ALTER TABLE `AlternateScripts`
  ADD PRIMARY KEY (`altscriptname`),
  ADD KEY `OriginalScriptName` (`OriginalScriptName`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `Cast`
--
ALTER TABLE `Cast`
  ADD PRIMARY KEY (`scriptname`,`chID`),
  ADD KEY `scriptname` (`scriptname`);

--
-- Indexes for table `Genre`
--
ALTER TABLE `Genre`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `OriginalScript`
--
ALTER TABLE `OriginalScript`
  ADD PRIMARY KEY (`scriptname`),
  ADD KEY `UserName` (`UserName`);

--
-- Indexes for table `People`
--
ALTER TABLE `People`
  ADD PRIMARY KEY (`Email`),
  ADD UNIQUE KEY `Username` (`Username`);

--
-- Indexes for table `scriptAttributes`
--
ALTER TABLE `scriptAttributes`
  ADD PRIMARY KEY (`scriptname`),
  ADD KEY `scriptname` (`scriptname`);

--
-- Indexes for table `ScriptComments`
--
ALTER TABLE `ScriptComments`
  ADD PRIMARY KEY (`UserName`,`scriptname`,`Times`),
  ADD KEY `UserName` (`UserName`),
  ADD KEY `scriptname` (`scriptname`);

--
-- Indexes for table `Scriptlikes`
--
ALTER TABLE `Scriptlikes`
  ADD PRIMARY KEY (`scriptname`,`username`),
  ADD KEY `scriptname` (`scriptname`),
  ADD KEY `username` (`username`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `AlternateScripts`
--
ALTER TABLE `AlternateScripts`
  ADD CONSTRAINT `alternatescripts_ibfk_1` FOREIGN KEY (`OriginalScriptName`) REFERENCES `OriginalScript` (`scriptname`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `alternatescripts_ibfk_2` FOREIGN KEY (`username`) REFERENCES `People` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Cast`
--
ALTER TABLE `Cast`
  ADD CONSTRAINT `cast_ibfk_1` FOREIGN KEY (`scriptname`) REFERENCES `OriginalScript` (`scriptname`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `OriginalScript`
--
ALTER TABLE `OriginalScript`
  ADD CONSTRAINT `originalscript_ibfk_1` FOREIGN KEY (`UserName`) REFERENCES `People` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `scriptAttributes`
--
ALTER TABLE `scriptAttributes`
  ADD CONSTRAINT `scriptattributes_ibfk_1` FOREIGN KEY (`scriptname`) REFERENCES `OriginalScript` (`scriptname`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `scriptattributes_ibfk_2` FOREIGN KEY (`scriptname`) REFERENCES `AlternateScripts` (`altscriptname`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ScriptComments`
--
ALTER TABLE `ScriptComments`
  ADD CONSTRAINT `scriptcomments_ibfk_1` FOREIGN KEY (`scriptname`) REFERENCES `OriginalScript` (`scriptname`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `scriptcomments_ibfk_2` FOREIGN KEY (`scriptname`) REFERENCES `AlternateScripts` (`altscriptname`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `scriptcomments_ibfk_3` FOREIGN KEY (`UserName`) REFERENCES `People` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Scriptlikes`
--
ALTER TABLE `Scriptlikes`
  ADD CONSTRAINT `scriptlikes_ibfk_1` FOREIGN KEY (`scriptname`) REFERENCES `OriginalScript` (`scriptname`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `scriptlikes_ibfk_2` FOREIGN KEY (`username`) REFERENCES `People` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `scriptlikes_ibfk_3` FOREIGN KEY (`scriptname`) REFERENCES `AlternateScripts` (`altscriptname`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
