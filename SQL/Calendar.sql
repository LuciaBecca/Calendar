-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Creato il: Apr 05, 2023 alle 13:45
-- Versione del server: 10.4.27-MariaDB
-- Versione PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Calendar`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `attività`
--

CREATE TABLE `attività` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `dataInizio` date NOT NULL,
  `dataFine` date NOT NULL,
  `descrizione` varchar(255) NOT NULL,
  `categoria` varchar(100) NOT NULL,
  `priorità` varchar(100) NOT NULL,
  `scadenza` varchar(100) NOT NULL,
  `colore` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `categorie`
--

CREATE TABLE `categorie` (
  `id` varchar(100) NOT NULL,
  `Nome` varchar(255) NOT NULL,
  `Descrizione` varchar(255) NOT NULL,
  `Colore` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `priorità`
--

CREATE TABLE `priorità` (
  `id` varchar(100) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `simbolo` varchar(255) NOT NULL,
  `colore` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `scadenze`
--

CREATE TABLE `scadenze` (
  `id` varchar(100) NOT NULL,
  `nome` varchar(200) NOT NULL,
  `descrizione` varchar(255) NOT NULL,
  `data` date NOT NULL,
  `Colore` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `utente`
--

CREATE TABLE `utente` (
  `email` varchar(255) NOT NULL,
  `nomeUtente` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `attività`
--
ALTER TABLE `attività`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoria` (`categoria`),
  ADD KEY `priorità` (`priorità`),
  ADD KEY `scadenza` (`scadenza`);

--
-- Indici per le tabelle `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `priorità`
--
ALTER TABLE `priorità`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `scadenze`
--
ALTER TABLE `scadenze`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `utente`
--
ALTER TABLE `utente`
  ADD PRIMARY KEY (`email`);

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `attività`
--
ALTER TABLE `attività`
  ADD CONSTRAINT `attività_ibfk_1` FOREIGN KEY (`categoria`) REFERENCES `categorie` (`id`),
  ADD CONSTRAINT `attività_ibfk_2` FOREIGN KEY (`priorità`) REFERENCES `priorità` (`id`),
  ADD CONSTRAINT `attività_ibfk_3` FOREIGN KEY (`scadenza`) REFERENCES `scadenze` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
