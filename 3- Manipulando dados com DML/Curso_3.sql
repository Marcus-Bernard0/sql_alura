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

-- Inserindo sem declarações, respeitando a ordem dos campos.
insert into produtos
values
('1040109', 'Light - 350 - Jaca', 'Jaca', '350 ml', 'Lata', 3.7);

-- Alterando os campos na delcaração e inserção
insert into produtos
(codigo, descritor, preco_lista, tamanho, embalagem, sabor)
values
('1040110', 'Light - 350 - Manga', 7, '350 ml', 'Lata', 'Manga');

-- Incluindo várias linhas

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


-- descobrindo qual produto está bloqueando a inserção
select
P.codigo
from
produtos P
inner join
tabela_de_produtos_fonte TPF
on P.codigo = TPF.codigo_do_produto

--  Para a inserir a partir de uma tabela fonte, os campos devem ser da mesma ordem e mesmo nome.
--  Inserindo fazendo a remoção do código que se repete. Dinâmico e insere todos dados novos

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

-- Alterando dados da tabela
select * from produtos where codigo = '1040107';
update produtos set preco_lista = 5.2 where codigo = '1040107';
update produtos set sabor = 'Laranja', embalagem = 'PET' where codigo = '1040107';

-- Alterando com replace
select descritor, replace(descritor, 'Melancia','Laranja') from produtos where codigo = '1040107';
update produtos set descritor = replace(descritor, 'Melancia','Laranja') where codigo = '1040107';



-- Table fonte
  CREATE TABLE "TABELA_DE_VENDEDORES_FONTE" 
   ("MATRICULA" NVARCHAR2(5), 
	"NOME" NVARCHAR2(100), 
	"PERCENTUAL_COMISSAO" FLOAT(126), 
	"DATA_ADMISSAO" DATE, 
	"DE_FERIAS" NUMBER(1,0), 
	"BAIRRO" NVARCHAR2(50)
   );

Insert into TABELA_DE_VENDEDORES_FONTE (MATRICULA,NOME,PERCENTUAL_COMISSAO,DATA_ADMISSAO,DE_FERIAS,BAIRRO) values ('00235','Marcio Almeida Silva','0,08',to_date('15/08/14','DD/MM/RR'),'0','Tijuca');
Insert into TABELA_DE_VENDEDORES_FONTE (MATRICULA,NOME,PERCENTUAL_COMISSAO,DATA_ADMISSAO,DE_FERIAS,BAIRRO) values ('00236','Claudia Morais','0,08',to_date('17/09/13','DD/MM/RR'),'1','Jardins');
Insert into TABELA_DE_VENDEDORES_FONTE (MATRICULA,NOME,PERCENTUAL_COMISSAO,DATA_ADMISSAO,DE_FERIAS,BAIRRO) values ('00237','Roberta Martins','0,11',to_date('18/03/17','DD/MM/RR'),'1','Copacabana');
Insert into TABELA_DE_VENDEDORES_FONTE (MATRICULA,NOME,PERCENTUAL_COMISSAO,DATA_ADMISSAO,DE_FERIAS,BAIRRO) values ('00238','Pericles Alves','0,11',to_date('21/08/16','DD/MM/RR'),'0','Santo Amaro');

select * from vendedores V;
select * from tabela_de_vendedores TVF;

-- inner join
select V.matricula as matricula_vendedores, TVF.matricula as matricula_fonte,
V.ferias as ferias_vendedores, TVF.de_ferias as ferias_fonte
from 
vendedores V
inner join
tabela_de_vendedores TVF
on V.matricula = SUBSTR(TVF.matricula, 3, 3);


-- A tabela fonte não está acesível, objetivo é elaborar uma atualização automática
update tabela_de_vendedores set de_ferias = 0 where matricula in ('00236', '00237');
update tabela_de_vendedores set de_ferias = 1 where matricula in ('00235', '00238');

-- Comando EXISTS (1´é verdadeiro)
select V.matricula as matricula_vendedores,
V.ferias as ferias_vendedores
from vendedores V
where exists
(select 1 from tabela_de_vendedores TVF
where V.matricula = SUBSTR(TVF.matricula, 3, 3));

-- Update e exists
select *  from vendedores;
select * from tabela_de_vendedores;

update vendedores V set V.ferias =
(select TVF.de_ferias from tabela_de_vendedores TVF
where V.matricula = SUBSTR(TVF.matricula, 3, 3))
where exists
(select 1 from tabela_de_vendedores TVF
where V.matricula = SUBSTR(TVF.matricula, 3, 3));

-- Deletando produtos automaticamente quando comparado com a tabela fonte e houver diferenças
select * from tabela_de_produtos_fonte;
delete from tabela_de_produtos_fonte where codigo_do_produto ='999999';

select * from produtos;
select * from produtos where codigo = '1001001';
select * from produtos where substr(descritor, 1,15)='Sabor dos Alpes';
select * from tabela_de_produtos_fonte where substr(nome_do_produto, 1,15)='Sabor dos Alpes';

delete from produtos where codigo = '1001001';

select count(*) from produtos;
select count(*) from tabela_de_produtos_fonte;

-- Descobrindo as diferenças
select 
P.codigo as codigo_produto, TPF.codigo_do_produto as codigo_fonte,
P.descritor as nome_produto, tpf.nome_do_produto as nome_fonte
from produtos P left join tabela_de_produtos_fonte TPF
on P.codigo = TPF.codigo_do_produto;

