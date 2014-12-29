-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 28, 2014 at 04:31 PM
-- Server version: 5.6.16
-- PHP Version: 5.5.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `evoucher`
--

-- --------------------------------------------------------

--
-- Table structure for table `v_merchant`
--

CREATE TABLE IF NOT EXISTS `v_merchant` (
  `id` int(11) NOT NULL,
  `category` varchar(20) NOT NULL,
  `alamat` varchar(150) NOT NULL,
  `pic` varchar(100) NOT NULL,
  `no_telp_pic` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Merchant';

-- --------------------------------------------------------

--
-- Table structure for table `v_promo`
--

CREATE TABLE IF NOT EXISTS `v_promo` (
  `id` int(11) NOT NULL,
  `merchant_id` int(11) NOT NULL,
  `item_desc` varchar(50) NOT NULL,
  `S&K` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` bigint(20) NOT NULL,
  `validity` int(11) NOT NULL,
  `rules_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `merchantidx` (`merchant_id`),
  KEY `rulesidx` (`rules_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='validity dalam hari';

-- --------------------------------------------------------

--
-- Table structure for table `v_rules`
--

CREATE TABLE IF NOT EXISTS `v_rules` (
  `id` int(11) NOT NULL,
  `rules_text` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `v_promo`
--
ALTER TABLE `v_promo`
  ADD CONSTRAINT `fk_rules` FOREIGN KEY (`rules_id`) REFERENCES `v_rules` (`id`),
  ADD CONSTRAINT `fk_merchant` FOREIGN KEY (`merchant_id`) REFERENCES `v_merchant` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
