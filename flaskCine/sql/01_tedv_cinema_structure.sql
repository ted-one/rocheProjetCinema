-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: mysql-tedv.alwaysdata.net
-- Generation Time: Nov 24, 2026 at 11:43 AM
-- Server version: 10.11.18-MariaDB
-- PHP Version: 8.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tedv_cinema`
--

-- --------------------------------------------------------

--
-- Table structure for table `afficheur`
--

CREATE TABLE `afficheur` (
  `id` int(10) UNSIGNED NOT NULL,
  `modele` varchar(20) NOT NULL,
  `taille_pixels` varchar(20) NOT NULL,
  `id_salle` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `capteur`
--

CREATE TABLE `capteur` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_salle` int(11) UNSIGNED NOT NULL,
  `nom_capteur` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `film`
--

CREATE TABLE `film` (
  `id` int(10) UNSIGNED NOT NULL,
  `titre` varchar(150) NOT NULL,
  `duree` int(5) NOT NULL,
  `interdit_16_ans` tinyint(1) NOT NULL,
  `langue` enum('FR','ES','EN') NOT NULL,
  `resume` text NOT NULL,
  `affiche` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mesure`
--

CREATE TABLE `mesure` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_capteur` int(11) UNSIGNED NOT NULL,
  `heure_date` datetime NOT NULL,
  `temperature` float NOT NULL,
  `humidite` float NOT NULL,
  `co2` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salle`
--

CREATE TABLE `salle` (
  `id` int(11) UNSIGNED NOT NULL,
  `numero_salle` int(11) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `taille_ecran` varchar(100) NOT NULL,
  `technologies` varchar(100) DEFAULT NULL,
  `amenagements` varchar(100) DEFAULT NULL,
  `nb_fauteuils` int(10) UNSIGNED NOT NULL,
  `place_pmr` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seance`
--

CREATE TABLE `seance` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_film` int(11) UNSIGNED NOT NULL,
  `id_salle` int(11) UNSIGNED NOT NULL,
  `heure_date` datetime NOT NULL,
  `version_langue` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `afficheur`
--
ALTER TABLE `afficheur`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_salle` (`id_salle`);

--
-- Indexes for table `capteur`
--
ALTER TABLE `capteur`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_salle` (`id_salle`) USING BTREE;

--
-- Indexes for table `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mesure`
--
ALTER TABLE `mesure`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_capteur` (`id_capteur`) USING BTREE;

--
-- Indexes for table `salle`
--
ALTER TABLE `salle`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seance`
--
ALTER TABLE `seance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_film` (`id_film`),
  ADD KEY `id_salle` (`id_salle`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `afficheur`
--
ALTER TABLE `afficheur`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `capteur`
--
ALTER TABLE `capteur`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `film`
--
ALTER TABLE `film`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mesure`
--
ALTER TABLE `mesure`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salle`
--
ALTER TABLE `salle`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seance`
--
ALTER TABLE `seance`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `afficheur`
--
ALTER TABLE `afficheur`
  ADD CONSTRAINT `afficheur_ibfk_1` FOREIGN KEY (`id_salle`) REFERENCES `salle` (`id`);

--
-- Constraints for table `capteur`
--
ALTER TABLE `capteur`
  ADD CONSTRAINT `capteur_ibfk_1` FOREIGN KEY (`id_salle`) REFERENCES `salle` (`id`);

--
-- Constraints for table `mesure`
--
ALTER TABLE `mesure`
  ADD CONSTRAINT `mesure_ibfk_1` FOREIGN KEY (`id_capteur`) REFERENCES `capteur` (`id`);

--
-- Constraints for table `seance`
--
ALTER TABLE `seance`
  ADD CONSTRAINT `seance_ibfk_1` FOREIGN KEY (`id_film`) REFERENCES `film` (`id`),
  ADD CONSTRAINT `seance_ibfk_2` FOREIGN KEY (`id_salle`) REFERENCES `salle` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
