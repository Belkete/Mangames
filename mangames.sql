-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 08 juin 2022 à 17:56
-- Version du serveur : 10.4.22-MariaDB
-- Version de PHP : 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `mangames`
--

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

CREATE TABLE `article` (
  `Id_Article` int(11) NOT NULL,
  `Nom_Article` varchar(50) COLLATE utf8_bin NOT NULL,
  `Type_Article` int(11) NOT NULL,
  `Lien_Image` varchar(50) COLLATE utf8_bin NOT NULL,
  `Prix_Article` double NOT NULL,
  `Quantite_Article` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `article`
--

INSERT INTO `article` (`Id_Article`, `Nom_Article`, `Type_Article`, `Lien_Image`, `Prix_Article`, `Quantite_Article`) VALUES
(1, 'Doom', 1, 'Doom.jpg', 60, 13),
(2, 'One piece Tome 100', 2, 'op100.jpg', 19.99, 25);

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `Id_Commande` int(11) NOT NULL,
  `Id_Utilisateur` int(11) NOT NULL,
  `Id_Utilisateur_Admin` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`Id_Commande`, `Id_Utilisateur`, `Id_Utilisateur_Admin`) VALUES
(2, 1, NULL),
(3, 1, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `posseder`
--

CREATE TABLE `posseder` (
  `Id_Article` int(11) NOT NULL,
  `Id_Commande` int(11) NOT NULL,
  `Quantite_Article` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `posseder`
--

INSERT INTO `posseder` (`Id_Article`, `Id_Commande`, `Quantite_Article`) VALUES
(1, 2, 3),
(2, 3, 4);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `Id_Utilisateur` int(11) NOT NULL,
  `Nom_Utilisateur` varchar(50) COLLATE utf8_bin NOT NULL,
  `Prenom_Utilisateur` varchar(50) COLLATE utf8_bin NOT NULL,
  `Mail_Utilisateur` varchar(50) COLLATE utf8_bin NOT NULL,
  `isAdmin` tinyint(1) DEFAULT 0,
  `Mdp_Utilisateur` varchar(50) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`Id_Utilisateur`, `Nom_Utilisateur`, `Prenom_Utilisateur`, `Mail_Utilisateur`, `isAdmin`, `Mdp_Utilisateur`) VALUES
(1, 'Frosini', 'Adrien', 'xxx', 1, '40bd001563085fc35165329ea1ff5c5ecbdbbeef'),
(2, 'Di Martino', 'Fabio', 'yyy', 0, '40bd001563085fc35165329ea1ff5c5ecbdbbeef'),
(3, 'Giroud', 'Lucas', 'giroudlucas01@gmail.com', 0, '40bd001563085fc35165329ea1ff5c5ecbdbbeef'),
(4, 'Coste', 'Gabriel', 'qqq', 0, '40bd001563085fc35165329ea1ff5c5ecbdbbeef'),
(5, 'Sangiardi', 'Sophia', 'sss', 0, '40bd001563085fc35165329ea1ff5c5ecbdbbeef');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`Id_Article`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`Id_Commande`),
  ADD KEY `Commande_Utilisateur_FK` (`Id_Utilisateur`),
  ADD KEY `Commande_Admin0_FK` (`Id_Utilisateur_Admin`);

--
-- Index pour la table `posseder`
--
ALTER TABLE `posseder`
  ADD PRIMARY KEY (`Id_Article`,`Id_Commande`),
  ADD KEY `Posseder_Commande0_FK` (`Id_Commande`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`Id_Utilisateur`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `article`
--
ALTER TABLE `article`
  MODIFY `Id_Article` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `Id_Commande` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `Id_Utilisateur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `Commande_Admin0_FK` FOREIGN KEY (`Id_Utilisateur_Admin`) REFERENCES `utilisateur` (`Id_Utilisateur`),
  ADD CONSTRAINT `Commande_Utilisateur_FK` FOREIGN KEY (`Id_Utilisateur`) REFERENCES `utilisateur` (`Id_Utilisateur`);

--
-- Contraintes pour la table `posseder`
--
ALTER TABLE `posseder`
  ADD CONSTRAINT `Posseder_Article_FK` FOREIGN KEY (`Id_Article`) REFERENCES `article` (`Id_Article`),
  ADD CONSTRAINT `Posseder_Commande0_FK` FOREIGN KEY (`Id_Commande`) REFERENCES `commande` (`Id_Commande`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
