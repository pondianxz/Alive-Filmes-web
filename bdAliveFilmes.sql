CREATE DATABASE bdAliveFilmes
GO
USE DATABASE bdAliveFilmes

CREATE TABLE tb_cliente (
    id_cliente INT PRIMARY KEY IDENTITY (1,1),
    nome_cliente VARCHAR(70),
    cpf_cliente CHAR(11),
    senha_cliente VARCHAR(200),
    data_nasc_cliente DATE,
    logradouro_cliente VARCHAR(100),
    num_logra_cliente VARCHAR(50),
    complemento_cliente VARCHAR(40),
    cep_cliente CHAR(8),
    bairro_cliente VARCHAR(60),
    cidade_cliente VARCHAR(60),
    estado_cliente VARCHAR(30),
    pais_cliente VARCHAR(60),
    data_criacao_conta_cliente DATETIME
);

CREATE TABLE tb_filme (
    id_filme INT PRIMARY KEY IDENTITY (1,1),
    nome_filme VARCHAR(80),
    genero_filme VARCHAR(40),
    sinopse_filme VARCHAR(170),
    duracao_filme BIGINT,
    capa_filme VARCHAR(350),
    classificacao_indicativa_filme VARCHAR(30),
    data_estreia_filme DATE,
    data_adicionado_filme DATETIME
);

CREATE TABLE tb_funcionario (
    id_funcionario INT PRIMARY KEY IDENTITY (1,1),
    nome_funcionario VARCHAR(70),
    cpf_funcionario CHAR(11),
    senha_funcionario VARCHAR(200),
    data_nasc_funcionario DATE,
    logradouro_funcionario VARCHAR(100),
    num_logra_funcionario VARCHAR(50),
    complemento_funcionario VARCHAR(40),
    cep_funcionario CHAR(8),
    bairro_funcionario VARCHAR(60),
    cidade_funcionario VARCHAR(60),
    estado_funcionario VARCHAR(30),
    pais_funcionario VARCHAR(60),
    data_criacao_conta_funcionario DATETIME,
    data_contratacao_funcionario DATETIME
);

CREATE TABLE tb_sala (
    id_sala INT PRIMARY KEY IDENTITY (1,1),
    nome_sala VARCHAR(30),
    capacidade_pessoas_sala INT
);

CREATE TABLE tb_funcao (
    id_funcao INT PRIMARY KEY IDENTITY (1,1),
    nome_funcao VARCHAR(50),
    desc_funcao VARCHAR(100),
    carga_horaria_funcao VARCHAR(25)
);

CREATE TABLE tb_caracteristica (
    id_caracteristica INT PRIMARY KEY IDENTITY (1,1),
    nome_caracteristica VARCHAR(40)
);

CREATE TABLE tb_distribuidora (
    id_distribuidora INT PRIMARY KEY IDENTITY (1,1),
    nome_distribuidora VARCHAR(40)
);

CREATE TABLE tb_assento (
    id_assento INT PRIMARY KEY IDENTITY (1,1),
    cod_assento CHAR(3) UNIQUE
);

CREATE TABLE tb_desconto (
    id_desconto INT PRIMARY KEY IDENTITY (1,1),
    nome_desconto VARCHAR(45),
    porcentagem_desconto INT
);

CREATE TABLE tb_alimento (
    id_alimento INT PRIMARY KEY IDENTITY (1,1),
    id_cliente INT,
    nome_alimento VARCHAR(70),
    desc_alimento VARCHAR(170),
    valor_alimento VARCHAR(6)
);

CREATE TABLE tb_metodo_pagamento (
    id_metodo_pagamento INT PRIMARY KEY IDENTITY (1,1),
    nome_metodo_pagamento VARCHAR(30)
);



/* --------------------------------------------------------------- 

tabelas sigmas que tem chave estrangeira 
------------------------------------------------------------- */



CREATE TABLE tb_direcao_filme (
    id_filme INT FOREIGN KEY REFERENCES tb_filme(id_filme),
    nome_diretor_filme VARCHAR(100)
);

CREATE TABLE tb_elenco_filme (
    id_filme INT FOREIGN KEY REFERENCES tb_filme(id_filme),
    nome_ator_filme VARCHAR(100)
);

CREATE TABLE tb_sessao (
    id_sessao INT PRIMARY KEY IDENTITY (1,1),
    id_filme INT FOREIGN KEY REFERENCES tb_filme(id_filme),
    id_sala INT FOREIGN KEY REFERENCES tb_sala(id_sala),
    data_sessao DATE,
    horario_sessao TIME,
    logradouro_sessao VARCHAR(100),
    num_logra_sessao VARCHAR(50),
    complemento_sessao VARCHAR(40),
    cep_sessao CHAR(8),
    bairro_sessao VARCHAR(60),
    cidade_sessao VARCHAR(60),
    estado_sessao VARCHAR(30),
    pais_sessao VARCHAR(60)
);

