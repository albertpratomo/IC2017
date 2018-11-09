-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 23, 2017 at 06:16 AM
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
(1, 'BenangMerah', 65, 50, 50, 1, 926, 1000, 1000, 926, 1000, 1000),
(2, 'BenangKuning', 50, 32, 50, 1, 1000, 924, 1000, 924, 924, 1000),
(3, 'BenangBiru', 50, 50, 55, 1, 1000, 1000, 922, 922, 1000, 922),
(4, 'Template', 119, 84, 101, 3, 975, 969, 977, 975, 969, 977),
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
(1, 'IDR', 41, 0),
(2, 'SGD', 44, 0),
(3, 'RMB', 65, 0);

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
(1, '3M 0K 0B', 309, 292, 300, 9993, 9989, 9993, 9993, 9989, 9993),
(2, '0M 3K 0B', 300, 300, 300, 10000, 10000, 10000, 10000, 10000, 10000),
(3, '0M 0K 3B', 300, 300, 300, 10000, 10000, 10000, 10000, 10000, 10000),
(4, '2M 1K 0B', 499, 503, 498, 25, 26, 24, 25, 26, 24),
(5, '2M 0K 1B', 500, 500, 500, 30, 30, 30, 30, 30, 30),
(6, '1M 2K 0B', 500, 500, 500, 30, 30, 30, 30, 30, 30),
(7, '1M 0K 2B', 500, 500, 500, 30, 30, 30, 30, 30, 30),
(8, '0M 2K 1B', 500, 500, 500, 30, 30, 30, 30, 30, 30),
(9, '0M 1K 2B', 500, 500, 500, 30, 30, 30, 30, 30, 30),
(10, '1M 1K 1B', 701, 700, 699, 11, 10, 11, 11, 10, 11);

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
(410, 0, 3450, 1150, 2350, 0, 0, 0),
(411, 0, 4733, 4866, 6802, 0, 0, 0),
(412, 0, 5461, 4514, 6234, 0, 0, 0),
(413, 0, 4650, 6146, 5409, 0, 0, 0),
(414, 0, 5505, 6673, 4512, 0, 0, 0),
(415, 0, 5831, 5119, 6448, 0, 0, 0),
(416, 0, 4801, 6714, 7829, 0, 0, 0),
(417, 0, 3322, 6125, 6582, 0, 0, 0);

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
(1, 7, 4, 2),
(2, 7, 3, 6),
(3, 7, 3, -3),
(4, 1, 4, 3),
(5, 1, 1, 9),
(6, 8, 4, 2),
(7, 5, 4, 2),
(8, 8, 3, 6),
(9, 5, 1, 6),
(10, 4, 4, 2),
(11, 20, 4, 4),
(12, 4, 1, 6),
(13, 11, 4, 2),
(14, 1, 1, -1),
(15, 20, 4, 4),
(16, 20, 4, -4),
(17, 2, 4, 3),
(18, 20, 2, 12),
(19, 2, 1, 3),
(20, 8, 3, -1),
(21, 15, 2, 6),
(22, 15, 4, 2),
(23, 3, 4, 2),
(24, 5, 1, -2),
(25, 20, 2, -1),
(26, 14, 4, 4),
(27, 3, 1, 6),
(28, 13, 4, 3),
(29, 14, 2, 12),
(30, 2, 3, 3),
(31, 1, 3, 1),
(32, 13, 3, 6),
(33, 19, 4, 3),
(34, 7, 3, -1),
(35, 7, 3, -1),
(36, 7, 3, -1),
(37, 7, 4, -1),
(38, 15, 1, 2),
(39, 19, 4, -3),
(40, 7, 1, 1),
(41, 8, 3, -1),
(42, 19, 4, 2),
(43, 8, 3, -1),
(44, 8, 3, -1),
(45, 8, 3, -1),
(46, 8, 4, -1),
(47, 9, 4, 1),
(48, 19, 2, 6),
(49, 8, 3, -1),
(50, 9, 3, 3),
(51, 16, 4, 2),
(52, 20, 2, -1),
(53, 20, 2, -1),
(54, 20, 2, -1),
(55, 20, 4, -1),
(56, 2, 3, 1),
(57, 16, 2, 6),
(58, 5, 1, 3),
(59, 10, 4, 2),
(60, 10, 3, 6),
(61, 18, 4, 2),
(62, 4, 3, 1),
(63, 18, 2, 6),
(64, 11, 3, 6),
(65, 5, 1, -2),
(66, 14, 1, 2),
(67, 1, 1, -1),
(68, 1, 1, -1),
(69, 1, 1, -1),
(70, 1, 4, -1),
(71, 20, 2, -1),
(72, 20, 2, -1),
(73, 20, 2, -1),
(74, 20, 4, -1),
(75, 1, 1, -1),
(76, 1, 1, -1),
(77, 1, 3, -1),
(78, 1, 4, -1),
(79, 18, 2, 6),
(80, 8, 3, 3),
(81, 20, 2, 1),
(82, 20, 2, 1),
(83, 20, 2, 1),
(84, 20, 4, 1),
(85, 4, 1, -1),
(86, 4, 1, -1),
(87, 4, 3, -1),
(88, 4, 4, -1),
(89, 8, 3, 3),
(90, 20, 2, -2),
(91, 20, 2, -2),
(92, 20, 2, -2),
(93, 20, 4, -2),
(94, 5, 1, -2),
(95, 7, 4, 1),
(96, 8, 3, -1),
(97, 1, 4, 2),
(98, 8, 3, -1),
(99, 1, 1, -3),
(100, 20, 4, 1),
(101, 1, 4, -1),
(102, 15, 1, -2),
(103, 15, 2, -2),
(104, 15, 2, -2),
(105, 15, 4, -2),
(106, 8, 3, 1),
(107, 7, 3, 6),
(108, 1, 1, 6),
(109, 20, 2, 3),
(110, 4, 1, -1),
(111, 3, 1, -2),
(112, 3, 1, -2),
(113, 3, 1, -2),
(114, 3, 4, -2),
(115, 7, 1, 2),
(116, 1, 3, 1),
(117, 13, 2, 0),
(118, 9, 4, 1),
(119, 19, 1, 0),
(120, 10, 3, -1),
(121, 10, 3, -1),
(122, 8, 1, 1),
(123, 10, 3, -1),
(124, 10, 4, -1),
(125, 18, 2, -3),
(126, 16, 2, -2),
(127, 16, 2, -2),
(128, 16, 2, -2),
(129, 16, 4, -2),
(130, 13, 2, 3),
(131, 7, 3, -3),
(132, 2, 2, 3),
(133, 19, 1, 2),
(134, 10, 3, -1),
(135, 10, 3, -1),
(136, 10, 3, -1),
(137, 10, 4, -1),
(138, 9, 3, 6),
(139, 11, 3, -3),
(140, 1, 1, -2),
(141, 4, 3, 3),
(142, 3, 4, 2),
(143, 18, 3, 3),
(144, 19, 3, 1),
(145, 3, 1, 6),
(146, 15, 1, 2),
(147, 2, 3, -1),
(148, 16, 4, 2),
(149, 16, 2, 6),
(150, 5, 1, 3),
(151, 13, 1, 0),
(152, 10, 4, 2),
(153, 20, 2, -1),
(154, 20, 2, -1),
(155, 20, 2, -1),
(156, 20, 4, -1),
(157, 13, 1, 2),
(158, 10, 3, 6),
(159, 8, 1, -1),
(160, 8, 3, -1),
(161, 8, 3, -1),
(162, 8, 4, -1),
(163, 4, 1, -1),
(164, 4, 1, -1),
(165, 4, 3, -1),
(166, 4, 4, -1),
(167, 20, 2, 1),
(168, 5, 1, -2),
(169, 7, 3, 1),
(170, 5, 3, 1),
(171, 14, 2, -2),
(172, 14, 2, -2),
(173, 14, 2, -2),
(174, 14, 4, -2),
(175, 4, 4, 1),
(176, 14, 1, -2),
(177, 14, 2, -2),
(178, 14, 2, -2),
(179, 14, 4, -2),
(180, 15, 4, 2),
(181, 8, 4, 2),
(182, 1, 1, -1),
(183, 1, 1, -1),
(184, 1, 3, -1),
(185, 1, 4, -1),
(186, 8, 3, 3),
(187, 19, 2, -2),
(188, 4, 1, -1),
(189, 4, 3, -1),
(190, 4, 3, -1),
(191, 4, 4, -1),
(192, 20, 2, -1),
(193, 20, 2, -1),
(194, 20, 2, -1),
(195, 20, 4, -1),
(196, 18, 1, 2),
(197, 7, 2, 2),
(198, 9, 3, -3),
(199, 7, 1, -2),
(200, 7, 3, -2),
(201, 7, 3, -2),
(202, 7, 4, -2),
(203, 1, 1, 3),
(204, 19, 1, -1),
(205, 19, 2, -1),
(206, 19, 3, -1),
(207, 19, 4, -1),
(208, 7, 1, -1),
(209, 5, 1, -2),
(210, 3, 1, -2),
(211, 3, 1, -2),
(212, 3, 1, -2),
(213, 3, 4, -2),
(214, 13, 2, -1),
(215, 13, 3, -1),
(216, 13, 3, -1),
(217, 13, 4, -1),
(218, 8, 1, 2),
(219, 7, 4, 2),
(220, 7, 3, 6),
(221, 1, 1, -2),
(222, 13, 1, -1),
(223, 13, 2, -1),
(224, 13, 3, -1),
(225, 13, 4, -1),
(226, 3, 4, 2),
(227, 14, 2, -2),
(228, 19, 4, 1),
(229, 8, 3, -1),
(230, 11, 3, -1),
(231, 11, 3, -1),
(232, 11, 3, -1),
(233, 11, 4, -1),
(234, 19, 2, 3),
(235, 1, 2, 2),
(236, 15, 3, 1),
(237, 3, 1, 6),
(238, 7, 1, 2),
(239, 8, 3, -1),
(240, 7, 3, -3),
(241, 2, 1, -3),
(242, 2, 2, -3),
(243, 2, 3, -3),
(244, 2, 4, -3),
(245, 19, 3, 1),
(246, 9, 3, -1),
(247, 1, 3, 1),
(248, 16, 2, -2),
(249, 16, 2, -2),
(250, 16, 2, -2),
(251, 16, 4, -2),
(252, 9, 3, -1),
(253, 9, 3, -1),
(254, 9, 3, -1),
(255, 9, 4, -1),
(256, 9, 3, -1),
(257, 11, 3, 3),
(258, 5, 1, 1),
(259, 8, 1, -2),
(260, 8, 3, -2),
(261, 8, 3, -2),
(262, 8, 4, -2),
(263, 13, 3, -2),
(264, 19, 2, -2),
(265, 2, 4, 1),
(266, 2, 1, 3),
(267, 8, 4, 3),
(268, 3, 1, -1),
(269, 1, 3, 1),
(270, 8, 3, 6),
(271, 10, 3, -2),
(272, 10, 3, -2),
(273, 10, 3, -2),
(274, 10, 4, -2),
(275, 4, 3, 1),
(276, 18, 1, -2),
(277, 18, 2, -2),
(278, 18, 3, -2),
(279, 18, 4, -2),
(280, 19, 1, 1),
(281, 9, 2, 2),
(282, 16, 1, 0),
(283, 13, 1, -1),
(284, 13, 2, -1),
(285, 13, 3, -1),
(286, 13, 4, -1),
(287, 1, 1, -1),
(288, 1, 2, -1),
(289, 1, 3, -1),
(290, 1, 4, -1),
(291, 16, 4, 2),
(292, 15, 1, -1),
(293, 15, 2, -1),
(294, 15, 3, -1),
(295, 15, 4, -1),
(296, 15, 3, 3),
(297, 5, 1, -1),
(298, 5, 1, -1),
(299, 5, 1, -1),
(300, 5, 4, -1),
(301, 2, 1, -1),
(302, 2, 1, -1),
(303, 2, 1, -1),
(304, 1, 3, 2),
(305, 18, 4, 2),
(306, 7, 1, 1),
(307, 1, 4, 2),
(308, 1, 1, 6),
(309, 3, 1, -1),
(310, 18, 1, 1),
(311, 3, 1, 1),
(312, 4, 3, -1),
(313, 8, 1, 1),
(314, 2, 4, -1),
(315, 11, 3, -3),
(316, 5, 4, 1),
(317, 16, 2, 6),
(318, 3, 1, -1),
(319, 3, 1, -1),
(320, 3, 1, -1),
(321, 3, 1, -1),
(322, 3, 4, -1),
(323, 5, 1, 2),
(324, 19, 3, 3),
(325, 7, 1, 1),
(326, 7, 1, -2),
(327, 7, 2, -2),
(328, 7, 3, -2),
(329, 7, 4, -2),
(330, 3, 1, -1),
(331, 1, 1, -2),
(332, 11, 4, -1),
(333, 8, 3, -1),
(334, 19, 1, 1),
(335, 15, 1, -1),
(336, 15, 2, -1),
(337, 15, 3, -1),
(338, 15, 4, -1),
(339, 2, 4, 1),
(340, 4, 3, 1),
(341, 2, 1, 1),
(342, 5, 3, 3),
(343, 8, 3, -1);

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
(8, 7, 3, 3, 295, 'SGD', 2),
(9, 1, 1, 1, 75, 'SGD', 7),
(10, 8, 3, 1, 85, 'IDR', 1),
(11, 5, 1, 2, 150, 'SGD', 15),
(12, 8, 3, 1, 85, 'IDR', 2),
(13, 8, 3, 1, 85, 'SGD', 4),
(14, 5, 1, 2, 150, 'RMB', 14),
(15, 5, 1, 2, 170, 'SGD', 7),
(16, 8, 3, 1, 85, 'SGD', 1),
(18, 4, 1, 1, 90, 'IDR', 8),
(19, 18, 2, 3, 300, 'RMB', 2),
(20, 7, 3, 3, 300, 'SGD', 18),
(21, 11, 3, 3, 181, 'IDR', 4),
(22, 1, 1, 2, 175, 'SGD', 15),
(23, 2, 3, 1, 100, 'SGD', 5),
(24, 5, 1, 2, 180, 'SGD', 18),
(25, 19, 2, 2, 180, 'RMB', 7),
(26, 9, 3, 3, 400, 'RMB', 19),
(27, 5, 1, 2, 170, 'RMB', 8),
(28, 1, 1, 2, 200, 'SGD', 7),
(29, 14, 2, 2, 250, 'RMB', 1),
(30, 8, 3, 1, 85, 'IDR', 15),
(31, 8, 3, 1, 85, 'SGD', 1),
(32, 7, 3, 3, 303, 'SGD', 15),
(33, 9, 3, 1, 150, 'SGD', 4),
(34, 9, 3, 1, 150, 'IDR', 1),
(35, 13, 3, 2, 300, 'IDR', 1),
(36, 19, 2, 2, 180, 'RMB', 9),
(37, 3, 1, 1, 90, 'SGD', 19),
(38, 2, 1, 1, 100, 'SGD', 7),
(39, 2, 1, 1, 100, 'SGD', 18),
(40, 2, 1, 1, 100, 'SGD', 8),
(44, 11, 3, 3, 180, 'RMB', 5),
(45, 3, 1, 1, 95, 'SGD', 7),
(46, 3, 1, 1, 95, 'SGD', 19),
(47, 1, 1, 2, 222, 'SGD', 0),
(48, 11, 4, 1, 110, 'RMB', 0),
(49, 8, 3, 1, 120, 'SGD', 0),
(50, 8, 3, 1, 120, 'IDR', 0);

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
(1, 4, 7, 2, 100, 'RMB'),
(2, 3, 7, 6, 50, 'RMB'),
(3, 4, 1, 3, 100, 'IDR'),
(4, 1, 1, 9, 50, 'IDR'),
(5, 4, 8, 2, 103, 'RMB'),
(6, 4, 5, 2, 111, 'IDR'),
(7, 3, 8, 6, 52, 'RMB'),
(8, 1, 5, 6, 58, 'IDR'),
(9, 4, 4, 2, 111, 'IDR'),
(11, 1, 4, 6, 58, 'IDR'),
(12, 4, 11, 2, 103, 'RMB'),
(13, 4, 20, 4, 87, 'SGD'),
(14, 4, 2, 3, 111, 'IDR'),
(15, 2, 20, 12, 40, 'SGD'),
(16, 1, 2, 3, 58, 'IDR'),
(17, 2, 15, 6, 40, 'SGD'),
(18, 4, 15, 2, 87, 'SGD'),
(19, 4, 3, 2, 111, 'IDR'),
(20, 4, 14, 4, 87, 'SGD'),
(21, 1, 3, 6, 58, 'IDR'),
(22, 4, 13, 3, 103, 'RMB'),
(23, 2, 14, 12, 40, 'SGD'),
(24, 3, 13, 6, 52, 'RMB'),
(26, 4, 19, 2, 87, 'SGD'),
(27, 4, 9, 1, 103, 'RMB'),
(28, 2, 19, 6, 40, 'SGD'),
(29, 3, 9, 3, 48, 'RMB'),
(30, 4, 16, 2, 89, 'SGD'),
(31, 2, 16, 6, 45, 'SGD'),
(32, 1, 5, 3, 57, 'IDR'),
(33, 4, 10, 2, 102, 'RMB'),
(34, 3, 10, 6, 48, 'RMB'),
(35, 4, 18, 2, 89, 'SGD'),
(36, 2, 18, 6, 45, 'SGD'),
(37, 3, 11, 6, 48, 'RMB'),
(38, 2, 18, 6, 45, 'SGD'),
(39, 3, 8, 3, 48, 'RMB'),
(40, 3, 8, 3, 49, 'RMB'),
(41, 4, 7, 1, 102, 'RMB'),
(42, 4, 1, 2, 97, 'IDR'),
(43, 4, 20, 1, 102, 'SGD'),
(44, 3, 7, 6, 49, 'RMB'),
(45, 1, 1, 6, 55, 'IDR'),
(46, 2, 20, 3, 46, 'SGD'),
(47, 2, 13, 0, 46, 'SGD'),
(48, 4, 9, 1, 102, 'RMB'),
(49, 1, 19, 0, 55, 'IDR'),
(50, 2, 13, 3, 46, 'SGD'),
(51, 1, 19, 2, 55, 'IDR'),
(52, 3, 9, 6, 49, 'RMB'),
(53, 4, 3, 2, 97, 'IDR'),
(54, 3, 19, 1, 49, 'RMB'),
(55, 1, 3, 6, 55, 'IDR'),
(56, 4, 16, 2, 95, 'SGD'),
(57, 2, 16, 6, 45, 'SGD'),
(58, 1, 5, 3, 56, 'IDR'),
(59, 1, 13, 0, 56, 'IDR'),
(60, 4, 10, 2, 100, 'RMB'),
(61, 1, 13, 2, 56, 'IDR'),
(62, 3, 10, 6, 50, 'RMB'),
(63, 2, 20, 1, 45, 'SGD'),
(64, 3, 7, 1, 50, 'RMB'),
(65, 4, 4, 1, 106, 'IDR'),
(66, 4, 15, 2, 95, 'SGD'),
(67, 4, 8, 2, 100, 'RMB'),
(68, 3, 8, 3, 50, 'RMB'),
(69, 1, 1, 3, 54, 'IDR'),
(70, 4, 7, 2, 104, 'RMB'),
(71, 3, 7, 6, 53, 'RMB'),
(72, 4, 3, 2, 98, 'IDR'),
(73, 4, 19, 1, 99, 'SGD'),
(74, 2, 19, 3, 45, 'SGD'),
(75, 1, 3, 6, 54, 'IDR'),
(76, 3, 19, 1, 53, 'RMB'),
(77, 3, 11, 3, 54, 'RMB'),
(78, 1, 5, 1, 58, 'IDR'),
(79, 4, 2, 1, 101, 'IDR'),
(80, 1, 2, 3, 58, 'IDR'),
(81, 4, 8, 3, 107, 'RMB'),
(82, 3, 8, 6, 54, 'RMB'),
(83, 1, 16, 0, 58, 'IDR'),
(84, 4, 16, 2, 101, 'IDR'),
(85, 4, 18, 2, 81, 'SGD'),
(86, 4, 1, 2, 108, 'IDR'),
(87, 1, 1, 6, 57, 'IDR'),
(88, 4, 5, 1, 108, 'IDR'),
(89, 2, 16, 6, 30, 'SGD'),
(90, 1, 5, 2, 57, 'IDR'),
(91, 1, 2, 1, 57, 'IDR');

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
(1, 7, 3, 1, 300, 'RMB'),
(2, 8, 3, 1, 300, 'RMB'),
(4, 1, 1, 1, 314, 'IDR'),
(5, 20, 2, 1, 314, 'SGD'),
(6, 1, 5, 1, 500, 'IDR'),
(7, 4, 5, 1, 497, 'IDR'),
(8, 20, 2, 2, 314, 'SGD'),
(9, 15, 6, 2, 502, 'SGD'),
(10, 3, 1, 2, 300, 'IDR'),
(11, 10, 3, 1, 285, 'RMB'),
(12, 16, 2, 2, 314, 'SGD'),
(13, 20, 2, 1, 305, 'SGD'),
(14, 8, 7, 1, 503, 'RMB'),
(15, 4, 5, 1, 497, 'IDR'),
(16, 14, 2, 2, 305, 'SGD'),
(17, 14, 6, 2, 501, 'SGD'),
(18, 1, 5, 1, 497, 'IDR'),
(19, 4, 7, 1, 497, 'IDR'),
(20, 20, 2, 1, 305, 'SGD'),
(21, 7, 7, 2, 503, 'RMB'),
(22, 19, 10, 1, 700, 'SGD'),
(23, 3, 1, 2, 316, 'IDR'),
(24, 13, 9, 1, 503, 'RMB'),
(25, 13, 10, 1, 700, 'RMB'),
(26, 11, 3, 1, 306, 'RMB'),
(27, 2, 10, 3, 700, 'IDR'),
(28, 16, 2, 2, 292, 'SGD'),
(29, 9, 3, 1, 306, 'RMB'),
(30, 8, 7, 2, 501, 'RMB'),
(31, 10, 3, 2, 306, 'RMB'),
(32, 18, 10, 2, 700, 'SGD'),
(33, 13, 10, 1, 700, 'RMB'),
(34, 1, 10, 1, 700, 'IDR'),
(35, 15, 10, 1, 700, 'SGD'),
(36, 5, 1, 1, 302, 'IDR'),
(37, 7, 10, 2, 700, 'RMB'),
(38, 15, 10, 1, 700, 'SGD');

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
(1, 4, 'IDR', 'SGD', 514),
(2, 2, 'IDR', 'RMB', 400),
(3, 14, 'SGD', 'IDR', 100);

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
(1, 1508732007);

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
(1, 7, 150, 'RMB'),
(2, 7, 1500, 'RMB'),
(3, 5, 150, 'IDR'),
(4, 5, 1500, 'IDR'),
(5, 2, 70, 'IDR'),
(6, 2, 700, 'IDR'),
(7, 1, 100, 'IDR'),
(8, 1, 1000, 'IDR'),
(9, 1, 25, 'SGD'),
(10, 1, 250, 'SGD'),
(11, 2, 40, 'SGD'),
(12, 2, 400, 'SGD'),
(13, 1, 25, 'RMB'),
(14, 1, 250, 'RMB'),
(15, 2, 40, 'RMB'),
(16, 2, 400, 'RMB'),
(17, 4, 100, 'IDR'),
(18, 4, 1000, 'IDR'),
(19, 4, 50, 'SGD'),
(20, 4, 500, 'SGD'),
(21, 8, 70, 'RMB'),
(22, 8, 700, 'RMB'),
(23, 11, 80, 'RMB'),
(24, 11, 800, 'RMB'),
(25, 13, 40, 'IDR'),
(26, 13, 400, 'IDR'),
(27, 13, 40, 'SGD'),
(28, 13, 400, 'SGD'),
(29, 20, 150, 'SGD'),
(30, 20, 1500, 'SGD'),
(31, 13, 70, 'RMB'),
(32, 13, 700, 'RMB'),
(33, 15, 60, 'SGD'),
(34, 15, 600, 'SGD'),
(35, 14, 30, 'IDR'),
(36, 14, 300, 'IDR'),
(37, 14, 90, 'SGD'),
(38, 14, 900, 'SGD'),
(39, 9, 100, 'RMB'),
(40, 9, 1000, 'RMB'),
(41, 14, 30, 'RMB'),
(42, 14, 300, 'RMB'),
(43, 3, 100, 'IDR'),
(44, 3, 1000, 'IDR'),
(45, 19, 50, 'IDR'),
(46, 19, 500, 'IDR'),
(47, 19, 50, 'SGD'),
(48, 19, 500, 'SGD'),
(49, 19, 50, 'RMB'),
(50, 19, 500, 'RMB'),
(51, 16, 50, 'IDR'),
(52, 16, 500, 'IDR'),
(53, 16, 50, 'SGD'),
(54, 16, 500, 'SGD'),
(55, 16, 50, 'RMB'),
(56, 16, 500, 'RMB'),
(57, 18, 150, 'SGD'),
(58, 18, 1500, 'SGD'),
(59, 10, 150, 'RMB'),
(60, 10, 1500, 'RMB'),
(61, 8, 30, 'IDR'),
(62, 8, 300, 'IDR'),
(63, 8, 30, 'SGD'),
(64, 8, 300, 'SGD'),
(65, 17, 50, 'IDR'),
(66, 17, 500, 'IDR'),
(67, 17, 50, 'SGD'),
(68, 17, 500, 'SGD'),
(69, 17, 50, 'RMB'),
(70, 17, 500, 'RMB'),
(71, 15, 9, 'IDR'),
(72, 15, 85, 'IDR'),
(73, 1, 110, 'IDR'),
(74, 1, 28, 'RMB'),
(75, 1, 28, 'SGD'),
(76, 2, 77, 'IDR'),
(77, 2, 44, 'RMB'),
(78, 2, 44, 'SGD'),
(79, 3, 110, 'IDR'),
(80, 4, 110, 'IDR'),
(81, 4, 55, 'SGD'),
(82, 5, 165, 'IDR'),
(83, 7, 165, 'RMB'),
(84, 8, 33, 'IDR'),
(85, 8, 77, 'RMB'),
(86, 8, 33, 'SGD'),
(87, 9, 110, 'RMB'),
(88, 10, 165, 'RMB'),
(89, 11, 88, 'RMB'),
(90, 13, 44, 'IDR'),
(91, 13, 77, 'RMB'),
(92, 13, 44, 'SGD'),
(93, 14, 33, 'IDR'),
(94, 14, 33, 'RMB'),
(95, 14, 99, 'SGD'),
(96, 15, 9, 'IDR'),
(97, 15, 66, 'SGD'),
(98, 16, 55, 'IDR'),
(99, 16, 55, 'RMB'),
(100, 16, 55, 'SGD'),
(101, 17, 55, 'IDR'),
(102, 17, 55, 'RMB'),
(103, 17, 55, 'SGD'),
(104, 18, 165, 'SGD'),
(105, 19, 55, 'IDR'),
(106, 19, 55, 'RMB'),
(107, 19, 55, 'SGD'),
(108, 20, 165, 'SGD'),
(109, 15, -500, 'SGD'),
(110, 20, -1815, 'SGD'),
(111, 4, -1210, 'IDR'),
(112, 4, -405, 'SGD'),
(113, 4, -200, 'SGD'),
(114, 2, -847, 'IDR'),
(115, 14, -1089, 'SGD'),
(116, 2, -484, 'RMB'),
(117, 14, -363, 'RMB'),
(118, 14, 36, 'IDR'),
(119, 14, 363, 'IDR'),
(120, 8, -363, 'IDR'),
(121, 8, -363, 'SGD'),
(122, 8, -300, 'RMB'),
(123, 13, -847, 'RMB'),
(124, 14, -762, 'IDR'),
(125, 2, -484, 'SGD'),
(126, 7, -1500, 'RMB'),
(127, 19, 30, 'IDR');

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

