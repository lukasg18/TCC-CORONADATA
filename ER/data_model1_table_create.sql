CREATE TABLE public.pessoa (
	id SERIAL NOT NULL,
	sexo VARCHAR(20) NOT NULL,
	idade integer NOT NULL,
	identificador integer NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE public.enderecoresidencial (
	municipioid integer NOT NULL,
	pessoaid integer NOT NULL,
	PRIMARY KEY (municipioid, pessoaid)
);


CREATE TABLE public.estado (
	id SERIAL NOT NULL,
	nome varchar(100) NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE public.municipio (
	id SERIAL NOT NULL,
	nome varchar(100) NOT NULL,
	estadoid integer NOT NULL,
	PRIMARY KEY (id)
);

CREATE INDEX ON public.municipio
	(estadoid);


CREATE TABLE public.fatorrisco (
	pessoaid integer NOT NULL,
	tipofatorriscoid integer NOT NULL,
	PRIMARY KEY (pessoaid, tipofatorriscoid)
);


CREATE TABLE public.tipofatorrisco (
	id SERIAL NOT NULL,
	nome varchar(100) NOT NULL,
	grupofatorriscoid integer NOT NULL,
	PRIMARY KEY (id)
);

CREATE INDEX ON public.tipofatorrisco
	(grupofatorriscoid);


CREATE TABLE public.sintomas (
	pessoaid integer NOT NULL,
	tiposintomaid integer NOT NULL,
	datainiciosintoma timestamp with time zone NOT NULL,
	PRIMARY KEY (pessoaid, tiposintomaid)
);


CREATE TABLE public.tiposintoma (
	id SERIAL NOT NULL,
	nome varchar(100) NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE public.tipoteste (
	id SERIAL NOT NULL,
	nome varchar(50) NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE public.evolucao (
	id SERIAL NOT NULL,
	dataevolucao timestamp with time zone NOT NULL,
	pessoaid integer NOT NULL,
	tipoevolucaoid integer NOT NULL,
	PRIMARY KEY (id)
);

CREATE INDEX ON public.evolucao
	(pessoaid);
CREATE INDEX ON public.evolucao
	(tipoevolucaoid);


CREATE TABLE public.tipoevolucao (
	id SERIAL NOT NULL,
	nome varchar(30) NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE public.racacor (
	id SERIAL NOT NULL,
	nome varchar(20) NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE public.tiporesultado (
	id SERIAL NOT NULL,
	nome VARCHAR(20) NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE public.pessoaracacor (
	pessoaid integer NOT NULL,
	racacorid integer NOT NULL,
	PRIMARY KEY (pessoaid, racacorid)
);


CREATE TABLE public.grupofatorrisco (
	id SERIAL NOT NULL,
	nome VARCHAR(50) NOT NULL,
	categoriafatorriscoid integer NOT NULL,
	PRIMARY KEY (id)
);

CREATE INDEX ON public.grupofatorrisco
	(categoriafatorriscoid);


CREATE TABLE public.categoriafatorrisco (
	id SERIAL NOT NULL,
	nome varchar(50) NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE public.exame (
	id SERIAL NOT NULL,
	pessoaid integer NOT NULL,
	tipotesteid integer NOT NULL,
	dataexame timestamp with time zone NOT NULL,
	tiporesultadoid integer NOT NULL,
	PRIMARY KEY (id)
);

CREATE INDEX ON public.exame
	(pessoaid);
CREATE INDEX ON public.exame
	(tipotesteid);
CREATE INDEX ON public.exame
	(tiporesultadoid);


CREATE TABLE public.diagnosticopessoa (
	id SERIAL NOT NULL,
	pessoaid integer NOT NULL,
	tiporesultadoid integer NOT NULL,
	datadiagnostico timestamp with time zone NOT NULL,
	PRIMARY KEY (id)
);

CREATE INDEX ON public.diagnosticopessoa
	(pessoaid);
CREATE INDEX ON public.diagnosticopessoa
	(tiporesultadoid);


CREATE TABLE public.enderecoatendimento (
	pessoaid integer NOT NULL,
	estadoid integer NOT NULL,
	PRIMARY KEY (pessoaid, estadoid)
);


ALTER TABLE public.enderecoresidencial ADD CONSTRAINT FK_enderecoresidencial__municipioid FOREIGN KEY (municipioid) REFERENCES public.municipio(id);
ALTER TABLE public.enderecoresidencial ADD CONSTRAINT FK_enderecoresidencial__pessoaid FOREIGN KEY (pessoaid) REFERENCES public.pessoa(id);
ALTER TABLE public.municipio ADD CONSTRAINT FK_municipio__estadoid FOREIGN KEY (estadoid) REFERENCES public.estado(id);
ALTER TABLE public.fatorrisco ADD CONSTRAINT FK_fatorrisco__pessoaid FOREIGN KEY (pessoaid) REFERENCES public.pessoa(id);
ALTER TABLE public.fatorrisco ADD CONSTRAINT FK_fatorrisco__tipofatorriscoid FOREIGN KEY (tipofatorriscoid) REFERENCES public.tipofatorrisco(id);
ALTER TABLE public.tipofatorrisco ADD CONSTRAINT FK_tipofatorrisco__grupofatorriscoid FOREIGN KEY (grupofatorriscoid) REFERENCES public.grupofatorrisco(id);
ALTER TABLE public.sintomas ADD CONSTRAINT FK_sintomas__pessoaid FOREIGN KEY (pessoaid) REFERENCES public.pessoa(id);
ALTER TABLE public.sintomas ADD CONSTRAINT FK_sintomas__tiposintomaid FOREIGN KEY (tiposintomaid) REFERENCES public.tiposintoma(id);
ALTER TABLE public.evolucao ADD CONSTRAINT FK_evolucao__pessoaid FOREIGN KEY (pessoaid) REFERENCES public.pessoa(id);
ALTER TABLE public.evolucao ADD CONSTRAINT FK_evolucao__tipoevolucaoid FOREIGN KEY (tipoevolucaoid) REFERENCES public.tipoevolucao(id);
ALTER TABLE public.pessoaracacor ADD CONSTRAINT FK_pessoaracacor__pessoaid FOREIGN KEY (pessoaid) REFERENCES public.pessoa(id);
ALTER TABLE public.pessoaracacor ADD CONSTRAINT FK_pessoaracacor__racacorid FOREIGN KEY (racacorid) REFERENCES public.racacor(id);
ALTER TABLE public.grupofatorrisco ADD CONSTRAINT FK_grupofatorrisco__categoriafatorriscoid FOREIGN KEY (categoriafatorriscoid) REFERENCES public.categoriafatorrisco(id);
ALTER TABLE public.exame ADD CONSTRAINT FK_exame__pessoaid FOREIGN KEY (pessoaid) REFERENCES public.pessoa(id);
ALTER TABLE public.exame ADD CONSTRAINT FK_exame__tipotesteid FOREIGN KEY (tipotesteid) REFERENCES public.tipoteste(id);
ALTER TABLE public.exame ADD CONSTRAINT FK_exame__tiporesultadoid FOREIGN KEY (tiporesultadoid) REFERENCES public.tiporesultado(id);
ALTER TABLE public.diagnosticopessoa ADD CONSTRAINT FK_diagnosticopessoa__pessoaid FOREIGN KEY (pessoaid) REFERENCES public.pessoa(id);
ALTER TABLE public.diagnosticopessoa ADD CONSTRAINT FK_diagnosticopessoa__tiporesultadoid FOREIGN KEY (tiporesultadoid) REFERENCES public.tiporesultado(id);
ALTER TABLE public.enderecoatendimento ADD CONSTRAINT FK_enderecoatendimento__pessoaid FOREIGN KEY (pessoaid) REFERENCES public.pessoa(id);
ALTER TABLE public.enderecoatendimento ADD CONSTRAINT FK_enderecoatendimento__estadoid FOREIGN KEY (estadoid) REFERENCES public.estado(id);