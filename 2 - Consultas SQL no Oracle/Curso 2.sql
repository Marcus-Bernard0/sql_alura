-- Consultas

select * from tabela_de_clientes;

select cpf, nome, endereco_1, bairro, cidade, cep from tabela_de_clientes;

-- Usando as (como)
select cpf as Identificador, nome as Clientes from tabela_de_clientes;

-- Tabela de produtos
select * from tabela_de_produtos where sabor = 'Uva';
select * from tabela_de_produtos where sabor = 'Laranja';

select * from tabela_de_produtos where embalagem = 'PET';

select * from tabela_de_produtos where preco_de_lista > 20;

-- Consultas condicionais

select * from tabela_de_produtos   where sabor = 'Manga' or tamanho = '470 ml';
select * from tabela_de_produtos   where sabor = 'Manga' and  tamanho = '470 ml';

select * from tabela_de_produtos   where  not (sabor = 'Manga' and  tamanho = '470 ml');

select * from tabela_de_produtos   where not (sabor = 'Manga' or tamanho = '470 ml');

select * from tabela_de_produtos   where (sabor = 'Manga' and not (tamanho = '470 ml'));

-- Usando in
select * from tabela_de_produtos where sabor in ('Laranja', 'Manga');

select * from tabela_de_clientes where cidade in ('Rio de Janeiro','Sao Paulo') and idade >= 20

select * from tabela_de_clientes where cidade in ('Rio de Janeiro','Sao Paulo') and (idade >= 20 and idade <= 22);

-- Like

select * from tabela_de_produtos where sabor like '%Maca%';
select * from tabela_de_produtos where sabor like '%Maca%' and embalagem = 'PET';

-- Distinct

select embalagem from tabela_de_produtos;

select distinct embalagem from tabela_de_produtos;

select distinct sabor from tabela_de_produtos;

select distinct embalagem, sabor from tabela_de_produtos;

-- Runnow

select rownum, codigo_do_produto, nome_do_produto from tabela_de_produtos;
select rownum, codigo_do_produto, nome_do_produto from tabela_de_produtos 
where rownum <5 ;


-- Order by
    
select * from tabela_de_produtos order by preco_de_lista;

select * from tabela_de_produtos order by  preco_de_lista desc;

select * from tabela_de_produtos order by  embalagem desc, nome_do_produto asc;

-- Groupby
    
select * from tabela_de_clientes;
select estado, limite_de_credito from tabela_de_clientes;
select estado, sum(limite_de_credito) as total_credito from tabela_de_clientes group by estado;

select embalagem, preco_de_lista from tabela_de_produtos;
select embalagem, max(preco_de_lista) as max_preco from tabela_de_produtos group by embalagem;
select embalagem, count(*) as numero_protudo from tabela_de_produtos group by embalagem;

select bairro, sum(limite_de_credito) as total_credito from tabela_de_clientes where cidade = 'Rio de Janeiro' group by bairro ;

select estado, bairro, sum(limite_de_credito) as total_credito from tabela_de_clientes group by estado, bairro order by estado, bairro;


-- Case

select nome_do_produto, preco_de_lista,
(case when preco_de_lista >= 12 then 'produo caro'
    when preco_de_lista >= 7 and preco_de_lista < 12 then 'produto barato'
    else 'produto barato'
    end) as status_preco
    from tabela_de_produtos
    where sabor = 'Manga';
    
-- Estatística com case e groupby
select embalagem,
(case when preco_de_lista >= 12 then 'produo caro'
    when preco_de_lista >= 7 and preco_de_lista < 12 then 'produto barato'
    else 'produto barato'
    end) as status_preco,
    avg(preco_de_lista) as media_preco
    from tabela_de_produtos
    group by embalagem, 
    (case when preco_de_lista >= 12 then 'produo caro'
    when preco_de_lista >= 7 and preco_de_lista < 12 then 'produto barato'
    else 'produto barato'
    end);
    
-- Having
select estado, sum(limite_de_credito) as soma_credito
from tabela_de_clientes
group by estado
having sum(limite_de_credito) >= 850000;

select embalagem, max(preco_de_lista) as maior_preco,
min(preco_de_lista) as menor_preco from tabela_de_produtos
group by embalagem;

select embalagem, max(preco_de_lista) as maior_preco,
min(preco_de_lista) as menor_preco from tabela_de_produtos
group by embalagem
having sum(preco_de_lista) <= 80;

-- conferindo os valores 
select * from tabela_de_produtos;
select embalagem, sum(preco_de_lista) 
from tabela_de_produtos
group by embalagem;

-- Join
--inner join
select matricula, count(*)numero_notas from notas_fiscais
group by matricula; 

select a.matricula, b.nome, count(*)from notas_fiscais A
inner join tabela_de_vendedores b
on a.matricula = b.matricula
group by a.matricula, b.nome;


