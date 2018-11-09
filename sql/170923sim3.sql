-- phpMyAdmin SQL Dump
-- version 3.4.11.1deb2+deb7u8
-- http://www.phpmyadmin.net
--
-- Inang: localhost
-- Waktu pembuatan: 23 Sep 2017 pada 20.35
-- Versi Server: 5.5.55
-- Versi PHP: 5.4.45-0+deb7u8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Basis data: `m26415175`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `bahanbaku`
--

CREATE TABLE IF NOT EXISTS `bahanbaku` (
  `idbahanbaku` int(11) NOT NULL AUTO_INCREMENT,
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
  `laststok3` int(11) NOT NULL,
  PRIMARY KEY (`idbahanbaku`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data untuk tabel `bahanbaku`
--

INSERT INTO `bahanbaku` (`idbahanbaku`, `nama`, `harga1`, `harga2`, `harga3`, `weight`, `stok1`, `stok2`, `stok3`, `laststok1`, `laststok2`, `laststok3`) VALUES
(1, 'BenangMerah', 50, 50, 50, 1, 893, 1000, 1000, 1000, 1000, 1000),
(2, 'BenangKuning', 50, 50, 50, 1, 1000, 934, 1000, 1000, 1000, 1000),
(3, 'BenangBiru', 50, 50, 50, 1, 1000, 1000, 965, 1000, 1000, 1000),
(4, 'Template', 100, 100, 100, 3, 968, 977, 989, 1000, 1000, 1000),
(5, 'Transportasi', 800, 800, 800, 0, 1000, 1000, 1000, 1000, 1000, 1000),
(6, 'Visa', 1000, 1000, 1000, 0, 1000, 1000, 1000, 1000, 1000, 1000),
(7, 'Inventory', 400, 400, 400, 0, 1000, 1000, 1000, 1000, 1000, 1000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `currency`
--

CREATE TABLE IF NOT EXISTS `currency` (
  `idcurrency` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `hjual` int(11) NOT NULL,
  `hbeli` int(11) NOT NULL,
  PRIMARY KEY (`idcurrency`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data untuk tabel `currency`
--

INSERT INTO `currency` (`idcurrency`, `nama`, `hjual`, `hbeli`) VALUES
(1, 'IDR', 31, 0),
(2, 'SGD', 46, 0),
(3, 'RMB', 74, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `desain`
--

CREATE TABLE IF NOT EXISTS `desain` (
  `iddesain` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(25) NOT NULL,
  `harga1` int(11) NOT NULL,
  `harga2` int(11) NOT NULL,
  `harga3` int(11) NOT NULL,
  `stok1` int(11) NOT NULL,
  `stok2` int(11) NOT NULL,
  `stok3` int(11) NOT NULL,
  `laststok1` int(11) NOT NULL,
  `laststok2` int(11) NOT NULL,
  `laststok3` int(11) NOT NULL,
  PRIMARY KEY (`iddesain`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data untuk tabel `desain`
--

INSERT INTO `desain` (`iddesain`, `nama`, `harga1`, `harga2`, `harga3`, `stok1`, `stok2`, `stok3`, `laststok1`, `laststok2`, `laststok3`) VALUES
(1, '3M 0K 0B', 300, 202, 126, 9978, 9990, 9997, 9978, 9990, 9997),
(2, '0M 3K 0B', 300, 202, 126, 10000, 10000, 10000, 9978, 9990, 9997),
(3, '0M 0K 3B', 300, 202, 126, 10000, 10000, 10000, 9978, 9990, 9997),
(4, '2M 1K 0B', 400, 270, 168, 36, 35, 39, 36, 35, 39),
(5, '2M 0K 1B', 400, 270, 168, 40, 40, 40, 36, 35, 39),
(6, '1M 2K 0B', 400, 270, 168, 40, 40, 40, 36, 35, 39),
(7, '1M 0K 2B', 400, 270, 168, 40, 40, 40, 36, 35, 39),
(8, '0M 2K 1B', 400, 270, 168, 40, 40, 40, 36, 35, 39),
(9, '0M 1K 2B', 400, 270, 168, 40, 40, 40, 36, 35, 39),
(10, '1M 1K 1B', 600, 404, 251, 16, 18, 20, 17, 18, 20);

-- --------------------------------------------------------

--
-- Struktur dari tabel `detildesain`
--

CREATE TABLE IF NOT EXISTS `detildesain` (
  `iddetildesain` int(11) NOT NULL AUTO_INCREMENT,
  `iddesain` int(11) NOT NULL,
  `idbahanbaku` int(11) NOT NULL,
  PRIMARY KEY (`iddetildesain`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=41 ;

--
-- Dumping data untuk tabel `detildesain`
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
-- Struktur dari tabel `event`
--

CREATE TABLE IF NOT EXISTS `event` (
  `idevent` int(11) NOT NULL AUTO_INCREMENT,
  `cash1` int(11) NOT NULL,
  `cash2` int(11) NOT NULL,
  `cash3` int(11) NOT NULL,
  PRIMARY KEY (`idevent`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `hargasaham`
--

CREATE TABLE IF NOT EXISTS `hargasaham` (
  `idhargasaham` int(11) NOT NULL AUTO_INCREMENT,
  `idsaham` int(11) NOT NULL,
  `hjual1` int(11) NOT NULL,
  `hjual2` int(11) NOT NULL,
  `hjual3` int(11) NOT NULL,
  `hbeli1` int(11) NOT NULL,
  `hbeli2` int(11) NOT NULL,
  `hbeli3` int(11) NOT NULL,
  PRIMARY KEY (`idhargasaham`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=415 ;

--
-- Dumping data untuk tabel `hargasaham`
--

INSERT INTO `hargasaham` (`idhargasaham`, `idsaham`, `hjual1`, `hjual2`, `hjual3`, `hbeli1`, `hbeli2`, `hbeli3`) VALUES
(410, 0, 4200, 4850, 7200, 0, 0, 0),
(411, 0, 4400, 5016, 6800, 0, 0, 0),
(412, 0, 5330, 6770, 8345, 0, 0, 0),
(413, 0, 5930, 7834, 8692, 0, 0, 0),
(414, 0, 6630, 6946, 9504, 0, 0, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `inventory`
--

CREATE TABLE IF NOT EXISTS `inventory` (
  `idinventory` int(11) NOT NULL AUTO_INCREMENT,
  `iduser` int(11) NOT NULL,
  `idbahanbaku` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  PRIMARY KEY (`idinventory`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=338 ;

--
-- Dumping data untuk tabel `inventory`
--

INSERT INTO `inventory` (`idinventory`, `iduser`, `idbahanbaku`, `qty`) VALUES
(1, 10, 4, 2),
(2, 6, 4, 2),
(3, 10, 2, 6),
(4, 6, 1, 6),
(5, 17, 4, 2),
(6, 17, 3, 6),
(7, 4, 4, 2),
(8, 4, 1, 6),
(9, 11, 4, 2),
(10, 11, 2, 6),
(11, 15, 4, 2),
(12, 15, 3, 6),
(13, 7, 4, 2),
(14, 7, 2, 6),
(15, 9, 4, 1),
(16, 2, 4, 2),
(17, 9, 2, 3),
(18, 2, 1, 6),
(19, 20, 4, 2),
(20, 1, 4, 2),
(21, 20, 3, 6),
(22, 1, 1, 3),
(23, 17, 3, -1),
(24, 9, 2, 3),
(25, 17, 3, -1),
(26, 5, 4, 2),
(27, 5, 1, 6),
(28, 9, 2, -1),
(29, 14, 4, 2),
(30, 20, 3, -3),
(31, 14, 3, 6),
(32, 9, 2, -1),
(33, 3, 4, 1),
(34, 3, 1, 3),
(35, 15, 3, -1),
(36, 16, 4, 3),
(37, 16, 3, 9),
(38, 7, 2, -2),
(39, 5, 1, -2),
(40, 4, 1, -2),
(41, 6, 1, -2),
(42, 6, 1, -2),
(43, 6, 1, -2),
(44, 6, 4, -2),
(45, 4, 2, 2),
(46, 8, 4, 2),
(47, 8, 2, 6),
(48, 9, 2, -1),
(49, 9, 2, -1),
(50, 9, 2, -1),
(51, 9, 4, -1),
(52, 6, 4, 3),
(53, 15, 2, 1),
(54, 7, 4, 2),
(55, 6, 1, 9),
(56, 8, 3, 3),
(57, 7, 4, -2),
(58, 17, 3, -3),
(59, 3, 2, 1),
(60, 10, 2, -2),
(61, 10, 2, -2),
(62, 10, 2, -2),
(63, 10, 4, -2),
(64, 7, 4, 1),
(65, 7, 2, 3),
(66, 11, 3, 3),
(67, 4, 1, -2),
(68, 10, 1, 2),
(69, 4, 1, 2),
(70, 9, 4, 1),
(71, 2, 1, -2),
(72, 2, 1, -2),
(73, 2, 1, -2),
(74, 2, 4, -2),
(75, 4, 1, -2),
(76, 9, 2, 3),
(77, 17, 1, 2),
(78, 2, 4, 2),
(79, 1, 2, 0),
(80, 15, 3, -1),
(81, 2, 1, 6),
(82, 1, 2, 3),
(83, 9, 2, 3),
(84, 3, 1, -1),
(85, 3, 1, -1),
(86, 3, 1, -1),
(87, 3, 4, -1),
(88, 11, 2, -1),
(89, 11, 2, -1),
(90, 11, 2, -1),
(91, 11, 4, -1),
(92, 3, 4, 1),
(93, 10, 4, 1),
(94, 15, 2, -1),
(95, 3, 1, 3),
(96, 11, 2, -1),
(97, 10, 2, 1),
(98, 11, 2, -1),
(99, 11, 3, -1),
(100, 9, 2, -1),
(101, 11, 4, -1),
(102, 5, 1, -1),
(103, 5, 1, -1),
(104, 5, 1, -1),
(105, 5, 4, -1),
(106, 15, 3, -1),
(107, 15, 3, -1),
(108, 15, 3, -1),
(109, 15, 4, -1),
(110, 9, 2, -1),
(111, 11, 4, 1),
(112, 7, 2, -1),
(113, 7, 2, -1),
(114, 7, 2, -1),
(115, 7, 4, -1),
(116, 10, 4, 1),
(117, 10, 2, 3),
(118, 20, 3, -1),
(119, 20, 3, -1),
(120, 20, 3, -1),
(121, 20, 4, -1),
(122, 9, 4, 1),
(123, 16, 2, 1),
(124, 2, 1, -3),
(125, 6, 1, -2),
(126, 6, 1, -2),
(127, 6, 1, -2),
(128, 6, 4, -2),
(129, 1, 2, 1),
(130, 4, 1, 3),
(131, 9, 4, -1),
(132, 7, 2, -1),
(133, 7, 2, -1),
(134, 7, 2, -1),
(135, 7, 4, -1),
(136, 8, 1, 3),
(137, 15, 3, 2),
(138, 6, 4, 2),
(139, 6, 1, 6),
(140, 3, 1, -1),
(141, 3, 1, -1),
(142, 3, 1, -1),
(143, 3, 4, -1),
(144, 7, 4, 1),
(145, 7, 2, 3),
(146, 3, 4, 2),
(147, 3, 1, 6),
(148, 9, 2, -1),
(149, 6, 1, -1),
(150, 6, 1, -1),
(151, 6, 1, -1),
(152, 6, 4, -1),
(153, 4, 1, -2),
(154, 7, 1, 2),
(155, 5, 1, 3),
(156, 14, 3, -2),
(157, 14, 3, -2),
(158, 14, 3, -2),
(159, 14, 4, -2),
(160, 9, 2, -1),
(161, 1, 1, -1),
(162, 1, 2, -1),
(163, 1, 2, -1),
(164, 1, 4, -1),
(165, 8, 1, -1),
(166, 2, 1, -1),
(167, 2, 1, -1),
(168, 2, 1, -1),
(169, 2, 4, -1),
(170, 7, 1, -1),
(171, 7, 1, -1),
(172, 7, 2, -1),
(173, 7, 4, -1),
(174, 2, 1, 3),
(175, 8, 1, -1),
(176, 8, 2, -1),
(177, 8, 3, -1),
(178, 8, 4, -1),
(179, 16, 3, -1),
(180, 16, 2, -1),
(181, 16, 3, -1),
(182, 16, 3, -1),
(183, 16, 4, -1),
(184, 6, 1, -2),
(185, 6, 1, -2),
(186, 6, 1, -2),
(187, 6, 4, -2),
(188, 9, 2, -1),
(189, 9, 2, -1),
(190, 9, 2, -1),
(191, 9, 4, -1),
(192, 1, 3, 1),
(193, 6, 4, 2),
(194, 9, 4, 1),
(195, 2, 1, -3),
(196, 6, 1, 6),
(197, 9, 2, 3),
(198, 3, 1, -1),
(199, 3, 1, -1),
(200, 3, 1, -1),
(201, 3, 4, -1),
(202, 3, 4, 1),
(203, 3, 1, 3),
(204, 2, 1, 3),
(205, 3, 2, 1),
(206, 7, 2, -1),
(207, 7, 2, -1),
(208, 7, 2, -1),
(209, 7, 4, -1),
(210, 16, 3, -2),
(211, 1, 1, -1),
(212, 1, 2, -1),
(213, 1, 3, -1),
(214, 1, 4, -1),
(215, 16, 4, -2),
(216, 3, 1, -1),
(217, 3, 1, -1),
(218, 3, 2, -1),
(219, 3, 4, -1),
(220, 7, 4, 2),
(221, 7, 2, 6),
(222, 1, 4, 2),
(223, 17, 3, -1),
(224, 10, 1, -1),
(225, 10, 2, -1),
(226, 10, 2, -1),
(227, 10, 4, -1),
(228, 3, 4, 1),
(229, 3, 1, 3),
(230, 5, 1, -1),
(231, 5, 1, -1),
(232, 5, 1, -1),
(233, 5, 4, -1),
(234, 6, 1, -2),
(235, 6, 1, -2),
(236, 6, 1, -2),
(237, 6, 4, -2),
(238, 16, 3, -4),
(239, 1, 3, 2),
(240, 3, 1, -1),
(241, 3, 1, -1),
(242, 3, 1, -1),
(243, 3, 4, -1),
(244, 6, 4, 2),
(245, 6, 1, 6),
(246, 10, 1, -1),
(247, 10, 2, -1),
(248, 10, 2, -1),
(249, 10, 4, -1),
(250, 4, 1, -1),
(251, 4, 1, -1),
(252, 4, 2, -1),
(253, 4, 4, -1),
(254, 8, 1, -1),
(255, 8, 2, -1),
(256, 8, 3, -1),
(257, 8, 4, -1),
(258, 15, 3, -1),
(259, 15, 3, -1),
(260, 15, 3, -1),
(261, 15, 4, -1),
(262, 1, 1, 1),
(263, 7, 2, -3),
(264, 4, 1, 3),
(265, 11, 2, -1),
(266, 11, 3, -1),
(267, 11, 3, -1),
(268, 11, 4, -1),
(269, 7, 2, 3),
(270, 8, 4, 1),
(271, 1, 1, -1),
(272, 1, 2, -1),
(273, 1, 3, -1),
(274, 1, 4, -1),
(275, 3, 3, 1),
(276, 1, 2, 1),
(277, 2, 1, 3),
(278, 3, 1, -1),
(279, 3, 2, -1),
(280, 3, 3, -1),
(281, 3, 4, -1),
(282, 3, 4, 2),
(283, 9, 2, -1),
(284, 2, 1, -3),
(285, 3, 1, 4),
(286, 10, 4, 1),
(287, 10, 2, 2),
(288, 9, 2, -1),
(289, 11, 4, 1),
(290, 11, 2, 3),
(291, 4, 1, -1),
(292, 4, 1, -1),
(293, 4, 2, -1),
(294, 4, 4, -1),
(295, 9, 2, -1),
(296, 17, 2, 1),
(297, 2, 1, -1),
(298, 2, 1, -1),
(299, 2, 1, -1),
(300, 2, 4, -1),
(301, 3, 1, -4),
(302, 9, 4, -1),
(303, 2, 4, 2),
(304, 7, 2, -1),
(305, 6, 1, -2),
(306, 7, 2, -1),
(307, 6, 1, -2),
(308, 7, 2, -1),
(309, 6, 1, -2),
(310, 7, 4, -1),
(311, 6, 4, -2),
(312, 2, 1, 6),
(313, 8, 2, -2),
(314, 10, 4, -1),
(315, 2, 2, 3),
(316, 7, 1, 0),
(317, 7, 1, 0),
(318, 7, 1, 0),
(319, 7, 4, 0),
(320, 10, 2, -1),
(321, 4, 4, 1),
(322, 3, 2, 2),
(323, 10, 2, -1),
(324, 4, 1, 3),
(325, 1, 2, 1),
(326, 7, 2, -1),
(327, 7, 2, -1),
(328, 7, 2, -1),
(329, 7, 4, -1),
(330, 11, 2, -1),
(331, 11, 2, -1),
(332, 11, 2, -1),
(333, 11, 4, -1),
(334, 1, 1, -1),
(335, 1, 2, -1),
(336, 1, 3, -1),
(337, 1, 4, -1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `onsale`
--

CREATE TABLE IF NOT EXISTS `onsale` (
  `idonsale` int(11) NOT NULL AUTO_INCREMENT,
  `iduser` int(11) NOT NULL,
  `idbahanbaku` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `currency` varchar(100) NOT NULL,
  PRIMARY KEY (`idonsale`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=38 ;

--
-- Dumping data untuk tabel `onsale`
--

INSERT INTO `onsale` (`idonsale`, `iduser`, `idbahanbaku`, `qty`, `harga`, `currency`) VALUES
(27, 16, 3, 4, 400, 'IDR'),
(30, 2, 1, 3, 275, 'IDR'),
(32, 9, 2, 1, 70, 'IDR'),
(33, 9, 4, 1, 150, 'RMB'),
(35, 10, 4, 1, 180, 'RMB'),
(36, 10, 2, 1, 90, 'RMB'),
(37, 10, 2, 1, 90, 'RMB');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian`
--

CREATE TABLE IF NOT EXISTS `pembelian` (
  `idpembelian` int(11) NOT NULL AUTO_INCREMENT,
  `idbahanbaku` int(11) NOT NULL,
  `iduser` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `hsatuan` int(11) NOT NULL,
  `currency` varchar(100) NOT NULL,
  PRIMARY KEY (`idpembelian`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=90 ;

--
-- Dumping data untuk tabel `pembelian`
--

INSERT INTO `pembelian` (`idpembelian`, `idbahanbaku`, `iduser`, `qty`, `hsatuan`, `currency`) VALUES
(1, 4, 10, 2, 100, 'SGD'),
(2, 4, 6, 2, 100, 'IDR'),
(3, 2, 10, 6, 50, 'SGD'),
(4, 1, 6, 6, 50, 'IDR'),
(5, 4, 17, 2, 100, 'RMB'),
(6, 3, 17, 6, 50, 'RMB'),
(7, 4, 4, 2, 100, 'IDR'),
(8, 1, 4, 6, 50, 'IDR'),
(9, 4, 11, 2, 100, 'SGD'),
(10, 2, 11, 6, 50, 'SGD'),
(11, 4, 15, 2, 100, 'RMB'),
(12, 3, 15, 6, 50, 'RMB'),
(13, 4, 7, 2, 100, 'SGD'),
(14, 2, 7, 6, 50, 'SGD'),
(15, 4, 9, 1, 100, 'SGD'),
(16, 4, 2, 2, 100, 'IDR'),
(17, 2, 9, 3, 50, 'SGD'),
(18, 1, 2, 6, 50, 'IDR'),
(19, 4, 20, 2, 100, 'RMB'),
(20, 4, 1, 2, 100, 'IDR'),
(21, 3, 20, 6, 50, 'RMB'),
(22, 1, 1, 3, 50, 'IDR'),
(23, 2, 9, 3, 50, 'SGD'),
(24, 4, 5, 2, 100, 'IDR'),
(25, 1, 5, 6, 50, 'IDR'),
(26, 4, 14, 2, 100, 'RMB'),
(27, 3, 14, 6, 50, 'RMB'),
(28, 4, 3, 1, 100, 'IDR'),
(29, 1, 3, 3, 50, 'IDR'),
(30, 4, 16, 3, 100, 'RMB'),
(31, 3, 16, 9, 50, 'RMB'),
(32, 4, 8, 2, 104, 'SGD'),
(33, 2, 8, 6, 52, 'SGD'),
(34, 4, 6, 3, 100, 'IDR'),
(36, 1, 6, 9, 50, 'IDR'),
(37, 4, 7, 1, 104, 'SGD'),
(38, 2, 7, 3, 52, 'SGD'),
(39, 4, 9, 1, 104, 'SGD'),
(40, 2, 9, 3, 52, 'SGD'),
(41, 4, 2, 2, 100, 'IDR'),
(42, 2, 1, 0, 52, 'SGD'),
(43, 1, 2, 6, 50, 'IDR'),
(44, 2, 1, 3, 52, 'SGD'),
(45, 2, 9, 3, 52, 'SGD'),
(46, 4, 3, 1, 100, 'IDR'),
(47, 4, 10, 1, 104, 'SGD'),
(48, 1, 3, 3, 50, 'IDR'),
(49, 2, 10, 1, 52, 'SGD'),
(50, 4, 11, 1, 104, 'SGD'),
(51, 4, 10, 1, 104, 'SGD'),
(52, 2, 10, 3, 52, 'SGD'),
(53, 4, 9, 1, 104, 'SGD'),
(54, 1, 4, 3, 50, 'IDR'),
(55, 3, 15, 2, 74, 'RMB'),
(56, 4, 6, 2, 100, 'IDR'),
(57, 1, 6, 6, 50, 'IDR'),
(58, 4, 7, 1, 112, 'SGD'),
(59, 2, 7, 3, 56, 'SGD'),
(60, 4, 3, 2, 100, 'IDR'),
(61, 1, 3, 6, 50, 'IDR'),
(62, 1, 5, 3, 50, 'IDR'),
(63, 1, 2, 3, 50, 'IDR'),
(64, 4, 6, 2, 100, 'IDR'),
(65, 4, 9, 1, 124, 'SGD'),
(66, 1, 6, 6, 50, 'IDR'),
(67, 2, 9, 3, 62, 'SGD'),
(68, 4, 3, 1, 100, 'IDR'),
(69, 1, 3, 3, 50, 'IDR'),
(70, 1, 2, 3, 50, 'IDR'),
(71, 4, 7, 2, 124, 'SGD'),
(72, 2, 7, 6, 62, 'SGD'),
(73, 4, 3, 1, 100, 'IDR'),
(74, 1, 3, 3, 50, 'IDR'),
(75, 4, 6, 2, 100, 'IDR'),
(76, 1, 6, 6, 50, 'IDR'),
(77, 1, 1, 1, 50, 'IDR'),
(78, 1, 4, 3, 50, 'IDR'),
(79, 2, 7, 3, 71, 'SGD'),
(80, 4, 3, 2, 100, 'IDR'),
(81, 1, 3, 4, 50, 'IDR'),
(82, 4, 10, 1, 141, 'SGD'),
(83, 2, 10, 2, 71, 'SGD'),
(84, 4, 11, 1, 141, 'SGD'),
(85, 2, 11, 3, 71, 'SGD'),
(86, 4, 2, 2, 100, 'IDR'),
(87, 1, 2, 6, 50, 'IDR'),
(88, 4, 4, 1, 100, 'IDR'),
(89, 1, 4, 3, 50, 'IDR');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penjualan`
--

CREATE TABLE IF NOT EXISTS `penjualan` (
  `idpenjualan` int(11) NOT NULL AUTO_INCREMENT,
  `iduser` int(11) NOT NULL,
  `iddesain` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `hsatuan` int(11) NOT NULL,
  `currency` varchar(100) NOT NULL,
  PRIMARY KEY (`idpenjualan`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=46 ;

--
-- Dumping data untuk tabel `penjualan`
--

INSERT INTO `penjualan` (`idpenjualan`, `iduser`, `iddesain`, `qty`, `hsatuan`, `currency`) VALUES
(1, 6, 1, 2, 300, 'IDR'),
(2, 9, 2, 1, 300, 'SGD'),
(3, 10, 2, 2, 300, 'SGD'),
(4, 2, 1, 2, 300, 'IDR'),
(5, 3, 1, 1, 300, 'IDR'),
(6, 11, 2, 1, 300, 'SGD'),
(7, 11, 8, 1, 400, 'SGD'),
(8, 5, 1, 1, 300, 'IDR'),
(9, 15, 3, 1, 300, 'RMB'),
(10, 7, 2, 1, 300, 'SGD'),
(11, 20, 3, 1, 300, 'RMB'),
(12, 6, 1, 2, 300, 'IDR'),
(13, 7, 2, 1, 288, 'SGD'),
(14, 3, 1, 1, 300, 'IDR'),
(15, 6, 1, 1, 300, 'IDR'),
(16, 1, 6, 1, 400, 'IDR'),
(17, 2, 1, 1, 300, 'IDR'),
(18, 7, 4, 1, 383, 'SGD'),
(19, 8, 10, 1, 575, 'SGD'),
(20, 16, 9, 1, 323, 'RMB'),
(21, 6, 1, 2, 300, 'IDR'),
(22, 9, 2, 1, 288, 'SGD'),
(23, 3, 1, 1, 300, 'IDR'),
(24, 7, 2, 1, 243, 'SGD'),
(25, 1, 10, 1, 600, 'IDR'),
(26, 3, 4, 1, 400, 'IDR'),
(27, 10, 6, 1, 323, 'SGD'),
(28, 5, 1, 1, 300, 'IDR'),
(29, 6, 1, 2, 300, 'IDR'),
(30, 3, 1, 1, 300, 'IDR'),
(31, 10, 6, 1, 323, 'SGD'),
(32, 4, 4, 1, 400, 'IDR'),
(33, 8, 10, 1, 485, 'SGD'),
(34, 15, 3, 1, 173, 'RMB'),
(35, 11, 9, 1, 283, 'SGD'),
(36, 1, 10, 1, 600, 'IDR'),
(37, 3, 10, 1, 600, 'IDR'),
(38, 4, 4, 1, 400, 'IDR'),
(39, 2, 1, 1, 300, 'IDR'),
(40, 7, 2, 1, 213, 'SGD'),
(41, 6, 1, 2, 300, 'IDR'),
(42, 7, 1, 0, 300, 'IDR'),
(43, 7, 2, 1, 300, 'IDR'),
(44, 11, 2, 1, 213, 'SGD'),
(45, 1, 10, 1, 600, 'IDR');

-- --------------------------------------------------------

--
-- Struktur dari tabel `saham`
--

CREATE TABLE IF NOT EXISTS `saham` (
  `idsaham` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  PRIMARY KEY (`idsaham`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data untuk tabel `saham`
--

INSERT INTO `saham` (`idsaham`, `nama`) VALUES
(1, 'Sampoerna'),
(2, 'Freeport'),
(3, 'Ciputra');

-- --------------------------------------------------------

--
-- Struktur dari tabel `setting`
--

CREATE TABLE IF NOT EXISTS `setting` (
  `idsetting` int(11) NOT NULL AUTO_INCREMENT,
  `namasetting` varchar(100) NOT NULL,
  `harga1` int(11) NOT NULL,
  `harga2` int(11) NOT NULL,
  `harga3` int(11) NOT NULL,
  PRIMARY KEY (`idsetting`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data untuk tabel `setting`
--

INSERT INTO `setting` (`idsetting`, `namasetting`, `harga1`, `harga2`, `harga3`) VALUES
(1, 'exportimport', 250, 250, 250),
(2, 'bungapinjam', 10, 0, 0),
(3, 'bungatabung', 5, 0, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tcurrency`
--

CREATE TABLE IF NOT EXISTS `tcurrency` (
  `idtcurrency` int(11) NOT NULL AUTO_INCREMENT,
  `iduser` int(11) NOT NULL,
  `currency1` varchar(100) NOT NULL,
  `currency2` varchar(100) NOT NULL,
  `nominal` int(11) NOT NULL,
  PRIMARY KEY (`idtcurrency`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data untuk tabel `tcurrency`
--

INSERT INTO `tcurrency` (`idtcurrency`, `iduser`, `currency1`, `currency2`, `nominal`) VALUES
(1, 3, 'IDR', 'SGD', 250),
(2, 3, 'IDR', 'RMB', 250),
(3, 1, 'IDR', 'RMB', 400),
(4, 1, 'IDR', 'SGD', 500),
(5, 1, 'IDR', 'RMB', 100),
(6, 1, 'IDR', 'RMB', 800),
(7, 9, 'SGD', 'RMB', 200);

-- --------------------------------------------------------

--
-- Struktur dari tabel `timer`
--

CREATE TABLE IF NOT EXISTS `timer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data untuk tabel `timer`
--

INSERT INTO `timer` (`id`, `time`) VALUES
(1, 1506171755);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tpinjaman`
--

CREATE TABLE IF NOT EXISTS `tpinjaman` (
  `idtpinjaman` int(11) NOT NULL AUTO_INCREMENT,
  `iduser` int(11) NOT NULL,
  `nominal` int(11) NOT NULL,
  `currency` varchar(100) NOT NULL,
  PRIMARY KEY (`idtpinjaman`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

--
-- Dumping data untuk tabel `tpinjaman`
--

INSERT INTO `tpinjaman` (`idtpinjaman`, `iduser`, `nominal`, `currency`) VALUES
(1, 9, 20, 'IDR'),
(2, 9, 200, 'IDR'),
(3, 9, 20, 'RMB'),
(4, 9, 200, 'RMB'),
(5, 8, 50, 'IDR'),
(6, 8, 500, 'IDR'),
(7, 8, 50, 'SGD'),
(8, 8, 500, 'SGD'),
(9, 8, 50, 'RMB'),
(10, 8, 500, 'RMB'),
(11, 11, 50, 'IDR'),
(12, 11, 500, 'IDR'),
(13, 1, 50, 'SGD'),
(14, 1, 500, 'SGD'),
(15, 1, 100, 'RMB'),
(16, 1, 1000, 'RMB'),
(17, 9, -220, 'IDR'),
(18, 9, -220, 'RMB'),
(19, 14, 50, 'IDR'),
(20, 14, 500, 'IDR'),
(21, 14, 50, 'SGD'),
(22, 14, 500, 'SGD'),
(23, 1, -550, 'SGD'),
(24, 1, -1100, 'RMB');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tsaham`
--

CREATE TABLE IF NOT EXISTS `tsaham` (
  `idtsaham` int(11) NOT NULL AUTO_INCREMENT,
  `iduser` int(11) NOT NULL,
  `idsaham` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `hsatuan` int(11) NOT NULL,
  `currency` varchar(100) NOT NULL,
  PRIMARY KEY (`idtsaham`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ttabungan`
--

CREATE TABLE IF NOT EXISTS `ttabungan` (
  `idttabungan` int(11) NOT NULL AUTO_INCREMENT,
  `iduser` int(11) NOT NULL,
  `nominal` int(11) NOT NULL,
  `currency` varchar(100) NOT NULL,
  PRIMARY KEY (`idttabungan`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data untuk tabel `ttabungan`
--

INSERT INTO `ttabungan` (`idttabungan`, `iduser`, `nominal`, `currency`) VALUES
(1, 13, 1000, 'RMB');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `iduser` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `cash1` int(11) NOT NULL,
  `cash2` int(11) NOT NULL,
  `cash3` int(11) NOT NULL,
  `maxweight` int(11) NOT NULL,
  PRIMARY KEY (`iduser`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`iduser`, `nama`, `password`, `cash1`, `cash2`, `cash3`, `maxweight`) VALUES
(1, 'tim1', 'tim1', 595, 161, 2083, 50),
(2, 'tim2', 'tim2', 190, 0, 0, 50),
(3, 'tim3', 'tim3', 635, 35, 250, 50),
(4, 'tim4', 'tim4', 750, 100, 0, 50),
(5, 'tim5', 'tim5', 950, 0, 0, 50),
(6, 'tim6', 'tim6', 1550, 0, 0, 50),
(7, 'tim7', 'tim7', 650, 455, 0, 50),
(8, 'tim8', 'tim8', 80, 2188, 375, 50),
(9, 'tim9', 'tim9', 245, 221, 578, 50),
(10, 'tim10', 'tim10', 0, 1047, 0, 50),
(11, 'tim11', 'tim11', 200, 1239, 0, 50),
(12, 'tim12', 'tim12', 0, 1000, 0, 50),
(13, 'tim13', 'tim13', 0, 0, 0, 50),
(14, 'tim14', 'tim14', 500, 500, 500, 50),
(15, 'tim15', 'tim15', 0, 0, 760, 50),
(16, 'tim16', 'tim16', 265, 0, 658, 50),
(17, 'tim17', 'tim17', 230, 0, 500, 50),
(18, 'tim18', 'tim18', 0, 0, 1000, 50),
(19, 'tim19', 'tim19', 0, 0, 1000, 50),
(20, 'tim20', 'tim20', 200, 0, 800, 50),
(21, 'tim21', 'tim21', 0, 0, 1000, 50);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
