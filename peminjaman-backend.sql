-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 14, 2022 at 08:35 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `peminjaman-backend`
--

-- --------------------------------------------------------

--
-- Table structure for table `keranjangs`
--

CREATE TABLE `keranjangs` (
  `nama_lengkap` varchar(255) NOT NULL,
  `instansi` varchar(255) NOT NULL,
  `tgl_pinjam` varchar(64) NOT NULL,
  `jam_start` varchar(8) NOT NULL,
  `jam_end` varchar(8) NOT NULL,
  `keterangan` varchar(512) NOT NULL,
  `status` varchar(8) NOT NULL,
  `id` int(11) NOT NULL,
  `kodeProduct` varchar(11) NOT NULL,
  `email` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `keranjangs`
--

INSERT INTO `keranjangs` (`nama_lengkap`, `instansi`, `tgl_pinjam`, `jam_start`, `jam_end`, `keterangan`, `status`, `id`, `kodeProduct`, `email`) VALUES
('Angga', 'STMIK', '2022-01-22', '20:55', '22:55', 'Jogging', 'OK', 9, '3A', 'admin1@gmail.com'),
('fery', 'Stmik', '2022-01-15', '20:06', '22:06', 'oifhskdhfksd', 'Cancel', 10, '3A', 'admin1@gmail.com'),
('A.A Gede Iswara Andika Parayana', 'UKM Musik', '2022-01-15', '15:00', '17:00', 'Rapat pengurus baru', 'OK', 15, '3B', 'gungde@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(64) NOT NULL,
  `kode` varchar(11) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `kursi` varchar(255) DEFAULT NULL,
  `meja` varchar(255) DEFAULT NULL,
  `gambar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `kode`, `nama`, `kursi`, `meja`, `gambar`) VALUES
(1, '3A', 'Ruang 3A', '34', '18', 'ruang-a.jpg'),
(2, '3B', 'Ruang 3B', '34', '17', 'ruang-b.jpg'),
(3, '3C', 'Ruang 3C', '30', '15', 'ruang-c.jpg'),
(4, '3D', 'Ruang 3D', '30', '15', 'ruang-d.jpg'),
(5, '3E', 'Ruang 3E', '30', '15', 'ruang-e.jpg'),
(6, '3F', 'Ruang 3F', '30', '15', 'ruang-f.jpg'),
(7, 'labkom', 'Lab Komputer', '30', '15', 'labkom.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `createdAt`, `updatedAt`) VALUES
(1, 'user', '2022-01-05 03:14:28', '2022-01-05 03:14:28'),
(2, 'admin', '2022-01-05 03:14:28', '2022-01-05 03:14:28'),
(3, 'moderator', '2022-01-14 14:47:28', '2022-01-14 14:47:28');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `createdAt`, `updatedAt`) VALUES
(1, 'admin1', 'admin1@gmail.com', '$2a$08$86HlpSuCCOAkxaMLnL8xHuCNyR0M/yd8ecCsEa2VEMB2tyE9ZPjzq', '2022-01-05 03:14:52', '2022-01-05 03:14:52'),
(2, 'gungde', 'gungde@gmail.com', '$2a$08$4AUWurbUW0.IgOr5SrPFSem11hq0WnAGQlxfx9o3iC.6NQb73k1sm', '2022-01-05 03:16:34', '2022-01-05 03:16:34'),
(3, 'fery', 'fery@gmail.com', '$2a$08$m7pAP3gPuFuRoZU0.265ZOOD7c9WvHqIBauJGqXbjkrapj1RCEPtm', '2022-01-05 03:16:49', '2022-01-05 03:16:49'),
(4, 'angga', 'angga@gmail.com', '$2a$08$NWoZ41TTbi9vVf5opnbOV.MaeZ7b5fpE1axHMfZ1iZcrDIhpXen0W', '2022-01-06 16:13:20', '2022-01-06 16:13:20'),
(5, 'wesby', 'wesby@gmail.com', '$2a$08$WeqhjJhAWyRZ/5w9vdm4Gel.ub4GLwAjZ8ujl7ruTEovfu4CAKwrm', '2022-01-06 16:13:46', '2022-01-06 16:13:46'),
(6, 'gungde1', 'gungde1@gmail.com', '$2a$08$smmGrVskjvxvET.a5x34j.ZooBhucQufd4N7xRfJmyG1SK0i2G3qC', '2022-01-06 17:14:31', '2022-01-06 17:14:31'),
(11, 'upt', 'upt@gmail.com', '$2a$08$rWDC51Q/cL3R9AclRgSVBeFow/DXNcXsoyk3/WBl37uA1/Ysqlh0i', '2022-01-13 08:19:02', '2022-01-13 08:19:02');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `roleId` int(11) NOT NULL,
  `userId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`createdAt`, `updatedAt`, `roleId`, `userId`) VALUES
('2022-01-05 03:16:34', '2022-01-05 03:16:34', 1, 2),
('2022-01-05 03:16:49', '2022-01-05 03:16:49', 1, 3),
('2022-01-06 16:13:20', '2022-01-06 16:13:20', 1, 4),
('2022-01-06 16:13:46', '2022-01-06 16:13:46', 1, 5),
('2022-01-06 17:14:31', '2022-01-06 17:14:31', 1, 6),
('2022-01-05 03:14:52', '2022-01-05 03:14:52', 2, 1),
('2022-01-13 08:19:02', '2022-01-13 08:19:02', 3, 11);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `keranjangs`
--
ALTER TABLE `keranjangs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_kode` (`kodeProduct`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kode` (`kode`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`roleId`,`userId`),
  ADD KEY `userId` (`userId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `keranjangs`
--
ALTER TABLE `keranjangs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(64) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_roles_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
