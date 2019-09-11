CREATE TABLE public."Receita"
(
    id_receita serial NOT NULL,
    tipo character varying(10) NOT NULL,
    valor double precision NOT NULL,
    data date NOT NULL,
    PRIMARY KEY (id_receita)
);

--SELECT SUM valor FROM receita WHERE data(apenas mes)

CREATE TABLE public."Orcamento"
(
    id_orcamento serial NOT NULL,
    tipo character varying(10) NOT NULL,
    valor double precision NOT NULL,
    PRIMARY KEY (id_orcamento)
);

--SELECT SUM valor FROM orcamento;


CREATE TABLE public."TipoDespesa"
(
    id_tipo serial NOT NULL,
    nome character varying(10) NOT NULL,
    PRIMARY KEY (id_tipo)
);

CREATE TABLE public."Despesa"
(
    id_despesa serial NOT NULL,
    id_tipo integer NOT NULL,
    valor double precision NOT NULL,
    data date NOT NULL,
    descricao character varying(10) NOT NULL,
    PRIMARY KEY (id_despesa),
    CONSTRAINT tipo_despesa FOREIGN KEY (id_tipo)
        REFERENCES public."TipoDespesa" (id_tipo) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

--SELECT SUM valor FROM despesas WHERE data(apenas mes)

--(SELECT SUM valor FROM receita WHERE data(apenas mes)) - (SELECT SUM valor FROM despesas WHERE data(apenas mes))
