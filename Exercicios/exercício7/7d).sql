select count(f.id)
from ficha f
where municipio_acidente ='9659'
	and extract(year from data_hora_acidente)=2009 and extract(month from data_hora_acidente)=3
	
	