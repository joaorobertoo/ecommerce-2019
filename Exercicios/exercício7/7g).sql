select count(*),e.nome,e.id
from empresa e
join ficha f on(e.id=empresa_acidente)
group by e.nome, e.id 
order by count(*) desc limit 10