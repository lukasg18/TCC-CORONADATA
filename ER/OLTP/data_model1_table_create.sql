CREATE TABLE public.pessoa (
	id SERIAL NOT NULL,
	sexoid integer NOT NULL,
	codplanilha integer NOT NULL,
	faixaetariaid integer NOT NULL,
	PRIMARY KEY (id)
);

CREATE INDEX ON public.pessoa
	(sexoid);
CREATE INDEX ON public.pessoa
	(faixaetariaid);


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
	dataevolucao date NOT NULL,
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


CREATE TABLE public.pessoaracacor (
	pessoaid integer NOT NULL,
	racacorid integer NOT NULL,
	PRIMARY KEY (pessoaid, racacorid)
);


CREATE TABLE public.teste (
	id SERIAL NOT NULL,
	tipotesteid integer NOT NULL,
	dataexame timestamp with time zone NOT NULL,
	tiporesultado integer NOT NULL,
	pesooaid integer NOT NULL,
	PRIMARY KEY (id)
);

CREATE INDEX ON public.teste
	(tipotesteid);
CREATE INDEX ON public.teste
	(tiporesultado);
CREATE INDEX ON public.teste
	(pesooaid);


CREATE TABLE public.enderecoatendimento (
	pessoaid integer NOT NULL,
	estadoid integer NOT NULL,
	PRIMARY KEY (pessoaid, estadoid)
);


CREATE TABLE public.sexo (
	id SERIAL NOT NULL,
	tipo VARCHAR(20) NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE public.faixaetaria (
	id SERIAL NOT NULL,
	faixa VARCHAR(100) NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE public.tiporesultado (
	id SERIAL NOT NULL,
	nome VARCHAR(20) NOT NULL,
	PRIMARY KEY (id)
);


ALTER TABLE public.pessoa ADD CONSTRAINT FK_pessoa__sexoid FOREIGN KEY (sexoid) REFERENCES public.sexo(id);
ALTER TABLE public.pessoa ADD CONSTRAINT FK_pessoa__faixaetariaid FOREIGN KEY (faixaetariaid) REFERENCES public.faixaetaria(id);
ALTER TABLE public.enderecoresidencial ADD CONSTRAINT FK_enderecoresidencial__municipioid FOREIGN KEY (municipioid) REFERENCES public.municipio(id);
ALTER TABLE public.enderecoresidencial ADD CONSTRAINT FK_enderecoresidencial__pessoaid FOREIGN KEY (pessoaid) REFERENCES public.pessoa(id);
ALTER TABLE public.municipio ADD CONSTRAINT FK_municipio__estadoid FOREIGN KEY (estadoid) REFERENCES public.estado(id);
ALTER TABLE public.comorbidade ADD CONSTRAINT FK_comorbidade__pessoaid FOREIGN KEY (pessoaid) REFERENCES public.pessoa(id);
ALTER TABLE public.comorbidade ADD CONSTRAINT FK_comorbidade__tipocomorbidadeid FOREIGN KEY (tipocomorbidadeid) REFERENCES public.tipocomorbidade(id);
ALTER TABLE public.sintoma ADD CONSTRAINT FK_sintoma__pessoaid FOREIGN KEY (pessoaid) REFERENCES public.pessoa(id);
ALTER TABLE public.sintoma ADD CONSTRAINT FK_sintoma__tiposintomaid FOREIGN KEY (tiposintomaid) REFERENCES public.tiposintoma(id);
ALTER TABLE public.evolucao ADD CONSTRAINT FK_evolucao__pessoaid FOREIGN KEY (pessoaid) REFERENCES public.pessoa(id);
ALTER TABLE public.evolucao ADD CONSTRAINT FK_evolucao__tipoevolucaoid FOREIGN KEY (tipoevolucaoid) REFERENCES public.tipoevolucao(id);
ALTER TABLE public.pessoaracacor ADD CONSTRAINT FK_pessoaracacor__pessoaid FOREIGN KEY (pessoaid) REFERENCES public.pessoa(id);
ALTER TABLE public.pessoaracacor ADD CONSTRAINT FK_pessoaracacor__racacorid FOREIGN KEY (racacorid) REFERENCES public.racacor(id);
ALTER TABLE public.teste ADD CONSTRAINT FK_teste__tipotesteid FOREIGN KEY (tipotesteid) REFERENCES public.tipoteste(id);
ALTER TABLE public.teste ADD CONSTRAINT FK_teste__tiporesultado FOREIGN KEY (tiporesultado) REFERENCES public.tiporesultado(id);
ALTER TABLE public.teste ADD CONSTRAINT FK_teste__pesooaid FOREIGN KEY (pesooaid) REFERENCES public.pessoa(id);
ALTER TABLE public.enderecoatendimento ADD CONSTRAINT FK_enderecoatendimento__pessoaid FOREIGN KEY (pessoaid) REFERENCES public.pessoa(id);
ALTER TABLE public.enderecoatendimento ADD CONSTRAINT FK_enderecoatendimento__estadoid FOREIGN KEY (estadoid) REFERENCES public.estado(id);