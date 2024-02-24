create table ex4.produto
	(estoque integer,
	valor decimal(10,2),
	nome varchar(20),
	codigo varchar(20),
	descricao varchar(20),
	primary key(codigo));

create table ex4.vendedor
	(salario decimal(10,2),
	nome varchar(20),
	cpf varchar(20),
	primary key(cpf));

create table ex4.cliente
	(telefone varchar(20),
	nome varchar(20),
	cpf varchar(20),
	idade integer,
	rua varchar(20),
	numero varchar(20),
	bairro varchar(20),
	cidade varchar(20),
	primary key(cpf));

create table ex4.venda
	(data date,
	valor_total decimal(10,2),
	id varchar(20),
	cpf varchar(20),
	primary key(id),
	foreign key(cpf) references ex4.vendedor);

create table ex4.vendido
	(codigo varchar(20),
	id varchar(20),
	qtde_vendida integer,
	primary key(codigo,id),
	foreign key(codigo) references ex4.produto,
	foreign key(id) references ex4.venda);


