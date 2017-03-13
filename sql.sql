-- phpMyAdmin SQL Dump
-- version 4.6.5.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 09, 2017 at 09:13 AM
-- Server version: 5.6.34
-- PHP Version: 7.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `rzg_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `rzg_fang`
--

CREATE TABLE `rzg_fang` (
  `Id` int(11) NOT NULL,
  `fangName` varchar(30) NOT NULL,
  `fangDescription` varchar(255) NOT NULL,
  `fangBelongId` int(11) NOT NULL COMMENT '房东的userid',
  `fangLocation` varchar(255) NOT NULL COMMENT '位置（坐标）',
  `fangPrice` varchar(255) NOT NULL COMMENT '房费',
  `fangUnit` int(11) NOT NULL DEFAULT '0' COMMENT '0为天,1为小时,2为周,3为月,4为年',
  `fangProvince` varchar(15) NOT NULL COMMENT '省',
  `fangCity` varchar(30) NOT NULL COMMENT '市',
  `fangDistrict` varchar(50) DEFAULT NULL COMMENT '县、区',
  `fangStreet` varchar(255) DEFAULT NULL COMMENT '街道'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rzg_managers`
--

CREATE TABLE `rzg_managers` (
  `Id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `remtoken` varchar(36) NOT NULL COMMENT '记住我的token值',
  `email` varchar(100) NOT NULL,
  `userType` int(11) NOT NULL DEFAULT '0' COMMENT '用户类型',
  `created_time` varchar(20) NOT NULL,
  `login_last_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rzg_managers`
--

INSERT INTO `rzg_managers` (`Id`, `username`, `password`, `remtoken`, `email`, `userType`, `created_time`, `login_last_time`) VALUES
(1, 'admin', 'eyJpdiI6IlJ4Qll4VDNOVTVtXC9kMTZxZExaR3BRPT0iLCJ2YWx1ZSI6IjdkaDgwaE5IOXc1bGVJQXBDdm5Vbmc9PSIsIm1hYyI6Ijg2OGUyMzdiZmU5MzBmMmNmZGQyYjljNmE2ZDA5NGU2ODhiNDI4MjE0NjEyMTAyMzk4ODZhYjFjNTQ4OGRhN2EifQ==', '', '', 0, '', '2017-03-01 09:07:36');

-- --------------------------------------------------------

--
-- Table structure for table `rzg_menu`
--

CREATE TABLE `rzg_menu` (
  `Id` int(11) NOT NULL,
  `menuName` varchar(10) NOT NULL,
  `menuLevel` int(11) NOT NULL,
  `menuLink` varchar(255) NOT NULL,
  `menuLinkId` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rzg_menu`
--

INSERT INTO `rzg_menu` (`Id`, `menuName`, `menuLevel`, `menuLink`, `menuLinkId`) VALUES
(1, '设置', 0, '#', 0),
(2, '常规设置', 1, 'Common', 1),
(3, 'Seo设置', 1, 'seo', 1),
(4, 'App设置', 1, 'appset', 1),
(5, '房源管理', 0, '#', 0),
(6, '房源添加', 1, 'fadd', 5),
(7, '房源列表', 1, 'flist', 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `rzg_fang`
--
ALTER TABLE `rzg_fang`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `rzg_managers`
--
ALTER TABLE `rzg_managers`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `rzg_menu`
--
ALTER TABLE `rzg_menu`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `rzg_fang`
--
ALTER TABLE `rzg_fang`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `rzg_managers`
--
ALTER TABLE `rzg_managers`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `rzg_menu`
--
ALTER TABLE `rzg_menu`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
