-- COMOBIRDADE
ALTER TABLE "public".dimcomobirdade ADD COLUMN version INTEGER;
ALTER TABLE "public".dimcomobirdade ADD COLUMN date_from TIMESTAMP;
ALTER TABLE "public".dimcomobirdade ADD COLUMN date_to TIMESTAMP;
CREATE INDEX idx_dimcomobirdade_lookup ON "public".dimcomobirdade(codigo);
CREATE INDEX idx_dimcomobirdade_tk ON "public".dimcomobirdade(dim_cod_comobirdade);

-- LOCAL RESIDENCIA
ALTER TABLE "public".dimlocalresidencia ADD COLUMN version INTEGER;
ALTER TABLE "public".dimlocalresidencia ADD COLUMN date_from TIMESTAMP;
ALTER TABLE "public".dimlocalresidencia ADD COLUMN date_to TIMESTAMP;
CREATE INDEX idx_dimlocalresidencia_lookup ON "public".dimlocalresidencia(codigo);
CREATE INDEX idx_dimlocalresidencia_tk ON "public".dimlocalresidencia(dim_cod_local);

-- SINTOMA
ALTER TABLE "public".dimsintoma ADD COLUMN version INTEGER;
ALTER TABLE "public".dimsintoma ADD COLUMN date_from TIMESTAMP;
ALTER TABLE "public".dimsintoma ADD COLUMN date_to TIMESTAMP;
CREATE INDEX idx_dimsintoma_lookup ON "public".dimsintoma(codigo);
CREATE INDEX idx_dimsintoma_tk ON "public".dimsintoma(dim_cod_sintoma);

-- TEMPO
ALTER TABLE "public".dimtempo ADD COLUMN version INTEGER;
ALTER TABLE "public".dimtempo ADD COLUMN date_from TIMESTAMP;
ALTER TABLE "public".dimtempo ADD COLUMN date_to TIMESTAMP;
CREATE INDEX idx_dimtempo_lookup ON "public".dimtempo(codigo);
CREATE INDEX idx_dimtempo_tk ON "public".dimtempo(dim_cod_tempo);


-- Teste Covid
ALTER TABLE "public".dimtestecovid ADD COLUMN version INTEGER;
ALTER TABLE "public".dimtestecovid ADD COLUMN date_from TIMESTAMP;
ALTER TABLE "public".dimtestecovid ADD COLUMN date_to TIMESTAMP;
CREATE INDEX idx_dimtestecovid_lookup ON "public".dimtestecovid(codigo);
CREATE INDEX idx_dimtestecovid_tk ON "public".dimtestecovid(dim_cod_teste);

-- Pessoa
ALTER TABLE "public".dimpessoa ADD COLUMN version INTEGER;
ALTER TABLE "public".dimpessoa ADD COLUMN date_from TIMESTAMP;
ALTER TABLE "public".dimpessoa ADD COLUMN date_to TIMESTAMP;
CREATE INDEX idx_dimpessoa_lookup ON "public".dimpessoa(codigo);
CREATE INDEX idx_dimpessoa_tk ON "public".dimpessoa(dim_cod_pessoa);

