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