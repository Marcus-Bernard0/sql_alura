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

-- Veja o ano de nascimento dos clientes e classifique-os como:

-- Nascidos antes de 1990 são velhos
-- Nascidos entre 1990 e 1995 são jovens
-- Nascidos depois de 1995 são crianças
-- Liste o nome dos clientes e suas classificações.

select * from tabela_de_clientes;
select nome, data_de_nascimento,
(case when to_char(data_de_nascimento, 'yyyy' )< 1990 then 'Velhos'
    when to_char(data_de_nascimento, 'yyyy' ) >= 1990 and to_char(data_de_nascimento, 'yyyy' ) <= 1995 then 'Jovens'
    else 'Crianças'
    end) as classificacao_idade
    from tabela_de_clientes;

-- Quais os clientes que fizeram mais de 2000 compras em 2016?
select cpf,  count(*) from notas_fiscais
where to_char(data_venda, 'yyyy') = '2016'
group by cpf
having count(*) >= 2000;

-- Selecionando quem gastou mais de R$20.000,00
select nome, max(volume_de_compra) from tabela_de_clientes
group by nome
having max(volume_de_compra) >= 20000;


-- Levando em consideração que o valor financeiro das vendas consiste em multiplicar a quantidade pelo preço, obtenha o faturamento anual da empresa.
select * from notas_fiscais;
select * from itens_notas_fiscais;


select to_char(data_venda, 'yyyy'), sum(quantidade * preco) as faturamento
from notas_fiscais nf
inner join itens_notas_fiscais inf
on nf.numero = inf.numero
group by to_char(data_venda, 'yyyy');

-- Tendo em vista a seguinte consulta
-- Qual seria a consulta, usando subconsulta, que seria equivalente à consulta acima?

SELECT CPF, COUNT(*) FROM NOTAS_FISCAIS
WHERE TO_CHAR(DATA_VENDA, 'YYYY') = '2016'
GROUP BY CPF
HAVING COUNT(*) > 2000;


select x.cpf, x.contador from 
(select cpf, count(*) as contador from notas_fiscais
where to_char(data_venda, 'yyyy' ) = 2016
group by cpf) x
where x.contador > 2000;


-- Faça uma consulta listando o nome do cliente e o endereço completo (com rua, bairro, cidade e estado).
select * from tabela_de_clientes;

select nome, 'Endereço: ' || endereco_1 || ' ' || bairro || ' ' || cidade || ' ' || estado as endereco_completo
from tabela_de_clientes;

-- Crie uma consulta que mostre o nome e a idade atualizada dos clientes.

select nome, months_between (sysdate, data_de_nascimento) / 12 as idade
from tabela_de_clientes;

-- Na tabela de notas fiscais, temos o valor do imposto. Já na tabela de itens, temos a quantidade e o faturamento. Calcule o valor do imposto pago no ano de 2016, arredondando para o menor inteiro.
select * from notas_fiscais;
select * from itens_notas_fiscais;

select to_char(data_venda, 'yyyy'), floor(sum(imposto * (quantidade * preco))) as qtd
from notas_fiscais nf
inner join itens_notas_fiscais inf 
on nf.numero = inf.numero
where to_char(data_venda, 'yyyy') = 2016 
group by to_char(data_venda, 'yyyy') ;



-- exercicio relátorio
-- Modifique o relatório, mas agora para ver o ranking das vendas por tamanho. 
-- Dica: pode parecer difícil, mas este é o exercício mais fácil de resolver.


SELECT
    venda_tamanho.tamanho,
    venda_tamanho.ano,
    venda_tamanho.quantidade_vendas,
    round(((venda_tamanho.quantidade_vendas / total_venda.quantidade_vendas) * 100), 2) AS percentual
FROM
         (
        SELECT
            tp.tamanho,
            to_char(nf.data_venda, 'yyyy') AS ano,
            SUM(inf.quantidade)            AS quantidade_vendas
        FROM
                 tabela_de_produtos tp
            INNER JOIN itens_notas_fiscais inf ON inf.codigo_do_produto = tp.codigo_do_produto
            INNER JOIN notas_fiscais       nf ON inf.numero = nf.numero
        WHERE
            to_char(nf.data_venda, 'yyyy') = '2016'
        GROUP BY
            tp.tamanho,
            to_char(nf.data_venda, 'yyyy')
        ORDER BY
            tp.tamanho DESC
    ) venda_tamanho
    INNER JOIN (
        SELECT
            to_char(nf.data_venda, 'yyyy') AS ano,
            SUM(inf.quantidade)            AS quantidade_vendas
        FROM
                 tabela_de_produtos tp
            INNER JOIN itens_notas_fiscais inf ON inf.codigo_do_produto = tp.codigo_do_produto
            INNER JOIN notas_fiscais       nf ON inf.numero = nf.numero
        WHERE
            to_char(nf.data_venda, 'yyyy') = '2016'
        GROUP BY
            to_char(nf.data_venda, 'yyyy')
    ) total_venda ON venda_tamanho.ano = total_venda.ano
ORDER BY
    percentual DESC;



-- Resolvendo por Views
select * from venda_total;
select * from venda_por_tamanho;


SELECT
    venda_por_tamanho.tamanho,
    venda_por_tamanho.ano,
    venda_por_tamanho.quantidade_vendas,
    round(((venda_por_tamanho.quantidade_vendas / venda_total.quantidade_vendas) * 100), 2) AS percentual
FROM
         venda_por_tamanho
    INNER JOIN venda_total ON venda_por_tamanho.ano = venda_total.ano
ORDER BY
    percentual DESC;

















