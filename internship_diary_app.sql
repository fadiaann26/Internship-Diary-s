-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 11, 2024 at 11:37 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `internship_diary_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `dosen`
--

CREATE TABLE `dosen` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `nidn` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `jabatan` varchar(100) NOT NULL,
  `foto_profil` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dosen`
--

INSERT INTO `dosen` (`id`, `nama`, `nidn`, `email`, `jabatan`, `foto_profil`) VALUES
(9, 'Dosen A', '99999999', 'dosen@politeknikharber.ac.id', 'Ketua Program Studi', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `nim` varchar(20) NOT NULL,
  `program_studi` varchar(100) NOT NULL,
  `nama_perguruan_tinggi` varchar(100) NOT NULL,
  `nama_perusahaan` varchar(100) NOT NULL,
  `divisi` varchar(100) NOT NULL,
  `foto_profil` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`id`, `nama`, `nim`, `program_studi`, `nama_perguruan_tinggi`, `nama_perusahaan`, `divisi`, `foto_profil`) VALUES
(1, 'Fadia Nufinikita', '21090033', 'Teknik Informatika', 'Politeknik Harapan Bersama', 'IT Solution', 'Front End', NULL),
(2, 'Farda Nur Jihan', '21090101', 'Teknik Informatika', 'Politeknik Harapan Bersama', 'IT Solution', 'Front End', NULL),
(3, 'Yulia Trisnawati', '21090061', 'Teknik Informatika', 'Politeknik Harapan Bersama', 'IT Solution', 'Front End', NULL),
(4, 'Dimas Bintang Pratama', '21090129', 'Teknik Informatika', 'Politeknik Harapan Bersama', 'IT Solution', 'Back End', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mentor`
--

CREATE TABLE `mentor` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `nama_perusahaan` varchar(100) NOT NULL,
  `divisi` varchar(100) NOT NULL,
  `foto_profil` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mentor`
--

INSERT INTO `mentor` (`id`, `nama`, `email`, `nama_perusahaan`, `divisi`, `foto_profil`) VALUES
(5, 'Mentor A', 'mentor1@company.com', 'IT Solution', 'Web Developer', NULL),
(6, 'Mentor B', 'mentor2@company.com', 'IT Solution', 'Web Developer', NULL),
(7, 'Mentor C', 'mentor3@company.com', 'IT Solution', 'Web Developer', NULL),
(8, 'Mentor D', 'mentor4@company.com', 'IT Solution', 'Web Developer', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permission`
--

CREATE TABLE `permission` (
  `id` int(11) NOT NULL,
  `mahasiswa_id` int(11) DEFAULT NULL,
  `tanggal_mulai` date NOT NULL,
  `tanggal_selesai` date NOT NULL,
  `status` enum('sakit','izin') NOT NULL,
  `bukti` varchar(255) DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `presensi_mahasiswa`
--

CREATE TABLE `presensi_mahasiswa` (
  `id` int(11) NOT NULL,
  `waktu_presensi` datetime NOT NULL,
  `nama_mahasiswa` varchar(255) NOT NULL,
  `uraian_tugas` text DEFAULT NULL,
  `approval_mentor` tinyint(1) DEFAULT 0,
  `status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int(11) NOT NULL,
  `judul_project` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `deadline` date NOT NULL,
  `mahasiswa_ids` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('mahasiswa','mentor','dosen') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`) VALUES
(1, 'fadianufinikita', 'magangits1', 'mahasiswa'),
(2, 'fardanurjihan', 'magangits2', 'mahasiswa'),
(3, 'yuliatrisnawati', 'magangits3', 'mahasiswa'),
(4, 'dimasbintangpratama', 'magangits4', 'mahasiswa'),
(5, 'mentorits1', 'mentorits1', 'mentor'),
(6, 'mentorits2', 'mentorits2', 'mentor'),
(7, 'mentorits3', 'mentorits3', 'mentor'),
(8, 'mentorits4', 'mentorits4', 'mentor'),
(9, 'dosenphb1', 'dosenphb1', 'dosen');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mentor`
--
ALTER TABLE `mentor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission`
--
ALTER TABLE `permission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `presensi_mahasiswa`
--
ALTER TABLE `presensi_mahasiswa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `permission`
--
ALTER TABLE `permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `presensi_mahasiswa`
--
ALTER TABLE `presensi_mahasiswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dosen`
--
ALTER TABLE `dosen`
  ADD CONSTRAINT `dosen_ibfk_1` FOREIGN KEY (`id`) REFERENCES `users` (`id`);

--
-- Constraints for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD CONSTRAINT `mahasiswa_ibfk_1` FOREIGN KEY (`id`) REFERENCES `users` (`id`);

--
-- Constraints for table `mentor`
--
ALTER TABLE `mentor`
  ADD CONSTRAINT `mentor_ibfk_1` FOREIGN KEY (`id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
