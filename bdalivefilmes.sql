DROP DATABASE IF EXISTS bdalivefilmes;
CREATE DATABASE bdalivefilmes;
USE bdalivefilmes;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 14/09/2025 às 20:36
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bdalivefilmes`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_alimento`
--

CREATE TABLE `tb_alimento` (
  `id_alimento` int(11) NOT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `nome_alimento` varchar(70) DEFAULT NULL,
  `desc_alimento` varchar(170) DEFAULT NULL,
  `valor_alimento` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_alimento_ingresso`
--

CREATE TABLE `tb_alimento_ingresso` (
  `id_alimento_ingresso` int(11) NOT NULL,
  `cod_ingresso` char(7) DEFAULT NULL,
  `id_alimento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_assento`
--

CREATE TABLE `tb_assento` (
  `id_assento` int(11) NOT NULL,
  `cod_assento` char(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_caracteristica`
--

CREATE TABLE `tb_caracteristica` (
  `id_caracteristica` int(11) NOT NULL,
  `nome_caracteristica` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_caracteristica_assento_ingresso`
--

CREATE TABLE `tb_caracteristica_assento_ingresso` (
  `id_caracteristica_assento_ingresso` int(11) NOT NULL,
  `id_assento` int(11) DEFAULT NULL,
  `id_caracteristica` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_cliente`
--

CREATE TABLE `tb_cliente` (
  `id_cliente` int(11) NOT NULL,
  `nome_cliente` varchar(70) DEFAULT NULL,
  `cpf_cliente` char(11) DEFAULT NULL,
  `senha_cliente` varchar(200) DEFAULT NULL,
  `data_nasc_cliente` date DEFAULT NULL,
  `logradouro_cliente` varchar(100) DEFAULT NULL,
  `complemento_cliente` varchar(40) DEFAULT NULL,
  `cep_cliente` char(8) DEFAULT NULL,
  `bairro_cliente` varchar(60) DEFAULT NULL,
  `cidade_cliente` varchar(60) DEFAULT NULL,
  `estado_cliente` varchar(30) DEFAULT NULL,
  `pais_cliente` varchar(60) DEFAULT NULL,
  `data_criacao_conta_cliente` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_cliente`
--
/*
INSERT INTO `tb_cliente` (`id_cliente`, `nome_cliente`, `cpf_cliente`, `senha_cliente`, `data_nasc_cliente`, `logradouro_cliente`, `complemento_cliente`, `cep_cliente`, `bairro_cliente`, `cidade_cliente`, `estado_cliente`, `pais_cliente`, `data_criacao_conta_cliente`) VALUES
(1, 'PEDRO MANGA DA SILVA', NULL, '$2y$10$6ZU7fLo95rR.QOI42w/nzeoXFNmzy6hu.8uMRTZgQ0UOV6o9FzNsu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'JOAO VICTOR SANTOS', NULL, '$2y$10$yrHdZFyzMXSufa7XQ.f7/ucmN.QADjaff9Z/8Y6juuyZCeNC.90au', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'BEATRIZ MANGA DA SANTOS', NULL, '$2y$10$rijIE1jV7nH4Mh7rxgJQxObM7IOleyAYkdtr18UHywq4ajfI.apwC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'RONALDO', NULL, '$2y$10$LmduKWgE3rUsKTo5WPCbcO.Qb10Y.Y2I.cIUiDK5OAb41eeu7Oaqa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'MONOCELHA DA SILVA', NULL, '$2y$10$f2Pl5AzjPUO7xtxSMar.GupWYjTxV1edW94IVMStzJTVsZPzNWYsm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'GLUB GLUB', NULL, '$2y$10$203DE4HrXNNTLeUMDGXPneM3Y6jy.msI71WfLq6FJEUhOomqISyn2', NULL, 'Rua Bento Soares Mota', NULL, '08412180', 'Jardim São Paulo(Zona Leste)', 'São Paulo', 'SP', NULL, NULL),
(7, 'WALTER HARTWELL WHITE', NULL, '$2y$10$uG.KbtZlrr.xjjRxHtfXF.aJvj8DxvJb7ZZ6j7/evBXgHlKYiubFa', NULL, 'Rua João Franco', NULL, '12906000', 'Jardim São Cristóvão', 'Bragança Paulista', 'SP', NULL, '2025-09-14 13:48:09'),
(8, 'TYLER JOSEPH', NULL, '$2y$10$wbwmtH2hfr/ZnLbuCdq8Be81yRw1ztv6k6M.7YK11KytmqaD56/1C', NULL, 'Rua Bento Soares Mota', NULL, '08412180', 'Jardim São Paulo(Zona Leste)', 'São Paulo', 'SP', NULL, '2025-09-14 14:27:05'),
(9, 'JOSH DUN', NULL, '$2y$10$XZHMEjVdL4CsOFvgCA/B7.CziloKODlTBpbiJgB36AO0bJSTJXjJ2', NULL, 'Rua Bento Soares Mota', NULL, '08412180', 'Jardim São Paulo(Zona Leste)', 'São Paulo', 'SP', NULL, '2025-09-14 14:29:16'),
(10, 'TESTE TESTE DA SILVA', NULL, '$2y$10$.dNN2A/2LOKT3/UhrAWa2eXUcspsqsS09Wp5OLwgVCd6LebDiFS3q', NULL, '', NULL, '', '', '', '', NULL, '2025-09-14 15:32:44'),
(11, 'OUTRO TESTE SANTOS', NULL, '$2y$10$1ueGOAMRSYF88CImSb8fx.dzVmfzoPs7S5fdz9OfLoJAU1Uq6GN36', NULL, 'Rua Bento Soares Mota', NULL, '08412180', 'Jardim São Paulo(Zona Leste)', 'São Paulo', 'SP', NULL, '2025-09-14 15:34:08');
*/
-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_desconto`
--

CREATE TABLE `tb_desconto` (
  `id_desconto` int(11) NOT NULL,
  `nome_desconto` varchar(45) DEFAULT NULL,
  `porcentagem_desconto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_desconto_ingresso`
--

CREATE TABLE `tb_desconto_ingresso` (
  `id_desconto_ingresso` int(11) NOT NULL,
  `cod_ingresso` char(7) DEFAULT NULL,
  `id_desconto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_direcao_filme`
--

CREATE TABLE `tb_direcao_filme` (
  `id_filme` int(11) DEFAULT NULL,
  `nome_diretor_filme` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_distribuidora`
--

CREATE TABLE `tb_distribuidora` (
  `id_distribuidora` int(11) NOT NULL,
  `nome_distribuidora` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_distribuidora_filme`
--

CREATE TABLE `tb_distribuidora_filme` (
  `id_distribuidora_filme` int(11) NOT NULL,
  `id_filme` int(11) DEFAULT NULL,
  `id_distribuidora` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_elenco_filme`
--

CREATE TABLE `tb_elenco_filme` (
  `id_filme` int(11) DEFAULT NULL,
  `nome_ator_filme` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_email_cliente`
--

CREATE TABLE `tb_email_cliente` (
  `id_email_cliente` int(11) NOT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `email_cliente` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_email_cliente`
--
/*
INSERT INTO `tb_email_cliente` (`id_email_cliente`, `id_cliente`, `email_cliente`) VALUES
(1, 1, 'teste@gmail.com'),
(2, 2, 'aura@gmail.com'),
(3, 3, 'testeeee@gmail.com'),
(4, 4, 'trovadorismo@gmail.com'),
(5, 5, 'autismo@gmail.com'),
(6, 6, 'exemplo2@gmail.com'),
(7, 7, '123@gmail.com'),
(8, 8, 'clique@gmail.com'),
(9, 9, 'american@gmail.com'),
(10, 10, 'sdfjgfdhj@gmail.com'),
(11, 11, '3456@gmail.com');
*/
-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_email_funcionario`
--

CREATE TABLE `tb_email_funcionario` (
  `id_email_funcionario` int(11) NOT NULL,
  `id_funcionario` int(11) DEFAULT NULL,
  `email_funcionario` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_filme`
--

CREATE TABLE `tb_filme` (
  `id_filme` int(11) NOT NULL,
  `nome_filme` varchar(80) DEFAULT NULL,
  `genero_filme` varchar(40) DEFAULT NULL,
  `sinopse_filme` varchar(170) DEFAULT NULL,
  `duracao_filme` varchar(8) DEFAULT NULL,
  `capa_filme` varchar(350) DEFAULT NULL,
  `classificacao_indicativa_filme` varchar(30) DEFAULT NULL,
  `data_estreia_filme` date DEFAULT NULL,
  `data_adicionado_filme` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_funcao`
--

CREATE TABLE `tb_funcao` (
  `id_funcao` int(11) NOT NULL,
  `nome_funcao` varchar(50) DEFAULT NULL,
  `desc_funcao` varchar(100) DEFAULT NULL,
  `carga_horaria_funcao` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_funcao_funcionario`
--

CREATE TABLE `tb_funcao_funcionario` (
  `id_funcao_funcionario` int(11) NOT NULL,
  `id_funcionario` int(11) DEFAULT NULL,
  `id_funcao` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_funcionario`
--

CREATE TABLE `tb_funcionario` (
  `id_funcionario` int(11) NOT NULL,
  `nome_funcionario` varchar(70) DEFAULT NULL,
  `cpf_funcionario` char(11) DEFAULT NULL,
  `senha_funcionario` varchar(200) DEFAULT NULL,
  `data_nasc_funcionario` date DEFAULT NULL,
  `logradouro_funcionario` varchar(100) DEFAULT NULL,
  `complemento_funcionario` varchar(40) DEFAULT NULL,
  `cep_funcionario` char(8) DEFAULT NULL,
  `bairro_funcionario` varchar(60) DEFAULT NULL,
  `cidade_funcionario` varchar(60) DEFAULT NULL,
  `estado_funcionario` varchar(30) DEFAULT NULL,
  `pais_funcionario` varchar(60) DEFAULT NULL,
  `data_criacao_conta_funcionario` datetime DEFAULT NULL,
  `data_contratacao_funcionario` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_ingresso`
--

CREATE TABLE `tb_ingresso` (
  `cod_ingresso` char(7) NOT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `id_sessao` int(11) DEFAULT NULL,
  `valor_total_ingresso` int(11) DEFAULT NULL,
  `data_compra_ingresso` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_metodo_pagamento`
--

CREATE TABLE `tb_metodo_pagamento` (
  `id_metodo_pagamento` int(11) NOT NULL,
  `nome_metodo_pagamento` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_metodo_pagamento_ingresso`
--

CREATE TABLE `tb_metodo_pagamento_ingresso` (
  `id_metodo_pagamento_ingresso` int(11) NOT NULL,
  `cod_ingresso` char(7) DEFAULT NULL,
  `id_metodo_pagamento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_sala`
--

CREATE TABLE `tb_sala` (
  `id_sala` int(11) NOT NULL,
  `nome_sala` varchar(30) DEFAULT NULL,
  `capacidade_pessoas_sala` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_sessao`
--

CREATE TABLE `tb_sessao` (
  `id_sessao` int(11) NOT NULL,
  `id_filme` int(11) DEFAULT NULL,
  `id_sala` int(11) DEFAULT NULL,
  `tipo_audio_sessao` varchar(50) DEFAULT NULL,
  `data_sessao` date DEFAULT NULL,
  `horario_sessao` time DEFAULT NULL,
  `logradouro_sessao` varchar(100) DEFAULT NULL,
  `complemento_sessao` varchar(40) DEFAULT NULL,
  `cep_sessao` char(8) DEFAULT NULL,
  `bairro_sessao` varchar(60) DEFAULT NULL,
  `cidade_sessao` varchar(60) DEFAULT NULL,
  `estado_sessao` varchar(30) DEFAULT NULL,
  `pais_sessao` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_tag_sala`
--

CREATE TABLE `tb_tag_sala` (
  `id_tag_sala` int(11) NOT NULL,
  `id_sala` int(11) DEFAULT NULL,
  `nome_tag_sala` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_tel_cliente`
--

CREATE TABLE `tb_tel_cliente` (
  `id_tel_cliente` int(11) NOT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `tel_cliente` char(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_tel_funcionario`
--

CREATE TABLE `tb_tel_funcionario` (
  `id_tel_funcionario` int(11) NOT NULL,
  `id_funcionario` int(11) DEFAULT NULL,
  `tel_funcionario` char(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_tipo_sala`
--

CREATE TABLE `tb_tipo_sala` (
  `id_tipo_sala` int(11) NOT NULL,
  `id_sala` int(11) DEFAULT NULL,
  `tipo_sala` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_trailer_filme`
--

CREATE TABLE `tb_trailer_filme` (
  `id_trailer` int(11) NOT NULL,
  `id_filme` int(11) DEFAULT NULL,
  `link_trailer` varchar(300) DEFAULT NULL,
  `duracao_trailer` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `tb_alimento`
--
ALTER TABLE `tb_alimento`
  ADD PRIMARY KEY (`id_alimento`);

--
-- Índices de tabela `tb_alimento_ingresso`
--
ALTER TABLE `tb_alimento_ingresso`
  ADD PRIMARY KEY (`id_alimento_ingresso`),
  ADD KEY `id_alimento` (`id_alimento`);

--
-- Índices de tabela `tb_assento`
--
ALTER TABLE `tb_assento`
  ADD PRIMARY KEY (`id_assento`),
  ADD UNIQUE KEY `cod_assento` (`cod_assento`);

--
-- Índices de tabela `tb_caracteristica`
--
ALTER TABLE `tb_caracteristica`
  ADD PRIMARY KEY (`id_caracteristica`);

--
-- Índices de tabela `tb_caracteristica_assento_ingresso`
--
ALTER TABLE `tb_caracteristica_assento_ingresso`
  ADD PRIMARY KEY (`id_caracteristica_assento_ingresso`),
  ADD KEY `id_assento` (`id_assento`),
  ADD KEY `id_caracteristica` (`id_caracteristica`);

--
-- Índices de tabela `tb_cliente`
--
ALTER TABLE `tb_cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Índices de tabela `tb_desconto`
--
ALTER TABLE `tb_desconto`
  ADD PRIMARY KEY (`id_desconto`);

--
-- Índices de tabela `tb_desconto_ingresso`
--
ALTER TABLE `tb_desconto_ingresso`
  ADD PRIMARY KEY (`id_desconto_ingresso`),
  ADD KEY `id_desconto` (`id_desconto`);

--
-- Índices de tabela `tb_direcao_filme`
--
ALTER TABLE `tb_direcao_filme`
  ADD KEY `id_filme` (`id_filme`);

--
-- Índices de tabela `tb_distribuidora`
--
ALTER TABLE `tb_distribuidora`
  ADD PRIMARY KEY (`id_distribuidora`);

--
-- Índices de tabela `tb_distribuidora_filme`
--
ALTER TABLE `tb_distribuidora_filme`
  ADD PRIMARY KEY (`id_distribuidora_filme`),
  ADD KEY `id_filme` (`id_filme`),
  ADD KEY `id_distribuidora` (`id_distribuidora`);

--
-- Índices de tabela `tb_elenco_filme`
--
ALTER TABLE `tb_elenco_filme`
  ADD KEY `id_filme` (`id_filme`);

--
-- Índices de tabela `tb_email_cliente`
--
ALTER TABLE `tb_email_cliente`
  ADD PRIMARY KEY (`id_email_cliente`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Índices de tabela `tb_email_funcionario`
--
ALTER TABLE `tb_email_funcionario`
  ADD PRIMARY KEY (`id_email_funcionario`),
  ADD KEY `id_funcionario` (`id_funcionario`);

--
-- Índices de tabela `tb_filme`
--
ALTER TABLE `tb_filme`
  ADD PRIMARY KEY (`id_filme`);

--
-- Índices de tabela `tb_funcao`
--
ALTER TABLE `tb_funcao`
  ADD PRIMARY KEY (`id_funcao`);

--
-- Índices de tabela `tb_funcao_funcionario`
--
ALTER TABLE `tb_funcao_funcionario`
  ADD PRIMARY KEY (`id_funcao_funcionario`),
  ADD KEY `id_funcionario` (`id_funcionario`),
  ADD KEY `id_funcao` (`id_funcao`);

--
-- Índices de tabela `tb_funcionario`
--
ALTER TABLE `tb_funcionario`
  ADD PRIMARY KEY (`id_funcionario`);

--
-- Índices de tabela `tb_ingresso`
--
ALTER TABLE `tb_ingresso`
  ADD PRIMARY KEY (`cod_ingresso`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_sessao` (`id_sessao`);

--
-- Índices de tabela `tb_metodo_pagamento`
--
ALTER TABLE `tb_metodo_pagamento`
  ADD PRIMARY KEY (`id_metodo_pagamento`);

--
-- Índices de tabela `tb_metodo_pagamento_ingresso`
--
ALTER TABLE `tb_metodo_pagamento_ingresso`
  ADD PRIMARY KEY (`id_metodo_pagamento_ingresso`),
  ADD KEY `id_metodo_pagamento` (`id_metodo_pagamento`);

--
-- Índices de tabela `tb_sala`
--
ALTER TABLE `tb_sala`
  ADD PRIMARY KEY (`id_sala`);

--
-- Índices de tabela `tb_sessao`
--
ALTER TABLE `tb_sessao`
  ADD PRIMARY KEY (`id_sessao`),
  ADD KEY `id_filme` (`id_filme`),
  ADD KEY `id_sala` (`id_sala`);

--
-- Índices de tabela `tb_tag_sala`
--
ALTER TABLE `tb_tag_sala`
  ADD PRIMARY KEY (`id_tag_sala`),
  ADD KEY `id_sala` (`id_sala`);

--
-- Índices de tabela `tb_tel_cliente`
--
ALTER TABLE `tb_tel_cliente`
  ADD PRIMARY KEY (`id_tel_cliente`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Índices de tabela `tb_tel_funcionario`
--
ALTER TABLE `tb_tel_funcionario`
  ADD PRIMARY KEY (`id_tel_funcionario`),
  ADD KEY `id_funcionario` (`id_funcionario`);

--
-- Índices de tabela `tb_tipo_sala`
--
ALTER TABLE `tb_tipo_sala`
  ADD PRIMARY KEY (`id_tipo_sala`),
  ADD KEY `id_sala` (`id_sala`);

--
-- Índices de tabela `tb_trailer_filme`
--
ALTER TABLE `tb_trailer_filme`
  ADD PRIMARY KEY (`id_trailer`),
  ADD KEY `id_filme` (`id_filme`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tb_alimento`
--
ALTER TABLE `tb_alimento`
  MODIFY `id_alimento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_alimento_ingresso`
--
ALTER TABLE `tb_alimento_ingresso`
  MODIFY `id_alimento_ingresso` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_assento`
--
ALTER TABLE `tb_assento`
  MODIFY `id_assento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_caracteristica`
--
ALTER TABLE `tb_caracteristica`
  MODIFY `id_caracteristica` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_caracteristica_assento_ingresso`
--
ALTER TABLE `tb_caracteristica_assento_ingresso`
  MODIFY `id_caracteristica_assento_ingresso` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_cliente`
--
ALTER TABLE `tb_cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `tb_desconto`
--
ALTER TABLE `tb_desconto`
  MODIFY `id_desconto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_desconto_ingresso`
--
ALTER TABLE `tb_desconto_ingresso`
  MODIFY `id_desconto_ingresso` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_distribuidora`
--
ALTER TABLE `tb_distribuidora`
  MODIFY `id_distribuidora` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_distribuidora_filme`
--
ALTER TABLE `tb_distribuidora_filme`
  MODIFY `id_distribuidora_filme` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_email_cliente`
--
ALTER TABLE `tb_email_cliente`
  MODIFY `id_email_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `tb_email_funcionario`
--
ALTER TABLE `tb_email_funcionario`
  MODIFY `id_email_funcionario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_filme`
--
ALTER TABLE `tb_filme`
  MODIFY `id_filme` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_funcao`
--
ALTER TABLE `tb_funcao`
  MODIFY `id_funcao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_funcao_funcionario`
--
ALTER TABLE `tb_funcao_funcionario`
  MODIFY `id_funcao_funcionario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_funcionario`
--
ALTER TABLE `tb_funcionario`
  MODIFY `id_funcionario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_metodo_pagamento`
--
ALTER TABLE `tb_metodo_pagamento`
  MODIFY `id_metodo_pagamento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_metodo_pagamento_ingresso`
--
ALTER TABLE `tb_metodo_pagamento_ingresso`
  MODIFY `id_metodo_pagamento_ingresso` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_sala`
--
ALTER TABLE `tb_sala`
  MODIFY `id_sala` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_sessao`
--
ALTER TABLE `tb_sessao`
  MODIFY `id_sessao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_tag_sala`
--
ALTER TABLE `tb_tag_sala`
  MODIFY `id_tag_sala` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_tel_cliente`
--
ALTER TABLE `tb_tel_cliente`
  MODIFY `id_tel_cliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_tel_funcionario`
--
ALTER TABLE `tb_tel_funcionario`
  MODIFY `id_tel_funcionario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_tipo_sala`
--
ALTER TABLE `tb_tipo_sala`
  MODIFY `id_tipo_sala` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_trailer_filme`
--
ALTER TABLE `tb_trailer_filme`
  MODIFY `id_trailer` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `tb_alimento_ingresso`
--
ALTER TABLE `tb_alimento_ingresso`
  ADD CONSTRAINT `tb_alimento_ingresso_ibfk_1` FOREIGN KEY (`id_alimento`) REFERENCES `tb_alimento` (`id_alimento`);

--
-- Restrições para tabelas `tb_caracteristica_assento_ingresso`
--
ALTER TABLE `tb_caracteristica_assento_ingresso`
  ADD CONSTRAINT `tb_caracteristica_assento_ingresso_ibfk_1` FOREIGN KEY (`id_assento`) REFERENCES `tb_assento` (`id_assento`),
  ADD CONSTRAINT `tb_caracteristica_assento_ingresso_ibfk_2` FOREIGN KEY (`id_caracteristica`) REFERENCES `tb_caracteristica` (`id_caracteristica`);

--
-- Restrições para tabelas `tb_desconto_ingresso`
--
ALTER TABLE `tb_desconto_ingresso`
  ADD CONSTRAINT `tb_desconto_ingresso_ibfk_1` FOREIGN KEY (`id_desconto`) REFERENCES `tb_desconto` (`id_desconto`);

--
-- Restrições para tabelas `tb_direcao_filme`
--
ALTER TABLE `tb_direcao_filme`
  ADD CONSTRAINT `tb_direcao_filme_ibfk_1` FOREIGN KEY (`id_filme`) REFERENCES `tb_filme` (`id_filme`);

--
-- Restrições para tabelas `tb_distribuidora_filme`
--
ALTER TABLE `tb_distribuidora_filme`
  ADD CONSTRAINT `tb_distribuidora_filme_ibfk_1` FOREIGN KEY (`id_filme`) REFERENCES `tb_filme` (`id_filme`),
  ADD CONSTRAINT `tb_distribuidora_filme_ibfk_2` FOREIGN KEY (`id_distribuidora`) REFERENCES `tb_distribuidora` (`id_distribuidora`);

--
-- Restrições para tabelas `tb_elenco_filme`
--
ALTER TABLE `tb_elenco_filme`
  ADD CONSTRAINT `tb_elenco_filme_ibfk_1` FOREIGN KEY (`id_filme`) REFERENCES `tb_filme` (`id_filme`);

--
-- Restrições para tabelas `tb_email_cliente`
--
ALTER TABLE `tb_email_cliente`
  ADD CONSTRAINT `tb_email_cliente_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `tb_cliente` (`id_cliente`);

--
-- Restrições para tabelas `tb_email_funcionario`
--
ALTER TABLE `tb_email_funcionario`
  ADD CONSTRAINT `tb_email_funcionario_ibfk_1` FOREIGN KEY (`id_funcionario`) REFERENCES `tb_funcionario` (`id_funcionario`);

--
-- Restrições para tabelas `tb_funcao_funcionario`
--
ALTER TABLE `tb_funcao_funcionario`
  ADD CONSTRAINT `tb_funcao_funcionario_ibfk_1` FOREIGN KEY (`id_funcionario`) REFERENCES `tb_funcionario` (`id_funcionario`),
  ADD CONSTRAINT `tb_funcao_funcionario_ibfk_2` FOREIGN KEY (`id_funcao`) REFERENCES `tb_funcao` (`id_funcao`);

--
-- Restrições para tabelas `tb_ingresso`
--
ALTER TABLE `tb_ingresso`
  ADD CONSTRAINT `tb_ingresso_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `tb_cliente` (`id_cliente`),
  ADD CONSTRAINT `tb_ingresso_ibfk_2` FOREIGN KEY (`id_sessao`) REFERENCES `tb_sessao` (`id_sessao`);

--
-- Restrições para tabelas `tb_metodo_pagamento_ingresso`
--
ALTER TABLE `tb_metodo_pagamento_ingresso`
  ADD CONSTRAINT `tb_metodo_pagamento_ingresso_ibfk_1` FOREIGN KEY (`id_metodo_pagamento`) REFERENCES `tb_metodo_pagamento` (`id_metodo_pagamento`);

--
-- Restrições para tabelas `tb_sessao`
--
ALTER TABLE `tb_sessao`
  ADD CONSTRAINT `tb_sessao_ibfk_1` FOREIGN KEY (`id_filme`) REFERENCES `tb_filme` (`id_filme`),
  ADD CONSTRAINT `tb_sessao_ibfk_2` FOREIGN KEY (`id_sala`) REFERENCES `tb_sala` (`id_sala`);

--
-- Restrições para tabelas `tb_tag_sala`
--
ALTER TABLE `tb_tag_sala`
  ADD CONSTRAINT `tb_tag_sala_ibfk_1` FOREIGN KEY (`id_sala`) REFERENCES `tb_sala` (`id_sala`);

--
-- Restrições para tabelas `tb_tel_cliente`
--
ALTER TABLE `tb_tel_cliente`
  ADD CONSTRAINT `tb_tel_cliente_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `tb_cliente` (`id_cliente`);

--
-- Restrições para tabelas `tb_tel_funcionario`
--
ALTER TABLE `tb_tel_funcionario`
  ADD CONSTRAINT `tb_tel_funcionario_ibfk_1` FOREIGN KEY (`id_funcionario`) REFERENCES `tb_funcionario` (`id_funcionario`);

--
-- Restrições para tabelas `tb_tipo_sala`
--
ALTER TABLE `tb_tipo_sala`
  ADD CONSTRAINT `tb_tipo_sala_ibfk_1` FOREIGN KEY (`id_sala`) REFERENCES `tb_sala` (`id_sala`);

--
-- Restrições para tabelas `tb_trailer_filme`
--
ALTER TABLE `tb_trailer_filme`
  ADD CONSTRAINT `tb_trailer_filme_ibfk_1` FOREIGN KEY (`id_filme`) REFERENCES `tb_filme` (`id_filme`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