-- left join
select distinct A.cpf as cpf_clientes,
A.nome, B.cpf as cpf_da_nota
from tabela_de_clientes A
left join notas_fiscais B
on A.cpf = B.cpf;



-- full join e cross join
 -- inner join
select
TV.nome as nome_vendedores
,TV.bairro as bairro_vendedores
,TC.nome as nome_cliente
,TC.bairro as bairro_cliente
from
tabela_de_clientes TC
inner join
tabela_de_vendedores TV
on TV.bairro = TC.bairro ; 

-- left
select
TV.nome as nome_vendedores
,TV.bairro as bairro_vendedores
,TC.nome as nome_cliente
,TC.bairro as bairro_cliente
from
tabela_de_clientes TC
left join
tabela_de_vendedores TV
on TV.bairro = TC.bairro ; 

-- right
select 
TV.nome as nome_vendedores
,TV.bairro as bairro_vendedores
,TC.nome as nome_cliente
,TC.bairro as bairro_cliente
from
tabela_de_clientes TC
right join
tabela_de_vendedores TV
on TV.bairro = TC.bairro ; 


-- full join
select 
TV.nome as nome_vendedores
,TV.bairro as bairro_vendedores
,TC.nome as nome_cliente
,TC.bairro as bairro_cliente
from
tabela_de_clientes TC
full join
tabela_de_vendedores TV
on TV.bairro = TC.bairro ; 


-- cross join
select 
TV.nome as nome_vendedores
,TV.bairro as bairro_vendedores
,TC.nome as nome_cliente
,TC.bairro as bairro_cliente
from
tabela_de_clientes TC, tabela_de_vendedores TV;



-- Union

select distinct bairro from tabela_de_clientes
union
select distinct bairro from tabela_de_vendedores;

select distinct bairro from tabela_de_clientes
union all
select distinct bairro from tabela_de_vendedores;

select distinct bairro as bairro, 'cliente' as  tipo from tabela_de_clientes
union
select distinct bairro as bairro, 'vendedor' as tipo from tabela_de_vendedores;

-- Sub consulta
select distinct bairro from tabela_de_vendedores;

select * from tabela_de_clientes 
where bairro
in (select distinct bairro from tabela_de_vendedores);

select embalagem, sum(preco_de_lista) as soma_preco
from tabela_de_produtos group by embalagem
having sum(preco_de_lista) <=80;

select z.embalagem, z.soma_preco from
(select embalagem, sum(preco_de_lista) as soma_preco
from tabela_de_produtos group by embalagem) z
where z.soma_preco <= 80;

select z.nome_do_produto, z.preco_medio from
(select nome_do_produto , avg(preco_de_lista) as preco_medio
from tabela_de_produtos group by nome_do_produto) z 
where z.preco_medio <=25;


 -- View
 select * from vw_embalagem;
 
 select * from vw_embalagem where soma_preco <=50;
 
 select * from view1;

select * from tabela_de_produtos A
inner join vw_embalagem B
on A.embalagem = B.embalagem;

select distinct embalagem from tabela_de_produtos;

-- Funções  
select nome from tablea_de_clientes;
select nome, upper(nome) from tabela_de_clientes;
select nome, lower(nome) from tabela_de_clientes;

select nome_do_produto, initcap(nome_do_produto) from tabela_de_produtos;

select concat(endereco_1, bairro) from tabela_De_clientes;

select nome, 'Endereço: ' || endereco_1 || ' ' || bairro || ' ' || cidade ||
' ' || estado || ', Cep: ' || cep
from tabela_de_clientes;

select nome_do_produto, lpad(nome_do_produto, 60, '*') from tabela_de_produtos;

select nome_do_produto, substr(nome_do_produto, 3,5) 
from tabela_de_produtos;

select nome_do_produto, instr(nome_do_produto, '-') 
from tabela_de_produtos;

select ltrim('      aaaa')
from dual;

select nome_do_produto, replace(nome_do_produto, 'Litro', 'L') 
from tabela_de_produtos;

select nome_do_produto, replace(replace(nome_do_produto, 'Litro', 'L'),'Ls', 'L')
from tabela_de_produtos;

-- Funções de data
select sysdate from dual;

select to_char(sysdate, 'yyyy/mm/dd hh:mm:ss') from dual;

select sysdate + 10 from dual;
select sysdate - 10 from dual;

select months_between(sysdate, to_date('2023-02-20', 'yyyy/mm/dd')) 
from dual;

select add_months(sysdate, 10) from dual;

select next_day(sysdate, 'sexta') from dual;

select last_day(sysdate) from dual;

select trunc(sysdate, 'year') from dual;

select trunc(sysdate, 'month') from dual;

-- Funções matemáticas
select round(3.4) from dual;

select ceil (3.4) from dual;

select power (20, 2 ) from dual;

