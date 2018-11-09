-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 20, 2017 at 01:27 PM
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
(1, 'BenangMerah', 71, 50, 50, 1, 894, 1000, 1000, 894, 1000, 1000),
(2, 'BenangKuning', 50, 56, 50, 1, 1000, 888, 1000, 888, 888, 1000),
(3, 'BenangBiru', 50, 50, 30, 1, 1000, 1000, 884, 884, 1000, 884),
(4, 'Template', 92, 114, 95, 3, 966, 962, 962, 966, 962, 962),
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
(1, 'IDR', 49, 0),
(2, 'SGD', 78, 0),
(3, 'RMB', 24, 0);

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
(1, '3M 0K 0B', 342, 282, 276, 9992, 9987, 9979, 9992, 9988, 9979),
(2, '0M 3K 0B', 300, 300, 300, 10000, 10000, 10000, 10000, 10000, 10000),
(3, '0M 0K 3B', 300, 300, 300, 10000, 10000, 10000, 10000, 10000, 10000),
(4, '2M 1K 0B', 492, 503, 505, 17, 20, 18, 17, 20, 18),
(5, '2M 0K 1B', 500, 500, 500, 30, 30, 30, 30, 30, 30),
(6, '1M 2K 0B', 500, 500, 500, 30, 30, 30, 30, 30, 30),
(7, '1M 0K 2B', 500, 500, 500, 30, 30, 30, 30, 30, 30),
(8, '0M 2K 1B', 500, 500, 500, 30, 30, 30, 30, 30, 30),
(9, '0M 1K 2B', 500, 500, 500, 30, 30, 30, 30, 30, 30),
(10, '1M 1K 1B', 688, 705, 707, 8, 10, 13, 8, 10, 13);

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
(415, 0, 7174, 7282, 6740, 0, 0, 0),
(416, 0, 7784, 9075, 7863, 0, 0, 0),
(417, 0, 6608, 8978, 5673, 0, 0, 0),
(418, 0, 7214, 8143, 6207, 0, 0, 0),
(419, 0, 8578, 6730, 5524, 0, 0, 0),
(420, 0, 8400, 6413, 5641, 0, 0, 0),
(421, 0, 7576, 8633, 7690, 0, 0, 0);

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
(117, 15, 2, 3),
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
(200, 15, 4, 0),
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
(250, 14, 2, 3),
(251, 14, 2, -6),
(252, 14, 4, -1),
(253, 13, 1, -1),
(254, 1, 1, -1),
(255, 16, 4, 2),
(256, 5, 1, -1),
(257, 5, 1, -1),
(258, 5, 2, -1),
(259, 5, 4, -1),
(260, 5, 1, -1),
(261, 10, 3, -4),
(262, 10, 3, -4),
(263, 10, 3, -4),
(264, 10, 4, -4),
(265, 18, 4, -1),
(266, 16, 2, 4),
(267, 2, 1, -1),
(268, 2, 1, -1),
(269, 2, 2, -1),
(270, 2, 4, -1),
(271, 3, 1, -1),
(272, 3, 1, -1),
(273, 3, 1, -1),
(274, 3, 4, -1),
(275, 9, 3, 6),
(276, 15, 1, 1),
(277, 8, 3, -2),
(278, 8, 3, -2),
(279, 8, 3, -2),
(280, 8, 4, -2),
(281, 14, 2, -3),
(282, 3, 4, 2),
(283, 4, 2, 3),
(284, 3, 1, 6),
(285, 13, 1, -1),
(286, 13, 3, -1),
(287, 13, 3, -1),
(288, 13, 4, -1),
(289, 7, 1, 1),
(290, 10, 4, 4),
(291, 5, 4, 1),
(292, 10, 3, 12),
(293, 1, 1, -1),
(294, 1, 2, -1),
(295, 1, 3, -1),
(296, 1, 4, -1),
(297, 5, 1, 3),
(298, 19, 2, 2),
(299, 19, 2, -1),
(300, 19, 2, -1),
(301, 19, 2, -1),
(302, 19, 4, -1),
(303, 1, 3, 3),
(304, 1, 4, 2),
(305, 1, 1, 3),
(306, 15, 2, -1),
(307, 9, 3, -3),
(308, 20, 1, -1),
(309, 20, 1, -1),
(310, 20, 2, -1),
(311, 20, 4, -1),
(312, 2, 4, 1),
(313, 2, 1, 3),
(314, 4, 1, -1),
(315, 4, 2, -1),
(316, 4, 3, -1),
(317, 4, 4, -1),
(318, 9, 3, 3),
(319, 15, 1, -2),
(320, 15, 2, -2),
(321, 15, 2, -2),
(322, 15, 4, -2),
(323, 7, 2, 3),
(324, 9, 3, -3),
(325, 13, 4, 2),
(326, 13, 3, 6),
(327, 19, 2, -2),
(328, 19, 4, 1),
(329, 14, 2, -1),
(330, 14, 2, -1),
(331, 14, 2, -1),
(332, 14, 4, -1),
(333, 12, 4, 2),
(334, 12, 3, 6),
(335, 19, 2, 3),
(336, 11, 3, -3),
(337, 15, 4, 2),
(338, 15, 2, 6),
(339, 16, 2, -1),
(340, 16, 2, -1),
(341, 16, 2, -1),
(342, 16, 4, -1),
(343, 4, 1, -1),
(344, 4, 2, -1),
(345, 4, 3, -1),
(346, 4, 4, -1),
(347, 2, 3, 3),
(348, 3, 1, -1),
(349, 3, 1, -1),
(350, 3, 1, -1),
(351, 3, 4, -1),
(352, 8, 4, 2),
(353, 8, 3, 6),
(354, 20, 4, 1),
(355, 20, 2, 3),
(356, 10, 3, -1),
(357, 10, 3, -1),
(358, 10, 3, -1),
(359, 10, 4, -1),
(360, 4, 1, -2),
(361, 16, 4, 1),
(362, 16, 2, 2),
(363, 7, 4, 3),
(364, 5, 1, -1),
(365, 5, 1, -1),
(366, 5, 1, -1),
(367, 5, 4, -1),
(368, 7, 3, 7),
(369, 4, 1, 2),
(370, 2, 1, -1),
(371, 2, 2, -1),
(372, 2, 3, -1),
(373, 2, 4, -1),
(374, 14, 4, 1),
(375, 4, 1, -2),
(376, 14, 2, 6),
(377, 19, 1, 2),
(378, 5, 4, 1),
(379, 20, 2, -2),
(380, 5, 1, 3),
(381, 2, 4, 2),
(382, 10, 3, -1),
(383, 10, 3, -1),
(384, 10, 3, -1),
(385, 10, 4, -1),
(386, 20, 2, -1),
(387, 2, 1, 2),
(388, 1, 2, 1),
(389, 15, 2, -2),
(390, 11, 3, 1),
(391, 14, 2, -3),
(392, 1, 1, -1),
(393, 1, 2, -1),
(394, 1, 3, -1),
(395, 1, 4, -1),
(396, 2, 1, -1),
(397, 8, 3, -3),
(398, 3, 2, 2),
(399, 1, 1, -1),
(400, 1, 1, -1),
(401, 1, 3, -1),
(402, 1, 4, -1),
(403, 13, 2, 2),
(404, 3, 1, -1),
(405, 3, 1, -1),
(406, 3, 1, -1),
(407, 3, 4, -1),
(408, 8, 4, -1),
(409, 1, 4, 2),
(410, 1, 1, 6),
(411, 16, 2, -1),
(412, 16, 2, -1),
(413, 16, 2, -1),
(414, 16, 4, -1),
(415, 3, 4, 2),
(416, 10, 3, -1),
(417, 10, 3, -1),
(418, 10, 3, -1),
(419, 10, 4, -1),
(420, 3, 1, 6),
(421, 18, 1, 1),
(422, 4, 4, 1),
(423, 18, 3, 3),
(424, 1, 1, -1),
(425, 1, 1, 1),
(426, 10, 3, -1),
(427, 10, 3, -1),
(428, 10, 3, -1),
(429, 10, 4, -1),
(430, 14, 2, 3),
(431, 1, 1, -1),
(432, 14, 2, -3),
(433, 3, 1, -2),
(434, 15, 2, -1),
(435, 16, 2, 3),
(436, 18, 1, 1),
(437, 1, 1, -1),
(438, 15, 1, 1),
(439, 19, 2, 2),
(440, 4, 1, -1),
(441, 4, 1, -1),
(442, 4, 2, -1),
(443, 4, 4, -1),
(444, 13, 2, -2),
(445, 13, 3, -2),
(446, 13, 3, -2),
(447, 13, 4, -2),
(448, 19, 2, -2),
(449, 2, 1, -1),
(450, 2, 1, -1),
(451, 2, 3, -1),
(452, 2, 4, -1),
(453, 2, 2, 1),
(454, 13, 4, 1),
(455, 13, 3, 3),
(456, 12, 3, -3),
(457, 5, 1, -1),
(458, 5, 1, -1),
(459, 5, 1, -1),
(460, 5, 4, -1),
(461, 18, 4, 1),
(462, 16, 4, 2),
(463, 5, 4, 1),
(464, 5, 1, 3),
(465, 16, 2, 6),
(466, 8, 3, -2),
(467, 2, 1, 3),
(468, 20, 3, 3),
(469, 12, 3, -1),
(470, 12, 3, -1),
(471, 12, 3, -1),
(472, 12, 4, -1),
(473, 1, 1, -1),
(474, 19, 1, 0),
(475, 19, 1, 0),
(476, 19, 1, 0),
(477, 19, 4, 0),
(478, 15, 1, -1),
(479, 15, 2, -1),
(480, 15, 2, -1),
(481, 15, 4, -1),
(482, 2, 1, -3),
(483, 1, 2, 2),
(484, 18, 1, 1),
(485, 10, 4, 1),
(486, 10, 3, 3),
(487, 19, 1, -1),
(488, 19, 2, -1),
(489, 19, 2, -1),
(490, 19, 4, -1),
(491, 18, 1, -1),
(492, 18, 2, -1),
(493, 18, 3, -1),
(494, 18, 4, -1),
(495, 2, 1, 2),
(496, 3, 1, -1),
(497, 3, 1, -1),
(498, 3, 2, -1),
(499, 3, 4, -1),
(500, 15, 3, 2),
(501, 14, 2, 3),
(502, 5, 1, -1),
(503, 15, 4, 1),
(504, 14, 2, -1),
(505, 14, 2, -1),
(506, 14, 2, -1),
(507, 14, 4, -1),
(508, 14, 2, -6),
(509, 14, 2, 6),
(510, 15, 2, 3),
(511, 7, 1, 2),
(512, 2, 1, -1),
(513, 14, 2, -3),
(514, 12, 4, 1),
(515, 12, 3, 6),
(516, 18, 1, -1),
(517, 20, 4, 2),
(518, 2, 1, 3),
(519, 20, 2, 6),
(520, 15, 1, 1),
(521, 3, 2, 3),
(522, 18, 1, -1),
(523, 18, 2, -1),
(524, 18, 3, -1),
(525, 18, 4, -1),
(526, 2, 1, -2),
(527, 2, 1, -1),
(528, 2, 1, -1),
(529, 2, 2, -1),
(530, 2, 3, -1),
(531, 2, 4, -1),
(532, 16, 2, -1),
(533, 18, 1, 1),
(534, 10, 3, -1),
(535, 10, 3, -1),
(536, 10, 3, -1),
(537, 10, 4, -1),
(538, 15, 2, -2),
(539, 16, 2, 1),
(540, 14, 2, 3),
(541, 5, 1, -1),
(542, 3, 1, -1),
(543, 3, 1, -1),
(544, 3, 2, -1),
(545, 3, 4, -1),
(546, 18, 4, 1),
(547, 15, 1, -1),
(548, 15, 2, -1),
(549, 15, 3, -1),
(550, 15, 4, -1),
(551, 3, 4, 2),
(552, 13, 1, 2),
(553, 3, 1, 6),
(554, 2, 1, -1),
(555, 7, 1, -1),
(556, 7, 3, -1),
(557, 7, 3, -1),
(558, 7, 4, -1),
(559, 5, 1, -1),
(560, 7, 1, -2),
(561, 7, 2, -2),
(562, 7, 3, -2),
(563, 7, 4, -2),
(564, 13, 4, 1),
(565, 1, 1, -1),
(566, 1, 2, -1),
(567, 1, 3, -1),
(568, 1, 4, -1),
(569, 7, 2, -1),
(570, 7, 3, -1),
(571, 7, 3, -1),
(572, 7, 4, -1),
(573, 18, 1, -1),
(574, 18, 2, -1),
(575, 18, 3, -1),
(576, 18, 4, -1),
(577, 5, 1, 3),
(578, 1, 1, -1),
(579, 1, 2, -1),
(580, 1, 3, -1),
(581, 1, 4, -1),
(582, 19, 3, 3),
(583, 20, 2, -1),
(584, 20, 2, -1),
(585, 20, 3, -1),
(586, 20, 4, -1),
(587, 8, 1, 1),
(588, 11, 1, 1),
(589, 16, 2, -3),
(590, 16, 2, -3),
(591, 16, 2, -3),
(592, 16, 4, -3),
(593, 19, 4, 2),
(594, 9, 1, 1),
(595, 13, 1, -2),
(596, 13, 3, -2),
(597, 13, 3, -2),
(598, 13, 4, -2),
(599, 15, 1, -1),
(600, 15, 2, -1),
(601, 15, 3, -1),
(602, 15, 4, -1),
(603, 14, 2, -1),
(604, 14, 2, -1),
(605, 14, 2, -1),
(606, 14, 4, -1);

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
(29, 11, 3, 3, 300, 'IDR', 4),
(30, 9, 3, 3, 300, 'RMB', 1),
(31, 15, 2, 3, 320, 'RMB', 4),
(32, 5, 1, 1, 100, 'SGD', 15),
(34, 18, 2, 1, 75, 'SGD', 2),
(35, 9, 4, 1, 200, 'RMB', 0),
(36, 3, 1, 2, 140, 'RMB', 13),
(37, 9, 3, 3, 500, 'IDR', 1),
(38, 3, 1, 2, 160, 'SGD', 20),
(40, 5, 1, 1, 100, 'SGD', 7),
(42, 14, 2, 3, 300, 'SGD', 7),
(44, 9, 3, 3, 500, 'RMB', 19),
(46, 11, 3, 3, 350, 'IDR', 2),
(48, 4, 1, 2, 250, 'RMB', 19),
(49, 20, 2, 2, 150, 'RMB', 13),
(50, 20, 2, 1, 75, 'IDR', 1),
(51, 15, 2, 2, 210, 'RMB', 3),
(53, 2, 1, 1, 100, 'RMB', 18),
(54, 8, 3, 3, 270, 'RMB', 18),
(55, 8, 4, 1, 110, 'RMB', 0),
(57, 1, 1, 1, 70, 'RMB', 18),
(59, 3, 1, 2, 175, 'RMB', 7),
(60, 15, 2, 1, 100, 'RMB', 2),
(61, 1, 1, 1, 65, 'RMB', 15),
(62, 19, 2, 2, 250, 'RMB', 1),
(63, 12, 3, 3, 200, 'SGD', 20),
(64, 8, 3, 2, 140, 'RMB', 15),
(65, 1, 1, 1, 75, 'RMB', 18),
(67, 5, 1, 1, 100, 'SGD', 18),
(69, 2, 1, 1, 100, 'SGD', 15),
(70, 14, 2, 3, 250, 'IDR', 3),
(71, 2, 1, 2, 200, 'RMB', 13),
(72, 2, 1, 1, 100, 'RMB', 8),
(73, 15, 2, 2, 210, 'RMB', 0),
(74, 5, 1, 1, 110, 'SGD', 0),
(75, 2, 1, 1, 100, 'SGD', 11),
(76, 5, 1, 1, 95, 'RMB', 9);

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
(73, 4, 1, 1, 93, 'IDR'),
(75, 1, 1, 1, 47, 'IDR'),
(76, 4, 10, 2, 101, 'RMB'),
(77, 3, 10, 6, 43, 'RMB'),
(78, 1, 5, 1, 47, 'IDR'),
(79, 4, 4, 1, 93, 'IDR'),
(80, 1, 4, 3, 47, 'IDR'),
(81, 4, 16, 2, 99, 'SGD'),
(82, 2, 16, 4, 63, 'SGD'),
(83, 3, 9, 6, 43, 'RMB'),
(84, 4, 3, 2, 95, 'IDR'),
(85, 1, 3, 6, 47, 'IDR'),
(86, 4, 10, 4, 103, 'RMB'),
(87, 4, 5, 1, 95, 'IDR'),
(88, 3, 10, 12, 43, 'RMB'),
(89, 1, 5, 3, 47, 'IDR'),
(90, 4, 1, 2, 95, 'IDR'),
(91, 1, 1, 3, 47, 'IDR'),
(92, 4, 2, 1, 95, 'IDR'),
(93, 1, 2, 3, 47, 'IDR'),
(94, 4, 13, 2, 103, 'RMB'),
(95, 3, 13, 6, 44, 'RMB'),
(96, 4, 19, 1, 94, 'SGD'),
(97, 4, 12, 2, 103, 'RMB'),
(98, 3, 12, 6, 44, 'RMB'),
(99, 2, 19, 3, 61, 'SGD'),
(100, 4, 15, 2, 94, 'SGD'),
(101, 2, 15, 6, 61, 'SGD'),
(102, 4, 8, 2, 103, 'RMB'),
(103, 3, 8, 6, 44, 'RMB'),
(104, 4, 20, 1, 94, 'SGD'),
(105, 2, 20, 3, 61, 'SGD'),
(106, 4, 16, 1, 94, 'SGD'),
(107, 2, 16, 2, 61, 'SGD'),
(108, 4, 7, 3, 103, 'RMB'),
(109, 3, 7, 7, 44, 'RMB'),
(110, 4, 14, 1, 95, 'SGD'),
(111, 2, 14, 6, 61, 'SGD'),
(112, 4, 5, 1, 91, 'IDR'),
(113, 1, 5, 3, 46, 'IDR'),
(114, 4, 2, 2, 91, 'IDR'),
(115, 1, 2, 2, 46, 'IDR'),
(116, 3, 11, 1, 46, 'RMB'),
(117, 4, 1, 2, 91, 'IDR'),
(118, 1, 1, 6, 46, 'IDR'),
(119, 4, 3, 2, 91, 'IDR'),
(120, 1, 3, 6, 46, 'IDR'),
(121, 4, 4, 1, 91, 'IDR'),
(122, 2, 16, 3, 59, 'SGD'),
(123, 4, 13, 1, 101, 'RMB'),
(124, 3, 13, 3, 40, 'RMB'),
(125, 4, 16, 2, 87, 'SGD'),
(126, 4, 5, 1, 111, 'IDR'),
(127, 1, 5, 3, 54, 'IDR'),
(128, 2, 16, 6, 59, 'SGD'),
(129, 1, 2, 3, 54, 'IDR'),
(130, 4, 10, 1, 101, 'RMB'),
(131, 3, 10, 3, 40, 'RMB'),
(132, 1, 2, 2, 53, 'IDR'),
(133, 4, 15, 1, 90, 'SGD'),
(134, 2, 15, 3, 61, 'SGD'),
(135, 4, 12, 1, 104, 'RMB'),
(136, 3, 12, 6, 39, 'RMB'),
(137, 4, 20, 2, 90, 'SGD'),
(138, 2, 20, 6, 61, 'SGD'),
(139, 2, 16, 1, 61, 'SGD'),
(140, 2, 14, 3, 61, 'SGD'),
(141, 4, 18, 1, 107, 'SGD'),
(142, 4, 3, 2, 92, 'IDR'),
(143, 1, 3, 6, 47, 'IDR'),
(144, 4, 13, 1, 101, 'RMB'),
(145, 1, 5, 3, 47, 'IDR'),
(146, 4, 19, 2, 107, 'SGD');

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
(27, 16, 6, 1, 500, 'SGD'),
(28, 5, 4, 1, 498, 'IDR'),
(29, 10, 3, 4, 302, 'RMB'),
(30, 2, 4, 1, 498, 'IDR'),
(31, 3, 1, 1, 300, 'IDR'),
(32, 8, 3, 2, 302, 'RMB'),
(33, 13, 7, 1, 502, 'RMB'),
(34, 1, 10, 1, 697, 'IDR'),
(35, 19, 2, 1, 299, 'SGD'),
(36, 20, 4, 1, 500, 'SGD'),
(37, 4, 10, 1, 697, 'IDR'),
(38, 15, 6, 2, 500, 'SGD'),
(39, 14, 2, 1, 307, 'SGD'),
(40, 16, 2, 1, 307, 'SGD'),
(41, 4, 10, 1, 694, 'IDR'),
(42, 3, 1, 1, 308, 'IDR'),
(43, 10, 3, 1, 287, 'RMB'),
(44, 2, 10, 1, 691, 'IDR'),
(45, 10, 3, 1, 290, 'RMB'),
(46, 1, 10, 1, 691, 'IDR'),
(47, 1, 5, 1, 498, 'IDR'),
(48, 3, 1, 1, 311, 'IDR'),
(49, 16, 2, 1, 300, 'SGD'),
(50, 10, 3, 1, 290, 'RMB'),
(51, 10, 3, 1, 283, 'RMB'),
(52, 4, 4, 1, 495, 'IDR'),
(53, 13, 9, 2, 504, 'RMB'),
(54, 2, 5, 1, 495, 'IDR'),
(55, 5, 1, 1, 314, 'IDR'),
(56, 12, 3, 1, 283, 'RMB'),
(57, 19, 1, 0, 314, 'IDR'),
(58, 15, 6, 1, 502, 'SGD'),
(59, 19, 6, 1, 495, 'IDR'),
(60, 18, 10, 1, 706, 'SGD'),
(61, 3, 4, 1, 495, 'IDR'),
(62, 14, 2, 1, 317, 'SGD'),
(63, 18, 10, 1, 706, 'SGD'),
(64, 2, 10, 1, 688, 'IDR'),
(65, 10, 3, 1, 269, 'RMB'),
(66, 3, 4, 1, 495, 'IDR'),
(67, 15, 10, 1, 705, 'SGD'),
(68, 7, 7, 1, 505, 'RMB'),
(69, 7, 10, 2, 707, 'RMB'),
(70, 7, 9, 1, 505, 'RMB'),
(71, 18, 10, 1, 705, 'SGD'),
(72, 1, 10, 1, 688, 'IDR'),
(73, 20, 8, 1, 503, 'SGD'),
(74, 16, 2, 3, 310, 'SGD'),
(75, 13, 7, 2, 505, 'RMB'),
(76, 15, 10, 1, 705, 'SGD'),
(77, 14, 2, 1, 282, 'SGD');

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
(1, 8, 'SGD', 'RMB', 1000),
(2, 11, 'IDR', 'SGD', 100),
(3, 4, 'IDR', 'RMB', 100),
(4, 14, 'RMB', 'SGD', 250),
(5, 20, 'IDR', 'SGD', 75),
(6, 4, 'IDR', 'SGD', 200),
(7, 11, 'IDR', 'SGD', 145),
(8, 4, 'IDR', 'RMB', 200),
(9, 4, 'IDR', 'RMB', 100),
(10, 8, 'RMB', 'IDR', 100),
(11, 1, 'SGD', 'RMB', 1);

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
(1, 1508498544);

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
(126, 20, 165, 'SGD'),
(127, 11, -605, 'IDR'),
(128, 7, 30, 'SGD'),
(129, 7, 300, 'SGD'),
(130, 2, -100, 'SGD'),
(131, 2, -100, 'RMB'),
(132, 7, 10, 'SGD'),
(133, 7, 100, 'SGD'),
(134, 4, -968, 'IDR'),
(135, 9, -1210, 'IDR'),
(136, 5, -363, 'SGD'),
(137, 5, -200, 'RMB'),
(138, 15, -815, 'SGD'),
(139, 16, -1210, 'SGD'),
(140, 10, -1815, 'RMB'),
(141, 4, -363, 'SGD'),
(142, 14, -1210, 'SGD'),
(143, 19, -500, 'IDR'),
(144, 5, -500, 'IDR'),
(145, 19, -105, 'IDR'),
(146, 2, -402, 'SGD'),
(147, 4, -484, 'RMB'),
(148, 8, -605, 'IDR'),
(149, 18, -605, 'SGD'),
(150, 7, -700, 'RMB'),
(151, 18, -500, 'IDR'),
(152, 1, -605, 'IDR');

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
(1, 'tim1', 'tim1', 1051, 99, 160, 50),
(2, 'tim2', 'tim2', 1583, 123, 400, 50),
(3, 'tim3', 'tim3', 438, 345, 215, 50),
(4, 'tim4', 'tim4', 1037, 179, 27, 50),
(5, 'tim5', 'tim5', 187, 252, 270, 50),
(6, 'tim6', 'tim6', 0, 0, 0, 50),
(7, 'tim7', 'tim7', 0, 0, 1894, 50),
(8, 'tim8', 'tim8', 95, 0, 517, 50),
(9, 'tim9', 'tim9', 190, 0, 525, 50),
(10, 'tim10', 'tim10', 0, 0, 567, 50),
(11, 'tim11', 'tim11', 300, 183, 40, 50),
(12, 'tim12', 'tim12', 500, 700, 146, 50),
(13, 'tim13', 'tim13', 350, 350, 2071, 50),
(14, 'tim14', 'tim14', 500, 395, 0, 50),
(15, 'tim15', 'tim15', 0, 1982, 510, 50),
(16, 'tim16', 'tim16', 0, 972, 0, 50),
(17, 'tim17', 'tim17', 0, 0, 0, 50),
(18, 'tim18', 'tim18', 0, 1405, 85, 50),
(19, 'tim19', 'tim19', 280, 215, 0, 50),
(20, 'tim20', 'tim20', 0, 1332, 150, 50);

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
  MODIFY `idhargasaham` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=422;
--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `idinventory` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=607;
--
-- AUTO_INCREMENT for table `onsale`
--
ALTER TABLE `onsale`
  MODIFY `idonsale` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;
--
-- AUTO_INCREMENT for table `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `idpembelian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=147;
--
-- AUTO_INCREMENT for table `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `idpenjualan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;
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
  MODIFY `idtcurrency` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `timer`
--
ALTER TABLE `timer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tpinjaman`
--
ALTER TABLE `tpinjaman`
  MODIFY `idtpinjaman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=153;
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
