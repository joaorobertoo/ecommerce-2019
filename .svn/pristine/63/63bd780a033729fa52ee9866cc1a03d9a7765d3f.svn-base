select e.nome_empregado
from empregado as e,trabalha as t,companhia as c
where c.cidade = e.cidade and e.nome_empregado = t.nome_empregado and t.nome_companhia = c.nome_companhia;



select e.nome_empregado
from empregado e
join trabalha t on (e.nome_empregado = t.nome_empregado)
join companhia c on (t.nome_companhia = c.nome_companhia)
where c.cidade = e.cidade;