CREATE TABLE tb_tipo_audio_sessao (
    id_sessao INT FOREIGN KEY REFERENCES tb_sessao(id_sessao),
    tipo_audio_sessao VARCHAR(50)
);

CREATE TABLE tb_tipo_sala (
    id_tipo_sala INT PRIMARY KEY IDENTITY (1,1),
    id_sala INT FOREIGN KEY REFERENCES tb_sala(id_sala),
    tipo_sala VARCHAR(40)
);

CREATE TABLE tb_tag_sala (
    id_tag_sala INT PRIMARY KEY IDENTITY (1,1),
    id_sala INT FOREIGN KEY REFERENCES tb_sala(id_sala),
    nome_tag_sala VARCHAR(20)
);

CREATE TABLE tb_ingresso (
    cod_ingresso CHAR(7) PRIMARY KEY,
    id_cliente INT FOREIGN KEY REFERENCES tb_cliente(id_cliente),
    id_sessao INT FOREIGN KEY REFERENCES tb_sessao(id_sessao),
    valor_total_ingresso INT,
    data_compra_ingresso DATETIME
);

CREATE TABLE tb_preco_sessao (
    id_preco_sessao INT PRIMARY KEY IDENTITY (1,1),
    id_sessao INT FOREIGN KEY REFERENCES tb_sessao(id_sessao),
    preco_sessao VARCHAR(7),
    nome_preco_sessao VARCHAR(50)
);

CREATE TABLE tb_tel_cliente (
    id_tel_cliente INT PRIMARY KEY IDENTITY (1,1),
    id_cliente INT FOREIGN KEY REFERENCES tb_cliente(id_cliente),
    tel_cliente CHAR(14),
);

CREATE TABLE tb_email_cliente (
    id_email_cliente INT PRIMARY KEY IDENTITY (1,1),
    id_cliente INT FOREIGN KEY REFERENCES tb_cliente(id_cliente),
    email_cliente VARCHAR(200),
);
CREATE TABLE tb_caracteristica_assento_ingresso (
    id_caracteristica_assento_ingresso INT PRIMARY KEY IDENTITY (1,1),
    id_assento INT FOREIGN KEY REFERENCES tb_assento(id_assento),
    id_caracteristica INT FOREIGN KEY REFERENCES tb_caracteristica(id_caracteristica)
);
CREATE TABLE tb_email_funcionario (
    id_email_funcionario INT PRIMARY KEY IDENTITY (1,1),
    id_funcionario INT FOREIGN KEY REFERENCES tb_funcionario(id_funcionario),
    email_funcionario VARCHAR(200),
);

CREATE TABLE tb_tel_funcionario (
    id_tel_funcionario INT PRIMARY KEY IDENTITY (1,1),
    id_funcionario INT FOREIGN KEY REFERENCES tb_funcionario(id_funcionario),
    tel_funcionario CHAR(14),
);
CREATE TABLE tb_funcao_funcionario (
    id_funcao_funcionario INT PRIMARY KEY IDENTITY (1,1),
    id_funcionario INT FOREIGN KEY REFERENCES tb_funcionario(id_funcionario),
    id_funcao INT FOREIGN KEY REFERENCES tb_funcao(id_funcao),
);
CREATE TABLE tb_assento_ingresso (
    id_assento_ingresso INT PRIMARY KEY IDENTITY (1,1),
    cod_ingresso CHAR(7),
    id_assento INT FOREIGN KEY REFERENCES tb_assento(id_assento),
);
CREATE TABLE tb_desconto_ingresso (
    id_desconto_ingresso INT PRIMARY KEY IDENTITY (1,1),
    cod_ingresso CHAR(7),
    id_desconto INT FOREIGN KEY REFERENCES tb_desconto(id_desconto),
);

CREATE TABLE tb_alimento_ingresso (
    id_alimento_ingresso INT PRIMARY KEY IDENTITY (1,1),
    cod_ingresso CHAR(7),
    id_alimento INT FOREIGN KEY REFERENCES tb_alimento(id_alimento),
);

CREATE TABLE tb_metodo_pagamento_ingresso (
    id_metodo_pagamento_ingresso INT PRIMARY KEY IDENTITY (1,1),
    cod_ingresso CHAR(7),
    id_metodo_pagamento INT FOREIGN KEY REFERENCES tb_metodo_pagamento(id_metodo_pagamento),
);

CREATE TABLE tb_distribuidora_filme (
    id_distribuidora_filme INT PRIMARY KEY IDENTITY (1,1),
    id_filme INT FOREIGN KEY REFERENCES tb_filme(id_filme),
    id_distribuidora INT FOREIGN KEY REFERENCES tb_distribuidora(id_distribuidora),
);
CREATE TABLE tb_trailer_filme (
    id_trailer INT PRIMARY KEY,
    id_filme INT FOREIGN KEY REFERENCES tb_filme(id_filme),
    link_trailer VARCHAR(300),
    duracao_trailer BIGINT,
);