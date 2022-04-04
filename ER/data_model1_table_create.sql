CREATE TABLE public.pessoa (
	pessoaid SERIAL NOT NULL,
	possuideficiencia boolean NOT NULL,
	racacorid integer NOT NULL,
	sexo VARCHAR(20) NOT NULL,
	idade integer NOT NULL,
	identificador integer NOT NULL,
	PRIMARY KEY (pessoaid)
);

CREATE INDEX ON public.pessoa
	(racacorid);


CREATE TABLE public.endereco (
	enderecoid SERIAL NOT NULL,
	municipioid integer NOT NULL,
	pessoaid integer NOT NULL,
	PRIMARY KEY (enderecoid)
);

CREATE INDEX ON public.endereco
	(municipioid);
CREATE INDEX ON public.endereco
	(pessoaid);


CREATE TABLE public.estado (
	estadoid SERIAL NOT NULL,
	nome varchar(100) NOT NULL,
	PRIMARY KEY (estadoid)
);


CREATE TABLE public.municipio (
	municipioid SERIAL NOT NULL,
	nome varchar(100) NOT NULL,
	estadoid integer NOT NULL,
	PRIMARY KEY (municipioid)
);

CREATE INDEX ON public.municipio
	(estadoid);


CREATE TABLE public.fatorrisco (
	pessoaid integer NOT NULL,
	tipofatorriscoid integer NOT NULL,
	PRIMARY KEY (pessoaid, tipofatorriscoid)
);


CREATE TABLE public.tipofatorrisco (
	tipofatorriscoid SERIAL NOT NULL,
	nome varchar(100) NOT NULL,
	grupofatorriscoid integer NOT NULL,
	PRIMARY KEY (tipofatorriscoid)
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
	tiposintomaid SERIAL NOT NULL,
	nome varchar(100) NOT NULL,
	PRIMARY KEY (tiposintomaid)
);


CREATE TABLE public.tipoteste (
	tipotesteid SERIAL NOT NULL,
	nome varchar(50) NOT NULL,
	PRIMARY KEY (tipotesteid)
);


CREATE TABLE public.evolucao (
	evolucaoid SERIAL NOT NULL,
	dataevolucao timestamp with time zone NOT NULL,
	pessoaid integer NOT NULL,
	tipoevolucaoid integer NOT NULL,
	PRIMARY KEY (evolucaoid)
);

CREATE INDEX ON public.evolucao
	(pessoaid);
CREATE INDEX ON public.evolucao
	(tipoevolucaoid);


CREATE TABLE public.tipoevolucao (
	tipoevolucaoid SERIAL NOT NULL,
	nome varchar(20) NOT NULL,
	PRIMARY KEY (tipoevolucaoid)
);


CREATE TABLE public.racacor (
	racacorid SERIAL NOT NULL,
	nome varchar(20) NOT NULL,
	PRIMARY KEY (racacorid)
);


CREATE TABLE public.tiporesultado (
	tiporesultadoid SERIAL NOT NULL,
	nome VARCHAR(20) NOT NULL,
	PRIMARY KEY (tiporesultadoid)
);


CREATE TABLE public.pessoaracacor (
	pessoaid integer NOT NULL,
	racacorid integer NOT NULL,
	PRIMARY KEY (pessoaid, racacorid)
);


CREATE TABLE public.grupofatorrisco (
	grupofatorriscoid SERIAL NOT NULL,
	nome VARCHAR(50) NOT NULL,
	categoriafatorriscoid integer NOT NULL,
	PRIMARY KEY (grupofatorriscoid)
);

CREATE INDEX ON public.grupofatorrisco
	(categoriafatorriscoid);


CREATE TABLE public.categoriafatorrisco (
	categoriafatorriscoid SERIAL NOT NULL,
	nome varchar(50) NOT NULL,
	PRIMARY KEY (categoriafatorriscoid)
);


CREATE TABLE public.exame (
	exameid SERIAL NOT NULL,
	pessoaid integer NOT NULL,
	tipotesteid integer NOT NULL,
	dataexame timestamp with time zone NOT NULL,
	tiporesultadoid integer NOT NULL,
	PRIMARY KEY (exameid)
);

CREATE INDEX ON public.exame
	(pessoaid);