--
-- Dumping data for table `ttabungan`
--

INSERT INTO `ttabungan` (`idttabungan`, `iduser`, `nominal`, `currency`) VALUES
(1, 17, 500, 'IDR'),
(2, 17, 500, 'SGD'),
(3, 17, 500, 'RMB');

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
(1, 'tim1', 'tim1', 482, 530, 0, 50),
(2, 'tim2', 'tim2', 629, 21, 31, 50),
(3, 'tim3', 'tim3', 618, 280, 0, 50),
(4, 'tim4', 'tim4', 0, 60, 0, 50),
(5, 'tim5', 'tim5', 613, 400, 140, 50),
(6, 'tim6', 'tim6', 0, 0, 0, 50),
(7, 'tim7', 'tim7', 0, 258, 1054, 50),
(8, 'tim8', 'tim8', 102, 92, 231, 50),
(9, 'tim9', 'tim9', 150, 150, 883, 50),
(10, 'tim10', 'tim10', 0, 0, 1283, 50),
(11, 'tim11', 'tim11', 181, 0, 630, 50),
(12, 'tim12', 'tim12', 0, 0, 0, 50),
(13, 'tim13', 'tim13', 338, 12, 1135, 50),
(14, 'tim14', 'tim14', 21, 495, 37, 50),
(15, 'tim15', 'tim15', 0, 1272, 0, 50),
(16, 'tim16', 'tim16', 48, 624, 500, 50),
(17, 'tim17', 'tim17', 0, 0, 0, 50),
(18, 'tim18', 'tim18', 0, 1440, 300, 50),
(19, 'tim19', 'tim19', 0, 367, 358, 50),
(20, 'tim20', 'tim20', 0, 124, 0, 50);

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
  MODIFY `idhargasaham` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=418;
--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `idinventory` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=344;
--
-- AUTO_INCREMENT for table `onsale`
--
ALTER TABLE `onsale`
  MODIFY `idonsale` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT for table `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `idpembelian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;
--
-- AUTO_INCREMENT for table `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `idpenjualan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
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
  MODIFY `idtcurrency` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `timer`
--
ALTER TABLE `timer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tpinjaman`
--
ALTER TABLE `tpinjaman`
  MODIFY `idtpinjaman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;
--
-- AUTO_INCREMENT for table `tsaham`
--
ALTER TABLE `tsaham`
  MODIFY `idtsaham` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ttabungan`
--
ALTER TABLE `ttabungan`
  MODIFY `idttabungan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `iduser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
