-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 20, 2017 at 12:56 PM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ic2017`
--

-- --------------------------------------------------------

--
-- Table structure for table `bahanbaku`
--

CREATE TABLE `bahanbaku` (
  `idbahanbaku` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `harga1` int(11) NOT NULL,
  `harga2` int(11) NOT NULL,
  `harga3` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  `stok1` int(11) NOT NULL,
  `stok2` int(11) NOT NULL,
  `stok3` int(11) NOT NULL,
  `laststok1` int(11) NOT NULL,
  `laststok2` int(11) NOT NULL,
  `laststok3` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bahanbaku`
--

INSERT INTO `bahanbaku` (`idbahanbaku`, `nama`, `harga1`, `harga2`, `harga3`, `weight`, `stok1`, `stok2`, `stok3`, `laststok1`, `laststok2`, `laststok3`) VALUES
(1, 'BenangMerah', 47, 50, 50, 1, 943, 1000, 1000, 943, 1000, 1000),
(2, 'BenangKuning', 50, 63, 50, 1, 1000, 934, 1000, 934, 934, 1000),
(3, 'BenangBiru', 50, 50, 43, 1, 1000, 1000, 940, 940, 1000, 940),
(4, 'Template', 95, 99, 103, 3, 983, 978, 979, 983, 978, 979),
(5, 'Transportasi', 800, 800, 800, 0, 1000, 1000, 1000, 1000, 1000, 1000),
(6, 'Visa', 1000, 1000, 1000, 0, 1000, 1000, 1000, 1000, 1000, 1000),
(7, 'Inventory', 400, 400, 400, 0, 1000, 1000, 1000, 1000, 1000, 1000);

-- --------------------------------------------------------

--
-- Table structure for table `currency`
--