CREATE INDEX ON public.exame
	(tipotesteid);
CREATE INDEX ON public.exame
	(tiporesultadoid);


CREATE TABLE public.diagnosticopessoa (
	diagnosticoid SERIAL NOT NULL,
	pessoaid integer NOT NULL,
	tiporesultadoid integer NOT NULL,
	datadiagnostico timestamp with time zone NOT NULL,
	PRIMARY KEY (diagnosticoid)
);

CREATE INDEX ON public.diagnosticopessoa
	(pessoaid);
CREATE INDEX ON public.diagnosticopessoa
	(tiporesultadoid);


ALTER TABLE public.endereco ADD CONSTRAINT FK_endereco__municipioid FOREIGN KEY (municipioid) REFERENCES public.municipio(municipioid);
ALTER TABLE public.endereco ADD CONSTRAINT FK_endereco__pessoaid FOREIGN KEY (pessoaid) REFERENCES public.pessoa(pessoaid);
ALTER TABLE public.municipio ADD CONSTRAINT FK_municipio__estadoid FOREIGN KEY (estadoid) REFERENCES public.estado(estadoid);
ALTER TABLE public.fatorrisco ADD CONSTRAINT FK_fatorrisco__pessoaid FOREIGN KEY (pessoaid) REFERENCES public.pessoa(pessoaid);
ALTER TABLE public.fatorrisco ADD CONSTRAINT FK_fatorrisco__tipofatorriscoid FOREIGN KEY (tipofatorriscoid) REFERENCES public.tipofatorrisco(tipofatorriscoid);
ALTER TABLE public.tipofatorrisco ADD CONSTRAINT FK_tipofatorrisco__grupofatorriscoid FOREIGN KEY (grupofatorriscoid) REFERENCES public.grupofatorrisco(grupofatorriscoid);
ALTER TABLE public.sintomas ADD CONSTRAINT FK_sintomas__pessoaid FOREIGN KEY (pessoaid) REFERENCES public.pessoa(pessoaid);
ALTER TABLE public.sintomas ADD CONSTRAINT FK_sintomas__tiposintomaid FOREIGN KEY (tiposintomaid) REFERENCES public.tiposintoma(tiposintomaid);
ALTER TABLE public.evolucao ADD CONSTRAINT FK_evolucao__pessoaid FOREIGN KEY (pessoaid) REFERENCES public.pessoa(pessoaid);
ALTER TABLE public.evolucao ADD CONSTRAINT FK_evolucao__tipoevolucaoid FOREIGN KEY (tipoevolucaoid) REFERENCES public.tipoevolucao(tipoevolucaoid);
ALTER TABLE public.pessoaracacor ADD CONSTRAINT FK_pessoaracacor__pessoaid FOREIGN KEY (pessoaid) REFERENCES public.pessoa(pessoaid);
ALTER TABLE public.pessoaracacor ADD CONSTRAINT FK_pessoaracacor__racacorid FOREIGN KEY (racacorid) REFERENCES public.racacor(racacorid);
ALTER TABLE public.grupofatorrisco ADD CONSTRAINT FK_grupofatorrisco__categoriafatorriscoid FOREIGN KEY (categoriafatorriscoid) REFERENCES public.categoriafatorrisco(categoriafatorriscoid);
ALTER TABLE public.exame ADD CONSTRAINT FK_exame__pessoaid FOREIGN KEY (pessoaid) REFERENCES public.pessoa(pessoaid);
ALTER TABLE public.exame ADD CONSTRAINT FK_exame__tipotesteid FOREIGN KEY (tipotesteid) REFERENCES public.tipoteste(tipotesteid);
ALTER TABLE public.exame ADD CONSTRAINT FK_exame__tiporesultadoid FOREIGN KEY (tiporesultadoid) REFERENCES public.tiporesultado(tiporesultadoid);
ALTER TABLE public.diagnosticopessoa ADD CONSTRAINT FK_diagnosticopessoa__pessoaid FOREIGN KEY (pessoaid) REFERENCES public.pessoa(pessoaid);
ALTER TABLE public.diagnosticopessoa ADD CONSTRAINT FK_diagnosticopessoa__tiporesultadoid FOREIGN KEY (tiporesultadoid) REFERENCES public.tiporesultado(tiporesultadoid);