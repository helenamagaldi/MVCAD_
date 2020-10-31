CREATE TABLE pessoa (
	id serial PRIMARY KEY,
	nome varchar(150) NOT NULL,
	data_nascimento date NOT NULL,
	cpf char(11) NULL
);
-- VARCHAR eh a string, no maximo 150 caracteres com tamanho variavel na memoria
-- 	CHAR com tamanho definido
-- NOT NULL: NULL campo vazio, absolutamente nada. Porém, Primary Key nao pode ser null, justamente por ser chave primária
-- tanto faz lowercase quanto uppercase

CREATE TABLE CONTATO (
    ID serial PRIMARY KEY,
	telefone varchar(11) NULL,
	email varchar(150),
	id_pessoa integer REFERENCES pessoa (id)
);


CREATE TABLE endereco (
	id serial PRIMARY KEY,
	logradouro varchar(100) NOT NULL,
	numero varchar(20) NULL,
	bairro varchar(50) NULL
	cidade varchar(100) NOT NULL,
	uf char(2) NOT NULL,
	id_pessoa integer REFERENCES pessoa (id)
);

CREATE TABLE medico (
	id serial PRIMARY KEY,
	crm varchar(50) NOT NULL,
	especialidade varchar(150) NOT NULL,
	id_pessoa integer REFERENCES pessoa(id) NOT NULL
);

CREATE TABLE consulta (
	id serial PRIMARY KEY,
	data timestamp NOT NULL,
	valor decimal(10,2),
-- 	base 10, 2 é quantidade de casa decimais
	id_paciente integer REFERENCES paciente (id) NOT NULL,
	id_medico integer REFERENCES medico (id) NOT NULL
);

