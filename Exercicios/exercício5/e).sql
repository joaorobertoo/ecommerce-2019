select e1.nome_empregado
from empregado e1
join gerente g on (g.nome_empregado = e1.nome_empregado)
join empregado e2 on(e2.nome_empregado = g.nome_gerente)
where e1.rua = e2.rua and e1.cidade = e2.cidade;