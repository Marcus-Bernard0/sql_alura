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

-- inserindo dados na tabela
insert into produtos
(codigo, descritor, sabor, tamanho, embalagem, preco_lista)
values
('1040108', 'Light - 350 - Graviola', 'Graviola', '350 ml', 'Lata', 5);

-- Inserindo sem declara��es, respeitando a ordem dos campos.
insert into produtos
values
('1040109', 'Light - 350 - Jaca', 'Jaca', '350 ml', 'Lata', 3.7);

-- Alterando os campos na delcara��o e inser��o
insert into produtos
(codigo, descritor, preco_lista, tamanho, embalagem, sabor)
values
('1040110', 'Light - 350 - Manga', 7, '350 ml', 'Lata', 'Manga');

-- Incluindo v�rias linhas

insert all
into produtos
(codigo, descritor, preco_lista, tamanho, embalagem, sabor)
values
('1040111', 'Light - 350 - Morango', 7, '350 ml', 'Lata', 'Morango')
into produtos
(codigo, descritor, preco_lista, tamanho, embalagem, sabor)
values
('1040112', 'Light - 350 - Melao', 7, '350 ml', 'Lata', 'Melao')

--***********************************************************

CREATE TABLE TABELA_DE_PRODUTOS_FONTE(
	CODIGO_DO_PRODUTO NVARCHAR2(10) NOT NULL,
	NOME_DO_PRODUTO NVARCHAR2(50) NULL,
	EMBALAGEM NVARCHAR2(20) NULL,
	TAMANHO NVARCHAR2(10) NULL,
	SABOR NVARCHAR2(20) NULL,
	PRECO_DE_LISTA FLOAT NOT NULL);

