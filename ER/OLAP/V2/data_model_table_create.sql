CREATE TABLE public.fatoobito (
	dim_cod_teste integer NOT NULL,
	dim_cod_tempo integer NOT NULL,
	dim_cod_sintoma integer NOT NULL,
	dim_cod_comobirdade integer NOT NULL,
	dim_cod_pessoa integer NOT NULL,
	dim_cod_local integer NOT NULL
);

CREATE INDEX ON public.fatoobito
	(dim_cod_teste);
CREATE INDEX ON public.fatoobito
	(dim_cod_tempo);
CREATE INDEX ON public.fatoobito
	(dim_cod_sintoma);
CREATE INDEX ON public.fatoobito
	(dim_cod_comobirdade);
CREATE INDEX ON public.fatoobito
	(dim_cod_pessoa);
CREATE INDEX ON public.fatoobito
	(dim_cod_local);


CREATE TABLE public.dimtempo (
	dim_cod_tempo integer NOT NULL,
	dia integer,
	mes integer,
	ano integer,
	diasemana VARCHAR(50),
	quarter VARCHAR(50),
	nomemes VARCHAR(50),
	codigo integer,
	PRIMARY KEY (dim_cod_tempo)
);


CREATE TABLE public.dimcomobirdade (
	dim_cod_comobirdade integer NOT NULL,
	nome VARCHAR(100),
	codigo integer,
	PRIMARY KEY (dim_cod_comobirdade)
);


CREATE TABLE public.dimsintoma (
	dim_cod_sintoma integer NOT NULL,
	nome VARCHAR(100),
	codigo integer,
	PRIMARY KEY (dim_cod_sintoma)
);


CREATE TABLE public.dimtestecovid (
	dim_cod_teste integer NOT NULL,
	nome VARCHAR(100),
	resultado VARCHAR(100),
	codigo integer,
	PRIMARY KEY (dim_cod_teste)
);


CREATE TABLE public.dimpessoa (
	dim_cod_pessoa integer NOT NULL,
	estadoatendimento varchar(50),
	racacor VARCHAR(50),
	faixaetaria VARCHAR(100),
	codigo integer,
	sexo varchar(50),
	PRIMARY KEY (dim_cod_pessoa)
);


CREATE TABLE public.dimlocalresidencia (
	dim_cod_local integer NOT NULL,
	municipio VARCHAR(100),
	estado VARCHAR(50),
	codigo integer,
	PRIMARY KEY (dim_cod_local)
);


ALTER TABLE public.fatoobito ADD CONSTRAINT FK_fatoobito__dim_cod_teste FOREIGN KEY (dim_cod_teste) REFERENCES public.dimtestecovid(dim_cod_teste);
ALTER TABLE public.fatoobito ADD CONSTRAINT FK_fatoobito__dim_cod_tempo FOREIGN KEY (dim_cod_tempo) REFERENCES public.dimtempo(dim_cod_tempo);
ALTER TABLE public.fatoobito ADD CONSTRAINT FK_fatoobito__dim_cod_sintoma FOREIGN KEY (dim_cod_sintoma) REFERENCES public.dimsintoma(dim_cod_sintoma);
ALTER TABLE public.fatoobito ADD CONSTRAINT FK_fatoobito__dim_cod_comobirdade FOREIGN KEY (dim_cod_comobirdade) REFERENCES public.dimcomobirdade(dim_cod_comobirdade);
ALTER TABLE public.fatoobito ADD CONSTRAINT FK_fatoobito__dim_cod_pessoa FOREIGN KEY (dim_cod_pessoa) REFERENCES public.dimpessoa(dim_cod_pessoa);
ALTER TABLE public.fatoobito ADD CONSTRAINT FK_fatoobito__dim_cod_local FOREIGN KEY (dim_cod_local) REFERENCES public.dimlocalresidencia(dim_cod_local);