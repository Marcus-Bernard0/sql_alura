create table produtos
(codigo varchar(10) not null,
descritor varchar(100) null,
sabor varchar (50) null,
tamanho varchar(50) null,
embalagem varchar(50) null, 
preco_lista float null, 
primary key (codigo));

create table vendedores
( matricula varchar(5) not null,
nome varchar(100) null,
bairro varchar(50) null,
comissao float null,
data_admissao date null,
ferias integer null,
primary key (matricula));

create table tabela_vendas
(numero varchar(5) not null,
data_venda date null,
cpf varchar(11) not null,
matricula varchar(5) not null,
imposto float null,
primary key (numero));

-- criando chave estrangeira

alter table tabela_vendas
add constraint FK_clientes
foreign key (cpf) references clientes (cpf);

alter table tabela_vendas
add constraint FK_vendedores
foreign key (matricula) references vendedores (matricula);

