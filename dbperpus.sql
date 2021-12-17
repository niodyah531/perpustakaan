-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 07, 2021 at 02:04 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbpus`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `idadmin` int(11) NOT NULL,
  `nm_admin` text CHARACTER SET latin1 NOT NULL,
  `username` text CHARACTER SET latin1 NOT NULL,
  `password` text CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`idadmin`, `nm_admin`, `username`, `password`) VALUES
(1, 'Admin', 'jwd', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `tbanggota`
--

CREATE TABLE `tbanggota` (
  `idanggota` varchar(5) CHARACTER SET latin1 NOT NULL,
  `nama` varchar(30) CHARACTER SET latin1 NOT NULL,
  `jeniskelamin` varchar(10) CHARACTER SET latin1 NOT NULL,
  `alamat` varchar(40) CHARACTER SET latin1 NOT NULL,
  `status` varchar(20) CHARACTER SET latin1 NOT NULL,
  `foto` varchar(35) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbanggota`
--

INSERT INTO `tbanggota` (`idanggota`, `nama`, `jeniskelamin`, `alamat`, `status`, `foto`) VALUES
('N01', 'Jennie', 'Wanita', 'Pasuruan ', 'Tidak Meminjam', 'N01.JPG'),
('N02', 'Jhope', 'Pria', 'Banyuwangi', 'Tidak Meminjam', 'N02.jpg'),
('N03', 'Jimin', 'Pria', 'Nganjuk', 'Tidak Meminjam', 'N03.jpg'),
('N04', 'Seokjin', 'Pria', 'Nganjuk', 'Tidak Meminjam', 'N04.jpg'),
('N05', 'Jisoo', 'Wanita', 'Madiun', 'Tidak Meminjam', 'N05.jpg'),
('N06', 'Jungkook', 'Pria', 'Blitar', 'Tidak Meminjam', 'B06.webp'),
('N07', 'Namjoon', 'Pria', 'Malang', 'Tidak Meminjam', 'N07.jpg'),
('N08', 'Rose', 'Wanita', 'Tulungagung', 'Tidak Meminjam', 'N08.jpg'),
('N09', 'Yoongi', 'Pria', 'Pacitan', 'Tidak Meminjam', 'N09.jpg'),
('N10', 'Taehyung', 'Pria', 'Nganjuk', 'Tidak Meminjam', 'N10.webp');

-- --------------------------------------------------------

--
-- Table structure for table `tbbuku`
--

CREATE TABLE `tbbuku` (
  `idbuku` varchar(5) CHARACTER SET latin1 NOT NULL,
  `judul` varchar(50) CHARACTER SET latin1 NOT NULL,
  `kategori` varchar(50) CHARACTER SET latin1 NOT NULL,
  `pengarang` varchar(40) CHARACTER SET latin1 NOT NULL,
  `penerbit` varchar(40) CHARACTER SET latin1 NOT NULL,
  `cover` varchar(35) CHARACTER SET latin1 NOT NULL,
  `statusbuku` varchar(10) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbbuku`
--

INSERT INTO `tbbuku` (`idbuku`, `judul`, `kategori`, `pengarang`, `penerbit`, `cover`, `statusbuku`) VALUES
('B01', 'Bulan', 'Novel', 'Tere Liye', 'Gramedia Pustaka Utama', 'B01.jpg', 'Tersedia'),
('B02', 'Bintang', 'Novel', 'Tere Liye', 'Gramedia Pustaka Utama', 'B02.jpg', 'Tersedia'),
('B03', 'Hujan', 'Novel', 'Tere Liye', 'Gramedia Pustaka Utama', 'B03.jpg', 'Tersedia'),
('B04', 'Cisco', 'Buku_Pelajaran', 'Andi Maslan', 'Informatika', 'BK004.jpg', 'Tersedia'),
('B05', 'Java', 'Buku_Pelajaran', 'Mardi Turnip', 'Informatics', 'B05.jpg', 'Tersedia'),
('B06', 'Matahari', 'Novel', 'Tere Liye', 'Gramedia Pustaka Utama', 'B06.jpg', 'Tersedia'),
('B07', 'Bumi', 'Novel', 'Tere Liye', 'Gramedia Pustaka Utama', 'B07.jpg', 'Tersedia'),
('B08', 'Jaringan', 'Buku_Pelajaran', 'Suleman', 'Graha Ilmu', 'B08.jpg', 'Tersedia'),
('B09', 'Laravel', 'Buku_Pelajaran', 'Hebid Mukhlisin', 'Laravel Indonesia', 'B09.jpg', 'Tersedia'),
('B10', 'Web', 'Buku_Pelajaran', 'Ir Yuniar Supardi', 'Elex Media Komputindo', 'B10.jpg', 'Tersedia');

-- --------------------------------------------------------

--
-- Table structure for table `tbtransaksi`
--

CREATE TABLE `tbtransaksi` (
  `idtransaksi` varchar(5) CHARACTER SET latin1 NOT NULL,
  `idanggota` varchar(5) CHARACTER SET latin1 NOT NULL,
  `idbuku` varchar(5) CHARACTER SET latin1 NOT NULL,
  `tglpinjam` date NOT NULL,
  `tglkembali` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbtransaksi`
--

INSERT INTO `tbtransaksi` (`idtransaksi`, `idanggota`, `idbuku`, `tglpinjam`, `tglkembali`) VALUES
('T01', 'N01', 'B01', '2021-08-27', '0000-00-00'),
('T02', 'N07', 'B02', '2021-08-30', '0000-00-00'),
('T03', 'N03', 'B07', '2021-08-31', '0000-00-00'),
('T04', 'N09', 'B08', '2021-09-02', '0000-00-00'),
('T05', 'N11', 'B10', '2021-09-01', '0000-00-00'),
('T06', 'N05', 'B04', '2021-09-01', '0000-00-00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`idadmin`);

--
-- Indexes for table `tbanggota`
--
ALTER TABLE `tbanggota`
  ADD PRIMARY KEY (`idanggota`);

--
-- Indexes for table `tbbuku`
--
ALTER TABLE `tbbuku`
  ADD PRIMARY KEY (`idbuku`);

--
-- Indexes for table `tbtransaksi`
--
ALTER TABLE `tbtransaksi`
  ADD PRIMARY KEY (`idtransaksi`),
  ADD KEY `fk_transaksi_anggota` (`idanggota`),
  ADD KEY `fk_transaksi_buku` (`idbuku`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `idadmin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
