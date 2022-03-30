CREATE TABLE cliente(
id_cliente SERIAL CONSTRAINT pk_id_cliente PRIMARY KEY NOT NULL,
nome VARCHAR(255) NOT NULL,
data_de_nascimento DATE NOT NULL,
email VARCHAR(255) NOT NULL
);

INSERT INTO cliente (nome, data_de_nascimento, email) VALUES ('Enzo Costa', '2002-09-03', 'enzo99costa@gmail.com');
INSERT INTO cliente (nome, data_de_nascimento, email) VALUES ('Maria Silva', '1999-07-25', 'mariasilava@gmail.com');

SELECT * FROM cliente;


CREATE TABLE dependente(
id_dependente SERIAL CONSTRAINT pk_id_dependente PRIMARY KEY NOT NULL,
cliente INT NOT NULL,
dependente INT NOT NULL,
CONSTRAINT fk_cliente FOREIGN KEY (cliente) REFERENCES cliente(id_cliente),
CONSTRAINT fk_dependente FOREIGN KEY (dependente) REFERENCES cliente(id_cliente)
);

INSERT INTO dependente (cliente, dependente) VALUES (1, 1);
INSERT INTO dependente (cliente, dependente) VALUES (2, 2);

SELECT * FROM dependente;


CREATE TABLE produto(
id_produto SERIAL CONSTRAINT pk_id_produto PRIMARY KEY NOT NULL,
codigo INT NOT NULL,
descricao VARCHAR(255),
valor MONEY NOT NULL
);

INSERT INTO produto (codigo, descricao, valor) VALUES (432651, 'Exame de covid', 100);
INSERT INTO produto (codigo, descricao, valor) VALUES (930118, 'Consulta com médico', 200);

SELECT * FROM produto;


CREATE TABLE contrato(
id_contrato SERIAL CONSTRAINT pk_id_contrato PRIMARY KEY NOT NULL,
cliente INT NOT NULL,
produto INT NOT NULL,
data_inicio_vigencia DATE NOT NULL,
CONSTRAINT fk_cliente FOREIGN KEY (cliente) REFERENCES cliente(id_cliente),
CONSTRAINT fk_produto FOREIGN KEY (produto) REFERENCES produto(id_produto)
);

INSERT INTO contrato (cliente, produto, data_inicio_vigencia) VALUES (1, 2, '2022-03-30');
INSERT INTO contrato (cliente, produto, data_inicio_vigencia) VALUES (2, 1, '2022-02-15');

SELECT * FROM contrato;
