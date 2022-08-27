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
	codigo integer
);


CREATE TABLE public.dimcomobirdade (
	dim_cod_comobirdade integer NOT NULL,
	nome VARCHAR(100),
	codigo integer
);


CREATE TABLE public.dimsintoma (
	dim_cod_sintoma integer NOT NULL,
	nome VARCHAR(100),
	codigo integer
);


CREATE TABLE public.dimtestecovid (
	dim_cod_teste integer NOT NULL,
	nome VARCHAR(100),
	resultado VARCHAR(100),
	codigo integer
);


CREATE TABLE public.dimpessoa (
	dim_cod_pessoa integer NOT NULL,
	estadoatendimento integer,
	racacor VARCHAR(50),
	faixaetaria VARCHAR(100),
	codigo integer
);


CREATE TABLE public.dimlocalresidencia (
	dim_cod_local integer NOT NULL,
	municipio VARCHAR(100),
	estado VARCHAR(50),
	codigo integer
);

ALTER TABLE "public".dimcomobirdade ADD COLUMN version INTEGER;
ALTER TABLE "public".dimcomobirdade ADD COLUMN date_from TIMESTAMP;
ALTER TABLE "public".dimcomobirdade ADD COLUMN date_to TIMESTAMP;
CREATE INDEX idx_dimcomobirdade_lookup ON "public".dimcomobirdade(codigo);
CREATE INDEX idx_dimcomobirdade_tk ON "public".dimcomobirdade(dim_cod_comobirdade)