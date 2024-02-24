create table paciente
	(nome_paciente varchar(20),
	rua varchar(20),
	numero int,
	bairro varchar(20),
	cidade varchar(20),
	cpf varchar(20),
	primary key(cpf));

create table paciente_telefone
	(cpf varchar(20),
	telefone varchar(20),
	foreign key (cpf) references paciente);

create table convenio
	(CNPJ varchar(20),
	nome_convenio varchar(20),
	pessoa_de_contato varchar(20),
	primary key(CNPJ));

create table exame
	(numero_exame varchar(20),
	nome_exame varchar(20),
	diagnostico_principal text,
	nome_paciente varchar(20),
	CNPJ varchar(20),
	data date,
	primary key(numero_exame),
	foreign key(CNPJ) references convenio,
	foreign key(nome_paciente) references paciente);


	