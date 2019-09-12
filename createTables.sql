CREATE TABLE "bdreceita"
(
    id_receita serial NOT NULL,
    tipo character varying(10) NOT NULL,
    valor double precision NOT NULL,
    data_recebimento date NOT NULL,
    PRIMARY KEY (id_receita)
)

INSERT INTO bdreceita (tipo, valor, data_recebimento) 
VALUES ('salário', 2000.00, '2019-01-10'), ('salário', 2010.00, '2019-02-10'), ('salário', 2005.00, '2019-03-10');

--SELECT SUM valor FROM receita WHERE data_recebimento(apenas mes)

CREATE TABLE "bdorcamento"
(
    id_orcamento serial NOT NULL,
    tipo character varying(10) NOT NULL,
    valor double precision NOT NULL,
    PRIMARY KEY (id_orcamento)
);

INSERT INTO bdorcamento (tipo, valor) 
VALUES ('Hospedagem', 1500.00), ('Transporte', 2100.00), ('Aliment', 500.00), ('Seguro', 100.00);


--SELECT SUM valor FROM orcamento;


CREATE TABLE "bdtipodespesa"
(
    id_tipo serial NOT NULL,
    nome character varying(10) NOT NULL,
    PRIMARY KEY (id_tipo)
);

INSERT INTO bdtipodespesa (nome) VALUES ('Mensal'), ('Constante'), ('Rara'), ('Emergencia');

CREATE TABLE "bddespesa"
(
    id_despesa serial NOT NULL,
    id_tipo integer NOT NULL,
    valor double precision NOT NULL,
    data_despesa date NOT NULL,
    descricao character varying(10) NOT NULL,
    PRIMARY KEY (id_despesa),
    CONSTRAINT tipo_despesa FOREIGN KEY (id_tipo)
        REFERENCES "bdtipodespesa" (id_tipo) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

INSERT INTO bddespesa (id_tipo, valor, data_despesa, descricao) 
VALUES (1, 800.00, '2019-01-11', 'aluguel'), (3, 100.00, '2019-02-10', 'conser.máq'), (2, 200.00, '2019-01-08', 'recargTRI'), (4, 50.00, '2019-01-30', 'CopiaChave');

--SELECT SUM valor FROM despesas WHERE data_despesa(apenas mes)

--(SELECT SUM valor FROM receita WHERE data_despesa(apenas mes)) - (SELECT SUM valor FROM despesas WHERE data(apenas mes))
