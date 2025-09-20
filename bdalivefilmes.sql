-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 20/09/2025 às 02:19
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

--
-- Despejando dados para a tabela `tb_direcao_filme`
--

INSERT INTO `tb_direcao_filme` (`id_filme`, `nome_diretor_filme`) VALUES
(1, 'Michael Chaves');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_distribuidora_filme`
--

CREATE TABLE `tb_distribuidora_filme` (
  `id_filme` int(11) DEFAULT NULL,
  `nome_distribuidora` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_distribuidora_filme`
--

INSERT INTO `tb_distribuidora_filme` (`id_filme`, `nome_distribuidora`) VALUES
(1, 'Warner Bros');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_elenco_filme`
--

CREATE TABLE `tb_elenco_filme` (
  `id_filme` int(11) DEFAULT NULL,
  `nome_ator_filme` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_elenco_filme`
--

INSERT INTO `tb_elenco_filme` (`id_filme`, `nome_ator_filme`) VALUES
(1, 'Vera Farmiga'),
(1, 'Patrick Wilson'),
(1, 'Mia Tomlinson');

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
  `sinopse_filme` varchar(350) DEFAULT NULL,
  `duracao_filme` varchar(10) DEFAULT NULL,
  `capa_filme` varchar(350) DEFAULT NULL,
  `classificacao_indicativa_filme` int(11) DEFAULT NULL,
  `data_estreia_filme` date DEFAULT NULL,
  `data_adicionado_filme` datetime DEFAULT current_timestamp(),
  `link_trailer` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_filme`
--

INSERT INTO `tb_filme` (`id_filme`, `nome_filme`, `genero_filme`, `sinopse_filme`, `duracao_filme`, `capa_filme`, `classificacao_indicativa_filme`, `data_estreia_filme`, `data_adicionado_filme`, `link_trailer`) VALUES
(1, 'Invocação do Mal 4: O último ritual', 'Terror', 'Os investigadores paranormais Ed e Lorraine Warren tentam banir um demônio da casa de uma família.', '2h 15min', NULL, 16, '2025-09-04', NULL, 'https://www.youtube.com/embed/n0sq-r0mBXQ'),
(3, 'Undertale: O Filme', 'Romance, Comédia', 'Oi meu nome é Samara, tenho 14 anos (Teria se estivesse viva), morri aos 13 em Cascavel-PR. Eu andava de bicicleta Quando não pude desviar de um arame farpado. O pior foi que o dono do lote não quis me ajudar, riu bastante mim após agonizar por 2 horas enroscada no arame eu faleci, através dessa mensagem eu peço que façam com que eu possa descanç', '1h 40min', NULL, 18, '2025-11-30', '2025-09-19 19:56:50', 'https://www.youtube.com/embed/tXRcYP36U4U');

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

--
-- Despejando dados para a tabela `tb_sala`
--

INSERT INTO `tb_sala` (`id_sala`, `nome_sala`, `capacidade_pessoas_sala`) VALUES
(1, 'Tradicional', 100),
(2, 'Tradicional', 150),
(3, 'Tradicional', 100),
(4, 'IMAX', 150);

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

--
-- Despejando dados para a tabela `tb_sessao`
--

INSERT INTO `tb_sessao` (`id_sessao`, `id_filme`, `id_sala`, `tipo_audio_sessao`, `data_sessao`, `horario_sessao`, `logradouro_sessao`, `complemento_sessao`, `cep_sessao`, `bairro_sessao`, `cidade_sessao`, `estado_sessao`, `pais_sessao`) VALUES
(2, 1, 3, 'Dublado', '2025-09-15', '18:00:00', 'Rua Morango do Amor', NULL, '91919191', 'Labubu', 'São Paulo', 'SP', 'Brasil');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_tag_filme`
--

CREATE TABLE `tb_tag_filme` (
  `id_tag_filme` int(11) NOT NULL,
  `id_filme` int(11) DEFAULT NULL,
  `nome_tag_sala` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_tag_filme`
--

INSERT INTO `tb_tag_filme` (`id_tag_filme`, `id_filme`, `nome_tag_sala`) VALUES
(1, 3, 'PRÉ-VENDA');

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
-- Índices de tabela `tb_distribuidora_filme`
--
ALTER TABLE `tb_distribuidora_filme`
  ADD KEY `tb_distribuidora_filme_ibfk_1` (`id_filme`);

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
-- Índices de tabela `tb_tag_filme`
--
ALTER TABLE `tb_tag_filme`
  ADD PRIMARY KEY (`id_tag_filme`),
  ADD KEY `id_sala` (`id_filme`);

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
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

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
-- AUTO_INCREMENT de tabela `tb_email_cliente`
--
ALTER TABLE `tb_email_cliente`
  MODIFY `id_email_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de tabela `tb_email_funcionario`
--
ALTER TABLE `tb_email_funcionario`
  MODIFY `id_email_funcionario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_filme`
--
ALTER TABLE `tb_filme`
  MODIFY `id_filme` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `id_sala` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `tb_sessao`
--
ALTER TABLE `tb_sessao`
  MODIFY `id_sessao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `tb_tag_filme`
--
ALTER TABLE `tb_tag_filme`
  MODIFY `id_tag_filme` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  ADD CONSTRAINT `tb_distribuidora_filme_ibfk_1` FOREIGN KEY (`id_filme`) REFERENCES `tb_filme` (`id_filme`);

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
-- Restrições para tabelas `tb_tag_filme`
--
ALTER TABLE `tb_tag_filme`
  ADD CONSTRAINT `tb_tag_filme_ibfk_1` FOREIGN KEY (`id_filme`) REFERENCES `tb_filme` (`id_filme`);

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
