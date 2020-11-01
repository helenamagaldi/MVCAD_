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


INSERT INTO pessoa (nome, data_nascimento, cpf)
VALUES ('Helena', '1988-02-20', '11111111111');

INSERT INTO pessoa (nome, data_nascimento, cpf)
VALUES ('Mika', '2007-11-01', '2222222222');

INSERT INTO pessoa (nome, data_nascimento, cpf)
VALUES ('Hell', '2001-03-24', '33333333333');

INSERT INTO contato (telefone, email, id_pessoa)
VALUES ('61111111111', 'heyyou@helenamagaldi.com', 1);

INSERT INTO contato (telefone, id_pessoa)
VALUES ('4711111111', 1);

INSERT INTO contato (telefone, email, id_pessoa)
VALUES ('78111111111', 'wellwell@helenamagaldi,com', 2);

INSERT INTO endereco (logradouro, numero, bairro, cidade, uf, id_pessoa)
VALUES ('SQL 999', '666', 'Old Strathcona', 'Edmonton', 'AB', 1);

INSERT INTO endereco (logradouro, numero, bairro, cidade, uf, id_pessoa)
VALUES ('10644', '666', 'Old Strathcona', 'Edmonton', 'AB', 2);

INSERT INTO endereco (logradouro, numero, bairro, cidade, uf, id_pessoa)
VALUES ('10855', '666', 'Stony Plain', 'Edmonton', 'AB', 3);

INSERT INTO paciente (plano_saude, id_pessoa)
VALUES ('uofa', 1)

INSERT INTO paciente (plano_saude, id_pessoa)
VALUES ('unimed', 2)

INSERT INTO paciente (plano_saude, id_pessoa)
VALUES ('itau', 3)

DELETE FROM paciente WHERE id_pessoa = 2

INSERT INTO pessoa (nome, data_nascimento, cpf)
VALUES ('chanel', '2010-06-05', '99999999999');

INSERT INTO contato (telefone, id_pessoa)
VALUES ('66666666', 4)

INSERT INTO endereco
-- nao preciso colocar as colunas se escrever todos os valores da tabela, mas precisamos colocar o ID como primeiro valor
-- se nao for colocar em todas, tem que escrever a coluna correspondente
VALUES ('2020', 'street', '10', 'dontknowanymore', 'edmonton', 'ab', 4);

INSERT INTO medico (crm, especialidade, id_pessoa)
VALUES ('AAA-01', 'epidemiologista', 2);

INSERT INTO medico (crm, especialidade, id_pessoa)
VALUES ('AAA-02', 'anestesista', 4);

INSERT INTO consulta (data, valor, id_paciente, id_medico)
VALUES ('2020-10-31 09:00:00', 150, 1, 1)

INSERT INTO consulta (data, valor, id_paciente, id_medico)
VALUES ('2020-10-31 10:00:00', 150, 1, 2)

INSERT INTO consulta (data, valor, id_paciente, id_medico)
VALUES ('2020-10-30 10:00:00', 150, 1, 1)

INSERT INTO consulta (data, valor, id_paciente, id_medico)
VALUES ('2020-10-29 10:00:00', 150, 1, 1)

INSERT INTO consulta (data, valor, id_paciente, id_medico)
VALUES ('2020-11-01 18:00:00', 150, 1, 2)

INSERT INTO consulta (data, valor, id_paciente, id_medico)
VALUES ('2020-11-14 18:00:00', 32.50, 1, 2)


-- to return all fields from pessoa table
SELECT * FROM pessoa;

-- not all fields
SELECT nome, cpf FROM pessoa
WHERE cpf = '00000000000';

SELECT nome,id, cpf FROM pessoa
WHERE cpf = '00000000000';

-- ao inves de ID, alias, codigo
SELECT id as codigo, cpf FROM pessoa
WHERE cpf = '00000000000';

SELECT id as codigo, nome
FROM pessoa
WHERE id >= 2;

SELECT id as codigo, nome
FROM pessoa
ORDER BY nome;
-- tb pode ser ORDER BY id

