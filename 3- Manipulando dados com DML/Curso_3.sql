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

-- alterando campo
alter table tab_departamento rename column cidade_departamento to cidade;
alter table tab_projeto rename column orcamento_projeto to orcamento;
alter table tab_projeto rename column data_inicio_projeto to data_inicio;
alter table tab_dependente rename column tipo_dependencia to tipo;
alter table tab_dependente rename column idade_dependencia to idade;

-- tabela com duas chaves
create table itens_notas
(
numero varchar(5) not null,
codigo varchar (10) not null,
quantidade integer null,
preco float,
primary key (numero, codigo)
);

alter table itens_notas
add constraint fk_produtos
foreign key (codigo) references produtos (codigo);