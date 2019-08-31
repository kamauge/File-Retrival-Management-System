-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 30, 2019 at 09:28 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `frms`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `FullName` varchar(100) DEFAULT NULL,
  `AdminEmail` varchar(120) DEFAULT NULL,
  `UserName` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `updationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `FullName`, `AdminEmail`, `UserName`, `Password`, `updationDate`) VALUES
(1, 'Bruce Wayne', 'brucewayne@gmail.com', 'admin', 'f925916e2754e5e03f75dd58a5733251', '2019-08-30 07:20:45');

-- --------------------------------------------------------

--
-- Table structure for table `tblcategory`
--

CREATE TABLE `tblcategory` (
  `id` int(11) NOT NULL,
  `CategoryName` varchar(150) DEFAULT NULL,
  `Status` int(1) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcategory`
--

INSERT INTO `tblcategory` (`id`, `CategoryName`, `Status`, `CreationDate`, `UpdationDate`) VALUES
(4, 'Articles', 1, '2017-07-04 18:35:25', '2019-08-30 00:19:13'),
(5, 'Technology', 1, '2017-07-04 18:35:39', '2019-08-08 17:13:03'),
(6, 'Newsletters', 1, '2017-07-04 18:35:55', '2019-08-30 00:19:25'),
(7, 'Management', 1, '2017-07-04 18:36:16', '2019-08-30 00:19:31');

-- --------------------------------------------------------

--
-- Table structure for table `tblfiles`
--

CREATE TABLE `tblfiles` (
  `id` int(11) NOT NULL,
  `FileName` varchar(255) DEFAULT NULL,
  `CatId` int(11) DEFAULT NULL,
  `OwnerId` int(11) DEFAULT NULL,
  `ISBNNumber` int(11) DEFAULT NULL,
  `RegDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdateDate` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblfiles`
--

INSERT INTO `tblfiles` (`id`, `FileName`, `CatId`, `OwnerId`, `ISBNNumber`, `RegDate`, `UpdateDate`) VALUES
(1, 'PHP And MySql programming', 5, 1, 222333, '2019-08-28 20:04:55', '2017-07-15 05:54:41'),
(3, 'physics', 6, 4, 1111, '2019-08-28 21:17:31', '2017-07-15 06:13:17'),
(4, 'ddd', 4, 2, 111, '2019-08-29 23:15:24', NULL),
(5, 'Aston', 4, 1, 31313, '2019-08-29 23:18:38', '2019-08-29 23:20:40'),
(6, 'hammond', 4, 2, 1212, '2019-08-29 23:19:21', NULL),
(7, NULL, NULL, NULL, NULL, '2019-08-30 01:03:38', NULL),
(8, 'ffd', 5, 11, 0, '2019-08-30 01:14:57', NULL),
(9, 'vv', 5, 10, 555, '2019-08-30 01:15:31', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblissuedfilesdetails`
--

CREATE TABLE `tblissuedfilesdetails` (
  `id` int(11) NOT NULL,
  `FileId` int(11) DEFAULT NULL,
  `UserID` varchar(150) DEFAULT NULL,
  `IssuesDate` timestamp NULL DEFAULT current_timestamp(),
  `ReturnDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `ReturnStatus` int(1) DEFAULT NULL,
  `fine` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblissuedfilesdetails`
--

INSERT INTO `tblissuedfilesdetails` (`id`, `FileId`, `UserID`, `IssuesDate`, `ReturnDate`, `ReturnStatus`, `fine`) VALUES
(1, 1, 'SID002', '2017-07-15 06:09:47', '2017-07-15 11:15:20', 1, 0),
(2, 1, 'SID002', '2017-07-15 06:12:27', '2017-07-15 11:15:23', 1, 5),
(3, 3, 'SID002', '2017-07-15 06:13:40', NULL, 0, NULL),
(4, 3, 'SID002', '2017-07-15 06:23:23', '2017-07-15 11:22:29', 1, 2),
(5, 1, 'SID009', '2017-07-15 10:59:26', NULL, 0, NULL),
(6, 3, 'SID011', '2017-07-15 18:02:55', NULL, 0, NULL),
(7, 3, 'SID002', '2019-08-29 21:25:40', NULL, NULL, NULL),
(8, 3, 'SID002', '2019-08-29 22:52:06', NULL, NULL, NULL),
(9, 3, 'SID013', '2019-08-29 22:54:44', NULL, NULL, NULL),
(10, 3, 'SID013', '2019-08-29 23:00:38', NULL, NULL, NULL),
(11, 3, 'SID013', '2019-08-29 23:07:17', NULL, NULL, NULL),
(12, 3, 'SID013', '2019-08-29 23:10:53', NULL, NULL, NULL),
(13, 3, 'SID013', '2019-08-29 23:21:40', NULL, NULL, NULL),
(14, 3, 'SID013', '2019-08-29 23:22:53', NULL, NULL, NULL),
(15, 3, 'SID013', '2019-08-29 23:36:11', '2019-08-29 23:49:41', 1, 0),
(16, 3, 'SID013', '2019-08-29 23:46:42', '2019-08-30 01:26:41', 1, 0),
(17, NULL, 'SID002', '2019-08-30 01:31:02', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblowners`
--

CREATE TABLE `tblowners` (
  `id` int(11) NOT NULL,
  `OwnerName` varchar(159) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblowners`
--

INSERT INTO `tblowners` (`id`, `OwnerName`, `creationDate`, `UpdationDate`) VALUES
(10, 'HR', '2019-08-30 00:36:04', NULL),
(11, 'Jimmy', '2019-08-30 00:42:11', NULL),
(12, 'Accounting', '2019-08-30 00:43:01', '2019-08-30 00:52:45'),
(13, 'James', '2019-08-30 00:51:53', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblusers`
--

CREATE TABLE `tblusers` (
  `id` int(11) NOT NULL,
  `UserId` varchar(100) DEFAULT NULL,
  `FullName` varchar(120) DEFAULT NULL,
  `EmailId` varchar(120) DEFAULT NULL,
  `MobileNumber` char(11) DEFAULT NULL,
  `Password` varchar(120) DEFAULT NULL,
  `Status` int(1) DEFAULT NULL,
  `RegDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblusers`
--

INSERT INTO `tblusers` (`id`, `UserId`, `FullName`, `EmailId`, `MobileNumber`, `Password`, `Status`, `RegDate`, `UpdationDate`) VALUES
(11, 'SID012', 'Gee', 'gerald.kamau@unep.org', '231231313', 'e10adc3949ba59abbe56e057f20f883e', 1, '2019-08-29 22:48:49', NULL),
(13, 'SID013', 'Gee', 'kamaugerald2@yahoo.com', '0711311131', 'e10adc3949ba59abbe56e057f20f883e', 1, '2019-08-29 22:53:03', '2019-08-29 22:58:34');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcategory`
--
ALTER TABLE `tblcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblfiles`
--
ALTER TABLE `tblfiles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblissuedfilesdetails`
--
ALTER TABLE `tblissuedfilesdetails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblowners`
--
ALTER TABLE `tblowners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblusers`
--
ALTER TABLE `tblusers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `StudentId` (`UserId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblcategory`
--
ALTER TABLE `tblcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tblfiles`
--
ALTER TABLE `tblfiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tblissuedfilesdetails`
--
ALTER TABLE `tblissuedfilesdetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tblowners`
--
ALTER TABLE `tblowners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tblusers`
--
ALTER TABLE `tblusers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
