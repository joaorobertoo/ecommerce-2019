select e.nome_empregado
from empregado e
join trabalha t on (e.nome_empregado = t.nome_empregado)
where salario >(
select max(salario)
from empregado e
join trabalha t on(e.nome_empregado = t.nome_empregado)
where nome_companhia="Byte Corporation" and;);