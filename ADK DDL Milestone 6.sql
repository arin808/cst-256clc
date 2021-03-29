-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Mar 29, 2021 at 06:43 AM
-- Server version: 5.7.24
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cst-256`
--
CREATE DATABASE IF NOT EXISTS `cst-256` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `cst-256`;

-- --------------------------------------------------------

--
-- Table structure for table `groupmembers`
--

CREATE TABLE `groupmembers` (
  `groupID` int(11) NOT NULL,
  `memberName` varchar(255) NOT NULL,
  `memberID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `groupmembers`
--

INSERT INTO `groupmembers` (`groupID`, `memberName`, `memberID`) VALUES
(1, 'Arin', 3),
(3, 'Arin', 3),
(4, 'Arin', 3);

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `groupID` int(11) NOT NULL,
  `groupName` varchar(100) NOT NULL,
  `interest` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `description` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`groupID`, `groupName`, `interest`, `type`, `description`) VALUES
(1, 'test', 'coding', 'Business', 'this group likes coding a LOT'),
(3, 'test', 'test for memberview', 'Personal', 'test'),
(4, 'test3', 'coding', 'Personal', 'tesst');

-- --------------------------------------------------------

--
-- Table structure for table `jobapps`
--

CREATE TABLE `jobapps` (
  `appID` int(11) NOT NULL,
  `jobID` int(11) NOT NULL,
  `applicantID` bigint(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jobapps`
--

INSERT INTO `jobapps` (`appID`, `jobID`, `applicantID`) VALUES
(1, 1, 3),
(3, 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `jobID` int(11) NOT NULL,
  `company` varchar(100) NOT NULL,
  `position` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `experience` varchar(100) NOT NULL,
  `skills` varchar(200) NOT NULL,
  `description` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`jobID`, `company`, `position`, `location`, `experience`, `skills`, `description`) VALUES
(1, 'Apple', 'Coffee Guy', 'Texas', 'Intermediate', 'Fast-walker', 'run faster'),
(2, 'Google', 'Coffee guyy', 'san fran', 'Intermediate', 'speed', 'get our coffee');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(5, '2014_10_12_000000_create_users_table', 1),
(6, '2014_10_12_100000_create_password_resets_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `moreinfo`
--

CREATE TABLE `moreinfo` (
  `userID` bigint(20) NOT NULL,
  `age` int(50) NOT NULL,
  `gender` text CHARACTER SET utf8 NOT NULL,
  `phonenumber` bigint(20) NOT NULL,
  `address` varchar(25) CHARACTER SET utf8 NOT NULL,
  `ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `moreinfo`
--

INSERT INTO `moreinfo` (`userID`, `age`, `gender`, `phonenumber`, `address`, `ID`) VALUES
(5, 19, 'Male', 1234567890, 'w street', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `userportfolio`
--

CREATE TABLE `userportfolio` (
  `userID` bigint(20) NOT NULL,
  `portfolioID` int(11) NOT NULL,
  `jobHistory` varchar(250) CHARACTER SET utf8 NOT NULL,
  `jobSkills` varchar(250) CHARACTER SET utf8 NOT NULL,
  `education` varchar(250) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `userportfolio`
--

INSERT INTO `userportfolio` (`userID`, `portfolioID`, `jobHistory`, `jobSkills`, `education`) VALUES
(4, 58, 'asdfa', 'asdfa', 'sdaf'),
(3, 59, 'Pizza Hut', 'Folding Boxes, Multitasking', 'High School Diploma KSM');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(3, 'Arin', 'a@email.com', NULL, '$2y$10$vGaXf97zycoaQst5UhueXONPqwA7Xqzb9Ny7VOf/VRec.iPP4m0Sm', 'admin', 'Q35sxOOLdSLxStsG3MuywISMiPCJdpQQzntjtK4uhipv0pOQxykce6b4v22h', '2021-02-22 11:21:05', '2021-02-22 11:21:05'),
(4, 'Arin4', 'b@email.com', NULL, '$2y$10$KIQ1LrDuBR5UUya2UbtaMuCmQ3veVekh8TOuFRAzN4E10EnM3h/t.', 'customer', NULL, '2021-02-22 11:21:36', '2021-02-22 11:21:36'),
(5, 'Arin Test', 'c@email.com', NULL, '$2y$10$lMdMTEvpSuYFrkSHgJpE/uI5W5XKGYJwC26QAJO.LYoOue4iPQ3p.', 'customer', NULL, '2021-03-29 03:12:50', '2021-03-29 03:12:50');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `groupmembers`
--
ALTER TABLE `groupmembers`
  ADD KEY `group_ID` (`groupID`),
  ADD KEY `group_member_ID` (`memberID`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`groupID`);

--
-- Indexes for table `jobapps`
--
ALTER TABLE `jobapps`
  ADD PRIMARY KEY (`appID`),
  ADD KEY `fk_app_jobID` (`jobID`),
  ADD KEY `fk_app_userID` (`applicantID`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`jobID`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `moreinfo`
--
ALTER TABLE `moreinfo`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_ID` (`userID`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `userportfolio`
--
ALTER TABLE `userportfolio`
  ADD PRIMARY KEY (`portfolioID`),
  ADD KEY `user_port_ID` (`userID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `groupID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `jobapps`
--
ALTER TABLE `jobapps`
  MODIFY `appID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `jobID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `moreinfo`
--
ALTER TABLE `moreinfo`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `userportfolio`
--
ALTER TABLE `userportfolio`
  MODIFY `portfolioID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `groupmembers`
--
ALTER TABLE `groupmembers`
  ADD CONSTRAINT `group_ID` FOREIGN KEY (`groupID`) REFERENCES `groups` (`groupID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `group_member_ID` FOREIGN KEY (`memberID`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jobapps`
--
ALTER TABLE `jobapps`
  ADD CONSTRAINT `fk_app_jobID` FOREIGN KEY (`jobID`) REFERENCES `jobs` (`jobID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_app_userID` FOREIGN KEY (`applicantID`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `moreinfo`
--
ALTER TABLE `moreinfo`
  ADD CONSTRAINT `user_ID` FOREIGN KEY (`userID`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `userportfolio`
--
ALTER TABLE `userportfolio`
  ADD CONSTRAINT `user_port_ID` FOREIGN KEY (`userID`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
