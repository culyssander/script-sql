CREATE DATABASE paga_com_culy;

USE paga_com_culy;

CREATE TABLE usuario(
id bigint primary key auto_increment,
telefone varchar(13) not null unique,
senha varchar(100) not null,
estado int(1) not null default 0,
data_hora_criacao datetime not null default current_timestamp,
data_hora_actualizacao datetime
);

CREATE TABLE funcionario(
id bigint primary key auto_increment,
nome varchar(70) not null,
email varchar(150),
morada varchar(200),
usuario_id bigint not null,
data_hora_criacao datetime not null default current_timestamp,
data_hora_actualizacao datetime,
constraint fk_funcionario_usuario foreign key(usuario_id) references usuario(id)
);

CREATE TABLE cliente(
id bigint primary key auto_increment,
nome varchar(70) not null,
email varchar(150),
morada varchar(200),
usuario_id bigint not null,
data_hora_criacao datetime not null default current_timestamp,
data_hora_actualizacao datetime,
constraint fk_fcliente_usuario foreign key(usuario_id) references usuario(id)
);

CREATE TABLE banco(
id int primary key auto_increment,
nome varchar(13) not null unique
);

CREATE TABLE cliente_banco(
cliente_id bigint not null,
banco_id int not null,
numero_conta varchar(15) not null unique,
iban varchar(25) not null unique,
constraint fk_cliente_banco foreign key(banco_id) references banco(id)
);

CREATE TABLE produto (
id bigint primary key auto_increment,
nome varchar(70) not null,
descricao varchar(150),
preco decimal(10, 2) not null,
quantidade int,
cliente_id bigint not null,
constraint fk_produto_cliente foreign key (cliente_id) references cliente(id)
);

CREATE TABLE subcliente(
id bigint primary key auto_increment,
nome varchar(70) not null,
telefone varchar(13) not null,
email varchar(150),
morada varchar(200),
cliente_id bigint not null,
data_hora_criacao datetime not null default current_timestamp,
data_hora_actualizacao datetime,
constraint fk_cliente_subcliente foreign key(cliente_id) references cliente(id)
);

CREATE TABLE referencia (
id bigint primary key not null,
data_hora_criacao datetime not null default current_timestamp,
cliente bigint,
funcioria bigint
);

CREATE TABLE estado_pagamento(
id int primary key auto_increment,
nome varchar(50) not null unique
);

CREATE TABLE pagamento(
id bigint primary key auto_increment,
cliente_id bigint not null,
subcliente_id bigint not null,
referencia_id bigint not null,
produto_id bigint not null,
banco_id int not null,
estado_id int not null,
data_hora_criacao datetime not null default current_timestamp,
data_hora_actualizacao datetime,
constraint fk_pagamento_cliente foreign key(cliente_id) references cliente(id),
constraint fk_pagamento_subcliente foreign key(subcliente_id) references subcliente(id),
constraint fk_pagamento_referentes foreign key(referencia_id) references referencia(id),
constraint fk_pagamento_produto foreign key(produto_id) references produto(id),
constraint fk_pagamento_banco foreign key(banco_id) references banco(id),
constraint fk_pagamento_estado foreign key(estado_id) references estado_pagamento(id)
);


















