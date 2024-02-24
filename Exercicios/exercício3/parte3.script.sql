create table ex3.proprietario
	(cpf varchar(20),
	nome varchar(20),
	rua varchar(20),
	numero varchar(20),
	bairro varchar(20),
	cidade varchar(20),
	estado varchar(20),
	sexo char(1),
	data_de_nascimeto date,
	idade integer,
	primary key(cpf));

create table ex3.proprietario_telefone
	(cpf varchar(20),
	telefone varchar(20),
	telefone2 varchar(20),
	telefone3 varchar(20),
	foreign key(cpf) references ex3.proprietario);

create table ex3.veiculo
	(placa varchar(20),
	chassi varchar(20),
	cor_predominante varchar(20),
	modelo varchar(20),
	categoria varchar(20),
	ano_fabricacao varchar(20),
	cpf varchar(20),
	primary key(placa),
	foreign key(cpf) references ex3.proprietario);

create table ex3.local_infracao
	(codigo_local varchar(20),
	pos_geografica varchar(20),
	vel_permitida integer,
	primary key(codigo_local));

create table ex3.agente
	(matricula varchar(20),
	nome varchar(20),
	data_contratacao date,
	tempo_servico interval,
	primary key(matricula));

create table ex3.infracao
	(codigo varchar(20),
	velocidade integer,
	data date,
	hora time,
	placa varchar(20),
	codigo_local varchar(20),
	matricula varchar(20),
	primary key(codigo),
	foreign key(placa) references ex3.veiculo,
	foreign key(codigo_local) references ex3.local_infracao,
	foreign key(matricula) references ex3.agente);

create table ex3.tipo_infracao
	(tipo varchar(20),
	valor decimal(10,2),
	codigo varchar(20),
	primary key(tipo),
	foreign key(codigo) references ex3.infracao)