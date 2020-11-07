ALTER TABLE pessoa
    ADD CONSTRAINT pessoa_cpf_unique 
    UNIQUE (data_nascimento, nome)

-- constrains servem para adicionar tratamento especial a algum campo.
-- unique tb eh um tipo de constraint. diz que o valor do campo tem que ser unico, sem nenhuim, outro regustro com o mesmo valor 
-- constraints sempre tem um tipo. nesse caso, ela é unique.

ALTER TABLE pessoa
    DROP CONSTRAINT pessoa_cpf_unique




ALTER TABLE pessoa
    ADD CONSTRAINT pessoa_cpf_unique
	unique (cpf)


ALTER TABLE pessoa
    ADD COLUMN idade varchar(3)  

    -- ATUALIZAR REGISTRO DE PESSOA EM PESSOA DA TABELA

UPDATE pessoa SET idade = '28'
-- se executar assim todo mundo vai ter 28 anos
-- entao:
WHERE id = 1

-- para atualizar outra pessoa: 
UPDATE pessoa SET idade = '30'
WHERE id = 2


-- empty, not null

ALTER TABLE pessoa
	ALTER COLUMN idade TYPE integer
--

UPDATE pessoa SET idade = ''
WHERE id = 3;


-- atividade
ALTER TABLE pessoa 
	ADD COLUMN ativo boolean DEFAULT false NOT NULL 
	-- muito usado para delecao logica: deleta-se um ativo, mas de maneira logica. tem um campo para dizer se o arquivo esta ativo ou nao, deletado ou nao. fica como verdadeiro ou falso para fins de historico e etc.
	-- o sistema e servicoes nao contarão mais com esse campo. 
	
	-- true or false

-- ate agora tudo false, agora estou mudando tudo para true. lembrando que o tivo eh simplesmente mais um campo na tabela     
UPDATE pessoa SET ativo = true


-- nao tem mais referencia pendendo da chave estrangeira. vai ser apenas um campo qualquer, com qualquer valor 
-- excluindo todo mundo que tem a chave estrangeira da pessoa
ALTER TABLE contato
    DROP CONSTRAINT contato_id_pessoa_fkey;

ALTER TABLE endereco
    DROP CONSTRAINT endereco_id_pessoa_fkey;

ALTER TABLE paciente
    DROP CONSTRAINT paciente_id_pessoa_fkey;

ALTER TABLE medico
    DROP CONSTRAINT medico_id_pessoa_fkey;





ALTER TABLE contato
	ADD CONSTRAINT contato_id_pessoa_fkey
	FOREIGN KEY (id_pessoa)
	REFERENCES pessoa(id)
	ON DELETE CASCADE;
	-- excluir mesmo se referenciaado em outra tabela, pois comando cascade vai excluir todo mundo



-- fazer a mesma coisa do delete cascade com endereco
ALTER TABLE endereco
	ADD CONSTRAINT endereco_id_pessoa_fkey
	FOREIGN KEY (id_pessoa)
	REFERENCES pessoa(id)
	ON DELETE CASCADE;
	-- excluir mesmo se referenciaado em outra tabela, pois comando cascade vai excluir todo mundo


    ALTER TABLE medico
    ADD CONSTRAINT medico_id_pessoa_fkey
    FOREIGN KEY (id_pessoa)
    REFERENCES pessoa(id)
    ON DELETE CASCADE;

        ALTER TABLE paciente
    ADD CONSTRAINT paciente_id_pessoa_fkey
    FOREIGN KEY (id_pessoa)
    REFERENCES pessoa(id)
    ON DELETE CASCADE;


ALTER TABLE consulta
    DROP CONSTRAINT consulta_id_medico_fkey,
    DROP CONSTRAINT consulta_id_paciente_fkey;



    ALTER TABLE consulta
    ADD CONSTRAINT consulta_id_medico_fkey
    FOREIGN KEY (id_medico)
    REFERENCES medico(id)
    ON DELETE CASCADE,

    ADD CONSTRAINT consulta_id_paciente_fkey
    FOREIGN KEY (id_paciente)
    REFERENCES paciente(id)
    ON DELETE CASCADE;



-- deletar pessoa de todas, ja que usei o on delete cascate
DELETE FROM pessoa
WHERE ID = 3;


-- transaction: executamos varios comandos e so salvamos a execucao se tudo der certo, senao podemos cancelar tudo para nao deixar metade feito e metade nao feito
-- visualmente ate aqui nao mudou nada, mas começamos uma transacao. todo o seguinte estara dentro dessa transacao que iniciei
-- nesse caso eu quero inserir uma pessoa nova:
-- com o returning ID, a pessoa sera inseridade e o resultado disso sera um valor que sera a ID

BEGIN;

INSERT INTO pessoa (nome, data_nascimento, cpf, idade, ativo)
VALUES ('Keila', '1995-11-07', '55555555555', 25, true)
RETURNING id;

INSERT INTO paciente (plano_saude, id_pessoa)
VALUES (
    'unimed',
    5
);

SELECT * FROM pessoa;

COMMIT;

ROLLBACK;