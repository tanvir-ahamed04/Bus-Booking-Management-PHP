-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 25, 2023 at 01:22 AM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bus_query`
--

-- --------------------------------------------------------

--
-- Table structure for table `booked`
--

CREATE TABLE `booked` (
  `id` int(30) NOT NULL,
  `schedule_id` int(30) NOT NULL,
  `ref_no` text NOT NULL,
  `name` varchar(250) NOT NULL,
  `qty` int(11) NOT NULL,
  `status` tinyint(1) DEFAULT '0' COMMENT '1=Paid, 0- Unpaid',
  `date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `booked`
--

INSERT INTO `booked` (`id`, `schedule_id`, `ref_no`, `name`, `qty`, `status`, `date_updated`) VALUES
(1, 1, '202009091727', 'John Smith', 1, 1, '2023-06-22 10:29:44'),
(4, 2, '202306213389', 'aman', 12, 0, '2023-06-22 02:56:58'),
(5, 2, '202306217227', 'MD AMAN FERDSOUSH AFRIDY', 5, 0, '2023-06-22 03:02:26'),
(6, 6, '202306212800', 'Gu Shenkhai', 2, 0, '2023-06-22 03:02:40'),
(7, 2, '202306218370', 'zihan', 2, 0, '2023-06-22 03:19:13'),
(8, 8, '20230621377', 'MD AMAN FERDSOUSH AFRIDY', 2, 0, '2023-06-22 03:19:24'),
(9, 2, '202306212247', 'Shihab', 1, 1, '2023-06-22 03:25:48'),
(10, 9, '202306224687', 'hadi', 1, 0, '2023-06-22 18:20:25'),
(11, 6, '202306223942', 'MD AZAZ KHAN', 5, 0, '2023-06-22 18:21:12');

-- --------------------------------------------------------

--
-- Table structure for table `bus`
--

CREATE TABLE `bus` (
  `id` int(30) NOT NULL,
  `name` varchar(250) NOT NULL,
  `bus_number` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 = inactive, 1 = active',
  `date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bus`
--

INSERT INTO `bus` (`id`, `name`, `bus_number`, `status`, `date_updated`) VALUES
(3, 'Nanjing Express', '5001', 1, '2023-06-22 02:26:28'),
(4, 'Wuhan Sp', '1212', 1, '2023-06-22 02:27:57'),
(5, 'Beijing Delux', '1001', 1, '2023-06-22 02:27:57'),
(6, 'Nantong Coach', '2020', 1, '2023-06-22 02:29:39'),
(7, 'Guangzhou Travels', '3030', 1, '2023-06-22 02:29:39'),
(8, 'Shanghai Sleeper Coach', '1010', 1, '2023-06-22 02:32:29'),
(9, 'Yangzhou Dack', '5020', 1, '2023-06-22 03:31:12');

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `id` int(30) NOT NULL,
  `terminal_name` text NOT NULL,
  `city` varchar(250) NOT NULL,
  `state` varchar(250) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0= inactive , 1= active',
  `date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`id`, `terminal_name`, `city`, `state`, `status`, `date_updated`) VALUES
(1, 'Nanjing Terninal', 'Nanjing', 'Jiangshu', 1, '2023-06-22 02:21:12'),
(2, 'Wuhan Terminal', 'Wuhan', 'Wuhan', 1, '2023-06-22 02:21:32'),
(3, 'Yuangzhou Terminal', 'Yuangzhou', 'Jiangshu', 1, '2023-06-22 02:20:44'),
(4, 'Nantong Terminal', 'Nantong', 'Jiangshu', 1, '2023-06-22 02:23:22'),
(5, 'Beijing Terminal', 'Beijing Capital', 'Baijing', 1, '2023-06-22 02:23:22'),
(6, 'Guangzhou Terminal', 'Guangzhou Main City', 'Guangzhou', 1, '2023-06-22 02:25:06'),
(7, 'Shanghai Port Terminal', 'Shanghai City', 'Shanghai', 1, '2023-06-22 02:25:06');

-- --------------------------------------------------------

--
-- Table structure for table `schedule_list`
--

CREATE TABLE `schedule_list` (
  `id` int(30) NOT NULL,
  `bus_id` int(30) NOT NULL,
  `from_location` int(30) NOT NULL,
  `to_location` int(30) NOT NULL,
  `departure_time` datetime NOT NULL,
  `eta` datetime NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `availability` int(11) NOT NULL,
  `price` text NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `schedule_list`
--

INSERT INTO `schedule_list` (`id`, `bus_id`, `from_location`, `to_location`, `departure_time`, `eta`, `status`, `availability`, `price`, `date_updated`) VALUES
(1, 3, 1, 3, '2023-06-22 02:40:00', '2023-06-23 06:00:00', 1, 30, '650', '2023-06-24 23:19:24'),
(2, 3, 1, 5, '2023-06-22 02:39:00', '2023-06-23 09:00:00', 1, 30, '600', '2023-06-21 18:42:55'),
(4, 1, 4, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, '150', '2023-06-21 18:38:29'),
(5, 1, 5, 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, '400', '2023-06-21 18:38:29'),
(6, 8, 7, 1, '2023-06-24 02:41:00', '2023-06-25 09:00:00', 1, 12, '300', '2023-06-21 18:44:11'),
(7, 9, 4, 3, '2023-06-22 03:00:00', '2023-06-22 08:00:00', 1, 10, '150', '2023-06-21 18:43:54'),
(8, 7, 7, 6, '2023-06-23 02:44:00', '2023-06-24 07:00:00', 1, 0, '575', '2023-06-21 18:44:42'),
(9, 5, 5, 6, '2023-06-25 02:45:00', '2023-06-27 04:00:00', 1, 20, '800', '2023-06-21 18:46:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `name` varchar(150) NOT NULL,
  `user_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 = admin, 2= faculty , 3 = student',
  `username` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT ' 0 = incative , 1 = active',
  `date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `user_type`, `username`, `password`, `status`, `date_updated`) VALUES
(1, 'Gu Shenkhai', 1, 'admin', 'admin123', 1, '2023-06-22 02:46:41'),
(2, 'John Smith', 1, 'jsmth', 'admin123', 1, '2020-09-08 16:13:53'),
(3, 'MD AMAN FERDSOUSH AFRIDY', 1, 'aman', 'aman', 1, '2023-06-22 02:47:10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booked`
--
ALTER TABLE `booked`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bus`
--
ALTER TABLE `bus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schedule_list`
--
ALTER TABLE `schedule_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booked`
--
ALTER TABLE `booked`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `bus`
--
ALTER TABLE `bus`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `schedule_list`
--
ALTER TABLE `schedule_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
