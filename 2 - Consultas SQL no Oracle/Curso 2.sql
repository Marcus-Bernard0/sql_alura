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