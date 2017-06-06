-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 12, 2017 at 11:57 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `praktika`
--

-- --------------------------------------------------------

--
-- Table structure for table `kelione`
--

CREATE TABLE `kelione` (
  `KelionesID` int(11) NOT NULL,
  `KlientoID` int(11) NOT NULL,
  `Pradzia` datetime NOT NULL,
  `Pabaiga` datetime NOT NULL,
  `Kaina` double DEFAULT NULL,
  `iskaiciuota` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kelione`
--

INSERT INTO `kelione` (`KelionesID`, `KlientoID`, `Pradzia`, `Pabaiga`, `Kaina`, `iskaiciuota`) VALUES
(2, 1, '2017-04-20 00:00:00', '2017-04-23 00:00:00', NULL, 0),
(283, 17, '2017-05-14 08:09:51', '2017-05-14 08:09:51', 0, 0),
(287, 4, '2017-05-15 11:35:40', '2017-05-15 11:35:40', 0, 0),
(288, 4, '2017-05-16 11:35:40', '2017-05-16 11:35:40', 0, 0),
(289, 22, '2017-05-13 12:20:42', '2017-05-13 12:20:42', 64, 0),
(290, 3, '2017-05-16 12:23:02', '2017-05-16 12:23:02', 128, 0),
(292, 22, '2017-05-15 12:31:37', '2017-05-17 12:31:37', 324, 0);

-- --------------------------------------------------------

--
-- Table structure for table `kel_lankvietos`
--

CREATE TABLE `kel_lankvietos` (
  `ID` int(11) NOT NULL,
  `KelionesID` int(11) NOT NULL,
  `VietosID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kel_lankvietos`
--

INSERT INTO `kel_lankvietos` (`ID`, `KelionesID`, `VietosID`) VALUES
(1, 290, 5);

-- --------------------------------------------------------

--
-- Table structure for table `kel_miestas`
--

CREATE TABLE `kel_miestas` (
  `ID` int(11) NOT NULL,
  `MiestoID` int(11) NOT NULL,
  `KelionesID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kel_miestas`
--

INSERT INTO `kel_miestas` (`ID`, `MiestoID`, `KelionesID`) VALUES
(1, 22, 289),
(3, 22, 290),
(4, 23, 290),
(5, 25, 292),
(6, 38, 292),
(7, 27, 292),
(8, 26, 289);

-- --------------------------------------------------------

--
-- Table structure for table `kel_transportas`
--

CREATE TABLE `kel_transportas` (
  `ID` int(11) NOT NULL,
  `KelionesID` int(11) NOT NULL,
  `TransportoID` int(11) NOT NULL,
  `nuoMiestoID` int(11) NOT NULL,
  `ikiMiestoID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kel_transportas`
--

INSERT INTO `kel_transportas` (`ID`, `KelionesID`, `TransportoID`, `nuoMiestoID`, `ikiMiestoID`) VALUES
(1, 289, 8, 26, 22),
(3, 290, 8, 26, 22),
(4, 290, 8, 22, 23),
(5, 292, 8, 26, 25),
(6, 292, 8, 25, 38),
(7, 292, 8, 38, 27),
(8, 289, 8, 22, 26);

-- --------------------------------------------------------

--
-- Table structure for table `kel_viesbutis`
--

CREATE TABLE `kel_viesbutis` (
  `ID` int(11) NOT NULL,
  `KelionesID` int(11) NOT NULL,
  `ViesbucioID` int(11) NOT NULL,
  `nak_sk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kel_viesbutis`
--

INSERT INTO `kel_viesbutis` (`ID`, `KelionesID`, `ViesbucioID`, `nak_sk`) VALUES
(1, 292, 5, 2),
(2, 289, 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `lank_viet`
--

CREATE TABLE `lank_viet` (
  `VietosID` int(11) NOT NULL,
  `Salis` varchar(255) NOT NULL,
  `Miestas` varchar(255) DEFAULT NULL,
  `Pavadinimas` varchar(255) NOT NULL,
  `Tipas` varchar(255) DEFAULT NULL,
  `Aprasymas` varchar(255) CHARACTER SET utf8 COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `Reitingas` varchar(255) DEFAULT NULL,
  `Image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lank_viet`
--

INSERT INTO `lank_viet` (`VietosID`, `Salis`, `Miestas`, `Pavadinimas`, `Tipas`, `Aprasymas`, `Reitingas`, `Image`) VALUES
(1, 'Lietuva', 'Vilnius', 'Gedimino pilis', 'Pilis', 'Vilniaus aukštutinės pilies liekanos stūkso Vilniuje, Gedimino kalno ovalioje aikštelėje, kurios ilgis 110–120 m, plotis 50-60 m.\r\n\r\nKalno aukštis nuo papėdės yra 47-48 m. Kalno šlaitai – statūs (35\'-40\'), todėl ši pilis būdavo sunkiai įveikiama priešams.', '5', 'Gedimino-pilis-1.jpg'),
(5, 'Lietuva', 'Alytus', 'Baltosios rožes tiltas', 'Tiltas', '2013–2015 m. pastatytas pesciuju ir dviratininku tiltas Alytuje per Nemuna, jungiantis Pirmaji Alytu ir senamiescio kurortine dali su Alytaus piliakalniu, stuksanciu priešingoje upes puseje.', '4', 'Gedimino-pilis-1.jpg'),
(6, 'Lietuva', 'Druskininkai', 'Gruto parkas', 'Parkas', 'Gruto kaime netoli Druskininku esantis parkas, kuriame irengta socialistinio realizmo dvasia sukurtu tarybinio laikotarpio veikeju skulpturu ekspozicija. Atidarytas 2001 m. balandžio 1 d. Steigejas – Viliumas Malinauskas.', '5', 'Gedimino-pilis-1.jpg'),
(7, 'Lietuva', 'Kaunas', 'Pažaislio vienuolynas', 'Bažnycia', 'Pastatu ansamblis Pažaislyje, Kauno mariu šiaures-vakariniame krante, T. Masiulio g. 31 (Kaunas). Kraštovaizdžio architekturos draustinis.', '4', 'Gedimino-pilis-1.jpg'),
(8, 'Lietuva', 'Klaipeda', 'Lietuvos juru muziejus', 'Muziejus', 'Nuo 1979 metu veikiantis muziejus Kuršiu nerijos šiauriausiame taške, Kopgalyje, Smiltynes g. 3. Nuo 1994 metu veikia Delfinariumas. Muziejaus rinkiniuose saugomi 60.062 eksponatu vienetai.', '5', 'Gedimino-pilis-1.jpg'),
(9, 'Latvija', 'Ryga', 'Laisves paminklas', 'Paminklas', 'Laisves paminklas yra 42 metru aukšcio paminklas, esantis Latvijos sostineje Rygoje. Paminklas yra latviu tautos vienybes ir laisves simbolis.', '3', 'Gedimino-pilis-1.jpg'),
(10, 'Latvija', 'Ryga', 'Rygos Šv. Petro bažnycia', 'Bažnycia', 'Rygos Šv. Petro bažnycia yra aukšciausia Rygos bažnycia, gotikos stiliaus architekturos paminklas. Bažnycia pastatyta 1209 m., bokštas kelis kartus sudeges ir vel atstatytas. Šiuo metu Šv. Petro bažnycia yra Rygos Šv.', '4', 'Gedimino-pilis-1.jpg'),
(11, 'Latvija', 'Liepoja', 'Karosta Prison', 'Kalejimas', 'Liepojos karo uosto kalejimas, Karuoscio kalejimas – vienintelis turistams prieinamas karinis kalejimas Europoje, esantis Liepojoje (Latvija).', '5', 'Gedimino-pilis-1.jpg'),
(12, 'Latvija', 'Daugpilis', 'Daugpilio tvirtove', 'Pilis', 'XIX a. pradžios tvirtove Daugpilyje, Latvijos istorijos ir architekturos paminklas. Be to, tai vienintele, gerai išsilaikiusi be žymesniu pokyciu, tokio tipo tvirtove Rytu Europoje.', '4', 'Gedimino-pilis-1.jpg'),
(13, 'Latvija', 'Ryga', 'Latvijos karo muziejus', 'Muziejus', 'Nepriklausomos Latvijos valstybes egzistavimo laikais, iki 1940 metu muziejus buvo Karines ministerijos žinioje. 1919 metais muziejus isikure Porochovo bokšto Rygos tvirtoveje. Pagrindinis muziejaus tikslas buvo ekspozicijomis parodyti Latvijos žmoniu kov', '4', 'Gedimino-pilis-1.jpg'),
(14, 'Estija', 'Tartu', 'AHHAA', 'Mokslo centras', 'Centre lankytojai gali išbandyti veidrodžiu labirinta, Niutono obeli (energijos mašina), nuotykiu lifta i žemes gelmes, kuris nukelia i požeminius planetos sluoksnius, irengtame sferiniame planetariume galima stebeti milijonus žvaigždžiu. Galima pasivažin', '5', 'Gedimino-pilis-1.jpg'),
(15, 'Estija', 'Pernu', 'Somos nacionalinis parkas', 'Parkas', 'Saugoma gamtos teritorija vidurio Estijoje, Viljandžio apskrityje. Ikurtas 1993 m. ir apima 359 km² teritorija. Parke saugomi šlapyniu plotai, meandruojancios upes ir paupiu lankos, pelketi miškai. ', '5', 'Gedimino-pilis-1.jpg'),
(16, 'Estija', 'Narva', 'Hermann Castle', 'Pilis', 'Tai yra Narvos miesto pilis. Pastatyta, Danu, 14-to amžiaus pradžioje', '5', 'Gedimino-pilis-1.jpg'),
(17, 'Estija', 'Veru', 'Lake Tamula', 'Ežeras', 'Tamulo ežeras', '4', 'Gedimino-pilis-1.jpg'),
(18, 'Estija', 'Rapla', 'Heksenbron van Tuhala', 'šulinys', 'Raganos šulinys', '5', 'Gedimino-pilis-1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `miestas`
--

CREATE TABLE `miestas` (
  `MiestoID` int(11) NOT NULL,
  `Salis` varchar(255) CHARACTER SET latin1 NOT NULL,
  `Pavadinimas` varchar(255) CHARACTER SET latin1 NOT NULL,
  `Ilguma` varchar(255) COLLATE utf32_unicode_ci NOT NULL,
  `Platuma` varchar(255) COLLATE utf32_unicode_ci NOT NULL,
  `Image` varchar(255) COLLATE utf32_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Dumping data for table `miestas`
--

INSERT INTO `miestas` (`MiestoID`, `Salis`, `Pavadinimas`, `Ilguma`, `Platuma`, `Image`) VALUES
(22, 'Lietuva', 'Alytus', '24.045876', '54.3962938', ''),
(23, 'Lietuva', 'Druskininkai', '23.9759137', '54.0211428', ''),
(25, 'Lietuva', 'Kaunas', '23.903597', '54.898521', ''),
(26, 'Lietuva', 'Vilnius', '25.279651', '54.687156', ''),
(27, 'Lietuva', 'Klaipeda', '21.144279', '55.703295', ''),
(28, 'Latvija', 'Ryga', '24.105186', '56.949649', ''),
(29, 'Latvija', 'Liepoja', '21.010806', '56.504668', ''),
(30, 'Latvija', 'Jurmala', '23.616849', '56.947079', ''),
(31, 'Latvija', 'Daugpilis', '26.536179', '55.874736', ''),
(32, 'Latvija', 'Ventspilis', '21.564707', '57.393722', ''),
(33, 'Estija', 'Tartu', '26.729006', '58.377625', ''),
(34, 'Estija', 'Pernu', '24.496577', '58.385808', ''),
(35, 'Estija', 'Narva', '28.179133', '59.379680', ''),
(36, 'Estija', 'Veru', '26.998698', '57.846072', ''),
(37, 'Estija', 'Rapla', '24.794242', '59.005735', ''),
(38, 'Lietuva', 'Lentvaris', '25.04333', '54.64694', '');

-- --------------------------------------------------------

--
-- Table structure for table `transportas`
--

CREATE TABLE `transportas` (
  `TransportoID` int(11) NOT NULL,
  `TransTipas` varchar(255) NOT NULL,
  `VietuSK` varchar(255) NOT NULL,
  `Kaina` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transportas`
--

INSERT INTO `transportas` (`TransportoID`, `TransTipas`, `VietuSK`, `Kaina`) VALUES
(1, 'Autobusas', '26', 88),
(3, 'Autobusas', '30', 74),
(4, 'Autobusas', '45', 13),
(7, 'Autobusas', '36', 45),
(8, 'Autobusas', '32', 64),
(9, 'Mikroautobusas', '16', 75),
(10, 'Mikroautobusas', '16', 75),
(11, 'Mikroautobusas', '9', 95),
(12, 'Mikroautobusas', '14', 65),
(13, 'Mikroautobusas', '15', 70);

-- --------------------------------------------------------

--
-- Table structure for table `vartotojai`
--

CREATE TABLE `vartotojai` (
  `KlientoID` int(11) NOT NULL,
  `Vardas` varchar(255) NOT NULL,
  `Pavarde` varchar(255) NOT NULL,
  `Tipas` tinyint(1) NOT NULL,
  `Username` varchar(255) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vartotojai`
--

INSERT INTO `vartotojai` (`KlientoID`, `Vardas`, `Pavarde`, `Tipas`, `Username`, `Password`) VALUES
(1, 'admin', 'admin', 1, 'admin', 'admin'),
(3, 'Laurynas', 'Laurinavicius', 0, 'Laulau', '456'),
(4, 'Marius', 'Marinavicius', 0, 'Marmar', '654'),
(5, 'Dzukas', 'Zemaitis', 0, 'Dzuzem', '789'),
(16, 'Paulius', 'Aidietis', 1, 'PauliusAi', 'zxc'),
(17, 'Daniel', 'Barkovski', 0, 'Barka', 'barka'),
(18, 'Daniel', 'Zeimo', 0, 'DanielZ', 'dz'),
(19, 'Lukas', 'Velecka', 0, 'LukasV', 'lv'),
(20, 'Simonas', 'Krušinskas', 0, 'SimKru', 'sk'),
(21, 'Paulius', 'Paulauskas', 0, 'PaulPaul', 'pp'),
(22, 'asas', 'basas', 0, 'asas', 'asas'),
(23, 'demo', 'demo', 1, 'demo', 'demo');

-- --------------------------------------------------------

--
-- Table structure for table `viesbutis`
--

CREATE TABLE `viesbutis` (
  `ViesbucioID` int(11) NOT NULL,
  `Miestas` varchar(255) NOT NULL,
  `Salis` varchar(255) NOT NULL,
  `Adresas` varchar(255) NOT NULL,
  `Pavadinimas` varchar(255) NOT NULL,
  `Kaina` double DEFAULT NULL,
  `Kaina_su_maistu` double NOT NULL,
  `Image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `viesbutis`
--

INSERT INTO `viesbutis` (`ViesbucioID`, `Miestas`, `Salis`, `Adresas`, `Pavadinimas`, `Kaina`, `Kaina_su_maistu`, `Image`) VALUES
(4, 'Vilnius', 'Lietuva', 'Švitrigailos g. 11D', 'Vilnius City Hotel', 44, 66, ''),
(5, 'Kaunas', 'Lietuva', 'Vytauto pr. 25', 'Magnus Hotel', 66, 79, ''),
(6, 'Alytus', 'Lietuva', 'Naujoji g. 8c', 'Hotel Ode', 46, 56, ''),
(7, 'Klaipeda', 'Lietuva', 'Naujojo Sodo g. 1C', 'Amberton Klaipeda', 50, 65, ''),
(8, 'Druskininkai', 'Lietuva', 'Vilniaus Ave. 7', 'Europa Royale Druskininkai, Europa Group', 70, 80, ''),
(9, 'Ryga', 'Latvija', 'Krišjana Barona iela 12', 'Europa Royale Riga', 62, 70, ''),
(10, 'Liepoja', 'Latvija', 'Kuršu iela 32', 'Hotel Kolumbs', 45, 59, ''),
(11, 'Jurmala', 'Latvija', 'Kemeru nacionalais parks', 'Melnais Starkis', 30, 45, ''),
(12, 'Daugpilis', 'Latvija', 'Mihoelsa iela 66', 'HomeLike Hotel', 65, 79, ''),
(13, 'Ventspilis', 'Latvija', 'Karla iela 5', 'Kupfernams', 56, 66, ''),
(14, 'Tartu', 'Estija', 'Soola 3', 'Hotel Tartu', 73, 86, ''),
(15, 'Pernu', 'Estija', 'A. H. Tammsaare puiestee 4A, Pärnu', 'ESTONIA Resort Hotel & Spa 4*', 94, 109, ''),
(16, 'Narva', 'Estija', 'Aia 3', 'Narva-Jõesuu SPA & Sanatoorium', 95, 100, ''),
(17, 'Veru', 'Estija', 'Juri 36', 'Ränduri Guesthouse', 75, 86, ''),
(18, 'Rapla', 'Estija', 'Pajaka küla, Märjamaa vald, Raplamaa, Nõmmealuse', 'Ruunawere Postimõis Hotell', 44, 57, '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kelione`
--
ALTER TABLE `kelione`
  ADD PRIMARY KEY (`KelionesID`,`KlientoID`),
  ADD UNIQUE KEY `UK_kelione_KelionesID` (`KelionesID`),
  ADD KEY `FK_kelione_klientas_KlientoID` (`KlientoID`);

--
-- Indexes for table `kel_lankvietos`
--
ALTER TABLE `kel_lankvietos`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `VietosID` (`VietosID`),
  ADD KEY `KelionesID` (`KelionesID`);

--
-- Indexes for table `kel_miestas`
--
ALTER TABLE `kel_miestas`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `MiestoID` (`MiestoID`),
  ADD KEY `KelionesID` (`KelionesID`);

--
-- Indexes for table `kel_transportas`
--
ALTER TABLE `kel_transportas`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `TransportoID` (`TransportoID`),
  ADD KEY `KelionesID` (`KelionesID`);

--
-- Indexes for table `kel_viesbutis`
--
ALTER TABLE `kel_viesbutis`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ViesbucioID` (`ViesbucioID`),
  ADD KEY `KelionesID` (`KelionesID`);

--
-- Indexes for table `lank_viet`
--
ALTER TABLE `lank_viet`
  ADD PRIMARY KEY (`VietosID`);

--
-- Indexes for table `miestas`
--
ALTER TABLE `miestas`
  ADD PRIMARY KEY (`MiestoID`);

--
-- Indexes for table `transportas`
--
ALTER TABLE `transportas`
  ADD PRIMARY KEY (`TransportoID`);

--
-- Indexes for table `vartotojai`
--
ALTER TABLE `vartotojai`
  ADD PRIMARY KEY (`KlientoID`);

--
-- Indexes for table `viesbutis`
--
ALTER TABLE `viesbutis`
  ADD PRIMARY KEY (`ViesbucioID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kelione`
--
ALTER TABLE `kelione`
  MODIFY `KelionesID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=293;
--
-- AUTO_INCREMENT for table `kel_lankvietos`
--
ALTER TABLE `kel_lankvietos`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `kel_miestas`
--
ALTER TABLE `kel_miestas`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `kel_transportas`
--
ALTER TABLE `kel_transportas`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `kel_viesbutis`
--
ALTER TABLE `kel_viesbutis`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `lank_viet`
--
ALTER TABLE `lank_viet`
  MODIFY `VietosID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `miestas`
--
ALTER TABLE `miestas`
  MODIFY `MiestoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT for table `transportas`
--
ALTER TABLE `transportas`
  MODIFY `TransportoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `vartotojai`
--
ALTER TABLE `vartotojai`
  MODIFY `KlientoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `viesbutis`
--
ALTER TABLE `viesbutis`
  MODIFY `ViesbucioID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `kelione`
--
ALTER TABLE `kelione`
  ADD CONSTRAINT `FK_kelione_klientas_KlientoID` FOREIGN KEY (`KlientoID`) REFERENCES `vartotojai` (`KlientoID`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `kel_lankvietos`
--
ALTER TABLE `kel_lankvietos`
  ADD CONSTRAINT `kel_lankvietos_ibfk_2` FOREIGN KEY (`VietosID`) REFERENCES `lank_viet` (`VietosID`) ON DELETE CASCADE,
  ADD CONSTRAINT `kel_lankvietos_ibfk_3` FOREIGN KEY (`KelionesID`) REFERENCES `kelione` (`KelionesID`) ON DELETE CASCADE;

--
-- Constraints for table `kel_miestas`
--
ALTER TABLE `kel_miestas`
  ADD CONSTRAINT `kel_miestas_ibfk_2` FOREIGN KEY (`MiestoID`) REFERENCES `miestas` (`MiestoID`) ON DELETE CASCADE,
  ADD CONSTRAINT `kel_miestas_ibfk_3` FOREIGN KEY (`KelionesID`) REFERENCES `kelione` (`KelionesID`) ON DELETE CASCADE;

--
-- Constraints for table `kel_transportas`
--
ALTER TABLE `kel_transportas`
  ADD CONSTRAINT `kel_transportas_ibfk_2` FOREIGN KEY (`TransportoID`) REFERENCES `transportas` (`TransportoID`) ON DELETE CASCADE,
  ADD CONSTRAINT `kel_transportas_ibfk_3` FOREIGN KEY (`KelionesID`) REFERENCES `kelione` (`KelionesID`) ON DELETE CASCADE;

--
-- Constraints for table `kel_viesbutis`
--
ALTER TABLE `kel_viesbutis`
  ADD CONSTRAINT `kel_viesbutis_ibfk_2` FOREIGN KEY (`ViesbucioID`) REFERENCES `viesbutis` (`ViesbucioID`) ON DELETE CASCADE,
  ADD CONSTRAINT `kel_viesbutis_ibfk_3` FOREIGN KEY (`KelionesID`) REFERENCES `kelione` (`KelionesID`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
