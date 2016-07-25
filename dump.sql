-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Host: localhost:8889
-- Generation Time: Jul 25, 2016 at 04:38 AM
-- Server version: 5.5.42
-- PHP Version: 5.6.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `advanced_yii2`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_assignment`
--

CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) NOT NULL,
  `user_id` int(64) NOT NULL,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_assignment`
--

INSERT INTO `auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('admin', 1, NULL),
('admin', 18, NULL),
('admin', 19, NULL),
('create-branch', 2, NULL),
('create-branch', 19, NULL),
('create-company', 18, NULL),
('create-company', 19, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `auth_item`
--

CREATE TABLE `auth_item` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `rule_name` varchar(64) DEFAULT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_item`
--

INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('admin', 1, 'Admin previliges', NULL, NULL, NULL, NULL),
('create-branch', 1, 'Allow user to add a branch\r\n', NULL, NULL, NULL, NULL),
('create-company', 1, 'Allow user to create a company', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `auth_item_child`
--

CREATE TABLE `auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_item_child`
--

INSERT INTO `auth_item_child` (`parent`, `child`) VALUES
('admin', 'create-branch'),
('admin', 'create-company');

-- --------------------------------------------------------

--
-- Table structure for table `auth_rule`
--

CREATE TABLE `auth_rule` (
  `name` varchar(64) NOT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `branch_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `branch_name` varchar(100) NOT NULL,
  `branch_address` varchar(255) NOT NULL,
  `branch_created_date` datetime NOT NULL,
  `branch_status` enum('active','inactive') NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`branch_id`, `company_id`, `branch_name`, `branch_address`, `branch_created_date`, `branch_status`) VALUES
(1, 1, 'Hyderabad', 'asdfasdf', '2016-07-20 20:21:49', 'active'),
(2, 1, 'CHennai', 'asdfasdf', '2016-07-22 08:26:26', 'active'),
(3, 2, 'Start city', 'asdfasdf', '2016-07-22 08:57:45', 'inactive'),
(4, 3, 'Starling City', 'Glades', '2016-07-22 08:59:18', 'active'),
(5, 3, 'Chennai', '865867y9u', '2016-07-22 09:01:10', 'inactive'),
(6, 2, 'New Branch 24 Jul', 'Hyd', '2016-07-24 05:50:01', 'active'),
(7, 2, 'Branch 2342', '7689880', '2016-07-24 09:21:07', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `company_id` int(11) NOT NULL,
  `company_name` varchar(100) NOT NULL,
  `company_email` varchar(100) NOT NULL,
  `company_address` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `company_created_date` datetime NOT NULL,
  `company_status` enum('active','inactive') NOT NULL,
  `company_start_date` date NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`company_id`, `company_name`, `company_email`, `company_address`, `logo`, `company_created_date`, `company_status`, `company_start_date`) VALUES
(1, 'Pegasystems', 'saishankar@live.in', '#301, Laxmi Madhava Park View,', '', '2016-07-20 20:12:54', 'active', '0000-00-00'),
(2, 'Queen Consolidated', 'Queen@gmali.com', '6826', '', '2016-07-22 08:56:50', 'active', '0000-00-00'),
(3, 'Rogers Consolidated', 'rogers@gmail.com', '#301, Laxmi Madhava Park View,', '', '2016-07-22 08:57:18', 'inactive', '0000-00-00'),
(4, 'United Health Group', 'uhg@gmail.com', 'aksdfjlsjl', '', '2016-07-21 00:00:00', 'active', '2016-07-21'),
(6, 'Ambrocias', 'saishankar@live.in', '#301, Laxmi Madhava Park View,', 'uploads/Ambrocias.jpg', '2016-07-22 20:20:38', 'active', '0000-00-00'),
(7, 'asdfasdasd', 'fasdf', 'asdfasdf', 'uploads/asdfasdasd.jpg', '2016-07-24 08:09:50', 'active', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `zip_code` varchar(20) NOT NULL,
  `city` varchar(100) NOT NULL,
  `province` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `department_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `department_name` varchar(100) NOT NULL,
  `department_created_date` datetime NOT NULL,
  `department_status` enum('active','inactive') NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`department_id`, `branch_id`, `company_id`, `department_name`, `department_created_date`, `department_status`) VALUES
(1, 1, 1, 'IAD', '2016-07-20 20:38:23', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `email`
--

CREATE TABLE `email` (
  `id` int(11) NOT NULL,
  `receiver_name` varchar(100) NOT NULL,
  `receiver_email` varchar(200) NOT NULL,
  `content` text NOT NULL,
  `attachment` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `email`
--

INSERT INTO `email` (`id`, `receiver_name`, `receiver_email`, `content`, `attachment`, `subject`) VALUES
(1, 'Sai', 'saishankar@live.in', 'ads', 'attachments/1469340337.png', 'as');

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `location_id` int(11) NOT NULL,
  `zip_code` varchar(20) NOT NULL,
  `city` varchar(100) NOT NULL,
  `province` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`location_id`, `zip_code`, `city`, `province`) VALUES
(1, '506101', 'Warangal', 'Telangana'),
(2, '500084', 'Hyderabad', 'Telangana');

-- --------------------------------------------------------

--
-- Table structure for table `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1469032788),
('m130524_201442_init', 1469033104);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `firstname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `firstname`, `lastname`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Sai', 'Shankar', 'sai1231', 'PeeZhoBOoCVidco2Nz-g7oRVaORe7ebV', '$2y$13$o5ScC2ADwojj7pIl3bfWlO3trzLGncs2uRQSai6SYV24LH6hRWzgm', NULL, 'saishankar@live.in', 10, 1469033190, 1469033190),
(2, '', '', 'sai1232', 'hxcG4Zst0xOk8nJZx60_MOZbACtHOITf', '$2y$13$5Zp6O4.nDBSpWCGQvuUUq.IW1ZpZ0SgKYEgXwUsN5jpBzGWk7UWKe', NULL, 'saishankar@live.i', 10, 1469034772, 1469034772),
(3, 'Sai', 'Shankar', 'sai1233', 'Vh9io_tnGGWa57dChumZ96wxu-YXFJKf', '$2y$13$k.g0rtBv9Bwc5AhqOcWeDO2L6gnkAeQnAbF190f/h2dYty/MWRqbi', NULL, 'saishankar@live.inn', 10, 1469034807, 1469034807),
(4, 'Thea', 'Queen', 'theaqueen', 'XH0_c0xp7e5oypJlPcwav-IyzDWCfPBP', '$2y$13$tkH6YfrLjOoSpq0nJ2RoTeadXVxNrf592D3eimeyxdSyeYUatYv3q', NULL, 'theaqueen@gmail.com', 10, 1469370078, 1469370078),
(5, 'sai1231', 'kjhkj', 'sai12328', 'uL-1tRBsRTR1J7KBFUWDkVjpICfJzofn', '$2y$13$2MKmHBxHtsQDSkWxptv/DublhG5BxmIrLeNBKvebH.3YTq3yNZoqu', NULL, 'khsdfgsdfg@gmail.com', 10, 1469370350, 1469370350),
(6, 'oliver', 'queen', 'oliver', 'z5ANWQDDagbOPzbMMnQ8Z-Nt4CkqK700', '$2y$13$hy6BGYBXhpi29MYMIakfxueFLHYJ27bUgleAa35opFVOKuqA0t5nq', NULL, 'oliver@gmail.com', 10, 1469370510, 1469370510),
(7, 'Malcom ', 'Merlyn', 'malcom', 'UYOtWcQDUOCCwMvTJvU5kLtus6Xtoh8A', '$2y$13$NLiuYrIg.lQrK46Soee1Yuh8Bc1IBS.MX47QCVZIvu15KReNuGYIG', NULL, 'malcom@gmail.com', 10, 1469370645, 1469370645),
(8, 'Slade', 'Wilson', 'sladew', 'ZvouIeVz4vldd8vJP2lBDVGe2XPunPO7', '$2y$13$z1AsOMbBAWW.aOzJNAlo6eZkKl/9GNi6774VT8iqluu7bsmmevq1.', NULL, 'sladew@gmail.com', 10, 1469370785, 1469370785),
(9, 'Slade', 'Wilson', 'sladew1', 'O3-XkdDIKJ8_Mp7fvUvcR2HxPa3I47A_', '$2y$13$QWNmbqvnvGkrum8K0x5Ah.yM6nIOkREa8bGW8zc4XV9oNNukEr7pu', NULL, 'sladew@gmail.com1', 10, 1469370825, 1469370825),
(10, 'newuser', 'newuser', 'newuser', '5zh6vJSZFYF2WAvxy2Ufm-VKZbiTXfPe', '$2y$13$rabqj4Cv8TeYSjRLNdRl7uKEpRVrJnacICMYmhYwDVQSFuA4JPX3C', NULL, 'newuser@gm.com', 10, 1469372122, 1469372122),
(11, 'newuser1', 'newuser1', 'newuser1', 'ZgKU8mXXPEV-IN-GPeFocJAWaM5tp-vb', '$2y$13$MdPU1JX.TFueE.OEGA6/5OMQschnKX1C6XeSo7cNKBF7C7ts7oH2q', NULL, 'newuser1@gm.com', 10, 1469372175, 1469372175),
(12, 'newuser2', 'newuser2', 'newuser2', 'XrXkmLFKogo5wLSdFNlhrsvJSiIOgbTS', '$2y$13$dhR./aLA2dMSRwcTlaO.1ehl1hRmGvJhgDgN7OnQTHcbq3mHOUvia', NULL, 'newuser2@gm.om', 10, 1469372280, 1469372280),
(13, 'newuser2', 'newuser2', 'newuser23', 'JqXrV5HG89Lk4tZQPAjz381fLsXZQKIz', '$2y$13$Pj5G5M5Krsz9emDZkINXHOkSsZepXhnEHRLPVeBtBPd8XguKdeasC', NULL, 'newuser2@gm.om323', 10, 1469372306, 1469372306),
(14, 'newuser2', 'newuser2', '2newuser23', 'OqW4lQdQwBLRW5kk2htmVl2VzwwlwgzQ', '$2y$13$dk9TAhDdrbiidhwWMjYC1Ow7FA7GQyXBcM3vlQ42JEAAvAVQoaYPi', NULL, 'newu12321ser2@gm.om323', 10, 1469372325, 1469372325),
(15, 'newuser2', 'newuser2', '2312newuser23', 'b11wF3f5lpBd89IDPuoCcWYB-5pxZEDW', '$2y$13$J6/pJNdW/9HDr7Js6OCxgut3uRsVvamvYjrz2ONT8dzkonWpANFwu', NULL, 'newu12321ser2@gm.om32312', 10, 1469372348, 1469372348),
(16, 'newuser2', 'newuser2', 'sdf2312newuser23', 'JGb8NKlnQQDyCa7jXNSaZS_8DG845CAb', '$2y$13$wIuLCOfWWq8wB6Z84jP2wuqZW.DwFiT3XLrqDXpCbft3qULnztlKi', NULL, 'newusd12321ser2@gm.om32312', 10, 1469372507, 1469372507),
(17, 'newuser2', 'newuser2', '11sdf2312newuser23', '_d9ecC5Tt3Q_uMW_avV-xPO6fChR2zkk', '$2y$13$eu3oI/ZSD6Dcw54WzZIP..bwlSjRkKkxFuwxTEDauysGBOWQO2C9K', NULL, 'newus1d12321ser2@gm.om32312', 10, 1469372576, 1469372576),
(18, 'newuser2', 'newuser2', 'w11sdf2312newuser23', '9Ips6_mNGP1dI7jvZ0fvnpBWhhOesYA1', '$2y$13$98q3eBETDPuF6sPTBQEoPuoXE2GKFUPaQ.5956d4E8Kx6/aRPfEbW', NULL, 'newuss1d12321ser2@gm.om32312', 10, 1469372646, 1469372646),
(19, 'newuser2', 'newuser2', 'hjhw11sdf2312newuser23', 'Vb3tTjZfb11bUMzFAGGjlzn_3UDphXCa', '$2y$13$lV9HPnn88YPKSbTpurT0AOe.t1fe9M.EirvfTORTAt/MMvvVMI2X2', NULL, 'newusdss1d12321ser2@gm.om32312', 10, 1469372702, 1469372702);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD PRIMARY KEY (`item_name`,`user_id`);

--
-- Indexes for table `auth_item`
--
ALTER TABLE `auth_item`
  ADD PRIMARY KEY (`name`),
  ADD KEY `rule_name` (`rule_name`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD PRIMARY KEY (`parent`,`child`),
  ADD KEY `child` (`child`);

--
-- Indexes for table `auth_rule`
--
ALTER TABLE `auth_rule`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`branch_id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `company_id_2` (`company_id`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`company_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`department_id`),
  ADD KEY `branch_id` (`branch_id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `email`
--
ALTER TABLE `email`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`location_id`);

--
-- Indexes for table `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `password_reset_token` (`password_reset_token`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `branch_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `company_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `email`
--
ALTER TABLE `email`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `auth_item`
--
ALTER TABLE `auth_item`
  ADD CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `branches`
--
ALTER TABLE `branches`
  ADD CONSTRAINT `company_branch_fk` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`);

--
-- Constraints for table `departments`
--
ALTER TABLE `departments`
  ADD CONSTRAINT `departments_branch_fk` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`branch_id`),
  ADD CONSTRAINT `departments_company_fk` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`);
