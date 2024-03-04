-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 04 mars 2024 à 21:03
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `cms_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `branches`
--

CREATE TABLE `branches` (
  `id` int(30) NOT NULL,
  `branch_code` varchar(50) NOT NULL,
  `street` text NOT NULL,
  `city` text NOT NULL,
  `state` text NOT NULL,
  `zip_code` varchar(50) NOT NULL,
  `country` text NOT NULL,
  `contact` varchar(100) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `branches`
--

INSERT INTO `branches` (`id`, `branch_code`, `street`, `city`, `state`, `zip_code`, `country`, `contact`, `date_created`) VALUES
(1, 'vzTL0PqMogyOWhF', 'Mahdia', 'Manila', 'ahmed', '1001', 'tunis', '+2 123 455 623', '2023-11-26 11:21:41'),
(3, 'KyIab3mYBgAX71t', 'Tunis', 'Cebu', 'Cebu', '6000', 'tunis', '+1234567489', '2023-11-26 16:45:05'),
(4, 'dIbUK5mEh96f0Zc', 'Ariena', 'Sample', 'Sample', '123456', 'tunis', '123456', '2023-11-27 13:31:49');

-- --------------------------------------------------------

--
-- Structure de la table `parcels`
--

CREATE TABLE `parcels` (
  `id` int(30) NOT NULL,
  `reference_number` varchar(100) NOT NULL,
  `sender_name` text NOT NULL,
  `sender_address` text NOT NULL,
  `sender_contact` text NOT NULL,
  `recipient_name` text NOT NULL,
  `recipient_address` text NOT NULL,
  `recipient_contact` text NOT NULL,
  `type` int(1) NOT NULL COMMENT '1 = Deliver, 2=Pickup',
  `from_branch_id` varchar(30) NOT NULL,
  `to_branch_id` varchar(30) NOT NULL,
  `weight` varchar(100) NOT NULL,
  `height` varchar(100) NOT NULL,
  `width` varchar(100) NOT NULL,
  `length` varchar(100) NOT NULL,
  `price` float NOT NULL,
  `status` int(2) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `parcels`
--

INSERT INTO `parcels` (`id`, `reference_number`, `sender_name`, `sender_address`, `sender_contact`, `recipient_name`, `recipient_address`, `recipient_contact`, `type`, `from_branch_id`, `to_branch_id`, `weight`, `height`, `width`, `length`, `price`, `status`, `date_created`) VALUES
(1, '201406231415', 'AHMED', 'Sample', '+123456', 'AYMEN', 'Sample', 'Sample', 1, '1', '0', '30kg', '12in', '12in', '15in', 2500, 7, '2023-11-26 16:15:46'),
(2, '117967400213', 'ASMA', 'Sample', '+123456', 'AYMEN', 'Sample', 'Sample', 2, '1', '3', '30kg', '12in', '12in', '15in', 2500, 1, '2023-11-26 16:46:03'),
(3, '983186540795', 'ASMA', 'Sample', '+123456', 'AYMEN', 'Sample', 'Sample', 2, '1', '3', '20Kg', '10in', '10in', '10in', 1500, 2, '2023-11-26 16:46:03'),
(4, '514912669061', 'ASMA', 'Sample', '+123456', 'AYMEN', 'Sample Address', '+12345', 2, '4', '1', '23kg', '12in', '12in', '15in', 1900, 0, '2023-11-27 13:52:14'),
(5, '897856905844', 'ASMA', 'Sample', '+123456', 'AYMEN', 'Sample Address', '+12345', 2, '4', '1', '30kg', '10in', '10in', '10in', 1450, 0, '2023-11-27 13:52:14'),
(6, '505604168988', 'ASMA', 'Sample', '+123456', 'AYMEN', 'Sample', '+12345', 1, '1', '0', '23kg', '12in', '12in', '15in', 2500, 1, '2023-11-27 14:06:42');

-- --------------------------------------------------------

--
-- Structure de la table `parcel_tracks`
--

CREATE TABLE `parcel_tracks` (
  `id` int(30) NOT NULL,
  `parcel_id` int(30) NOT NULL,
  `status` int(2) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `parcel_tracks`
--

INSERT INTO `parcel_tracks` (`id`, `parcel_id`, `status`, `date_created`) VALUES
(1, 2, 1, '2023-11-27 09:53:27'),
(2, 3, 1, '2023-11-27 09:55:17'),
(3, 1, 1, '2023-11-27 10:28:01'),
(4, 1, 2, '2023-11-27 10:28:10'),
(5, 1, 3, '2023-11-27 10:28:16'),
(6, 1, 4, '2023-11-27 11:05:03'),
(7, 1, 5, '2023-11-27 11:05:17'),
(8, 1, 7, '2023-11-27 11:05:26'),
(9, 3, 2, '2023-11-27 11:05:41'),
(10, 6, 1, '2023-11-27 14:06:57');

-- --------------------------------------------------------

--
-- Structure de la table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `cover_img` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `system_settings`
--

INSERT INTO `system_settings` (`id`, `name`, `email`, `contact`, `address`, `cover_img`) VALUES
(1, 'gestion de la logistique des livraisons', 'info@logistique.cil', '+216 23111111', 'tunisia', '');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `firstname` varchar(200) NOT NULL,
  `lastname` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1 = admin, 2 = staff',
  `branch_id` int(30) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password`, `type`, `branch_id`, `date_created`) VALUES
(1, 'Administrator', '', 'admin@admin.com', '0192023a7bbd73250516f069df18b500', 1, 0, '2023-11-26 10:57:04'),
(2, 'ahmed', 'ben jazia', 'ahmed@yahoo.fr', '1254737c076cf867dc53d60a0364f38e', 2, 1, '2023-11-26 11:52:04'),
(3, 'ali', 'mahmoud', 'ahmed@yahoo.com', 'd40242fb23c45206fadee4e2418f274f', 2, 4, '2023-11-27 13:32:12');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `parcels`
--
ALTER TABLE `parcels`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `parcel_tracks`
--
ALTER TABLE `parcel_tracks`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `parcels`
--
ALTER TABLE `parcels`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `parcel_tracks`
--
ALTER TABLE `parcel_tracks`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
