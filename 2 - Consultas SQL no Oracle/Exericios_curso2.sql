-- Quantos bairros diferentes da cidade do Rio de Janeiro possuem clientes?

select * from tabela_de_clientes;
select distinct bairro from tabela_de_clientes where cidade = 'Rio de Janeiro';

-- Queremos obter as 10 primeiras vendas do dia 01/01/2017. Qual seria o comando SQL para obter este resultado?
select * from notas_fiscais;

select * from notas_fiscais where data_venda ='01/01/17' and rownum <=10;
select * from notas_fiscais where data_venda = to_date('2017/01/01', 'yyyy/mm/dd')and rownum <=10;

-- Utilizando duas querys SQL, qual foi a maior venda do produto "Linha Refrescante - 1 Litro - Morango/Limao", em quantidade?
select * from tabela_de_produtos;

select * from tabela_de_produtos where nome_do_produto = 'Linha Refrescante - 1 Litro - Morango/Limao';


select * from itens_notas_fiscais; 
select * from itens_notas_fiscais  where codigo_do_produto = 1101035 order by quantidade desc;

-- Aproveitando o exercício do vídeo anterior, quantos itens existem com a maior quantidade de venda para o produto '1101035'?

select codigo_do_produto, count(*) as quantidade_99 from itens_notas_fiscais where codigo_do_produto = 1101035 and quantidade = 99 group by codigo_do_produto;