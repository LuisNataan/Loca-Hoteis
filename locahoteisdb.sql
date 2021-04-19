-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 19-Abr-2021 às 22:11
-- Versão do servidor: 10.4.17-MariaDB
-- versão do PHP: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `locahoteisdb`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cidade`
--

CREATE TABLE `cidade` (
  `id_cidade` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cep` varchar(8) NOT NULL,
  `regiao` smallint(5) UNSIGNED NOT NULL,
  `id_estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cidade`
--

INSERT INTO `cidade` (`id_cidade`, `nome`, `cep`, `regiao`, `id_estado`) VALUES
(16, 'Blumenau', '89036000', 1, 1),
(17, 'Pomerode', '12365248', 1, 1),
(18, 'Caçador', '33665478', 2, 1),
(19, 'Florianópolis', '11548795', 3, 1),
(20, 'Urubici', '55698742', 4, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `comodidades`
--

CREATE TABLE `comodidades` (
  `id_comodidade` int(11) NOT NULL,
  `academia` tinyint(1) NOT NULL,
  `piscina` tinyint(1) NOT NULL,
  `refeicao` tinyint(1) NOT NULL,
  `id_hotel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `comodidades`
--

INSERT INTO `comodidades` (`id_comodidade`, `academia`, `piscina`, `refeicao`, `id_hotel`) VALUES
(1, 1, 1, 1, 1),
(2, 0, 1, 1, 2),
(3, 1, 1, 1, 3),
(4, 0, 0, 1, 4),
(5, 0, 0, 1, 5),
(6, 0, 0, 0, 6),
(7, 1, 1, 1, 7),
(8, 0, 0, 0, 8),
(9, 0, 0, 1, 9),
(10, 1, 0, 1, 10),
(11, 1, 1, 0, 11),
(12, 0, 1, 1, 12),
(13, 0, 0, 1, 13),
(14, 1, 1, 1, 14),
(15, 1, 0, 1, 15),
(16, 0, 0, 1, 16),
(17, 0, 0, 1, 17);

-- --------------------------------------------------------

--
-- Estrutura da tabela `estado`
--

CREATE TABLE `estado` (
  `id_estado` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `estado`
--

INSERT INTO `estado` (`id_estado`, `nome`) VALUES
(1, 'Santa catarina');

-- --------------------------------------------------------

--
-- Estrutura da tabela `hotel`
--

CREATE TABLE `hotel` (
  `id_hotel` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `classificacao` smallint(5) UNSIGNED NOT NULL,
  `preco_quarto` float NOT NULL,
  `id_cidade` int(11) NOT NULL,
  `vagas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `hotel`
--

INSERT INTO `hotel` (`id_hotel`, `nome`, `classificacao`, `preco_quarto`, `id_cidade`, `vagas`) VALUES
(1, 'Ibis Budget Blumenau', 2, 133, 16, 60),
(2, 'Hotel Glória', 3, 192, 16, 120),
(3, 'Quality Hotel Blumenau', 4, 278, 16, 45),
(4, 'Hotel Hermann', 1, 129, 16, 20),
(5, 'Hotel Blumenhof', 3, 320, 16, 0),
(6, 'Pousada Blauberg', 2, 80, 17, 18),
(7, 'LENA ROSA Premium Hote', 5, 232, 17, 45),
(8, 'Hostel Dina & Suítes', 2, 65, 17, 6),
(9, 'Hotel Kindermann', 3, 270, 18, 80),
(10, 'Alcacer Hotel', 3, 230, 18, 80),
(11, 'Hotel Majestic Palace Hotel', 5, 520, 19, 300),
(12, 'Hotel Oscar', 3, 133, 19, 80),
(13, 'Rede Andrade Cecomtur', 3, 117, 19, 90),
(14, 'Parada Beach Apart Hotel', 4, 225, 19, 96),
(15, 'Pousada Fazenda da Invernada', 3, 230, 20, 25),
(16, 'Pousada Annalu', 3, 300, 20, 14),
(17, 'Pousada Arco Íris', 3, 350, 20, 18);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cidade`
--
ALTER TABLE `cidade`
  ADD PRIMARY KEY (`id_cidade`),
  ADD KEY `cidade_FK` (`id_estado`);

--
-- Índices para tabela `comodidades`
--
ALTER TABLE `comodidades`
  ADD PRIMARY KEY (`id_comodidade`),
  ADD KEY `comodidades_FK` (`id_hotel`);

--
-- Índices para tabela `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id_estado`);

--
-- Índices para tabela `hotel`
--
ALTER TABLE `hotel`
  ADD PRIMARY KEY (`id_hotel`),
  ADD KEY `hotel_FK` (`id_cidade`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cidade`
--
ALTER TABLE `cidade`
  MODIFY `id_cidade` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `comodidades`
--
ALTER TABLE `comodidades`
  MODIFY `id_comodidade` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de tabela `estado`
--
ALTER TABLE `estado`
  MODIFY `id_estado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `hotel`
--
ALTER TABLE `hotel`
  MODIFY `id_hotel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `cidade`
--
ALTER TABLE `cidade`
  ADD CONSTRAINT `cidade_FK` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id_estado`);

--
-- Limitadores para a tabela `comodidades`
--
ALTER TABLE `comodidades`
  ADD CONSTRAINT `comodidades_FK` FOREIGN KEY (`id_hotel`) REFERENCES `hotel` (`id_hotel`);

--
-- Limitadores para a tabela `hotel`
--
ALTER TABLE `hotel`
  ADD CONSTRAINT `hotel_FK` FOREIGN KEY (`id_cidade`) REFERENCES `cidade` (`id_cidade`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
