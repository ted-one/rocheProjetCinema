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

SET FOREIGN_KEY_CHECKS=0;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tedv_cinema`
--

--
-- Dumping data for table `capteur`
--

INSERT INTO `capteur` (`id`, `id_salle`, `nom_capteur`) VALUES
(1, 1, '209'),
(2, 2, '202'),
(3, 3, '206'),
(4, 3, 'Nouvelle_carte'),
(5, 3, 'Nouvelle_carte'),
(6, 3, 'Nouvelle_carte'),
(7, 3, 'Nouvelle_carte'),
(8, 3, 'Nouvelle_carte'),
(9, 3, 'Nouvelle_carte'),
(10, 3, 'Nouvelle_carte');

--
-- Dumping data for table `film`
--

INSERT INTO `film` (`id`, `titre`, `duree`, `interdit_16_ans`, `langue`, `resume`, `affiche`) VALUES
(1, 'Lee Miller', 117, 0, 'EN', 'L’incroyable vie de LEE MILLER, ex-modèle pour Vogue et muse de Man Ray devenue l’une des premières femmes photographes de guerre. Partie sur le front et prête à tout pour témoigner des horreurs de la Seconde Guerre, elle a, par son courage et son refus des conventions, changé la façon de voir le monde.', 'affiche-leemiller.png'),
(2, 'Croquette', 87, 0, 'FR', 'C’est bien connu, les chats ont plusieurs vies ! Croquette vient de gâcher celle de trop et il ferait tout pour retrouver Rose, sa maîtresse adorée. On lui accorde une dernière chance, cependant une règle a changé : Croquette peut revenir, mais à un détail près... Désormais transformé en cheval, chien, perroquet ou poisson, l’aventure ne fait que commencer !', 'affiche-croquette.jpg'),
(3, 'Smile 2', 122, 1, 'EN', 'Sur le point d\'entamer une tournée mondiale, la sensation pop Skye Riley commence à vivre des événements de plus en plus terrifiants et inexplicables. Accablée par l\'escalade des horreurs, Skye est forcée de faire face à son passé.', 'affiche-smile.jpg'),
(4, 'Pulp Fiction', 149, 0, 'EN', 'L\'odyssée sanglante et burlesque de petits malfrats dans la jungle de Hollywood à travers trois histoires qui s\'entremêlent.', 'affiche-pulpfiction.jpg');

--
-- Dumping data for table `mesure`
--

INSERT INTO `mesure` (`id`, `id_capteur`, `heure_date`, `temperature`, `humidite`, `co2`) VALUES
(1, 1, '2026-09-04 10:27:54', 24.5, 34, 451),
(2, 1, '2026-09-04 10:29:00', 42.5, 54, 800),
(3, 1, '2026-09-04 10:29:41', 12.7, 13, 1200),
(4, 3, '2026-09-04 10:51:42', 35.9, 37, 1204),
(5, 2, '2026-09-04 10:52:11', 32, 55.4, 967),
(6, 2, '2026-09-04 10:52:43', 39.7, 22, 570),
(7, 3, '2026-09-04 10:53:08', 27, 67, 1607),
(8, 2, '2026-09-04 10:53:45', 15.8, 34, 628),
(9, 3, '2026-09-04 10:54:37', 25, 54, 367),
(10, 1, '2026-09-04 10:56:13', 38.3, 58, 1024),
(11, 2, '2026-09-04 10:56:48', 26.9, 33.5, 756),
(12, 3, '2026-09-04 10:57:15', 23, 66, 1504),
(13, 1, '2026-09-04 10:58:11', 45.6, 67, 1067),
(14, 3, '2026-09-04 11:00:38', 21.8, 25, 478),
(15, 2, '2026-09-04 11:01:01', 18.5, 48, 1360),
(16, 1, '2026-09-11 09:28:59', 23.16, 93.12, 2367),
(17, 1, '2026-09-11 09:29:20', 22.59, 20.58, 2672),
(18, 1, '2026-09-11 09:39:23', 25.61, 86.05, 805),
(19, 1, '2026-09-11 09:46:46', 26.5, 92.34, 616),
(20, 1, '2026-09-11 09:47:24', 21.75, 81.61, 1339),
(21, 1, '2026-09-11 09:47:55', 17.15, 57.35, 829),
(22, 1, '2026-09-11 09:48:35', 19.46, 48.79, 1043),
(23, 1, '2026-09-11 10:09:23', 16.65, 11.68, 386),
(24, 1, '2026-09-11 10:09:56', 23.04, 37.17, 2658),
(25, 1, '2026-09-11 10:41:13', 26.51, 12.31, 842),
(26, 1, '2026-09-11 10:41:18', 24.29, 88.99, 2089),
(27, 1, '2026-09-11 10:41:32', 17.94, 38.91, 2945),
(28, 1, '2026-09-11 10:41:49', 28.28, 87.64, 2823),
(29, 1, '2026-09-11 10:42:40', 26.18, 18.59, 1494),
(30, 1, '2026-09-11 10:42:44', 27.74, 61.38, 561),
(31, 1, '2026-09-11 10:42:53', 23.58, 77.25, 1130),
(32, 1, '2026-09-11 10:43:03', 16.76, 73.92, 1965),
(33, 1, '2026-09-11 10:43:08', 23.59, 20.24, 1136),
(34, 1, '2026-09-11 10:43:19', 17.91, 36.03, 1030),
(35, 1, '2026-09-11 10:43:38', 24.16, 74.81, 1481),
(36, 1, '2026-09-11 10:44:02', 16.15, 12.91, 1350),
(37, 1, '2026-09-11 10:45:27', 27.11, 52.84, 753),
(38, 1, '2026-09-11 10:52:09', 27.21, 94.26, 2344),
(39, 1, '2026-09-11 11:06:56', 17.4, 88.68, 1691),
(40, 1, '2026-09-11 11:12:51', 16.18, 80.72, 2982),
(41, 1, '2026-09-11 11:12:59', 26.35, 56.36, 1153),
(42, 1, '2026-09-11 11:19:56', 24.16, 46.25, 2217),
(43, 1, '2026-09-11 11:20:34', 18.08, 76.8, 2022),
(44, 1, '2026-09-11 11:20:36', 23.1, 81.17, 2252),
(45, 1, '2026-09-11 11:20:37', 25.94, 66.96, 2849),
(46, 1, '2026-09-11 11:20:38', 28.47, 11.17, 2113),
(47, 1, '2026-09-11 11:20:39', 22.6, 28.17, 744),
(48, 1, '2026-09-11 11:20:41', 22.02, 31.87, 2647),
(49, 1, '2026-09-11 11:21:39', 25.27, 64.68, 2330),
(50, 1, '2026-09-11 11:21:45', 19.69, 94.7, 1660),
(51, 1, '2026-09-11 11:21:55', 24.71, 31.29, 1453),
(52, 1, '2026-09-11 11:43:02', 19.91, 87.76, 1326),
(53, 1, '2026-09-18 08:22:32', 28.68, 32.07, 2213),
(54, 1, '2026-09-18 08:29:22', 18.96, 84.91, 2790),
(55, 1, '2026-09-18 08:37:17', 27.54, 71.04, 1464),
(56, 1, '2026-09-18 09:00:47', 17.81, 36.95, 2921),
(57, 1, '2026-09-18 09:05:42', 25.46, 14.04, 432),
(58, 1, '2026-09-18 09:07:06', 25.6, 55.75, 1882),
(59, 1, '2026-09-18 09:09:43', 28.6, 18.97, 2781),
(60, 1, '2026-09-18 09:37:26', 18.22, 18.14, 641),
(61, 1, '2026-09-18 10:46:46', 25.87, 43.05, 1267);

--
-- Dumping data for table `salle`
--

INSERT INTO `salle` (`id`, `numero_salle`, `nom`, `taille_ecran`, `technologies`, `amenagements`, `nb_fauteuils`, `place_pmr`) VALUES
(1, 1, 'Salle 1', '4.60m x 11.00m', '', 'Place PMR', 113, 4),
(2, 2, 'Salle 2', '4.60m x 11.00m', '', 'Place PMR', 97, 4),
(3, 3, 'Salle 3', '4.60m x 11.00m', '', 'Place PMR', 97, 4),
(4, 4, 'Salle 4', '4.60m x 11.00m', '', 'Place PMR', 112, 4),
(5, 5, 'Salle 5', '5.15m x 12.30m', '', 'Place PMR, Espace Co', 150, 5),
(6, 6, 'Salle 6', '5.15m x 12.30m', 'ScreenX', 'Place PMR, Espace Co', 150, 5),
(7, 7, 'Salle 7', '6.95m x 16.60m', 'Laser Ultra', 'Place PMR, Espace Co', 265, 7),
(8, 8, 'Salle ICE', '5.15m x 12.30m', '', 'Place PMR', 139, 4),
(9, 9, 'Salle 9', '6.95m x 16.60m', 'Laser Ultra', 'Place PMR, Espace Co', 125, 7),
(10, 10, 'Salle 10', '5.15m x 12.30m', '', 'Place PMR', 112, 4),
(11, 11, 'Salle 11', '6.95m x 16.60m', 'Laser Ultra', 'Place PMR, Espace Co', 158, 7),
(12, 12, 'Salle 12', '5.15m x 12.30m', '', 'Place PMR', 156, 4);

--
-- Dumping data for table `seance`
--

INSERT INTO `seance` (`id`, `id_film`, `id_salle`, `heure_date`, `version_langue`) VALUES
(1, 1, 1, '2026-11-16 12:30:00', 'VO'),
(2, 2, 3, '2026-11-16 21:30:00', 'VF'),
(3, 3, 2, '2026-11-16 19:00:00', 'VO'),
(4, 1, 2, '2026-11-13 20:00:00', 'VF'),
(5, 3, 1, '2026-11-15 20:30:00', 'VO'),
(6, 4, 3, '2026-11-15 22:30:00', 'VF');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

SET FOREIGN_KEY_CHECKS=1;