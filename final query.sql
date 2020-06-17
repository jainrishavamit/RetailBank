-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 16, 2020 at 09:57 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `retail_banking_db`
--


create database `retail_banking_db`;

use `retail_banking_db`;
-- --------------------------------------------------------

--
-- Table structure for table `account_info`
--

CREATE TABLE `account_info` (
  `AI_Acc_ID` bigint(9) NOT NULL,
  `AI_Cus_ID` bigint(9) NOT NULL,
  `AI_Acc_Type` char(1) NOT NULL,
  `AI_Balance` bigint(12) NOT NULL,
  `AI_Date_of_Creation` datetime NOT NULL DEFAULT current_timestamp(),
  `AI_Last_Updated` datetime NOT NULL DEFAULT current_timestamp(),
  `AI_Status` int(1) NOT NULL DEFAULT 1,
  `AI_Message` varchar(255) DEFAULT NULL,
  `AI_Duration` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `account_info`
--

INSERT INTO `account_info` (`AI_Acc_ID`, `AI_Cus_ID`, `AI_Acc_Type`, `AI_Balance`, `AI_Date_of_Creation`, `AI_Last_Updated`, `AI_Status`, `AI_Message`, `AI_Duration`) VALUES
(100000001, 100000001, 'S', 6000, '2020-06-10 16:04:58', '2020-06-17 01:01:37', 1, '', NULL),
(100000002, 100000003, 'S', 1500, '2020-06-11 16:58:51', '2020-06-17 00:59:56', 1, '', NULL),
(100000003, 100000001, 'C', 15000, '2020-06-11 17:00:23', '2020-06-17 01:01:37', 1, '', NULL),
(100000004, 100000003, 'C', 12000, '2020-06-11 17:01:11', '2020-06-12 17:01:11', 1, '', NULL),
(100000005, 100000002, 'S', 5000, '2020-06-11 17:01:54', '2020-06-11 17:01:54', 0, '', NULL),
(100000006, 100000002, 'C', 4000, '2020-06-11 17:02:33', '2020-06-11 17:02:33', 0, '', NULL);

--
-- Triggers `account_info`
--
DELIMITER $$
CREATE TRIGGER `Update_Account_Last_Updated_Trigger` BEFORE UPDATE ON `account_info` FOR EACH ROW SET New.AI_Last_Updated=CURRENT_TIMESTAMP
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `customer_info`
--

CREATE TABLE `customer_info` (
  `CI_Customer_ID` bigint(9) NOT NULL,
  `CI_Cus_SSN_ID` bigint(9) NOT NULL,
  `CI_Cus_Name` varchar(40) NOT NULL,
  `CI_Cus_Age` int(3) NOT NULL,
  `CI_Cus_Address` varchar(255) NOT NULL,
  `CI_Cus_State` varchar(30) NOT NULL,
  `CI_Cus_City` varchar(20) NOT NULL,
  `CI_isActive` int(1) NOT NULL DEFAULT 1,
  `CI_Message` varchar(255) DEFAULT NULL,
  `CI_Date_of_Creation` datetime DEFAULT current_timestamp(),
  `CI_Last_Updated` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer_info`
--

INSERT INTO `customer_info` (`CI_Customer_ID`, `CI_Cus_SSN_ID`, `CI_Cus_Name`, `CI_Cus_Age`, `CI_Cus_Address`, `CI_Cus_State`, `CI_Cus_City`, `CI_isActive`, `CI_Message`, `CI_Date_of_Creation`, `CI_Last_Updated`) VALUES
(100000001, 102543028, 'Harshal Chaudhary', 32, 'Civil Lines', 'Uttar Pradesh', 'Moradabad', 1, 'customer is active', '2020-06-08 17:03:20', '2020-06-11 17:03:50'),
(100000002, 201452016, 'Mohan Gupta', 28, 'Anand Vihar', 'Madhya Pradesh', 'Bhopal', 0, 'customer is inactive', '2020-06-09 17:03:49', '2020-06-10 17:03:49'),
(100000003, 142015236, 'Shalini Kapoor', 35, 'Ram Ganga Vihar, MDA ', 'Uttar Pradesh', 'Bareilly', 1, 'customer details updated successfully.', '2020-06-09 17:04:10', '2020-06-10 17:04:10'),
(100000017, 20, 'hjksc', 5, '', '', '', 1, NULL, '2020-06-15 21:38:56', '2020-06-17 01:04:53'),
(100000018, 254, 'jcjkc ', 0, '', '', '', 1, NULL, '2020-06-15 21:39:25', '2020-06-15 21:39:25'),
(100000019, 51, 'kmzx', 1, '', '', '', 1, NULL, '2020-06-15 21:39:50', '2020-06-15 21:39:50'),
(100000020, 52, 'ksjdhf', 52, '', '', '', 1, NULL, '2020-06-15 21:45:39', '2020-06-15 21:45:39'),
(100000021, 53, 'ksjdnj', 53, '', '', '', 1, NULL, '2020-06-15 21:45:58', '2020-06-15 21:45:58'),
(100000022, 54, 'skjdh', 54, '', '', '', 1, NULL, '2020-06-15 21:46:22', '2020-06-15 21:46:22'),
(100000023, 55, 'jdj', 55, '', '', '', 1, NULL, '2020-06-15 21:46:47', '2020-06-15 21:46:47'),
(100000024, 56, 'dkdjfh', 56, '', '', '', 1, NULL, '2020-06-15 21:47:02', '2020-06-15 21:47:02');

--
-- Triggers `customer_info`
--
DELIMITER $$
CREATE TRIGGER `Update_Account_Status_Trigger` AFTER UPDATE ON `customer_info` FOR EACH ROW UPDATE account_info SET account_info.AI_Status=NEW.CI_isActive WHERE account_info.AI_Cus_ID=NEW.CI_Customer_ID
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Update_Customer_Last_Updated_Trigger` BEFORE UPDATE ON `customer_info` FOR EACH ROW SET New.CI_Last_Updated=CURRENT_TIMESTAMP
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `L_ID` int(10) NOT NULL,
  `L_Role` varchar(40) NOT NULL,
  `L_Username` varchar(35) NOT NULL,
  `L_Password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`L_ID`, `L_Role`, `L_Username`, `L_Password`) VALUES
(1, 'customer_account_executive', 'Executive', 'Executive@1234'),
(2, 'cashier', 'Cashier_Teller', 'Cashier@1234');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `T_ID` bigint(9) NOT NULL,
  `T_Acc_ID` bigint(9) NOT NULL,
  `T_Transaction_Date` datetime NOT NULL DEFAULT current_timestamp(),
  `T_Source_Acc_Type` char(1) DEFAULT NULL,
  `T_Target_Acc_Type` char(1) DEFAULT NULL,
  `T_Amount` bigint(12) NOT NULL,
  `T_Description` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`T_ID`, `T_Acc_ID`, `T_Transaction_Date`, `T_Source_Acc_Type`, `T_Target_Acc_Type`, `T_Amount`, `T_Description`) VALUES
(100000001, 100000001, '2020-06-12 17:05:51', 'S', 'C', 1000, 'deposit'),
(100000002, 100000001, '2020-06-12 17:06:52', 'C', 'S', 1000, 'withdraw');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_info`
--
ALTER TABLE `account_info`
  ADD PRIMARY KEY (`AI_Acc_ID`),
  ADD KEY `AI_Cus_ID` (`AI_Cus_ID`);

--
-- Indexes for table `customer_info`
--
ALTER TABLE `customer_info`
  ADD PRIMARY KEY (`CI_Customer_ID`),
  ADD UNIQUE KEY `Cus_SSN_ID_index` (`CI_Cus_SSN_ID`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`L_ID`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`T_ID`),
  ADD KEY `T_Cus_ID` (`T_Acc_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_info`
--
ALTER TABLE `account_info`
  MODIFY `AI_Acc_ID` bigint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100000007;

--
-- AUTO_INCREMENT for table `customer_info`
--
ALTER TABLE `customer_info`
  MODIFY `CI_Customer_ID` bigint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100000025;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `L_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `T_ID` bigint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100000004;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account_info`
--
ALTER TABLE `account_info`
  ADD CONSTRAINT `account_info_ibfk_1` FOREIGN KEY (`AI_Cus_ID`) REFERENCES `customer_info` (`CI_Customer_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`T_Acc_ID`) REFERENCES `account_info` (`AI_Acc_ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
