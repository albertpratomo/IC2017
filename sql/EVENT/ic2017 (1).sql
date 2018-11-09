-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 27, 2017 at 07:29 AM
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
(1, 'BenangMerah', 47, 50, 50, 1, 889, 1000, 1000, 889, 1000, 1000),
(2, 'BenangKuning', 50, 60, 50, 1, 1000, 877, 1000, 877, 877, 1000),
(3, 'BenangBiru', 50, 50, 44, 1, 1000, 1000, 866, 866, 1000, 866),
(4, 'Template', 80, 130, 98, 3, 968, 957, 956, 968, 957, 956),
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
(1, 'IDR', 20, 0),
(2, 'SGD', 82, 0),
(3, 'RMB', 73, 0);

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
(1, '3M 0K 0B', 302, 310, 288, 9984, 9983, 9974, 9985, 9983, 9974),
(2, '0M 3K 0B', 300, 300, 300, 10000, 10000, 10000, 10000, 10000, 10000),
(3, '0M 0K 3B', 300, 300, 300, 10000, 10000, 10000, 10000, 10000, 10000),
(4, '2M 1K 0B', 495, 501, 504, 26, 22, 29, 26, 22, 29),
(5, '2M 0K 1B', 500, 500, 500, 30, 30, 30, 30, 30, 30),
(6, '1M 2K 0B', 500, 500, 500, 30, 30, 30, 30, 30, 30),
(7, '1M 0K 2B', 500, 500, 500, 30, 30, 30, 30, 30, 30),
(8, '0M 2K 1B', 500, 500, 500, 30, 30, 30, 30, 30, 30),
(9, '0M 1K 2B', 500, 500, 500, 30, 30, 30, 30, 30, 30),
(10, '1M 1K 1B', 703, 693, 705, 14, 12, 15, 14, 12, 15);

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
(1, 0, 2550, 3250, 1550, 0, 0, 0),
(2, 0, 2343, 4932, 5696, 0, 0, 0),
(3, 0, 2141, 3668, 3406, 0, 0, 0),
(4, 0, 2368, 6128, 4720, 0, 0, 0),
(5, 0, 3742, 4834, 6379, 0, 0, 0),
(6, 0, 2443, 6520, 7826, 0, 0, 0),
(7, 0, 3206, 6870, 7242, 0, 0, 0),
(8, 0, 4007, 7009, 6207, 0, 0, 0);

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
(1, 2, 4, 4),
(2, 2, 1, 12),
(3, 9, 4, 4),
(4, 9, 3, 12),
(5, 20, 4, 2),
(6, 20, 1, 6),
(7, 7, 4, 3),
(8, 14, 4, 2),
(9, 7, 1, 8),
(10, 14, 3, 6),
(11, 19, 4, 2),
(12, 19, 2, 6),
(13, 8, 4, 3),
(14, 8, 2, 9),
(15, 17, 4, 4),
(16, 12, 4, 3),
(17, 17, 1, 11),
(18, 14, 3, -2),
(19, 12, 2, 9),
(20, 14, 3, 2),
(21, 6, 4, 4),
(22, 5, 4, 4),
(23, 14, 3, -2),
(24, 5, 3, 12),
(25, 6, 1, 11),
(26, 1, 4, 4),
(27, 1, 2, 9),
(28, 20, 1, -2),
(29, 17, 1, -3),
(30, 7, 1, -2),
(31, 15, 4, 4),
(32, 13, 4, 4),
(33, 13, 1, 12),
(34, 16, 4, 4),
(35, 15, 3, 9),
(36, 16, 2, 12),
(37, 12, 2, -2),
(38, 1, 1, 3),
(39, 5, 2, 2),
(40, 20, 3, 2),
(41, 11, 4, 4),
(42, 10, 4, 2),
(43, 10, 3, 6),
(44, 11, 2, 12),
(45, 17, 1, -3),
(46, 14, 3, -1),
(47, 14, 3, -1),
(48, 14, 3, -1),
(49, 14, 4, -1),
(50, 12, 1, 2),
(51, 3, 4, 4),
(52, 3, 3, 12),
(53, 18, 4, 2),
(54, 19, 2, -1),
(55, 19, 2, -1),
(56, 19, 2, -1),
(57, 19, 4, -1),
(58, 17, 1, 4),
(59, 18, 2, 6),
(60, 1, 2, -2),
(61, 2, 1, -3),
(62, 7, 1, -1),
(63, 7, 1, -1),
(64, 7, 1, -1),
(65, 7, 4, -1),
(66, 4, 4, 4),
(67, 11, 4, 2),
(68, 6, 1, -1),
(69, 6, 1, -1),
(70, 6, 1, -1),
(71, 6, 4, -1),
(72, 4, 3, 12),
(73, 2, 1, 3),
(74, 11, 2, 6),
(75, 17, 1, -3),
(76, 2, 1, -3),
(77, 8, 2, -1),
(78, 8, 2, -1),
(79, 8, 2, -1),
(80, 8, 4, -1),
(81, 2, 1, 3),
(82, 16, 2, -3),
(83, 9, 3, -4),
(84, 9, 3, -4),
(85, 9, 3, -4),
(86, 9, 4, -4),
(87, 20, 1, -1),
(88, 20, 1, -1),
(89, 20, 3, -1),
(90, 20, 4, -1),
(91, 12, 1, -2),
(92, 12, 2, -2),
(93, 12, 2, -2),
(94, 12, 4, -2),
(95, 14, 3, 2),
(96, 2, 1, -3),
(97, 17, 1, -1),
(98, 17, 1, -1),
(99, 17, 1, -1),
(100, 17, 4, -1),
(101, 17, 2, 3),
(102, 20, 4, 2),
(103, 10, 4, 3),
(104, 20, 1, 6),
(105, 3, 3, -3),
(106, 10, 3, 9),
(107, 6, 1, -1),
(108, 6, 1, -1),
(109, 6, 1, -1),
(110, 6, 4, -1),
(111, 8, 2, -3),
(112, 18, 3, 3),
(113, 6, 4, 1),
(114, 6, 1, 4),
(115, 4, 4, 4),
(116, 17, 2, 3),
(117, 18, 1, 3),
(118, 4, 4, -4),
(119, 9, 4, 4),
(120, 5, 2, -1),
(121, 5, 3, -1),
(122, 5, 3, -1),
(123, 5, 4, -1),
(124, 13, 1, -1),
(125, 13, 1, -1),
(126, 13, 1, -1),
(127, 13, 4, -1),
(128, 9, 3, 12),
(129, 5, 3, -1),
(130, 5, 3, -1),
(131, 5, 3, -1),
(132, 5, 4, -1),
(133, 13, 1, -1),
(134, 13, 1, -1),
(135, 13, 1, -1),
(136, 13, 4, -1),
(137, 1, 1, -3),
(138, 1, 2, -3),
(139, 1, 2, -3),
(140, 1, 4, -3),
(141, 1, 4, 3),
(142, 19, 2, -1),
(143, 19, 2, -1),
(144, 19, 2, -1),
(145, 19, 4, -1),
(146, 12, 2, -1),
(147, 1, 2, 6),
(148, 14, 3, -2),
(149, 18, 2, -1),
(150, 18, 2, -1),
(151, 18, 2, -1),
(152, 18, 4, -1),
(153, 19, 4, 3),
(154, 14, 4, 1),
(155, 20, 1, -2),
(156, 19, 2, 9),
(157, 14, 3, 1),
(158, 5, 1, 2),
(159, 7, 1, -1),
(160, 7, 1, -1),
(161, 7, 1, -1),
(162, 7, 4, -1),
(163, 6, 1, -1),
(164, 6, 1, -1),
(165, 6, 1, -1),
(166, 6, 4, -1),
(167, 1, 2, 2),
(168, 12, 3, 2),
(169, 1, 2, -3),
(170, 7, 1, 3),
(171, 2, 1, -2),
(172, 2, 1, -2),
(173, 2, 1, -2),
(174, 2, 4, -2),
(175, 17, 1, 3),
(176, 20, 1, -1),
(177, 20, 1, -1),
(178, 20, 3, -1),
(179, 20, 4, -1),
(180, 2, 2, 3),
(181, 12, 4, 1),
(182, 10, 3, -3),
(183, 12, 2, 2),
(184, 17, 1, -1),
(185, 17, 1, -1),
(186, 17, 2, -1),
(187, 17, 4, -1),
(188, 17, 2, -3),
(189, 19, 2, -2),
(190, 13, 1, -1),
(191, 13, 1, -1),
(192, 13, 1, -1),
(193, 13, 4, -1),
(194, 18, 1, -1),
(195, 18, 2, -1),
(196, 18, 3, -1),
(197, 18, 4, -1),
(198, 8, 2, 6),
(199, 16, 3, 3),
(200, 15, 3, -3),
(201, 15, 3, -3),
(202, 15, 3, -3),
(203, 15, 4, -3),
(204, 5, 4, 1),
(205, 7, 4, 1),
(206, 2, 1, 3),
(207, 11, 2, -3),
(208, 11, 2, -3),
(209, 11, 2, -3),
(210, 11, 4, -3),
(211, 7, 1, 1),
(212, 17, 2, 3),
(213, 18, 4, 2),
(214, 14, 3, 2),
(215, 16, 2, -1),
(216, 16, 2, -1),
(217, 5, 3, -1),
(218, 16, 2, -1),
(219, 5, 3, -1),
(220, 16, 4, -1),
(221, 5, 3, -1),
(222, 5, 4, -1),
(223, 17, 1, -3),
(224, 13, 1, -3),
(225, 2, 1, -3),
(226, 6, 1, -1),
(227, 6, 1, -1),
(228, 6, 1, -1),
(229, 6, 4, -1),
(230, 4, 3, -3),
(231, 6, 4, 1),
(232, 6, 1, 3),
(233, 1, 3, 3),
(234, 15, 4, 1),
(235, 20, 4, 2),
(236, 14, 3, -1),
(237, 4, 3, 6),
(238, 20, 1, 6),
(239, 1, 2, -2),
(240, 1, 2, -2),
(241, 1, 2, -2),
(242, 1, 4, -2),
(243, 17, 4, 2),
(244, 2, 3, 1),
(245, 17, 1, 9),
(246, 3, 3, -3),
(247, 3, 3, -3),
(248, 3, 3, -3),
(249, 3, 4, -3),
(250, 8, 2, -1),
(251, 8, 2, -1),
(252, 8, 2, -1),
(253, 8, 4, -1),
(254, 2, 1, 3),
(255, 8, 2, -1),
(256, 1, 4, 2),
(257, 1, 2, 4),
(258, 6, 4, 1),
(259, 5, 2, 1),
(260, 3, 3, 3),
(261, 14, 3, -1),
(262, 14, 3, -1),
(263, 14, 3, -1),
(264, 14, 4, -1),
(265, 12, 2, -1),
(266, 12, 2, -1),
(267, 12, 3, -1),
(268, 12, 4, -1),
(269, 20, 4, -1),
(270, 3, 4, 2),
(271, 12, 2, -1),
(272, 12, 2, -1),
(273, 12, 3, -1),
(274, 12, 4, -1),
(275, 6, 1, 1),
(276, 10, 3, -2),
(277, 10, 3, -2),
(278, 10, 3, -2),
(279, 10, 4, -2),
(280, 13, 4, 1),
(281, 5, 4, 2),
(282, 5, 3, 6),
(283, 19, 2, -1),
(284, 19, 2, -1),
(285, 19, 2, -1),
(286, 19, 4, -1),
(287, 13, 1, 6),
(288, 8, 2, -1),
(289, 13, 2, 2),
(290, 9, 3, -4),
(291, 9, 3, -4),
(292, 9, 3, -4),
(293, 9, 4, -4),
(294, 20, 1, -2),
(295, 16, 2, -1),
(296, 16, 2, -1),
(297, 16, 3, -1),
(298, 16, 4, -1),
(299, 14, 3, 3),
(300, 5, 2, 1),
(301, 3, 3, -3),
(302, 6, 1, -1),
(303, 6, 1, -1),
(304, 6, 1, -1),
(305, 6, 4, -1),
(306, 16, 2, -2),
(307, 16, 2, -2),
(308, 16, 3, -2),
(309, 16, 4, -2),
(310, 1, 1, 2),
(311, 10, 4, 2),
(312, 10, 3, 6),
(313, 4, 3, -2),
(314, 4, 3, -2),
(315, 4, 3, -2),
(316, 4, 4, -2),
(317, 4, 3, -1),
(318, 4, 3, -1),
(319, 4, 3, -1),
(320, 4, 4, -1),
(321, 12, 4, 2),
(322, 2, 1, -1),
(323, 2, 2, -1),
(324, 2, 3, -1),
(325, 2, 4, -1),
(326, 18, 1, -1),
(327, 18, 2, -1),
(328, 18, 3, -1),
(329, 18, 4, -1),
(330, 6, 1, 5),
(331, 12, 2, 6),
(332, 19, 1, 3),
(333, 7, 1, -1),
(334, 7, 1, -1),
(335, 7, 1, -1),
(336, 7, 4, -1),
(337, 15, 3, 6),
(338, 3, 3, 9),
(339, 16, 4, 4),
(340, 17, 1, -1),
(341, 17, 1, -1),
(342, 17, 2, -1),
(343, 17, 4, -1),
(344, 15, 3, -2),
(345, 15, 3, -2),
(346, 15, 3, -2),
(347, 15, 4, -2),
(348, 16, 2, 12),
(349, 6, 1, -1),
(350, 6, 1, -1),
(351, 6, 1, -1),
(352, 6, 4, -1),
(353, 11, 2, -3),
(354, 11, 2, -3),
(355, 11, 2, -3),
(356, 11, 4, -3),
(357, 18, 4, 1),
(358, 17, 1, -1),
(359, 17, 1, -1),
(360, 17, 2, -1),
(361, 17, 4, -1),
(362, 18, 2, 6),
(363, 7, 1, -1),
(364, 6, 3, 3),
(365, 4, 3, -6),
(366, 3, 3, -3),
(367, 7, 1, 1),
(368, 8, 4, 1),
(369, 20, 1, -1),
(370, 20, 1, -1),
(371, 20, 1, -1),
(372, 20, 4, -1),
(373, 5, 3, -1),
(374, 5, 3, -1),
(375, 5, 3, -1),
(376, 5, 4, -1),
(377, 8, 2, 3),
(378, 12, 3, 3),
(379, 1, 1, -1),
(380, 1, 2, -1),
(381, 1, 3, -1),
(382, 1, 4, -1),
(383, 7, 1, 3),
(384, 10, 3, -3),
(385, 6, 1, -1),
(386, 6, 1, -1),
(387, 6, 1, -1),
(388, 6, 4, -1),
(389, 12, 2, -2),
(390, 12, 2, -2),
(391, 12, 2, -2),
(392, 12, 4, -2),
(393, 18, 2, -3),
(394, 14, 3, -1),
(395, 14, 3, -1),
(396, 14, 3, -1),
(397, 14, 4, -1),
(398, 2, 3, 3),
(399, 13, 1, -1),
(400, 3, 3, -3),
(401, 13, 1, -1),
(402, 13, 1, -1),
(403, 13, 4, -1),
(404, 10, 3, -3),
(405, 2, 3, 3);

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
(2, 14, 3, 2, 160, 'SGD', 20),
(3, 20, 1, 2, 190, 'SGD', 12),
(4, 17, 1, 3, 225, 'IDR', 1),
(5, 12, 2, 2, 200, 'RMB', 5),
(6, 17, 1, 3, 300, 'IDR', 18),
(11, 16, 2, 3, 300, 'IDR', 17),
(13, 3, 3, 3, 280, 'RMB', 18),
(14, 8, 2, 3, 230, 'SGD', 17),
(15, 12, 2, 1, 200, 'IDR', 0),
(16, 14, 3, 2, 185, 'IDR', 12),
(17, 20, 1, 2, 220, 'RMB', 5),
(18, 1, 2, 3, 200, 'IDR', 2),
(19, 10, 3, 3, 380, 'RMB', 16),
(21, 19, 2, 2, 250, 'IDR', 13),
(22, 17, 1, 3, 300, 'IDR', 19),
(23, 13, 1, 3, 350, 'IDR', 0),
(25, 4, 3, 3, 220, 'SGD', 1),
(26, 14, 3, 1, 90, 'IDR', 2),
(27, 8, 2, 1, 90, 'SGD', 5),
(28, 20, 4, 1, 100, 'IDR', 0),
(29, 8, 2, 1, 110, 'SGD', 5),
(30, 20, 1, 2, 220, 'SGD', 1),
(31, 3, 3, 3, 300, 'IDR', 6),
(33, 3, 3, 3, 300, 'RMB', 12),
(34, 10, 3, 3, 360, 'IDR', 2),
(35, 18, 2, 3, 300, 'IDR', 0),
(36, 3, 3, 3, 380, 'RMB', 2),
(37, 10, 3, 3, 360, 'IDR', 0);

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
(1, 4, 2, 4, 100, 'IDR'),
(2, 1, 2, 12, 50, 'IDR'),
(3, 4, 9, 4, 100, 'RMB'),
(4, 3, 9, 12, 50, 'RMB'),
(5, 4, 20, 2, 100, 'IDR'),
(6, 1, 20, 6, 50, 'IDR'),
(7, 4, 7, 3, 100, 'IDR'),
(8, 4, 14, 2, 100, 'RMB'),
(9, 1, 7, 8, 50, 'IDR'),
(10, 3, 14, 6, 50, 'RMB'),
(11, 4, 19, 2, 100, 'SGD'),
(12, 2, 19, 6, 50, 'SGD'),
(13, 4, 8, 3, 100, 'SGD'),
(14, 2, 8, 9, 50, 'SGD'),
(15, 4, 17, 4, 103, 'IDR'),
(16, 4, 12, 3, 98, 'SGD'),
(17, 1, 17, 11, 52, 'IDR'),
(18, 2, 12, 9, 49, 'SGD'),
(19, 4, 6, 4, 103, 'IDR'),
(20, 4, 5, 4, 99, 'RMB'),
(21, 3, 5, 12, 50, 'RMB'),
(22, 1, 6, 11, 52, 'IDR'),
(23, 4, 1, 4, 98, 'SGD'),
(24, 2, 1, 9, 49, 'SGD'),
(25, 4, 15, 4, 99, 'RMB'),
(26, 4, 13, 4, 103, 'IDR'),
(27, 1, 13, 12, 52, 'IDR'),
(28, 4, 16, 4, 98, 'SGD'),
(29, 3, 15, 9, 50, 'RMB'),
(30, 2, 16, 12, 49, 'SGD'),
(31, 4, 11, 4, 98, 'SGD'),
(32, 4, 10, 2, 98, 'RMB'),
(33, 3, 10, 6, 47, 'RMB'),
(34, 2, 11, 12, 50, 'SGD'),
(35, 4, 3, 4, 98, 'RMB'),
(36, 3, 3, 12, 47, 'RMB'),
(37, 4, 18, 2, 98, 'SGD'),
(38, 1, 17, 4, 55, 'IDR'),
(39, 2, 18, 6, 50, 'SGD'),
(40, 4, 4, 4, 98, 'RMB'),
(41, 4, 11, 2, 98, 'SGD'),
(42, 3, 4, 12, 47, 'RMB'),
(43, 2, 11, 6, 50, 'SGD'),
(44, 3, 14, 2, 49, 'RMB'),
(45, 4, 20, 2, 95, 'IDR'),
(46, 4, 10, 3, 104, 'RMB'),
(47, 1, 20, 6, 52, 'IDR'),
(48, 3, 10, 9, 49, 'RMB'),
(49, 4, 6, 1, 95, 'IDR'),
(50, 1, 6, 4, 52, 'IDR'),
(52, 4, 9, 4, 104, 'RMB'),
(53, 3, 9, 12, 49, 'RMB'),
(54, 4, 1, 3, 91, 'SGD'),
(55, 2, 1, 6, 47, 'SGD'),
(56, 4, 19, 3, 91, 'SGD'),
(57, 4, 14, 1, 118, 'RMB'),
(58, 2, 19, 9, 47, 'SGD'),
(59, 3, 14, 1, 53, 'RMB'),
(60, 1, 7, 3, 52, 'IDR'),
(61, 4, 12, 1, 91, 'SGD'),
(62, 2, 12, 2, 47, 'SGD'),
(63, 2, 8, 6, 58, 'SGD'),
(64, 4, 5, 1, 110, 'RMB'),
(65, 4, 7, 1, 80, 'IDR'),
(66, 1, 7, 1, 47, 'IDR'),
(67, 4, 18, 2, 111, 'SGD'),
(68, 3, 14, 2, 46, 'RMB'),
(69, 4, 6, 1, 80, 'IDR'),
(70, 1, 6, 3, 47, 'IDR'),
(71, 4, 15, 1, 110, 'RMB'),
(72, 4, 20, 2, 80, 'IDR'),
(74, 1, 20, 6, 47, 'IDR'),
(75, 4, 17, 2, 80, 'IDR'),
(76, 1, 17, 9, 47, 'IDR'),
(77, 4, 1, 2, 106, 'SGD'),
(78, 2, 1, 4, 56, 'SGD'),
(79, 4, 6, 1, 89, 'IDR'),
(80, 3, 3, 3, 45, 'RMB'),
(81, 4, 3, 2, 105, 'RMB'),
(82, 1, 6, 1, 50, 'IDR'),
(83, 4, 13, 1, 89, 'IDR'),
(84, 4, 5, 2, 105, 'RMB'),
(85, 3, 5, 6, 45, 'RMB'),
(86, 1, 13, 6, 50, 'IDR'),
(87, 3, 14, 3, 45, 'RMB'),
(88, 4, 10, 2, 105, 'RMB'),
(89, 3, 10, 6, 45, 'RMB'),
(90, 4, 12, 2, 106, 'SGD'),
(91, 1, 6, 5, 50, 'IDR'),
(92, 2, 12, 6, 56, 'SGD'),
(93, 3, 15, 6, 45, 'RMB'),
(94, 3, 3, 9, 45, 'RMB'),
(95, 4, 16, 4, 106, 'SGD'),
(96, 2, 16, 12, 56, 'SGD'),
(97, 4, 18, 1, 106, 'SGD'),
(98, 2, 18, 6, 56, 'SGD'),
(99, 4, 8, 1, 106, 'SGD'),
(100, 2, 8, 3, 56, 'SGD'),
(101, 1, 7, 3, 50, 'IDR');

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
(1, 14, 3, 1, 300, 'RMB'),
(2, 19, 2, 1, 300, 'SGD'),
(3, 7, 1, 1, 300, 'IDR'),
(4, 8, 2, 1, 300, 'SGD'),
(5, 9, 3, 4, 300, 'RMB'),
(6, 20, 5, 1, 500, 'IDR'),
(7, 12, 6, 2, 500, 'SGD'),
(8, 17, 1, 1, 300, 'IDR'),
(9, 6, 1, 1, 300, 'IDR'),
(10, 5, 9, 1, 500, 'RMB'),
(11, 13, 1, 1, 300, 'IDR'),
(12, 5, 3, 1, 300, 'RMB'),
(13, 1, 6, 3, 500, 'SGD'),
(14, 19, 2, 1, 308, 'SGD'),
(15, 18, 2, 1, 308, 'SGD'),
(16, 7, 1, 1, 300, 'IDR'),
(17, 6, 1, 1, 300, 'IDR'),
(18, 2, 1, 2, 300, 'IDR'),
(19, 20, 5, 1, 500, 'IDR'),
(20, 17, 4, 1, 500, 'IDR'),
(21, 13, 1, 1, 287, 'IDR'),
(22, 18, 10, 1, 700, 'SGD'),
(23, 15, 3, 3, 305, 'RMB'),
(24, 11, 2, 3, 308, 'SGD'),
(25, 16, 2, 1, 308, 'SGD'),
(26, 5, 3, 1, 305, 'RMB'),
(27, 6, 1, 1, 287, 'IDR'),
(28, 1, 2, 2, 308, 'SGD'),
(29, 3, 3, 3, 305, 'RMB'),
(30, 8, 2, 1, 308, 'SGD'),
(31, 14, 3, 1, 302, 'RMB'),
(32, 12, 8, 1, 501, 'SGD'),
(33, 10, 3, 2, 302, 'RMB'),
(34, 19, 2, 1, 305, 'SGD'),
(35, 9, 3, 4, 302, 'RMB'),
(36, 6, 1, 1, 293, 'IDR'),
(37, 16, 8, 2, 501, 'SGD'),
(38, 4, 3, 2, 302, 'RMB'),
(39, 2, 10, 1, 702, 'IDR'),
(40, 18, 10, 1, 697, 'SGD'),
(41, 7, 1, 1, 293, 'IDR'),
(42, 15, 3, 2, 288, 'RMB'),
(43, 6, 1, 1, 299, 'IDR'),
(44, 11, 2, 3, 313, 'SGD'),
(45, 17, 4, 1, 498, 'IDR'),
(46, 20, 1, 1, 299, 'IDR'),
(47, 5, 3, 1, 288, 'RMB'),
(48, 1, 10, 1, 696, 'SGD'),
(49, 6, 1, 1, 299, 'IDR'),
(50, 12, 2, 2, 313, 'SGD'),
(51, 14, 3, 1, 288, 'RMB'),
(52, 13, 1, 1, 302, 'IDR');

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
(1, 'exportimport', 80, 80, 80),
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
(1, 8, 'SGD', 'RMB', 100),
(2, 16, 'SGD', 'IDR', 500),
(3, 8, 'SGD', 'RMB', 50),
(4, 7, 'RMB', 'SGD', 400),
(5, 5, 'RMB', 'SGD', 200),
(6, 8, 'SGD', 'IDR', 25),
(7, 10, 'IDR', 'RMB', 500),
(8, 8, 'IDR', 'SGD', 18),
(9, 8, 'RMB', 'SGD', 137),
(10, 12, 'SGD', 'RMB', 400),
(11, 2, 'IDR', 'RMB', 200),
(12, 2, 'IDR', 'SGD', 200),
(13, 10, 'RMB', 'SGD', 300),
(14, 1, 'SGD', 'RMB', 500),
(15, 8, 'SGD', 'IDR', 79),
(16, 8, 'SGD', 'RMB', 50),
(17, 6, 'IDR', 'RMB', 200),
(18, 16, 'IDR', 'RMB', 400),
(19, 2, 'IDR', 'RMB', 300),
(20, 11, 'SGD', 'IDR', 936),
(21, 8, 'RMB', 'SGD', 36),
(22, 4, 'RMB', 'IDR', 200);

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
(1, 1509081925);

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
(1, 20, 100, 'IDR'),
(2, 20, 1000, 'IDR'),
(3, 2, 150, 'IDR'),
(4, 2, 1500, 'IDR'),
(5, 20, 25, 'SGD'),
(6, 20, 250, 'SGD'),
(7, 20, 25, 'RMB'),
(8, 20, 250, 'RMB'),
(9, 9, 100, 'RMB'),
(10, 9, 1000, 'RMB'),
(11, 14, 50, 'RMB'),
(12, 14, 500, 'RMB'),
(13, 7, 70, 'IDR'),
(14, 7, 700, 'IDR'),
(15, 7, 40, 'SGD'),
(16, 7, 400, 'SGD'),
(17, 7, 40, 'RMB'),
(18, 7, 400, 'RMB'),
(19, 19, 25, 'IDR'),
(20, 19, 250, 'IDR'),
(21, 19, 100, 'SGD'),
(22, 19, 1000, 'SGD'),
(23, 8, 100, 'SGD'),
(24, 8, 1000, 'SGD'),
(25, 19, 25, 'RMB'),
(26, 19, 250, 'RMB'),
(27, 12, 80, 'SGD'),
(28, 12, 800, 'SGD'),
(29, 1, 30, 'IDR'),
(30, 1, 300, 'IDR'),
(31, 17, 100, 'IDR'),
(32, 17, 1000, 'IDR'),
(33, 1, 90, 'SGD'),
(34, 1, 900, 'SGD'),
(35, 17, 25, 'SGD'),
(36, 17, 250, 'SGD'),
(37, 1, 30, 'RMB'),
(38, 17, 25, 'RMB'),
(39, 1, 300, 'RMB'),
(40, 17, 250, 'RMB'),
(41, 6, 100, 'IDR'),
(42, 6, 1000, 'IDR'),
(43, 16, 150, 'SGD'),
(44, 16, 1500, 'SGD'),
(45, 6, 20, 'SGD'),
(46, 6, 200, 'SGD'),
(47, 6, 20, 'RMB'),
(48, 6, 200, 'RMB'),
(49, 5, 150, 'RMB'),
(50, 5, 1500, 'RMB'),
(51, 15, 30, 'SGD'),
(52, 15, 300, 'SGD'),
(53, 15, 90, 'RMB'),
(54, 15, 900, 'RMB'),
(55, 10, 100, 'RMB'),
(56, 10, 1000, 'RMB'),
(57, 11, 150, 'SGD'),
(58, 11, 1500, 'SGD'),
(59, 3, 100, 'RMB'),
(60, 3, 1000, 'RMB'),
(61, 13, 110, 'IDR'),
(62, 13, 1100, 'IDR'),
(63, 18, 25, 'IDR'),
(64, 18, 250, 'IDR'),
(65, 18, 75, 'SGD'),
(66, 18, 750, 'SGD'),
(67, 18, 25, 'RMB'),
(68, 18, 250, 'RMB'),
(69, 4, 150, 'RMB'),
(70, 4, 1500, 'RMB'),
(71, 12, 20, 'SGD'),
(72, 12, 200, 'SGD'),
(73, 10, 50, 'IDR'),
(74, 10, 500, 'IDR'),
(75, 18, 5, 'IDR'),
(76, 18, 50, 'IDR'),
(77, 18, 5, 'RMB'),
(78, 18, 50, 'RMB'),
(79, 14, 20, 'SGD'),
(80, 14, 200, 'SGD'),
(81, 7, -400, 'SGD'),
(82, 7, -40, 'SGD'),
(83, 12, 20, 'IDR'),
(84, 12, 200, 'IDR'),
(85, 14, -220, 'SGD'),
(86, 14, 10, 'RMB'),
(87, 14, 100, 'RMB'),
(88, 20, -500, 'IDR'),
(89, 20, -200, 'RMB'),
(90, 18, -600, 'SGD'),
(91, 9, -1100, 'RMB'),
(92, 17, -250, 'RMB'),
(93, 20, -275, 'SGD'),
(94, 14, -206, 'RMB'),
(95, 8, -110, 'SGD'),
(96, 10, -250, 'RMB'),
(97, 1, -330, 'RMB'),
(98, 15, -990, 'RMB'),
(99, 16, -200, 'SGD'),
(100, 17, -500, 'IDR'),
(101, 1, 33, 'IDR'),
(102, 1, 0, 'RMB'),
(103, 1, 99, 'SGD'),
(104, 2, 165, 'IDR'),
(105, 3, 110, 'RMB'),
(106, 4, 165, 'RMB'),
(107, 5, 165, 'RMB'),
(108, 6, 110, 'IDR'),
(109, 6, 22, 'RMB'),
(110, 6, 22, 'SGD'),
(111, 7, 77, 'IDR'),
(112, 7, 44, 'RMB'),
(113, 7, 0, 'SGD'),
(114, 8, 99, 'SGD'),
(115, 9, 0, 'RMB'),
(116, 10, 55, 'IDR'),
(117, 10, 85, 'RMB'),
(118, 11, 165, 'SGD'),
(119, 12, 22, 'IDR'),
(120, 12, 110, 'SGD'),
(121, 13, 121, 'IDR'),
(122, 14, 45, 'RMB'),
(123, 14, 0, 'SGD'),
(124, 15, 0, 'RMB'),
(125, 15, 33, 'SGD'),
(126, 16, 145, 'SGD'),
(127, 17, 60, 'IDR'),
(128, 17, 3, 'RMB'),
(129, 17, 28, 'SGD'),
(130, 18, 33, 'IDR'),
(131, 18, 33, 'RMB'),
(132, 18, 23, 'SGD'),
(133, 19, 28, 'IDR'),
(134, 19, 28, 'RMB'),
(135, 19, 110, 'SGD'),
(136, 20, 60, 'IDR'),
(137, 20, 8, 'RMB'),
(138, 20, 0, 'SGD');

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
(1, 7, 300, 'IDR'),
(2, 15, 300, 'SGD'),
(3, 15, 54, 'RMB'),
(4, 7, 15, 'IDR'),
(5, 15, 3, 'RMB'),
(6, 15, 15, 'SGD');

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
(1, 'tim1', 'tim1', 275, 948, 331, 50),
(2, 'tim2', 'tim2', 452, 356, 481, 50),
(3, 'tim3', 'tim3', 300, 0, 1169, 50),
(4, 'tim4', 'tim4', 56, 220, 948, 50),
(5, 'tim5', 'tim5', 0, 45, 687, 50),
(6, 'tim6', 'tim6', 381, 200, 585, 50),
(7, 'tim7', 'tim7', 160, 490, 0, 50),
(8, 'tim8', 'tim8', 30, 496, 1, 50),
(9, 'tim9', 'tim9', 0, 0, 304, 50),
(10, 'tim10', 'tim10', 360, 415, 431, 50),
(11, 'tim11', 'tim11', 253, 939, 0, 50),
(12, 'tim12', 'tim12', 15, 1069, 219, 50),
(13, 'tim13', 'tim13', 314, 0, 0, 50),
(14, 'tim14', 'tim14', 275, 140, 288, 50),
(15, 'tim15', 'tim15', 0, 0, 121, 50),
(16, 'tim16', 'tim16', 347, 34, 390, 50),
(17, 'tim17', 'tim17', 536, 20, 0, 50),
(18, 'tim18', 'tim18', 0, 695, 20, 50),
(19, 'tim19', 'tim19', 200, 717, 250, 50),
(20, 'tim20', 'tim20', 355, 225, 270, 50);

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
  MODIFY `idhargasaham` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `idinventory` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=406;
--
-- AUTO_INCREMENT for table `onsale`
--
ALTER TABLE `onsale`
  MODIFY `idonsale` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `idpembelian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;
--
-- AUTO_INCREMENT for table `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `idpenjualan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;
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
  MODIFY `idtcurrency` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `timer`
--
ALTER TABLE `timer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tpinjaman`
--
ALTER TABLE `tpinjaman`
  MODIFY `idtpinjaman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;
--
-- AUTO_INCREMENT for table `tsaham`
--
ALTER TABLE `tsaham`
  MODIFY `idtsaham` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ttabungan`
--
ALTER TABLE `ttabungan`
  MODIFY `idttabungan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `iduser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