INSERT INTO TABELA_DE_PRODUTOS_FONTE (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('1000889', 'Sabor da Montanha - 700 ml - Uva', 'Garrafa', '700 ml', 'Uva', 6.3090);
INSERT INTO TABELA_DE_PRODUTOS_FONTE (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('1002334', 'Linha Citros - 1 Litro - Lima/Limao', 'PET', '1 Litro', 'Lima/Limao', 7.0040);
INSERT INTO TABELA_DE_PRODUTOS_FONTE (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('1002767', 'Videira do Campo - 700 ml - Cereja/Maca', 'Garrafa', '700 ml', 'Cereja/Maca', 8.4100);
INSERT INTO TABELA_DE_PRODUTOS_FONTE (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('1004327', 'Videira do Campo - 1,5 Litros - Melancia', 'PET', '1,5 Litros', 'Melancia', 19.5100);
INSERT INTO TABELA_DE_PRODUTOS_FONTE (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('1013793', 'Videira do Campo - 2 Litros - Cereja/Maca', 'PET', '2 Litros', 'Cereja/Maca', 24.0100);
INSERT INTO TABELA_DE_PRODUTOS_FONTE (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('1022450', 'Festival de Sabores - 2 Litros - Acai', 'PET', '2 Litros', 'Acai', 38.0120);
INSERT INTO TABELA_DE_PRODUTOS_FONTE (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('1037797', 'Clean - 2 Litros - Laranja', 'PET', '2 Litros', 'Laranja', 16.0080);
INSERT INTO TABELA_DE_PRODUTOS_FONTE (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('1040107', 'Light - 350 ml - Melancia', 'Lata', '350 ml', 'Melancia', 4.5550);
INSERT INTO TABELA_DE_PRODUTOS_FONTE (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('1041119', 'Linha Citros - 700 ml - Lima/Limao', 'Garrafa', '700 ml', 'Lima/Limao', 4.9040);
INSERT INTO TABELA_DE_PRODUTOS_FONTE (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('1078680', 'Frescor do Verao - 470 ml - Manga', 'Garrafa', '470 ml', 'Manga', 5.1795);
INSERT INTO TABELA_DE_PRODUTOS_FONTE (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('1086543', 'Linha Refrescante - 1 Litro - Manga', 'PET', '1 Litro', 'Manga', 11.0105);
INSERT INTO TABELA_DE_PRODUTOS_FONTE (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('1096818', 'Linha Refrescante - 700 ml - Manga', 'Garrafa', '700 ml', 'Manga', 7.7105);
INSERT INTO TABELA_DE_PRODUTOS_FONTE (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('1101035', 'Linha Refrescante - 1 Litro - Morango/Limao', 'PET', '1 Litro', 'Morango/Limao', 9.0105);
INSERT INTO TABELA_DE_PRODUTOS_FONTE (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('229900', 'Pedacos de Frutas - 350 ml - Maca', 'Lata', '350 ml', 'Maca', 4.2110);
INSERT INTO TABELA_DE_PRODUTOS_FONTE (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('231776', 'Festival de Sabores - 700 ml - Acai', 'Garrafa', '700 ml', 'Acai', 13.3120);
INSERT INTO TABELA_DE_PRODUTOS_FONTE (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('235653', 'Frescor do Verao - 350 ml - Manga', 'Lata', '350 ml', 'Manga', 3.8595);
INSERT INTO TABELA_DE_PRODUTOS_FONTE (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('243083', 'Festival de Sabores - 1,5 Litros - Maracuja', 'PET', '1,5 Litros', 'Maracuja', 10.5120);
INSERT INTO TABELA_DE_PRODUTOS_FONTE (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('290478', 'Videira do Campo - 350 ml - Melancia', 'Lata', '350 ml', 'Melancia', 4.5600);
INSERT INTO TABELA_DE_PRODUTOS_FONTE (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('326779', 'Linha Refrescante - 1,5 Litros - Manga', 'PET', '1,5 Litros', 'Manga', 16.5105);
INSERT INTO TABELA_DE_PRODUTOS_FONTE (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('394479', 'Sabor da Montanha - 700 ml - Cereja', 'Garrafa', '700 ml', 'Cereja', 8.4090);
INSERT INTO TABELA_DE_PRODUTOS_FONTE (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('479745', 'Clean - 470 ml - Laranja', 'Garrafa', '470 ml', 'Laranja', 3.7680);
INSERT INTO TABELA_DE_PRODUTOS_FONTE (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('520380', 'Pedacos de Frutas - 1 Litro - Maca', 'PET', '1 Litro', 'Maca', 12.0110);
INSERT INTO TABELA_DE_PRODUTOS_FONTE (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('695594', 'Festival de Sabores - 1,5 Litros - Acai', 'PET', '1,5 Litros', 'Acai', 28.5120);
INSERT INTO TABELA_DE_PRODUTOS_FONTE (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('723457', 'Festival de Sabores - 700 ml - Maracuja', 'Garrafa', '700 ml', 'Maracuja', 4.9120);
INSERT INTO TABELA_DE_PRODUTOS_FONTE (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('746596', 'Light - 1,5 Litros - Melancia', 'PET', '1,5 Litros', 'Melancia', 19.5050);
INSERT INTO TABELA_DE_PRODUTOS_FONTE (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('773912', 'Clean - 1 Litro - Laranja', 'PET', '1 Litro', 'Laranja', 8.0080);
INSERT INTO TABELA_DE_PRODUTOS_FONTE (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('783663', 'Sabor da Montanha - 700 ml - Morango', 'Garrafa', '700 ml', 'Morango', 7.7090);
INSERT INTO TABELA_DE_PRODUTOS_FONTE (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('788975', 'Pedacos de Frutas - 1,5 Litros - Maca', 'PET', '1,5 Litros', 'Maca', 18.0110);
INSERT INTO TABELA_DE_PRODUTOS_FONTE (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('812829', 'Clean - 350 ml - Laranja', 'Lata', '350 ml', 'Laranja', 2.8080);
INSERT INTO TABELA_DE_PRODUTOS_FONTE (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('826490', 'Linha Refrescante - 700 ml - Morango/Limao', 'Garrafa', '700 ml', 'Morango/Limao', 6.3105);
INSERT INTO TABELA_DE_PRODUTOS_FONTE (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('838819', 'Clean - 1,5 Litros - Laranja', 'PET', '1,5 Litros', 'Laranja', 12.0080);


select * from tabela_de_produtos_fonte;


-- descobrindo qual produto est� bloqueando a inser��o
select
P.codigo
from
produtos P
inner join
tabela_de_produtos_fonte TPF
on P.codigo = TPF.codigo_do_produto

- Para a inserir a partir de uma tabela fonte, os campos devem ser da mesma ordem e mesmo nome.
- Inserindo fazendo a remo��o do c�digo que se repete. Din�mico e insere todos dados novos

insert into produtos
select
codigo_do_produto as codigo,
nome_do_produto as descritor,
sabor,
tamanho, 
embalagem,
preco_de_lista as preco_lista
from tabela_de_produtos_fonte
where not codigo_do_produto in(
select
P.codigo
from
produtos P
inner join
tabela_de_produtos_fonte TPF
on P.codigo = TPF.codigo_do_produto
);


insert into tabela_de_produtos_fonte
values
('999999', 'Novo Produto', 'PET', '1 Litro', 'Indefinido', 10);

select * from produtos;

-lendo dados de arquivo externo
select * from clientes;
select * from vendedores;
select * from notas;