select sign(-1054) from dual;

select mod (10,8) from dual;

-- Conversão de dados
select to_char(sysdate, 'dd/mm/yyyy hh12:mm:ss am' ) from dual;



-- Relatório de vendas
select * from notas_fiscais NF
inner join itens_notas_fiscais INF
on  NF.numero = INF.numero;

select NF.cpf, NF.data_venda, INF.quantidade
from notas_fiscais NF
inner join itens_notas_fiscais INF
on  NF.numero = INF.numero;

select NF.cpf, to_char(NF.data_venda, 'yyyy-mm') as MES_ANO,
INF.quantidade
from notas_fiscais NF
inner join itens_notas_fiscais INF
on  NF.numero = INF.numero;



select NF.cpf, to_char(NF.data_venda, 'yyyy-mm') as MES_ANO,
sum(INF.quantidade) as VOLUME_DE_VENDIDO
from notas_fiscais NF
inner join itens_notas_fiscais INF
on  NF.numero = INF.numero
group by NF.cpf, to_char(NF.data_venda, 'yyyy-mm');

select cpf, nome, volume_de_compra from tabela_de_clientes;

select cadastro.cpf, cadastro.nome, vendas.mes_ano, cadastro.volume_de_compra,
vendas.vendas_limite
from
(select NF.cpf, to_char(NF.data_venda, 'yyyy-mm') as MES_ANO,
sum(INF.quantidade) as VENDAS_LIMITE
from notas_fiscais NF
inner join itens_notas_fiscais INF
on  NF.numero = INF.numero
group by NF.cpf, to_char(NF.data_venda, 'yyyy-mm')) VENDAS
inner join 
(select cpf, nome, volume_de_compra from tabela_de_clientes) cadastro
on vendas.cpf = cadastro.cpf;


select cadastro.cpf, cadastro.nome, vendas.mes_ano, cadastro.volume_de_compra,
vendas.vendas_limite,
case when vendas.vendas_limite >= cadastro.volume_de_compra then 'Venda válida'
else 'Venda Inválida' end as resultado
from
(select NF.cpf, to_char(NF.data_venda, 'yyyy-mm') as MES_ANO,
sum(INF.quantidade) as VENDAS_LIMITE
from notas_fiscais NF
inner join itens_notas_fiscais INF
on  NF.numero = INF.numero
group by NF.cpf, to_char(NF.data_venda, 'yyyy-mm')) VENDAS
inner join 
(select cpf, nome, volume_de_compra from tabela_de_clientes) cadastro
on vendas.cpf = cadastro.cpf
where mes_ano = '2018-01';


-- continuar daqui
select x.cpf, x.nome, x.mes_ano, x.quantidade_vendas, x.quantidade_limite,
case when (x.quantidade_limite - x.quantidade_vendas ) < 0 then 'inválida'
else 'Valida' end as RESULTADO, (1 - (x.quantidade_limite/x.quantidade_vendas)) * 100 as PERCENTUAL
from(
(select NF.cpf, TC.nome, to_char(NF.data_venda, 'yyyy-mm') as mes_ano
, sum(INF.quantidade) as quantidade_vendas
, max(TC.volume_de_compra) as quantidade_limite from notas_fiscais NF
inner join itens_notas_fiscais INF
on NF.numero = INF.numero
inner join tabela_de_clientes TC
on TC.cpf = NF.cpf
group by NF.cpf, TC.nome, to_char(NF.data_venda, 'yyyy-mm')) X



SELECT X.CPF, X.NOME, X.MES_ANO, X.QUANTIDADE_VENDAS, X.QUANTIDADE_LIMITE,
CASE WHEN (X.QUANTIDADE_LIMITE - X.QUANTIDADE_VENDAS) < 0 THEN 'INVÁLIDA'
ELSE 'VÁLIDA' END AS STATUS_VENDA, (1 - (X.QUANTIDADE_LIMITE/X.QUANTIDADE_VENDAS)) * 100 AS PERCENTUAL
FROM (
SELECT NF.CPF, TC.NOME, TO_CHAR(NF.DATA_VENDA, 'YYYY-MM') AS MES_ANO
, SUM(INF.QUANTIDADE) AS QUANTIDADE_VENDAS 
, MAX(TC.VOLUME_DE_COMPRA) AS QUANTIDADE_LIMITE FROM NOTAS_FISCAIS NF
INNER JOIN ITENS_NOTAS_FISCAIS INF
ON NF.NUMERO = INF.NUMERO
INNER JOIN TABELA_DE_CLIENTES TC 
ON TC.CPF = NF.CPF
GROUP BY NF.CPF, TC.NOME, TO_CHAR(NF.DATA_VENDA, 'YYYY-MM')) X
WHERE (X.QUANTIDADE_LIMITE - X.QUANTIDADE_VENDAS) < 0;