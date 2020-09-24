-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Sep 24, 2020 at 06:02 AM
-- Server version: 5.7.31
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecom`
--

-- --------------------------------------------------------

--
-- Table structure for table `castgmast`
--

CREATE TABLE `castgmast` (
  `CatgCode` int(11) NOT NULL,
  `CatgDesc` varchar(25) DEFAULT NULL,
  `CatgStat` char(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `custmast`
--

CREATE TABLE `custmast` (
  `CustCode` int(11) NOT NULL,
  `CustName` varchar(50) DEFAULT NULL,
  `CustCont` varchar(10) DEFAULT NULL,
  `CustAddr` varchar(250) DEFAULT NULL,
  `CustGST` varchar(25) DEFAULT NULL,
  `CustEmail` varchar(50) DEFAULT NULL,
  `CustPwd` varchar(10) DEFAULT NULL,
  `RegDate` date DEFAULT NULL,
  `CustStat` char(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `custmast`
--

INSERT INTO `custmast` (`CustCode`, `CustName`, `CustCont`, `CustAddr`, `CustGST`, `CustEmail`, `CustPwd`, `RegDate`, `CustStat`) VALUES
(1, 'Test_user', '12332', 'address', NULL, 'test@gmail.com', '1234', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orderdetl`
--

CREATE TABLE `orderdetl` (
  `OrderNo` int(11) NOT NULL,
  `SLNo` int(11) NOT NULL,
  `ProdCode` char(6) DEFAULT NULL,
  `Quantity` decimal(18,0) DEFAULT NULL,
  `Rate` decimal(18,0) DEFAULT NULL,
  `Amount` decimal(18,0) DEFAULT NULL,
  `DiscAmt` decimal(18,0) DEFAULT NULL,
  `OrderCancelStat` char(3) DEFAULT NULL,
  `OrderCancelDate` datetime DEFAULT NULL,
  `OrderAcptDate` datetime DEFAULT NULL,
  `OrderRejDate` datetime DEFAULT NULL,
  `OrderRejReason` varchar(50) DEFAULT NULL,
  `OrderDispDate` datetime DEFAULT NULL,
  `OrderDelvDate` datetime DEFAULT NULL,
  `OrderRecdDate` datetime DEFAULT NULL,
  `OrderStat` char(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ordermast`
--

CREATE TABLE `ordermast` (
  `OrderNo` int(11) NOT NULL,
  `OrderDt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CustCode` char(6) DEFAULT NULL,
  `ProdCode` int(11) DEFAULT NULL,
  `OrderAmt` decimal(18,0) DEFAULT NULL,
  `DiscAmt` decimal(18,0) DEFAULT NULL,
  `OthChgsAmt` decimal(18,0) DEFAULT NULL,
  `NetAmt` decimal(18,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ordermast`
--

INSERT INTO `ordermast` (`OrderNo`, `OrderDt`, `CustCode`, `ProdCode`, `OrderAmt`, `DiscAmt`, `OthChgsAmt`, `NetAmt`) VALUES
(19, '2020-09-24 06:00:47', '1', 2, '1', NULL, NULL, '500'),
(20, '2020-09-24 06:00:57', '1', 3, '1', NULL, NULL, '2000');

-- --------------------------------------------------------

--
-- Table structure for table `prodmast`
--

CREATE TABLE `prodmast` (
  `ProdCode` int(11) NOT NULL,
  `ProdTag` varchar(15) DEFAULT NULL,
  `ProdDesc` varchar(100) DEFAULT NULL,
  `PurRate` decimal(18,0) DEFAULT NULL,
  `SalesRate` decimal(18,0) DEFAULT NULL,
  `MaxDisc` decimal(18,0) DEFAULT NULL,
  `ProdCatg` char(3) DEFAULT NULL,
  `UnitCode` char(3) DEFAULT NULL,
  `ProdStat` char(3) DEFAULT NULL,
  `ImgUrl` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prodmast`
--

INSERT INTO `prodmast` (`ProdCode`, `ProdTag`, `ProdDesc`, `PurRate`, `SalesRate`, `MaxDisc`, `ProdCatg`, `UnitCode`, `ProdStat`, `ImgUrl`) VALUES
(1, 'prod tag 1', 'PROD 1 description', '100', '0', '0', 'ct1', '111', NULL, 'https://raw.githubusercontent.com/ranickpatra/all_apps_data/master/test_products/test-prod-01.png'),
(2, 'prod tag 2', 'PROD 2 description', '500', '0', '0', 'ct1', '112', NULL, 'https://raw.githubusercontent.com/ranickpatra/all_apps_data/master/test_products/test-prod-02.png'),
(3, 'prod tag 3', 'PROD 3 description', '2000', '0', '0', 'ct2', '113', NULL, 'https://raw.githubusercontent.com/ranickpatra/all_apps_data/master/test_products/test-prod-03.png'),
(4, 'prod tag 4', 'PROD 4 description', '6000', '0', '0', 'ct2', '114', NULL, 'https://raw.githubusercontent.com/ranickpatra/all_apps_data/master/test_products/test-prod-04.png');

-- --------------------------------------------------------

--
-- Table structure for table `unitmast`
--

CREATE TABLE `unitmast` (
  `UnitCode` int(11) NOT NULL,
  `UnitDesc` varchar(25) DEFAULT NULL,
  `UnitStat` char(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `castgmast`
--
ALTER TABLE `castgmast`
  ADD PRIMARY KEY (`CatgCode`);

--
-- Indexes for table `custmast`
--
ALTER TABLE `custmast`
  ADD PRIMARY KEY (`CustCode`);

--
-- Indexes for table `orderdetl`
--
ALTER TABLE `orderdetl`
  ADD PRIMARY KEY (`SLNo`);

--
-- Indexes for table `ordermast`
--
ALTER TABLE `ordermast`
  ADD PRIMARY KEY (`OrderNo`);

--
-- Indexes for table `prodmast`
--
ALTER TABLE `prodmast`
  ADD PRIMARY KEY (`ProdCode`);

--
-- Indexes for table `unitmast`
--
ALTER TABLE `unitmast`
  ADD PRIMARY KEY (`UnitCode`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `castgmast`
--
ALTER TABLE `castgmast`
  MODIFY `CatgCode` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custmast`
--
ALTER TABLE `custmast`
  MODIFY `CustCode` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orderdetl`
--
ALTER TABLE `orderdetl`
  MODIFY `SLNo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ordermast`
--
ALTER TABLE `ordermast`
  MODIFY `OrderNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `prodmast`
--
ALTER TABLE `prodmast`
  MODIFY `ProdCode` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `unitmast`
--
ALTER TABLE `unitmast`
  MODIFY `UnitCode` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
