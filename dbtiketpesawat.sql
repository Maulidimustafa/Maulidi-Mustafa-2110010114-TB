-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 06, 2024 at 07:11 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbtiketpesawat`
--

-- --------------------------------------------------------

--
-- Table structure for table `list_pembeli`
--

CREATE TABLE `list_pembeli` (
  `jumlah_beli` int(10) NOT NULL,
  `nama_pembeli` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `list_pembeli`
--

INSERT INTO `list_pembeli` (`jumlah_beli`, `nama_pembeli`) VALUES
(2, 'yaya');

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
  `id_pengguna` int(11) NOT NULL,
  `Nama` varchar(30) NOT NULL,
  `Level` varchar(11) NOT NULL,
  `Password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`id_pengguna`, `Nama`, `Level`, `Password`) VALUES
(1, 'Maulidi', 'Admin', 'Admin123'),
(2, 'Mustafa', 'User', 'User123');

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `nama_pembeli` varchar(30) NOT NULL,
  `jumlah_beli` int(10) NOT NULL,
  `total_bayar` int(50) NOT NULL,
  `pembayaran` int(50) NOT NULL,
  `kembalian` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`nama_pembeli`, `jumlah_beli`, `total_bayar`, `pembayaran`, `kembalian`) VALUES
('yaya', 2, 154000, 160000, 6000);

--
-- Triggers `penjualan`
--
DELIMITER $$
CREATE TRIGGER `after_insert_penjualan` AFTER INSERT ON `penjualan` FOR EACH ROW BEGIN
    INSERT INTO list_pembeli (nama_pembeli, jumlah_beli) VALUES (NEW.nama_pembeli, NEW.jumlah_beli);
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `list_pembeli`
--
ALTER TABLE `list_pembeli`
  ADD PRIMARY KEY (`jumlah_beli`),
  ADD KEY `nama_ibfk_1` (`nama_pembeli`);

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`id_pengguna`),
  ADD KEY `Nama` (`Nama`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`nama_pembeli`),
  ADD KEY `jumlah_beli` (`jumlah_beli`),
  ADD KEY `jumlah_beli_2` (`jumlah_beli`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `list_pembeli`
--
ALTER TABLE `list_pembeli`
  ADD CONSTRAINT `jumlah_ibfk_2` FOREIGN KEY (`jumlah_beli`) REFERENCES `penjualan` (`jumlah_beli`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `nama_ibfk_1` FOREIGN KEY (`nama_pembeli`) REFERENCES `penjualan` (`nama_pembeli`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
