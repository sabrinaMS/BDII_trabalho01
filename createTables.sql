CCREATE TABLE "BDII_trab1"."Receita"
(
    id_receita serial NOT NULL,
    tipo character varying(10) NOT NULL,
    valor double precision NOT NULL,
    data date NOT NULL,
    PRIMARY KEY (id_receita)
)

INSERT INTO "BDII_trab1".Receita (tipo, valor, data) 
VALUES ("salário", 2000.00, 2019-01-10), ("salário", 2010.00, 2019-02-10), ("salário", 2005.00, 2019-03-10);

--SELECT SUM valor FROM receita WHERE data(apenas mes)

CREATE TABLE "BDII_trab1"."Orcamento"
(
    id_orcamento serial NOT NULL,
    tipo character varying(10) NOT NULL,
    valor double precision NOT NULL,
    PRIMARY KEY (id_orcamento)
);

INSERT INTO "BDII_trab1".Orcamento (tipo, valor) 
VALUES ("Hospedagem", 1500.00), ("Transporte", 2100.00), ("Aliment", 500.00), ("Seguro", 100.00);


--SELECT SUM valor FROM orcamento;


CREATE TABLE "BDII_trab1"."TipoDespesa"
(
    id_tipo serial NOT NULL,
    nome character varying(10) NOT NULL,
    PRIMARY KEY (id_tipo)
);

INSERT INTO "BDII_trab1".TipoDespesa (nome) 
VALUES ("Mensal"), ("Constante"), ("Rara"), ("Emergencia");

CREATE TABLE "BDII_trab1"."Despesa"
(
    id_despesa serial NOT NULL,
    id_tipo integer NOT NULL,
    valor double precision NOT NULL,
    data date NOT NULL,
    descricao character varying(10) NOT NULL,
    PRIMARY KEY (id_despesa),
    CONSTRAINT tipo_despesa FOREIGN KEY (id_tipo)
        REFERENCES "BDII_trab1"."TipoDespesa" (id_tipo) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

INSERT INTO "BDII_trab1".Despesa (id_tipo, valor, data, descricao) 
VALUES (1, 800.00, 2019-01-11, "aluguel"), (3, 100.00, 2019-02-10, "conserto máquina"), (2, 200.00, 2019-01-08, "recarga TRI"), (4, 50.00, 2019-01-30, "Copia Chave");

--SELECT SUM valor FROM despesas WHERE data(apenas mes)

--(SELECT SUM valor FROM receita WHERE data(apenas mes)) - (SELECT SUM valor FROM despesas WHERE data(apenas mes))