-- para ser decrescente
SELECT id as codigo, nome
FROM pessoa
ORDER BY nome DESC;

-- select from inner join: select de mais de uma tabela 


-- pe is an alias
SELECT pe.nome
FROM pessoa pe
-- juntando outra tabela
-- final result: como eu vou conseguir duas tabelas em uma unica consulta? por meio da chave estrangeira
INNER JOIN endereco en ON en.id_pessoa = pe.id


-- com * vem todos os campos, tanto de pessoa quanto de endereco
SELECT *
FROM pessoa pe
-- juntando outra tabela
-- no final: como eu vou conseguir duas tabelas em uma unica consulta? por meio da chave estrangeira
INNER JOIN endereco en ON en.id_pessoa = pe.id;



SELECT pessoa.id as codigo_pessoa,
	pessoa.nome,
	pessoa.data_nascimento,
	endereco.cidade,
	endereco.uf,
	endereco.id
FROM pessoa
INNER JOIN endereco ON endereco.id_pessoa = pessoa.id;

-- select from inner join: select de mais de uma tabela 


SELECT pessoa.id as codigo_pessoa,
	pessoa.nome,
	pessoa.data_nascimento,
	endereco.cidade,
	endereco.uf,
	endereco.id as codigo_endereco
	
FROM pessoa
INNER JOIN endereco ON endereco.id_pessoa = pessoa.id;




-- select from inner join: select de mais de uma tabela 


SELECT pessoa.id as codigo_pessoa,
	pessoa.nome,
	endereco.uf	
FROM pessoa
INNER JOIN endereco ON endereco.id_pessoa = pessoa.id
INNER JOIN contato ON contato.id_pessoa = pessoa.id;


-- select from inner join: select de mais de uma tabela 


SELECT pessoa.id as codigo_pessoa,
	pessoa.nome,
	endereco.uf,
	contato.*
	-- isso quer dizer que quero todos os campos da tabela contato
FROM pessoa
INNER JOIN endereco ON endereco.id_pessoa = pessoa.id
INNER JOIN contato ON contato.id_pessoa = pessoa.id;

-- select from inner join: select de mais de uma tabela 


SELECT pessoa.id as codigo_pessoa,
	pessoa.nome,
	endereco.uf,
	contato.*
	-- isso quer dizer que quero todos os campos da tabela contato
FROM pessoa
INNER JOIN endereco ON endereco.id_pessoa = pessoa.id
INNER JOIN contato ON contato.id_pessoa = pessoa.id
WHERE endereco.uf = 'AB' AND contato.email IS NOT NULL;
-- where sempre vai no final do select, so nao vem antes do order e do groupby


SELECT pa.plano_saude
FROM paciente pa
INNER JOIN pessoa pe ON pe.id = pa.id_pessoa;



SELECT pe.nome,
	pa.plano_saude
FROM paciente pa
INNER JOIN pessoa pe ON  pe.id = pa.id_pessoa;




SELECT
	pe.nome,
	pa.plano_saude,
	co.data
FROM consulta co
INNER JOIN paciente pa ON co.id_paciente = pa.id
INNER JOIN pessoa pe ON pa.id_pessoa = pe.id;




SELECT
	pe.nome,
	pa.plano_saude,
	co.data,
	me.especialidade
FROM consulta co
INNER JOIN paciente pa ON co.id_paciente = pa.id
INNER JOIN pessoa pe ON pa.id_pessoa = pe.id
INNER JOIN medico me ON co.id_medico = me.id





SELECT
	pe.nome,
	pa.plano_saude,
	co.data,
	me.especialidade,
	pem.nome
FROM consulta co
INNER JOIN paciente pa ON co.id_paciente = pa.id
INNER JOIN pessoa pe ON pa.id_pessoa = pe.id
INNER JOIN medico me ON co.id_medico = me.id
INNER JOIN pessoa pem ON pem.id = me.id_pessoa;



UPDATE contato SET email = 'lalala@helenamagaldi.com'
WHERE id = 2;
-- updating content




