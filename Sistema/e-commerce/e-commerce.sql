﻿create table usuario
	(cpf varchar(20),
	admin boolean not null,
	nome_usuario text not null,
	email text not null unique,
	estado varchar(20) not null,
	cidade text not null,
	bairro text not null,
	rua text not null,
	numero integer not null,
	primary key(cpf)
	);

create table categoria
	(id_categoria integer,
	nome_categoria varchar(20),
	primary key(id_categoria)
	);

create table produto
	(codigo varchar(20),
	descricao text,
	imagem bytea,
	nome_produto varchar(50) not null,
	preco numeric(12,2) not null,
	quantidade_produto integer,
	id_categoria integer,
	data_cadastro timestamp without time zone DEFAULT now(),
	primary key(codigo),
	foreign key(id_categoria) references categoria,
	check (preco > 0),
	check(quantidade_produto >= 0 )
	);

create table compra
	(id_compra serial,
	codigo varchar(20),
	cpf varchar(20),
	quantidade_compra integer,
	valor numeric(12,2),
	data_compra timestamp without time zone DEFAULT now(),
	primary key(id_compra),
	foreign key(cpf) references usuario,
	foreign key(codigo) references produto
	);