select * from TB_VENDEDORES;

#Alternando chave

alter table TB_VENDEDORES add constraint pk_TB_VENDEDORES primary key(MATRICULA)

#Adicionando coluna férias e admissão
alter table TB_VENDEDORES add FERIAS number (1);
alter table TB_VENDEDORES add ADMISSAO date ;

#Inserindo novos vendedores

insert into TB_VENDEDORES (
     MATRICULA, NOME, COMISSAO, FERIAS, ADMISSAO
) values (
     '00235','Márcio Almeida Silva',0.08, 0, TO_DATE('15/08/2014','DD/MM/YYYY')
);
INSERT INTO TB_VENDEDORES(
     MATRICULA, NOME, COMISSAO, FERIAS, ADMISSAO
) VALUES (
     '00236','Cláudia Morais',0.08, 1, TO_DATE('17/09/2013','DD/MM/YYYY')
);

insert into TB_VENDEDORES(
     MATRICULA, NOME, COMISSAO, FERIAS, ADMISSAO
)
values (
     '00237','Roberta Martins',0.11, 1, TO_DATE('18/03/2017','DD/MM/YYYY')
);

insert into TB_VENDEDORES(
     MATRICULA, NOME, COMISSAO, FERIAS, ADMISSAO
)
values (
     '00238','Péricles Alves',0.11, 0, TO_DATE('21/08/2016','DD/MM/YYYY')
);


#Monte uma consulta SQL que somente seleciona o nome e a matrícula dos vendedores.

select * from tb_vendedores;

select nome, matricula from tb_vendedores;
