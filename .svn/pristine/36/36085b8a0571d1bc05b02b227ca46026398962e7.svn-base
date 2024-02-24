a) 
select sum(ficha.id)
from ficha;

b)
select sum(f.id)
from ficha f
where f.sexo = 'M';

c)
select fpc.id_parte_corpo
from ficha_parte_corpo fpc
join ficha f on (f.id = fpc.id_ficha)
where f.num_ordem ='100' and f.num_ordem='200'

d)
select count(f.id)
from ficha f
where municipio_acidente ='9659'
	and extract(year from data_hora_acidente)=2009 and extract(month from data_hora_acidente)=3

e)
select count(id)
from ficha
where extract (year from data_hora_acidente)=2011 
	and extract(month from data_hora_acidente)=1;

select count(id)
from ficha
where extract (year from data_hora_acidente)=2011 
	and extract(month from data_hora_acidente)=2;

select count(id)
from ficha
where extract (year from data_hora_acidente)=2011 
	and extract(month from data_hora_acidente)=3;

select count(id)
from ficha
where extract (year from data_hora_acidente)=2011 
	and extract(month from data_hora_acidente)=4;

select count(id)
from ficha
where extract (year from data_hora_acidente)=2011 
	and extract(month from data_hora_acidente)=5;

select count(id)
from ficha
where extract (year from data_hora_acidente)=2011 
	and extract(month from data_hora_acidente)=6;

select count(id)
from ficha
where extract (year from data_hora_acidente)=2011 
	and extract(month from data_hora_acidente)=7;

select count(id)
from ficha
where extract (year from data_hora_acidente)=2011 
	and extract(month from data_hora_acidente)=8;

select count(id)
from ficha
where extract (year from data_hora_acidente)=2011 
	and extract(month from data_hora_acidente)=9;

select count(id)
from ficha
where extract (year from data_hora_acidente)=2011 
	and extract(month from data_hora_acidente)=10;

select count(id)
from ficha
where extract (year from data_hora_acidente)=2011 
	and extract(month from data_hora_acidente)=11;

select count(id)
from ficha
where extract (year from data_hora_acidente)=2011 
	and extract(month from data_hora_acidente)=12;


f)
select count(distinct(e.id))
from empresa e


g)
select count(*),e.nome,e.id
from empresa e
join ficha f on(e.id=empresa_acidente)
group by e.nome, e.id 
order by count(*) desc limit 10

h)
select count(o.id),o.id
from ocupacao o
join ficha f on(f.ocupacao=o.id)
group by o.id
order by count(o.id) desc limit 1

i)
select count(f.id),f.municipio_acidente
from ficha f
group by f.municipio_acidente
order by count(f.id)desc limit 1

j)
select avg(age(f.data_nascimento))
from ficha f
where extract (year from data_hora_acidente)=2010

k)
select count(extract (dow from f.data_hora_acidente)),extract(dow from f.data_hora_acidente)
from ficha f
group by extract(dow from f.data_hora_acidente)
order by count(extract (dow from f.data_hora_acidente)) desc limit 1

l)
select count(f.unidade_notificante),f.unidade_notificante
from ficha f
group by f.unidade_notificante
order by count (f.unidade_notificante) desc limit 1