-- Exibindo os codigos nulos
select P.codigo from produtos P 
left join tabela_de_produtos_fonte TPF
on P.codigo = TPF.codigo_do_produto
where TPF.codigo_do_produto is null;

 -- Apagando as linhas
delete from produtos P where
P.codigo in(
select P.codigo from produtos P 
left join tabela_de_produtos_fonte TPF
on P.codigo = TPF.codigo_do_produto
where TPF.codigo_do_produto is null
 );

commit;

-- Rollback

create table produtos2 as (select * from produtos);

select * from produtos2;
update produtos2 set preco_lista=8;
rollback;

-- Autoincremento
create table tab_identity
(
id number generated by default on null as identity
, descritor varchar(20)
, primary key(ID)
);

select * from tab_identity;
insert into tab_identity (descritor) values ('Cliente 1');
insert into tab_identity (descritor) values ('Cliente 2');


create table tab_padrao
(
id number generated by default on null as identity
, descritor varchar(20) not null
, endereco varchar(100) null
, cidade varchar(50) default on null 'Rio de Janeiro'
, data_criacao date default on null sysdate
, primary key (id)
);

insert into tab_padrao (descritor, endereco, cidade, data_criacao)
values ('cliente 1', 'Rua tupinambas', 'Poços', to_date('2022-01-22', 'YYYY-MM-DD'));

insert into tab_padrao (descritor) values ('cliente 2');

-- Trigers
delete from itens_notas;
delete from notas;

select * from clientes;
--1471156710
select * from vendedores;
-- 235
select * from produtos;
-- 1000889
select * from notas;

insert into notas (numero, data_venda, cpf, matricula, imposto)
values('001', to_date('2019-01-01', 'yyyy-mm-dd'),'1471156710', '235', 0.1);

insert into itens_notas (numero, codigo, quantidade, preco)
values('001', '1000889', 10, 10);

INSERT INTO NOTAS (NUMERO, DATA_VENDA, CPF, MATRICULA, IMPOSTO)
VALUES ('002',TO_DATE('2019-01-01','YYYY-MM-DD'), '1471156710', '235', 0.1);
INSERT INTO ITENS_NOTAS (NUMERO, CODIGO, QUANTIDADE, PRECO)
VALUES ('002','1000889',15,10);

SELECT * FROM NOTAS;
SELECT * FROM ITENS_NOTAS;

select
n.data_venda, sum(itn.quantidade * itn.preco) as faturamento
from
notas n
inner join
itens_notas itn
on n.numero = itn.numero
group by n.data_venda;


create table tab_faturamento(data_venda date null, faturamento float);

insert into tab_faturamento
select
n.data_venda, sum(itn.quantidade * itn.preco) as faturamento
from
notas n
inner join
itens_notas itn
on n.numero = itn.numero
group by n.data_venda;

INSERT INTO NOTAS (NUMERO, DATA_VENDA, CPF, MATRICULA, IMPOSTO)
VALUES ('004',TO_DATE('2019-01-02','YYYY-MM-DD'), '1471156710', '235', 0.1);
INSERT INTO ITENS_NOTAS (NUMERO, CODIGO, QUANTIDADE, PRECO)
VALUES ('004','1000889',21,10);

create trigger tg_tab_faturamento
after insert on itens_notas
begin
delete from tab_faturamento;
insert into tab_faturamento
select
n.data_venda, sum(itn.quantidade * itn.preco) as faturamento
from
notas n
inner join
itens_notas itn
on n.numero = itn.numero
group by n.data_venda;
end;

INSERT INTO NOTAS (NUMERO, DATA_VENDA, CPF, MATRICULA, IMPOSTO)
VALUES ('006',TO_DATE('2019-01-03','YYYY-MM-DD'), '1471156710', '235', 0.1);
INSERT INTO ITENS_NOTAS (NUMERO, CODIGO, QUANTIDADE, PRECO)
VALUES ('006','1000889',40,10);


select * from tab_faturamento;
select * from notas;
select * from itens_notas;

update itens_notas set quantidade = 1000 where numero = '004';
DELETE FROM ITENS_NOTAS WHERE NUMERO = '004';
DELETE FROM NOTAS WHERE NUMERO = '004';

CREATE OR REPLACE TRIGGER TG_TAB_FATURAMENTO
AFTER INSERT OR UPDATE OR DELETE ON ITENS_NOTAS
BEGIN
DELETE FROM TAB_FATURAMENTO;
INSERT INTO TAB_FATURAMENTO
SELECT
N.DATA_VENDA, SUM(ITN.QUANTIDADE * ITN.PRECO) AS FATURAMENTO
FROM
NOTAS N
INNER JOIN
ITENS_NOTAS ITN
ON N.NUMERO = ITN.NUMERO
GROUP BY N.DATA_VENDA;
END;

INSERT INTO NOTAS (NUMERO, DATA_VENDA, CPF, MATRICULA, IMPOSTO)
VALUES ('007',TO_DATE('2019-01-03','YYYY-MM-DD'), '1471156710', '235', 0.1);
INSERT INTO ITENS_NOTAS (NUMERO, CODIGO, QUANTIDADE, PRECO)
VALUES ('007','1000889',40,10);

UPDATE ITENS_NOTAS SET QUANTIDADE = 1000 WHERE NUMERO = '007';
DELETE FROM ITENS_NOTAS WHERE NUMERO = '007';
DELETE FROM NOTAS WHERE NUMERO = '007';