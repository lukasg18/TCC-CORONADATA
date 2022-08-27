select 
	p.id as pessoaid,
	s.tipo as sexo,
	f.faixa as faixaetaria,
	codplanilha,
	r.nome as racacor,
	concat(er.pessoaid, er.municipioid) as residenciaid,
	m.nome as municipioresidencia,
	es.nome as estadoresidencia,
	concat(ea.pessoaid, ea.estadoid) as atendimentoid, 
	ess.nome as estadoatendimento,
	concat(si.pessoaid , si.tiposintomaid) as sintomaid,
	ts.nome as sintoma,
	concat(c.pessoaid, c.tipocomorbidadeid) as comobirdadeid,
	tc.nome as comobirdade,
	te.id as testeid,
	tt.nome as teste,
	tr.nome as resultadoTeste,
	tv.nome as evolucao,
	concat(ev.pessoaid, ev.tipoevolucaoid) as tempoid, 
	EXTRACT(DAY FROM ev.dataevolucao) AS dia,
	EXTRACT(MONTH FROM ev.dataevolucao) AS mes,
	EXTRACT(YEAR FROM ev.dataevolucao) AS ano,
	to_char(ev.dataevolucao, 'TMDay') AS diasemana,
	to_char(ev.dataevolucao, 'TMMonth') AS nomemes,
	'Q' || to_char(ev.dataevolucao, 'Q') AS Quartal
from pessoa p 
inner join sexo s on s.id = p.sexoid
inner join faixaetaria f on f.id = p.faixaetariaid
inner join pessoaracacor pr on pr.pessoaid = p.id 
inner join racacor r on r.id = pr.racacorid
inner join enderecoresidencial er on er.pessoaid = p.id 
inner join municipio m on m.id = er.municipioid
inner join estado es on es.id = m.estadoid 
inner join enderecoatendimento ea on ea.pessoaid = p.id 
inner join estado ess on ess.id = ea.estadoid 
inner join sintoma si on si.pessoaid = p.id 
inner join tiposintoma ts on ts.id = si.tiposintomaid 
inner join teste te on te.pesooaid = p.id 
inner join tipoteste tt on tt.id = te.tipotesteid 
inner join tiporesultado tr on tr.id = te.tiporesultadoid
inner join comorbidade c on c.pessoaid = p.id 
inner join tipocomorbidade tc on tc.id = c.tipocomorbidadeid
inner join evolucao ev on ev.pessoaid = p.id 
inner join tipoevolucao tv on tv.id = ev.tipoevolucaoid