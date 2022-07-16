CREATE TABLE public.fatoobito (
    fidtestecovid integer NOT NULL,
    fidtempo integer NOT NULL,
    fidsintoma integer NOT NULL,
    fidcomobirdade integer NOT NULL,
    fidpessoa integer NOT NULL,
    column1  NOT NULL
);

CREATE INDEX ON public.fatoobito
    (fidtestecovid);
CREATE INDEX ON public.fatoobito
    (fidtempo);
CREATE INDEX ON public.fatoobito
    (fidsintoma);
CREATE INDEX ON public.fatoobito
    (fidcomobirdade);
CREATE INDEX ON public.fatoobito
    (fidpessoa);


CREATE TABLE public.fatopessoa (
);


CREATE TABLE public.dimenderecoresidencial (
);


CREATE TABLE public.dimenderecoatendimento (
);


CREATE TABLE public.dimtempo (
    id integer NOT NULL,
    dia integer NOT NULL,
    mes integer NOT NULL,
    ano integer NOT NULL,
    diasemana VARCHAR(20) NOT NULL,
    quarter VARCHAR(20) NOT NULL,
    nomemes VARCHAR(20) NOT NULL,
    PRIMARY KEY (id)
);


CREATE TABLE public.dimcomobirdade (
    id integer NOT NULL,
    nome VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);


CREATE TABLE public.dimsintoma (
    id integer NOT NULL,
    nome VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);


CREATE TABLE public.dimtestecovid (
    id integer NOT NULL,
    nome VARCHAR(100) NOT NULL,
    resultado VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);


CREATE TABLE public.dimpessoa (
    id integer NOT NULL,
    estadoatendimento integer NOT NULL,
    racacor VARCHAR(20) NOT NULL,
    faixaetaria VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

CREATE INDEX ON public.dimpessoa
    (estadoatendimento);


CREATE TABLE public.dimlocalresidencia (
    id integer NOT NULL,
    municipio VARCHAR(100) NOT NULL,
    estado VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
);


CREATE TABLE public.entity1 (
);

