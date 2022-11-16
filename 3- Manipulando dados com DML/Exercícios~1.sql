select * from tab_empresa;

insert into tab_empresa
values
('E0002', 'Empresa E0002');


select * from tab_departamento;
INSERT ALL
INTO TAB_DEPARTAMENTO
VALUES ('D0001','DEPARTAMENTO D0001', 'CAMPINAS','E0001')
INTO TAB_DEPARTAMENTO
VALUES ('D0002','DEPARTAMENTO D0002', 'CAMPO GRANDE','E0001')
INTO TAB_DEPARTAMENTO
VALUES ('D0003','DEPARTAMENTO D0003', 'CAMPINAS','E0001')
INTO TAB_DEPARTAMENTO
VALUES ('D0004','DEPARTAMENTO D0004', 'CURITIBA','E0002')
INTO TAB_DEPARTAMENTO
VALUES ('D0005','DEPARTAMENTO D0005', 'CAMPO GRANDE','E0002')
SELECT * FROM DUAL;


CREATE TABLE TAB_PROJETO_ORCAMENTO
(cod_projeto VARCHAR(5), percentual_novo_orcamento FLOAT);

INSERT INTO TAB_PROJETO_ORCAMENTO VALUES ('P0001',0.2);
INSERT INTO TAB_PROJETO_ORCAMENTO VALUES ('P0002',0.1);
INSERT INTO TAB_PROJETO_ORCAMENTO VALUES ('P0003',-0.1);
INSERT INTO TAB_PROJETO_ORCAMENTO VALUES ('P0005',0.23);
INSERT INTO TAB_PROJETO_ORCAMENTO VALUES ('P0007',0.09);
INSERT INTO TAB_PROJETO_ORCAMENTO VALUES ('P0008',-0.03);
INSERT INTO TAB_PROJETO_ORCAMENTO VALUES ('P0009',-0.05);
INSERT INTO TAB_PROJETO_ORCAMENTO VALUES ('P0011',0.123);


select * from tab_projeto;
select * from tab_projeto_orcamento;

update tab_projeto TB set TB.orcamento = TB.orcamento * (1 + 
(select TBO.percentual_novo_orcamento from tab_projeto_orcamento TBO
where TB.cod_projeto = TBO.cod_projeto))
where exists
(select 1 from tab_projeto_orcamento TBO
where TB.cod_projeto = TBO.cod_projeto);

-- O departamento de RH nos passou a seguinte tabela com a lista de funcionários desligados no mês corrente:
CREATE TABLE TAB_RH_DEMITIDOS (COD_FUNCIONARIO VARCHAR(5));

INSERT INTO TAB_RH_DEMITIDOS VALUES ('F0001');
INSERT INTO TAB_RH_DEMITIDOS VALUES ('F0005');
INSERT INTO TAB_RH_DEMITIDOS VALUES ('F0012');
INSERT INTO TAB_RH_DEMITIDOS VALUES ('F0022');
INSERT INTO TAB_RH_DEMITIDOS VALUES ('F0033');

-- Apague os registros desses funcionários no banco de dados, levando em conta o conteúdo da tabela do RH, lembrando que devemos também apagar os dependentes.
select * from tab_funcionario;
select * from tab_dependente;
select * from tab_rh_demitidos;

-- exibindo
select TF.cod_funcionario from tab_funcionario TF
inner join tab_rh_demitidos TD
on TF.cod_funcionario = TD.cod_funcionario;

-- deletando das tabelas depedentes e funcionario
delete from tab_dependente TD where
TD.cod_funcionario in(
select TD.cod_funcionario from tab_dependente TD
inner join tab_rh_demitidos TRH
on TD.cod_funcionario = TRH.cod_funcionario);


delete from tab_funcionario TF where TF.cod_funcionario 
in (
select TF.cod_funcionario from tab_funcionario TF
inner join tab_rh_demitidos TRH
on TF.cod_funcionario = TRH.cod_funcionario);