CREATE TABLE `currency` (
  `idcurrency` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `hjual` int(11) NOT NULL,
  `hbeli` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `currency`
--

INSERT INTO `currency` (`idcurrency`, `nama`, `hjual`, `hbeli`) VALUES
(1, 'IDR', 42, 0),
(2, 'SGD', 68, 0),
(3, 'RMB', 40, 0);

-- --------------------------------------------------------

--
-- Table structure for table `desain`
--

CREATE TABLE `desain` (
  `iddesain` int(11) NOT NULL,
  `nama` varchar(25) NOT NULL,
  `harga1` int(11) NOT NULL,
  `harga2` int(11) NOT NULL,
  `harga3` int(11) NOT NULL,
  `stok1` int(11) NOT NULL,
  `stok2` int(11) NOT NULL,
  `stok3` int(11) NOT NULL,
  `laststok1` int(11) NOT NULL,
  `laststok2` int(11) NOT NULL,
  `laststok3` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `desain`
--

INSERT INTO `desain` (`iddesain`, `nama`, `harga1`, `harga2`, `harga3`, `stok1`, `stok2`, `stok3`, `laststok1`, `laststok2`, `laststok3`) VALUES
(1, '3M 0K 0B', 300, 299, 302, 9996, 9996, 9991, 9996, 9996, 9991),
(2, '0M 3K 0B', 300, 300, 300, 10000, 10000, 10000, 10000, 10000, 10000),
(3, '0M 0K 3B', 300, 300, 300, 10000, 10000, 10000, 10000, 10000, 10000),
(4, '2M 1K 0B', 498, 500, 502, 24, 22, 30, 24, 23, 30),
(5, '2M 0K 1B', 500, 500, 500, 30, 30, 30, 30, 30, 30),
(6, '1M 2K 0B', 500, 500, 500, 30, 30, 30, 30, 30, 30),
(7, '1M 0K 2B', 500, 500, 500, 30, 30, 30, 30, 30, 30),
(8, '0M 2K 1B', 500, 500, 500, 30, 30, 30, 30, 30, 30),
(9, '0M 1K 2B', 500, 500, 500, 30, 30, 30, 30, 30, 30),
(10, '1M 1K 1B', 697, 702, 702, 14, 15, 15, 14, 15, 15);

-- --------------------------------------------------------

--
-- Table structure for table `detildesain`
--

CREATE TABLE `detildesain` (
  `iddetildesain` int(11) NOT NULL,
  `iddesain` int(11) NOT NULL,
  `idbahanbaku` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detildesain`
--

INSERT INTO `detildesain` (`iddetildesain`, `iddesain`, `idbahanbaku`) VALUES
(1, 1, 1),
(2, 1, 1),
(3, 1, 1),
(4, 2, 2),
(5, 2, 2),
(6, 2, 2),
(7, 3, 3),
(8, 3, 3),
(9, 3, 3),
(10, 4, 1),
(11, 4, 1),
(12, 4, 2),
(13, 5, 1),
(14, 5, 1),
(15, 5, 3),
(16, 6, 1),
(17, 6, 2),
(18, 6, 2),
(19, 7, 1),
(20, 7, 3),
(21, 7, 3),
(22, 8, 2),
(23, 8, 2),
(24, 8, 3),
(25, 9, 2),
(26, 9, 3),
(27, 9, 3),
(28, 10, 1),
(29, 10, 2),
(30, 10, 3),
(31, 1, 4),
(32, 2, 4),
(33, 3, 4),
(34, 4, 4),
(35, 5, 4),
(36, 6, 4),
(37, 7, 4),
(38, 8, 4),
(39, 9, 4),
(40, 10, 4);

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `idevent` int(11) NOT NULL,
  `cash1` int(11) NOT NULL,
  `cash2` int(11) NOT NULL,
  `cash3` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hargasaham`
--

CREATE TABLE `hargasaham` (
  `idhargasaham` int(11) NOT NULL,
  `idsaham` int(11) NOT NULL,
  `hjual1` int(11) NOT NULL,
  `hjual2` int(11) NOT NULL,
  `hjual3` int(11) NOT NULL,
  `hbeli1` int(11) NOT NULL,
  `hbeli2` int(11) NOT NULL,
  `hbeli3` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hargasaham`
--

INSERT INTO `hargasaham` (`idhargasaham`, `idsaham`, `hjual1`, `hjual2`, `hjual3`, `hbeli1`, `hbeli2`, `hbeli3`) VALUES
(410, 0, 1900, 3600, 1400, 0, 0, 0),
(411, 0, 4616, 4724, 5551, 0, 0, 0),
(412, 0, 5133, 7088, 5863, 0, 0, 0),
(413, 0, 5263, 6675, 5707, 0, 0, 0),
(414, 0, 6309, 6183, 5728, 0, 0, 0),
(415, 0, 7174, 7282, 6740, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `idinventory` int(11) NOT NULL,
  `iduser` int(11) NOT NULL,
  `idbahanbaku` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`idinventory`, `iduser`, `idbahanbaku`, `qty`) VALUES
(1, 16, 4, 2),
(2, 16, 2, 6),
(3, 4, 4, 3),
(4, 4, 1, 6),
(5, 2, 4, 2),
(6, 2, 1, 4),
(7, 15, 4, 2),
(8, 15, 2, 6),
(9, 3, 4, 2),
(10, 3, 1, 6),
(11, 19, 4, 2),
(12, 7, 4, 4),
(13, 19, 4, -2),
(14, 7, 3, 9),
(15, 19, 4, 1),
(16, 19, 2, 3),
(17, 5, 4, 1),
(18, 5, 1, 3),
(19, 4, 1, -1),
(20, 14, 4, 2),
(21, 14, 2, 6),
(22, 18, 4, 2),
(23, 1, 4, 1),
(24, 1, 1, 3),
(25, 3, 1, -1),
(26, 18, 2, 5),
(27, 15, 2, -3),
(28, 5, 1, -1),
(29, 5, 1, 3),
(30, 13, 4, 2),
(31, 3, 1, -1),
(32, 5, 1, -1),
(33, 13, 3, 6),
(34, 15, 1, 1),
(35, 20, 4, 2),
(36, 16, 1, 1),
(37, 20, 2, 6),
(38, 10, 4, 4),
(39, 3, 1, -1),
(40, 3, 1, -1),
(41, 3, 1, -1),
(42, 3, 4, -1),
(43, 10, 3, 12),
(44, 20, 4, 1),
(45, 1, 1, -3),
(46, 2, 2, 3),
(47, 3, 4, 1),
(48, 3, 1, 6),
(49, 5, 1, -1),
(50, 1, 4, -1),
(51, 1, 4, 1),
(52, 3, 1, 3),
(53, 16, 1, 1),
(54, 19, 2, -1),
(55, 19, 2, -1),
(56, 19, 2, -1),
(57, 19, 4, -1),
(58, 5, 1, -1),
(59, 5, 1, -1),
(60, 5, 1, -1),
(61, 5, 4, -1),
(62, 5, 4, 1),
(63, 5, 1, 3),
(64, 19, 2, 3),
(65, 3, 1, -2),
(66, 19, 4, 1),
(67, 3, 1, -2),
(68, 12, 4, 2),
(69, 15, 2, -1),
(70, 12, 3, 6),
(71, 1, 1, 3),
(72, 18, 2, -1),
(73, 16, 1, 2),
(74, 4, 1, 1),
(75, 1, 1, -3),
(76, 15, 1, 2),
(77, 15, 1, -1),
(78, 15, 2, -1),
(79, 15, 2, -1),
(80, 15, 4, -1),
(81, 19, 2, 3),
(82, 5, 1, -1),
(83, 5, 1, 3),
(84, 4, 2, 1),
(85, 2, 1, -1),
(86, 2, 1, -1),
(87, 2, 2, -1),
(88, 2, 4, -1),
(89, 15, 4, 1),
(90, 16, 1, -2),
(91, 16, 2, -2),
(92, 16, 2, -2),
(93, 16, 4, -2),
(94, 19, 2, -1),
(95, 15, 2, 6),
(96, 11, 4, 2),
(97, 11, 3, 6),
(98, 4, 2, 1),
(99, 16, 4, 2),
(100, 16, 2, 2),
(101, 14, 2, -3),
(102, 1, 1, 3),
(103, 20, 2, -1),
(104, 20, 2, -1),
(105, 20, 2, -1),
(106, 20, 4, -1),
(107, 19, 2, -2),
(108, 5, 2, 3),
(109, 9, 4, 1),
(110, 1, 2, 2),
(111, 16, 1, 1),
(112, 9, 3, 3),
(113, 18, 2, -1),
(114, 18, 2, -1),
(115, 18, 2, -1),
(116, 18, 4, -1),
(117, 15, 2, -3),
(118, 13, 3, -1),
(119, 13, 3, -1),
(120, 13, 3, -1),
(121, 13, 4, -1),
(122, 10, 3, -1),
(123, 10, 3, -1),
(124, 10, 3, -1),
(125, 10, 4, -1),
(126, 5, 1, -1),
(127, 14, 2, 3),
(128, 19, 2, -1),
(129, 19, 2, -1),
(130, 19, 2, -1),
(131, 19, 4, -1),
(132, 20, 1, 1),
(133, 9, 4, 1),
(134, 9, 3, 3),
(135, 3, 1, 1),
(136, 15, 1, 1),
(137, 19, 4, 1),
(138, 2, 1, -1),
(139, 2, 1, -1),
(140, 2, 2, -1),
(141, 2, 4, -1),
(142, 19, 2, 3),
(143, 14, 2, -3),
(144, 4, 1, -1),
(145, 4, 1, -1),
(146, 4, 2, -1),
(147, 4, 4, -1),
(148, 10, 3, -1),
(149, 10, 3, -1),
(150, 10, 3, -1),
(151, 10, 4, -1),
(152, 18, 4, 1),
(153, 13, 4, 1),
(154, 13, 3, 3),
(155, 19, 2, -1),
(156, 18, 2, 3),
(157, 5, 1, -1),
(158, 5, 1, -1),
(159, 5, 2, -1),
(160, 5, 4, -1),
(161, 5, 4, 2),
(162, 19, 2, -2),
(163, 3, 1, -1),
(164, 3, 1, -1),
(165, 3, 1, -1),
(166, 3, 4, -1),
(167, 5, 1, 3),
(168, 19, 2, 3),
(169, 11, 3, -3),
(170, 8, 4, 2),
(171, 7, 3, -3),
(172, 7, 3, -3),
(173, 7, 3, -3),
(174, 7, 4, -3),
(175, 1, 2, 1),
(176, 3, 1, 6),
(177, 8, 3, 6),
(178, 4, 3, 3),
(179, 3, 4, 1),
(180, 15, 2, 3),
(181, 9, 3, -3),
(182, 16, 1, -2),
(183, 16, 2, -2),
(184, 16, 2, -2),
(185, 16, 4, -2),
(186, 13, 3, -1),
(187, 13, 3, -1),
(188, 13, 3, -1),
(189, 13, 4, -1),
(190, 15, 2, -3),
(191, 5, 1, -1),
(192, 1, 1, -1),
(193, 1, 1, -1),
(194, 1, 2, -1),
(195, 1, 4, -1),
(196, 14, 2, 3),
(197, 15, 1, -1),
(198, 15, 2, -1),
(199, 15, 2, -1),
(200, 15, 4, -1),
(201, 16, 4, 1),
(202, 2, 4, 1),
(203, 5, 1, -1),
(204, 5, 1, -1),
(205, 5, 2, -1),
(206, 5, 4, -1),
(207, 14, 2, -3),
(208, 18, 2, -1),
(209, 12, 3, -2),
(210, 12, 3, -2),
(211, 12, 3, -2),
(212, 12, 4, -2),
(213, 16, 2, 2),
(214, 2, 1, 2),
(215, 2, 2, 1),
(216, 9, 4, -1),
(217, 14, 4, 1),
(218, 1, 4, 1),
(219, 14, 2, 6),
(220, 3, 1, -2),
(221, 1, 1, 1),
(222, 9, 3, -3),
(223, 10, 4, 2),
(224, 4, 1, -1),
(225, 4, 2, -1),
(226, 4, 3, -1),
(227, 4, 4, -1),
(228, 10, 3, 6),
(229, 20, 1, -1),
(230, 20, 2, -1),
(231, 20, 2, -1),
(232, 20, 4, -1),
(233, 5, 1, 1),
(234, 3, 1, -2),
(235, 1, 3, 3),
(236, 4, 4, 1),
(237, 4, 1, 3),
(238, 13, 1, 2),
(239, 18, 4, -1),
(240, 18, 4, 1),
(241, 3, 1, -1),
(242, 3, 1, -1),
(243, 3, 1, -1),
(244, 3, 4, -1),
(245, 20, 1, 2),
(246, 16, 1, -1),
(247, 16, 2, -1),
(248, 16, 2, -1),
(249, 16, 4, -1),
(250, 14, 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `onsale`
--

CREATE TABLE `onsale` (
  `idonsale` int(11) NOT NULL,
  `iduser` int(11) NOT NULL,
  `idbahanbaku` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `currency` varchar(100) NOT NULL,
  `pembeli` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `onsale`
--

INSERT INTO `onsale` (`idonsale`, `iduser`, `idbahanbaku`, `qty`, `harga`, `currency`, `pembeli`) VALUES
(8, 3, 1, 1, 75, 'SGD', 15),
(9, 15, 2, 3, 300, 'RMB', 2),
(10, 5, 1, 1, 75, 'SGD', 16),
(12, 5, 1, 1, 75, 'RMB', 15),
(13, 1, 1, 3, 68, 'IDR', 3),
(14, 5, 1, 1, 80, 'SGD', 16),
(16, 3, 1, 2, 140, 'SGD', 16),
(17, 3, 1, 2, 140, 'RMB', 15),
(18, 18, 2, 1, 100, 'RMB', 4),
(20, 5, 1, 1, 80, 'SGD', 16),
(21, 19, 2, 1, 100, 'SGD', 4),
(22, 14, 2, 3, 300, 'SGD', 5),
(23, 19, 2, 2, 250, 'SGD', 1),
(25, 5, 1, 1, 80, 'SGD', 20),
(27, 19, 2, 1, 150, 'SGD', 1),
(28, 19, 2, 2, 275, 'SGD', 0),
(29, 11, 3, 3, 300, 'IDR', 4),
(30, 9, 3, 3, 300, 'RMB', 1),
(31, 15, 2, 3, 320, 'RMB', 0),
(32, 5, 1, 1, 100, 'SGD', 0),
(34, 18, 2, 1, 75, 'SGD', 2),
(35, 9, 4, 1, 200, 'RMB', 0),
(36, 3, 1, 2, 140, 'RMB', 13),
(37, 9, 3, 3, 500, 'IDR', 0),
(38, 3, 1, 2, 160, 'SGD', 20);

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE `pembelian` (
  `idpembelian` int(11) NOT NULL,
  `idbahanbaku` int(11) NOT NULL,
  `iduser` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `hsatuan` int(11) NOT NULL,
  `currency` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembelian`
--

INSERT INTO `pembelian` (`idpembelian`, `idbahanbaku`, `iduser`, `qty`, `hsatuan`, `currency`) VALUES
(1, 4, 16, 2, 100, 'SGD'),
(2, 2, 16, 6, 50, 'SGD'),
(3, 4, 4, 3, 100, 'IDR'),
(4, 1, 4, 6, 50, 'IDR'),
(5, 4, 2, 2, 100, 'IDR'),
(6, 1, 2, 4, 56, 'IDR'),
(7, 4, 15, 2, 98, 'SGD'),
(8, 2, 15, 6, 56, 'SGD'),
(9, 4, 3, 2, 114, 'IDR'),
(10, 1, 3, 6, 56, 'IDR'),
(12, 4, 7, 4, 87, 'RMB'),
(13, 3, 7, 9, 39, 'RMB'),
(14, 4, 19, 1, 98, 'SGD'),
(15, 2, 19, 3, 56, 'SGD'),
(16, 4, 5, 1, 114, 'IDR'),
(17, 1, 5, 3, 56, 'IDR'),
(18, 4, 14, 2, 98, 'SGD'),
(19, 2, 14, 6, 56, 'SGD'),
(20, 4, 18, 2, 98, 'SGD'),
(21, 4, 1, 1, 114, 'IDR'),
(22, 1, 1, 3, 56, 'IDR'),
(23, 2, 18, 5, 57, 'SGD'),
(24, 1, 5, 3, 56, 'IDR'),
(25, 4, 13, 2, 84, 'RMB'),
(26, 3, 13, 6, 38, 'RMB'),
(27, 4, 20, 2, 103, 'SGD'),
(28, 2, 20, 6, 57, 'SGD'),
(29, 4, 10, 4, 84, 'RMB'),
(30, 3, 10, 12, 38, 'RMB'),
(31, 4, 20, 1, 103, 'SGD'),
(32, 4, 3, 1, 111, 'IDR'),
(33, 1, 3, 6, 56, 'IDR'),
(34, 4, 5, 1, 103, 'IDR'),
(35, 1, 5, 3, 56, 'IDR'),
(36, 2, 19, 3, 57, 'SGD'),
(37, 4, 19, 1, 102, 'SGD'),
(38, 4, 12, 2, 93, 'RMB'),
(39, 3, 12, 6, 38, 'RMB'),
(40, 1, 1, 3, 56, 'IDR'),
(41, 1, 4, 1, 56, 'IDR'),
(42, 2, 19, 3, 57, 'SGD'),
(43, 1, 5, 3, 56, 'IDR'),
(44, 4, 15, 1, 102, 'SGD'),
(45, 2, 15, 6, 57, 'SGD'),
(46, 4, 11, 2, 93, 'RMB'),
(47, 3, 11, 6, 38, 'RMB'),
(48, 4, 16, 2, 102, 'SGD'),
(49, 2, 16, 2, 57, 'SGD'),
(50, 4, 9, 1, 97, 'RMB'),
(51, 3, 9, 3, 38, 'RMB'),
(52, 2, 14, 3, 58, 'SGD'),
(53, 4, 9, 1, 97, 'RMB'),
(54, 3, 9, 3, 38, 'RMB'),
(55, 4, 19, 1, 106, 'SGD'),
(56, 2, 19, 3, 58, 'SGD'),
(57, 4, 18, 1, 106, 'SGD'),
(58, 4, 13, 1, 97, 'RMB'),
(59, 3, 13, 3, 38, 'RMB'),
(60, 2, 18, 3, 58, 'SGD'),
(61, 4, 5, 2, 95, 'IDR'),
(62, 1, 5, 3, 47, 'IDR'),
(63, 2, 19, 3, 63, 'SGD'),
(64, 4, 8, 2, 101, 'RMB'),
(65, 1, 3, 6, 47, 'IDR'),
(66, 3, 8, 6, 43, 'RMB'),
(67, 4, 3, 1, 93, 'IDR'),
(68, 4, 16, 1, 104, 'SGD'),
(69, 4, 2, 1, 93, 'IDR'),
(70, 2, 16, 2, 63, 'SGD'),
(71, 1, 2, 2, 47, 'IDR'),
(72, 4, 14, 1, 104, 'SGD'),
(73, 4, 1, 1, 93, 'IDR'),
(74, 2, 14, 6, 63, 'SGD'),
(75, 1, 1, 1, 47, 'IDR'),
(76, 4, 10, 2, 101, 'RMB'),
(77, 3, 10, 6, 43, 'RMB'),
(78, 1, 5, 1, 47, 'IDR'),
(79, 4, 4, 1, 93, 'IDR'),
(80, 1, 4, 3, 47, 'IDR');

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `idpenjualan` int(11) NOT NULL,
  `iduser` int(11) NOT NULL,
  `iddesain` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `hsatuan` int(11) NOT NULL,
  `currency` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`idpenjualan`, `iduser`, `iddesain`, `qty`, `hsatuan`, `currency`) VALUES
(1, 3, 1, 1, 300, 'IDR'),
(2, 19, 2, 1, 300, 'SGD'),
(3, 5, 1, 1, 293, 'IDR'),
(4, 15, 6, 1, 500, 'SGD'),
(5, 2, 4, 1, 500, 'IDR'),
(6, 16, 6, 2, 500, 'SGD'),
(7, 20, 2, 1, 293, 'SGD'),
(8, 18, 2, 1, 286, 'SGD'),
(9, 13, 3, 1, 328, 'RMB'),
(10, 10, 3, 1, 328, 'RMB'),
(11, 19, 2, 1, 286, 'SGD'),
(12, 2, 4, 1, 500, 'IDR'),
(13, 4, 4, 1, 500, 'IDR'),
(14, 10, 3, 1, 328, 'RMB'),
(15, 5, 4, 1, 500, 'IDR'),
(16, 3, 1, 1, 286, 'IDR'),
(17, 7, 3, 3, 322, 'RMB'),
(18, 16, 6, 2, 500, 'SGD'),
(19, 13, 3, 1, 322, 'RMB'),
(20, 1, 4, 1, 498, 'IDR'),
(21, 15, 6, 1, 500, 'SGD'),
(22, 5, 4, 1, 498, 'IDR'),
(23, 12, 3, 2, 322, 'RMB'),
(24, 4, 10, 1, 700, 'IDR'),
(25, 20, 6, 1, 500, 'SGD'),
(26, 3, 1, 1, 293, 'IDR'),
(27, 16, 6, 1, 500, 'SGD');

-- --------------------------------------------------------

--
-- Table structure for table `saham`
--

CREATE TABLE `saham` (
  `idsaham` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `saham`
--

INSERT INTO `saham` (`idsaham`, `nama`) VALUES
(1, 'Sampoerna'),
(2, 'Freeport'),
(3, 'Ciputra');

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `idsetting` int(11) NOT NULL,
  `namasetting` varchar(100) NOT NULL,
  `harga1` int(11) NOT NULL,
  `harga2` int(11) NOT NULL,
  `harga3` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`idsetting`, `namasetting`, `harga1`, `harga2`, `harga3`) VALUES
(1, 'exportimport', 250, 250, 250),
(2, 'bungapinjam', 10, 0, 0),
(3, 'bungatabung', 5, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tcurrency`
--

CREATE TABLE `tcurrency` (
  `idtcurrency` int(11) NOT NULL,
  `iduser` int(11) NOT NULL,
  `currency1` varchar(100) NOT NULL,
  `currency2` varchar(100) NOT NULL,
  `nominal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tcurrency`
--

INSERT INTO `tcurrency` (`idtcurrency`, `iduser`, `currency1`, `currency2`, `nominal`) VALUES
(1, 8, 'SGD', 'RMB', 1000);

-- --------------------------------------------------------

--
-- Table structure for table `timer`
--

CREATE TABLE `timer` (
  `id` int(11) NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `timer`
--

INSERT INTO `timer` (`id`, `time`) VALUES
(1, 1508496930);

-- --------------------------------------------------------

--
-- Table structure for table `tpinjaman`
--

CREATE TABLE `tpinjaman` (
  `idtpinjaman` int(11) NOT NULL,
  `iduser` int(11) NOT NULL,
  `nominal` int(11) NOT NULL,
  `currency` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tpinjaman`
--

INSERT INTO `tpinjaman` (`idtpinjaman`, `iduser`, `nominal`, `currency`) VALUES
(1, 4, 80, 'IDR'),
(2, 4, 800, 'IDR'),
(3, 4, 30, 'SGD'),
(4, 4, 300, 'SGD'),
(5, 4, 40, 'RMB'),
(6, 4, 400, 'RMB'),
(7, 16, 100, 'SGD'),
(8, 16, 1000, 'SGD'),
(9, 19, 50, 'IDR'),
(10, 19, 500, 'IDR'),
(11, 19, 50, 'SGD'),
(12, 19, 500, 'SGD'),
(13, 2, 50, 'IDR'),
(14, 2, 500, 'IDR'),
(15, 19, 50, 'RMB'),
(16, 19, 500, 'RMB'),
(17, 2, 50, 'SGD'),
(18, 2, 500, 'SGD'),
(19, 2, 50, 'RMB'),
(20, 2, 500, 'RMB'),
(21, 3, 90, 'IDR'),
(22, 3, 900, 'IDR'),
(23, 15, 150, 'SGD'),
(24, 15, 1500, 'SGD'),
(25, 3, 30, 'SGD'),
(26, 3, 300, 'SGD'),
(27, 3, 30, 'RMB'),
(28, 3, 300, 'RMB'),
(29, 14, 25, 'IDR'),
(30, 14, 250, 'IDR'),
(31, 14, 100, 'SGD'),
(32, 14, 1000, 'SGD'),
(33, 7, 70, 'RMB'),
(34, 7, 700, 'RMB'),
(35, 14, 25, 'RMB'),
(36, 14, 250, 'RMB'),
(37, 5, 80, 'IDR'),
(38, 5, 800, 'IDR'),
(39, 18, 50, 'IDR'),
(40, 18, 500, 'IDR'),
(41, 5, 30, 'SGD'),
(42, 5, 300, 'SGD'),
(43, 18, 50, 'SGD'),
(44, 18, 500, 'SGD'),
(45, 5, 30, 'RMB'),
(46, 5, 300, 'RMB'),
(47, 18, 50, 'RMB'),
(48, 18, 500, 'RMB'),
(49, 1, 50, 'IDR'),
(50, 1, 500, 'IDR'),
(51, 1, 50, 'SGD'),
(52, 1, 500, 'SGD'),
(53, 13, 35, 'IDR'),
(54, 13, 350, 'IDR'),
(55, 1, 50, 'RMB'),
(56, 1, 500, 'RMB'),
(57, 13, 35, 'SGD'),
(58, 13, 350, 'SGD'),
(59, 13, 80, 'RMB'),
(60, 13, 800, 'RMB'),
(61, 9, 100, 'IDR'),
(62, 9, 1000, 'IDR'),
(63, 10, 150, 'RMB'),
(64, 10, 1500, 'RMB'),
(65, 12, 50, 'IDR'),
(66, 12, 500, 'IDR'),
(67, 12, 50, 'SGD'),
(68, 12, 500, 'SGD'),
(69, 11, 50, 'IDR'),
(70, 11, 500, 'IDR'),
(71, 12, 50, 'RMB'),
(72, 12, 500, 'RMB'),
(73, 11, 50, 'RMB'),
(74, 11, 500, 'RMB'),
(75, 20, 150, 'SGD'),
(76, 20, 1500, 'SGD'),
(77, 8, 100, 'SGD'),
(78, 8, 1000, 'SGD'),
(79, 9, 50, 'RMB'),
(80, 9, 500, 'RMB'),
(81, 8, 50, 'IDR'),
(82, 8, 500, 'IDR'),
(83, 3, -330, 'SGD'),
(84, 3, -330, 'RMB'),
(85, 2, -550, 'IDR'),
(86, 1, 55, 'IDR'),
(87, 1, 55, 'RMB'),
(88, 1, 55, 'SGD'),
(89, 2, 0, 'IDR'),
(90, 2, 55, 'RMB'),
(91, 2, 55, 'SGD'),
(92, 3, 99, 'IDR'),
(93, 3, 0, 'RMB'),
(94, 3, 0, 'SGD'),
(95, 4, 88, 'IDR'),
(96, 4, 44, 'RMB'),
(97, 4, 33, 'SGD'),
(98, 5, 88, 'IDR'),
(99, 5, 33, 'RMB'),
(100, 5, 33, 'SGD'),
(101, 7, 77, 'RMB'),
(102, 8, 55, 'IDR'),
(103, 8, 110, 'SGD'),
(104, 9, 110, 'IDR'),
(105, 9, 55, 'RMB'),
(106, 10, 165, 'RMB'),
(107, 11, 55, 'IDR'),
(108, 11, 55, 'RMB'),
(109, 12, 55, 'IDR'),
(110, 12, 55, 'RMB'),
(111, 12, 55, 'SGD'),
(112, 13, 39, 'IDR'),
(113, 13, 88, 'RMB'),
(114, 13, 39, 'SGD'),
(115, 14, 28, 'IDR'),
(116, 14, 28, 'RMB'),
(117, 14, 110, 'SGD'),
(118, 15, 165, 'SGD'),
(119, 16, 110, 'SGD'),
(120, 18, 55, 'IDR'),
(121, 18, 55, 'RMB'),
(122, 18, 55, 'SGD'),
(123, 19, 55, 'IDR'),
(124, 19, 55, 'RMB'),
(125, 19, 55, 'SGD'),
(126, 20, 165, 'SGD');

-- --------------------------------------------------------

--
-- Table structure for table `tsaham`
--

CREATE TABLE `tsaham` (
  `idtsaham` int(11) NOT NULL,
  `iduser` int(11) NOT NULL,
  `idsaham` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `hsatuan` int(11) NOT NULL,
  `currency` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ttabungan`
--

CREATE TABLE `ttabungan` (
  `idttabungan` int(11) NOT NULL,
  `iduser` int(11) NOT NULL,
  `nominal` int(11) NOT NULL,
  `currency` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `iduser` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `cash1` int(11) NOT NULL,
  `cash2` int(11) NOT NULL,
  `cash3` int(11) NOT NULL,
  `maxweight` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`iduser`, `nama`, `password`, `cash1`, `cash2`, `cash3`, `maxweight`) VALUES
(1, 'tim1', 'tim1', 476, 100, 200, 50),
(2, 'tim2', 'tim2', 339, 425, 200, 50),
(3, 'tim3', 'tim3', 325, 345, 250, 50),
(4, 'tim4', 'tim4', 810, 200, 300, 50),
(5, 'tim5', 'tim5', 824, 315, 375, 50),
(6, 'tim6', 'tim6', 0, 0, 0, 50),
(7, 'tim7', 'tim7', 0, 0, 967, 50),
(8, 'tim8', 'tim8', 500, 0, 212, 50),
(9, 'tim9', 'tim9', 1000, 0, 378, 50),
(10, 'tim10', 'tim10', 0, 0, 904, 50),
(11, 'tim11', 'tim11', 800, 0, 86, 50),
(12, 'tim12', 'tim12', 500, 500, 730, 50),
(13, 'tim13', 'tim13', 350, 350, 703, 50),
(14, 'tim14', 'tim14', 250, 112, 250, 50),
(15, 'tim15', 'tim15', 0, 1449, 85, 50),
(16, 'tim16', 'tim16', 0, 2077, 0, 50),
(17, 'tim17', 'tim17', 0, 0, 0, 50),
(18, 'tim18', 'tim18', 500, 100, 600, 50),
(19, 'tim19', 'tim19', 500, 407, 500, 50),
(20, 'tim20', 'tim20', 0, 1402, 0, 50);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bahanbaku`
--
ALTER TABLE `bahanbaku`
  ADD PRIMARY KEY (`idbahanbaku`);

--
-- Indexes for table `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`idcurrency`);

--
-- Indexes for table `desain`
--
ALTER TABLE `desain`
  ADD PRIMARY KEY (`iddesain`);

--
-- Indexes for table `detildesain`
--
ALTER TABLE `detildesain`
  ADD PRIMARY KEY (`iddetildesain`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`idevent`);

--
-- Indexes for table `hargasaham`
--
ALTER TABLE `hargasaham`
  ADD PRIMARY KEY (`idhargasaham`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`idinventory`);

--
-- Indexes for table `onsale`
--
ALTER TABLE `onsale`
  ADD PRIMARY KEY (`idonsale`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`idpembelian`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`idpenjualan`);

--
-- Indexes for table `saham`
--
ALTER TABLE `saham`
  ADD PRIMARY KEY (`idsaham`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`idsetting`);

--
-- Indexes for table `tcurrency`
--
ALTER TABLE `tcurrency`
  ADD PRIMARY KEY (`idtcurrency`);

--
-- Indexes for table `timer`
--
ALTER TABLE `timer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tpinjaman`
--
ALTER TABLE `tpinjaman`
  ADD PRIMARY KEY (`idtpinjaman`);

--
-- Indexes for table `tsaham`
--
ALTER TABLE `tsaham`
  ADD PRIMARY KEY (`idtsaham`);

--
-- Indexes for table `ttabungan`
--
ALTER TABLE `ttabungan`
  ADD PRIMARY KEY (`idttabungan`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`iduser`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bahanbaku`
--
ALTER TABLE `bahanbaku`
  MODIFY `idbahanbaku` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `currency`
--
ALTER TABLE `currency`
  MODIFY `idcurrency` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `desain`
--
ALTER TABLE `desain`
  MODIFY `iddesain` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `detildesain`
--
ALTER TABLE `detildesain`
  MODIFY `iddetildesain` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `idevent` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hargasaham`
--
ALTER TABLE `hargasaham`
  MODIFY `idhargasaham` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=416;
--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `idinventory` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=251;
--
-- AUTO_INCREMENT for table `onsale`
--
ALTER TABLE `onsale`
  MODIFY `idonsale` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT for table `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `idpembelian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;
--
-- AUTO_INCREMENT for table `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `idpenjualan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `saham`
--
ALTER TABLE `saham`
  MODIFY `idsaham` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `idsetting` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tcurrency`
--
ALTER TABLE `tcurrency`
  MODIFY `idtcurrency` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `timer`
--
ALTER TABLE `timer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tpinjaman`
--
ALTER TABLE `tpinjaman`
  MODIFY `idtpinjaman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;
--
-- AUTO_INCREMENT for table `tsaham`
--
ALTER TABLE `tsaham`
  MODIFY `idtsaham` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ttabungan`
--
ALTER TABLE `ttabungan`
  MODIFY `idttabungan` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `iduser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
