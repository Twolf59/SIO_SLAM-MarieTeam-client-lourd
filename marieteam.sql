-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 31 mai 2021 à 16:49
-- Version du serveur :  5.7.31
-- Version de PHP : 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `marieteam`
--

-- --------------------------------------------------------

--
-- Structure de la table `associer`
--

DROP TABLE IF EXISTS `associer`;
CREATE TABLE IF NOT EXISTS `associer` (
  `idReservation` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idType` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombrePlaces` int(11) DEFAULT NULL,
  PRIMARY KEY (`idReservation`,`idType`),
  KEY `idType` (`idType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `associer`
--

INSERT INTO `associer` (`idReservation`, `idType`, `nombrePlaces`) VALUES
('1', 'A1', 5),
('1', 'B2', 1),
('10', 'A1', 2),
('11', 'A1', 2),
('11', 'A2', 1),
('12', 'A1', 1),
('12', 'A2', 2),
('13', 'A1', 1),
('14', 'A1', 2),
('14', 'A2', 1),
('15', 'A1', 2),
('16', 'A1', 2),
('17', 'A1', 2),
('18', 'A1', 2),
('18', 'B1', 1),
('20', 'A1', 2),
('22', 'A1', 2),
('3', 'A1', 5),
('3', 'B2', 1),
('4', 'A1', 5),
('4', 'B2', 1),
('5', 'A1', 1),
('5', 'A2', 1),
('6', 'A1', 1),
('6', 'A2', 1),
('7', 'A1', 1),
('7', 'A2', 1),
('8', 'A1', 1),
('8', 'A2', 1),
('9', 'A1', 1),
('9', 'A2', 1);

-- --------------------------------------------------------

--
-- Structure de la table `avoir`
--

DROP TABLE IF EXISTS `avoir`;
CREATE TABLE IF NOT EXISTS `avoir` (
  `idBateau` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idEquipement` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`idBateau`,`idEquipement`),
  KEY `idEquipement` (`idEquipement`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `avoir`
--

INSERT INTO `avoir` (`idBateau`, `idEquipement`) VALUES
('2', '2');

-- --------------------------------------------------------

--
-- Structure de la table `bateau`
--

DROP TABLE IF EXISTS `bateau`;
CREATE TABLE IF NOT EXISTS `bateau` (
  `idBateau` int(10) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `largeur` double DEFAULT NULL,
  `longueur` double DEFAULT NULL,
  PRIMARY KEY (`idBateau`),
  KEY `FOREIGN` (`idBateau`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `bateau`
--

INSERT INTO `bateau` (`idBateau`, `nom`, `largeur`, `longueur`) VALUES
(1, 'TitanicusII', 456, 654),
(2, 'Posologie', 500, 750),
(3, 'Le Tituan', 180, 200),
(4, 'Conquerant', 150, 190);

-- --------------------------------------------------------

--
-- Structure de la table `bateaufret`
--

DROP TABLE IF EXISTS `bateaufret`;
CREATE TABLE IF NOT EXISTS `bateaufret` (
  `idBateau` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `poidChargeMax` int(11) DEFAULT NULL,
  `volumeMax` double DEFAULT NULL,
  PRIMARY KEY (`idBateau`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `bateauvoyageur`
--

DROP TABLE IF EXISTS `bateauvoyageur`;
CREATE TABLE IF NOT EXISTS `bateauvoyageur` (
  `idBateau` int(10) NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vitesse` int(11) DEFAULT NULL,
  PRIMARY KEY (`idBateau`),
  KEY `FOREIGN` (`idBateau`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `bateauvoyageur`
--

INSERT INTO `bateauvoyageur` (`idBateau`, `image`, `vitesse`) VALUES
(1, 'images/titanicus2.jpg', 150),
(2, 'images/posologie.jpg', 100),
(3, 'images/Letituan.jpg', 120),
(4, 'images/conquerant.jpg', 100);

-- --------------------------------------------------------

--
-- Structure de la table `capacite`
--

DROP TABLE IF EXISTS `capacite`;
CREATE TABLE IF NOT EXISTS `capacite` (
  `idBateau` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idCat` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `places` int(11) DEFAULT NULL,
  PRIMARY KEY (`idBateau`,`idCat`),
  KEY `idCat` (`idCat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
CREATE TABLE IF NOT EXISTS `categorie` (
  `idCat` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `libelle` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`idCat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `equipement`
--

DROP TABLE IF EXISTS `equipement`;
CREATE TABLE IF NOT EXISTS `equipement` (
  `idEquipement` int(10) NOT NULL AUTO_INCREMENT,
  `idbateau` int(10) NOT NULL,
  `libelle` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`idEquipement`),
  KEY `FK_ID` (`idbateau`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `equipement`
--

INSERT INTO `equipement` (`idEquipement`, `idbateau`, `libelle`, `description`) VALUES
(1, 1, 'bouées x 6', 'test'),
(2, 1, 'extincteurs x 5', NULL),
(3, 2, 'gilets de sauvetage x 50', NULL),
(4, 2, 'bouées x 6', NULL),
(5, 2, 'extincteurs x 3', NULL),
(6, 3, 'bouées x 10', NULL),
(7, 3, 'extincteurs x 10', NULL),
(8, 3, 'distributeur boissons x 3', NULL),
(9, 3, 'gilets de sauvetage x 100', NULL),
(10, 4, 'extincteurs x 5', NULL),
(11, 4, 'bouées x 6', NULL),
(12, 4, 'gilets de sauvetage x 20', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `liaison`
--

DROP TABLE IF EXISTS `liaison`;
CREATE TABLE IF NOT EXISTS `liaison` (
  `idLiaison` int(10) NOT NULL AUTO_INCREMENT,
  `distanceMileMarin` double DEFAULT NULL,
  `portDepart` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `portArrive` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `idSecteur` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`idLiaison`),
  KEY `idSecteur` (`idSecteur`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `liaison`
--

INSERT INTO `liaison` (`idLiaison`, `distanceMileMarin`, `portDepart`, `portArrive`, `idSecteur`) VALUES
(1, 159, 'douaix', 'Lille', '1'),
(2, 45, 'Paris', 'Lyon', '2'),
(3, 456, 'Paris', 'New York', '2'),
(4, 1200, 'Dunkerque', 'St-Petersbourg', '3'),
(5, 500, 'Dunkerque', 'Marseille', '3');

-- --------------------------------------------------------

--
-- Structure de la table `periode`
--

DROP TABLE IF EXISTS `periode`;
CREATE TABLE IF NOT EXISTS `periode` (
  `idPeriode` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DebutPeriode` date DEFAULT NULL,
  `FinPeriode` date DEFAULT NULL,
  PRIMARY KEY (`idPeriode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `periode`
--

INSERT INTO `periode` (`idPeriode`, `DebutPeriode`, `FinPeriode`) VALUES
('2020Dec', '2020-12-01', '2020-12-31'),
('2020Nov', '2020-11-01', '2020-11-30'),
('2021jan', '2021-01-01', '2021-03-30'),
('Mai2021', '2021-05-01', '2021-06-30');

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
CREATE TABLE IF NOT EXISTS `reservation` (
  `idReservation` int(10) NOT NULL AUTO_INCREMENT,
  `dateReservation` datetime DEFAULT NULL,
  `prixTotal` decimal(10,0) NOT NULL,
  `idUtilisateur` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idTraverse` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`idReservation`),
  KEY `idUtilisasteur` (`idUtilisateur`),
  KEY `idTraverse` (`idTraverse`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `reservation`
--

INSERT INTO `reservation` (`idReservation`, `dateReservation`, `prixTotal`, `idUtilisateur`, `idTraverse`) VALUES
(7, '2020-12-29 14:54:00', '200', '2', '1'),
(8, '2020-12-29 14:55:00', '200', '2', '1'),
(9, '2020-12-29 14:56:00', '200', '2', '1'),
(10, '2020-12-30 14:50:00', '50', '1', '6'),
(11, '2020-12-30 16:25:00', '90', '1', '6'),
(12, '2021-03-08 12:49:00', '25', '11', '6'),
(13, '2021-03-08 13:05:00', '25', '11', '6'),
(14, '2021-03-29 12:30:00', '25', '11', '6'),
(15, '2021-03-29 12:31:00', '25', '11', '6'),
(16, '2021-05-04 22:54:00', '37', '11', '6'),
(17, '2021-05-26 23:38:00', '25', '2', '6'),
(18, '2021-05-27 00:36:00', '250', '2', '9');

-- --------------------------------------------------------

--
-- Structure de la table `secteur`
--

DROP TABLE IF EXISTS `secteur`;
CREATE TABLE IF NOT EXISTS `secteur` (
  `idSecteur` int(10) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`idSecteur`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `secteur`
--

INSERT INTO `secteur` (`idSecteur`, `nom`) VALUES
(1, 'Poitoux-Charente'),
(2, 'Seine-St-Denis'),
(3, 'Nord');

-- --------------------------------------------------------

--
-- Structure de la table `tarif`
--

DROP TABLE IF EXISTS `tarif`;
CREATE TABLE IF NOT EXISTS `tarif` (
  `idLiaison` int(10) NOT NULL,
  `idPeriode` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idType` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prixUnite` double DEFAULT NULL,
  PRIMARY KEY (`idLiaison`,`idPeriode`,`idType`),
  KEY `idPeriode` (`idPeriode`),
  KEY `idType` (`idType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `tarif`
--

INSERT INTO `tarif` (`idLiaison`, `idPeriode`, `idType`, `prixUnite`) VALUES
(1, '2020Dec', 'A1', 30),
(1, '2020Dec', 'A2', 25),
(1, '2020Dec', 'A3', 20),
(1, '2020Dec', 'B1', 120),
(1, '2020Dec', 'B2', 80),
(1, '2020Nov', 'A1', 25),
(1, '2020Nov', 'A2', 20),
(1, '2020Nov', 'A3', 15),
(1, '2020Nov', 'B1', 80),
(1, '2020Nov', 'B2', 50),
(2, '2020Dec', 'A1', 56),
(2, '2020Dec', 'A2', 50),
(2, '2020Dec', 'A3', 46),
(2, '2020Dec', 'B1', 106),
(2, '2020Dec', 'B2', 83),
(2, '2020Nov', 'A1', 33),
(2, '2020Nov', 'A2', 30),
(2, '2020Nov', 'A3', 27),
(2, '2020Nov', 'B1', 60),
(2, '2020Nov', 'B2', 50),
(2, '2021jan', 'A1', 25),
(2, '2021jan', 'A2', 40),
(2, '2021jan', 'A3', 60),
(2, '2021jan', 'B1', 120),
(2, '2021jan', 'B2', 180),
(3, '2020Dec', 'A1', 40),
(3, '2020Dec', 'A2', 30),
(3, '2020Dec', 'A3', 20),
(3, '2020Dec', 'B1', 170),
(3, '2020Dec', 'B2', 130),
(4, 'Mai2021', 'A1', 35),
(4, 'Mai2021', 'A2', 20),
(4, 'Mai2021', 'A3', 15),
(4, 'Mai2021', 'B1', 150),
(4, 'Mai2021', 'B2', 190),
(5, 'Mai2021', 'A1', 50),
(5, 'Mai2021', 'A2', 30),
(5, 'Mai2021', 'A3', 25),
(5, 'Mai2021', 'B1', 200),
(5, 'Mai2021', 'B2', 180);

-- --------------------------------------------------------

--
-- Structure de la table `traverse`
--

DROP TABLE IF EXISTS `traverse`;
CREATE TABLE IF NOT EXISTS `traverse` (
  `idTraverse` int(10) NOT NULL AUTO_INCREMENT,
  `dateDepart` date DEFAULT NULL,
  `heureDepart` time DEFAULT NULL,
  `duree` double DEFAULT NULL,
  `idLiaison` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idBateau` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idPeriode` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`idTraverse`),
  KEY `idLiaison` (`idLiaison`),
  KEY `idBateau` (`idBateau`),
  KEY `FK_idPeriode` (`idPeriode`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `traverse`
--

INSERT INTO `traverse` (`idTraverse`, `dateDepart`, `heureDepart`, `duree`, `idLiaison`, `idBateau`, `idPeriode`) VALUES
(1, '2020-11-11', '09:41:00', 320, '1', '1', '2020Nov'),
(2, '2020-12-24', '16:06:00', 300, '1', '1', '2020Dec'),
(3, '2020-11-11', '05:55:00', 650, '2', '2', '2020Nov'),
(4, '2020-12-24', '22:18:00', 256, '3', '2', '2020Dec'),
(6, '2021-03-22', '16:46:00', 360, '2', '1', '2021jan'),
(7, '2021-05-01', '14:46:05', 300, '4', '2', 'Mai2021'),
(8, '2021-05-22', '10:56:11', 400, '4', '1', 'Mai2021'),
(9, '2021-05-01', '10:56:11', 350, '5', '1', 'Mai2021');

-- --------------------------------------------------------

--
-- Structure de la table `type`
--

DROP TABLE IF EXISTS `type`;
CREATE TABLE IF NOT EXISTS `type` (
  `idType` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `libelle` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `idCat` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`idType`),
  KEY `idCat` (`idCat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `typeplace`
--

DROP TABLE IF EXISTS `typeplace`;
CREATE TABLE IF NOT EXISTS `typeplace` (
  `idType` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `libelle` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idCat` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`idType`),
  KEY `fk_idCat` (`idCat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `typeplace`
--

INSERT INTO `typeplace` (`idType`, `libelle`, `idCat`) VALUES
('A1', 'Adulte', 'A'),
('A2', 'Junior', 'A'),
('A3', 'Enfant', 'A'),
('B1', 'Véhicule supérieur à 2 mètres', 'B'),
('B2', 'Véhicule inférieur à 2 mètres', 'B');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `idUtilisateur` int(10) NOT NULL AUTO_INCREMENT,
  `estAdmin` tinyint(1) DEFAULT NULL,
  `nom` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prenom` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mot_de_passe` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nbPoint` int(11) DEFAULT '0',
  PRIMARY KEY (`idUtilisateur`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`idUtilisateur`, `estAdmin`, `nom`, `prenom`, `email`, `mot_de_passe`, `nbPoint`) VALUES
(1, 0, 'paul', 'dupont', 'dupont@paul.com', '81dc9bdb52d04dc20036dbd8313ed055', 50),
(2, 1, 'admin', 'default', 'admin@default.com', '21232f297a57a5a743894a0e4a801fc3', 50),
(7, 0, 'theo ', 'blampain', 'theo@imgod.com', '4b3836aecd3e9c8caf6379ac0f74e54f', 0),
(11, 0, 'test', 'test', 'test@test.com', '098f6bcd4621d373cade4e832627b4f6', 0),
(13, 0, 'desreumaux', 'thomas', 'tomdsx@mail.fr', 'dba90500a23cbc4deca1e3896c203129', 0);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `bateauvoyageur`
--
ALTER TABLE `bateauvoyageur`
  ADD CONSTRAINT `bateauvoyageur_ibfk_1` FOREIGN KEY (`idBateau`) REFERENCES `bateau` (`idBateau`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
