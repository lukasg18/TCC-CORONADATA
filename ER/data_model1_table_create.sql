CREATE TABLE public.pessoa (
	id SERIAL NOT NULL,
	sexo integer NOT NULL,
	idade integer NOT NULL,
	identificador integer NOT NULL,
	PRIMARY KEY (id)
);

CREATE INDEX ON public.pessoa
	(sexo);


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


CREATE TABLE public.comorbidade (
	pessoaid integer NOT NULL,
	tipocomorbidadeid integer NOT NULL,
	PRIMARY KEY (pessoaid, tipocomorbidadeid)
);


CREATE TABLE public.tipocomorbidade (
	id SERIAL NOT NULL,
	nome varchar(100) NOT NULL,
	grupocomorbidadeid integer NOT NULL,
	PRIMARY KEY (id)
);

CREATE INDEX ON public.tipocomorbidade
	(grupocomorbidadeid);


CREATE TABLE public.sintoma (
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


CREATE TABLE public.grupocomorbidade (
	id SERIAL NOT NULL,
	nome VARCHAR(50) NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE public.exame (
	id SERIAL NOT NULL,
	tipotesteid integer NOT NULL,
	dataexame timestamp with time zone NOT NULL,
	PRIMARY KEY (id)
);

CREATE INDEX ON public.exame
	(tipotesteid);


CREATE TABLE public.diagnostico (
	id SERIAL NOT NULL,
	pessoaid integer NOT NULL,
	tiporesultadoid integer NOT NULL,
	datadiagnostico timestamp with time zone NOT NULL,
	PRIMARY KEY (id)
);

CREATE INDEX ON public.diagnostico
	(pessoaid);
CREATE INDEX ON public.diagnostico
	(tiporesultadoid);


CREATE TABLE public.enderecoatendimento (
	pessoaid integer NOT NULL,
	estadoid integer NOT NULL,
	PRIMARY KEY (pessoaid, estadoid)
);


CREATE TABLE public.examediagnostico (
	diagnosticoid integer NOT NULL,
	exameid integer NOT NULL,
	PRIMARY KEY (diagnosticoid, exameid)
);


CREATE TABLE public.sexo (
	id SERIAL NOT NULL,
	tipo VARCHAR(20) NOT NULL,
	PRIMARY KEY (id)
);


ALTER TABLE public.pessoa ADD CONSTRAINT FK_pessoa__sexo FOREIGN KEY (sexo) REFERENCES public.sexo(id);
ALTER TABLE public.enderecoresidencial ADD CONSTRAINT FK_enderecoresidencial__municipioid FOREIGN KEY (municipioid) REFERENCES public.municipio(id);
ALTER TABLE public.enderecoresidencial ADD CONSTRAINT FK_enderecoresidencial__pessoaid FOREIGN KEY (pessoaid) REFERENCES public.pessoa(id);
ALTER TABLE public.municipio ADD CONSTRAINT FK_municipio__estadoid FOREIGN KEY (estadoid) REFERENCES public.estado(id);
ALTER TABLE public.comorbidade ADD CONSTRAINT FK_comorbidade__pessoaid FOREIGN KEY (pessoaid) REFERENCES public.pessoa(id);
ALTER TABLE public.comorbidade ADD CONSTRAINT FK_comorbidade__tipocomorbidadeid FOREIGN KEY (tipocomorbidadeid) REFERENCES public.tipocomorbidade(id);
ALTER TABLE public.tipocomorbidade ADD CONSTRAINT FK_tipocomorbidade__grupocomorbidadeid FOREIGN KEY (grupocomorbidadeid) REFERENCES public.grupocomorbidade(id);
ALTER TABLE public.sintoma ADD CONSTRAINT FK_sintoma__pessoaid FOREIGN KEY (pessoaid) REFERENCES public.pessoa(id);
ALTER TABLE public.sintoma ADD CONSTRAINT FK_sintoma__tiposintomaid FOREIGN KEY (tiposintomaid) REFERENCES public.tiposintoma(id);
ALTER TABLE public.evolucao ADD CONSTRAINT FK_evolucao__pessoaid FOREIGN KEY (pessoaid) REFERENCES public.pessoa(id);
ALTER TABLE public.evolucao ADD CONSTRAINT FK_evolucao__tipoevolucaoid FOREIGN KEY (tipoevolucaoid) REFERENCES public.tipoevolucao(id);
ALTER TABLE public.pessoaracacor ADD CONSTRAINT FK_pessoaracacor__pessoaid FOREIGN KEY (pessoaid) REFERENCES public.pessoa(id);
ALTER TABLE public.pessoaracacor ADD CONSTRAINT FK_pessoaracacor__racacorid FOREIGN KEY (racacorid) REFERENCES public.racacor(id);
ALTER TABLE public.exame ADD CONSTRAINT FK_exame__tipotesteid FOREIGN KEY (tipotesteid) REFERENCES public.tipoteste(id);
ALTER TABLE public.diagnostico ADD CONSTRAINT FK_diagnostico__pessoaid FOREIGN KEY (pessoaid) REFERENCES public.pessoa(id);
ALTER TABLE public.diagnostico ADD CONSTRAINT FK_diagnostico__tiporesultadoid FOREIGN KEY (tiporesultadoid) REFERENCES public.tiporesultado(id);
ALTER TABLE public.enderecoatendimento ADD CONSTRAINT FK_enderecoatendimento__pessoaid FOREIGN KEY (pessoaid) REFERENCES public.pessoa(id);
ALTER TABLE public.enderecoatendimento ADD CONSTRAINT FK_enderecoatendimento__estadoid FOREIGN KEY (estadoid) REFERENCES public.estado(id);
ALTER TABLE public.examediagnostico ADD CONSTRAINT FK_examediagnostico__diagnosticoid FOREIGN KEY (diagnosticoid) REFERENCES public.diagnostico(id);
ALTER TABLE public.examediagnostico ADD CONSTRAINT FK_examediagnostico__exameid FOREIGN KEY (exameid) REFERENCES public.exame(id);