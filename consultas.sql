-- COUNT OK
-- SUBCONSULTA COM OPERADOR RELACIONAL OK
-- MIN OK
-- AVG OK
-- GROUP BY OK 
-- MAX OK 
-- LIKE OK 
-- ORDER BY OK
-- SELECT FROM WHERE OK
-- INNER JOIN OK
-- BETWEEN OK


-- Consulta sobre a quantidade de produtos 
-- que a cliente 'Maria Augusta' levou ao 
-- realizar um pedido na loja e o total pago 
-- pelos produtos.
SELECT SUM(quantidade), SUM(pr.preco)
FROM pessoa p 
    INNER JOIN cliente cl
        ON p.cpf = cl.cpf_cliente
    INNER JOIN  realizacao r
        ON cl.cpf_cliente = r.cpf_cliente_realizacao
    INNER JOIN  pedido pe
        ON r.id_pedido_realizacao = pe.id_pedido
    INNER JOIN contem c
        ON pe.id_pedido = c.id_pedido_contem
    INNER JOIN produto pr
        ON c.id_produto_contem = pr.id_produto
WHERE p.nome_completo = 'Maria Augusta';

-- Mostre o nome, categoria e preço dos
-- produtos comprados por 'Maria Augusta Neto'
-- ordenados pelo preço.
SELECT pr.nome, pr.categoria, pr.preco
FROM pessoa p
    INNER JOIN cliente cl
        ON p.cpf = cl.cpf_cliente
    INNER JOIN  realizacao r
        ON cl.cpf_cliente = r.cpf_cliente_realizacao
    INNER JOIN  pedido pe
        ON r.id_pedido_realizacao = pe.id_pedido
    INNER JOIN contem c
        ON pe.id_pedido = c.id_pedido_contem
    INNER JOIN produto pr
        ON c.id_produto_contem = pr.id_produto
WHERE p.nome_completo = 'Maria Augusta Neto'
ORDER BY pr.preco;

-- Mostre o nome completo de todos os funcionários com 
-- salário entre 2000 e 5000 reais e os seus respectivos cargos
SELECT p.nome_completo, c.nome_cargo
FROM pessoa p
    INNER JOIN funcionario f
        ON p.cpf = f.cpf_funcionario
    INNER JOIN cargo c
        ON f.cargo = c.id_cargo
WHERE c.salario BETWEEN 2000 AND 5000;

-- Mostre o nome completo e o endereço das clientes 
-- que possuem o nome Maria como primeiro nome.
SELECT p.nome_completo, p.logradouro, p.numero, p.complemento, p.bairro, p.cep
FROM pessoa p 
WHERE p.nome_completo LIKE 'Maria%';

-- Mostre o preço de todas as bebidas da loja 
SELECT pr.nome, MAX(pr.preco)
FROM produto pr
WHERE pr.categoria = 'bebida'
GROUP BY pr.nome;

-- Mostre o nome e o cargo do funcionario com o menor salário
SELECT p.nome_completo, c.nome_cargo
FROM pessoa p
    INNER JOIN funcionario f
        ON p.cpf = f.cpf_funcionario
    INNER JOIN cargo c
        ON f.cargo = c.id_cargo
WHERE c.salario = (SELECT MIN(salario) FROM cargo);

-- Mostre os nomes e os preços dos produtos 
-- mais caros que a média total dos preços 
SELECT pr.nome, pr.preco
FROM produto pr
WHERE pr.preco > (SELECT AVG(pr.preco) FROM produto pr);

-- Mostre quantidade de cada tipo de produto existente na loja
SELECT categoria, COUNT(*)
FROM produto 
GROUP BY categoria
HAVING  COUNT(*) > 0

-- Mostrar a quantidade de pedidos que incluem produtos aramazenados no estoque  3 emitidos um por funcionários supervisionados
SELECT count(distinct id_pedido) as quantidade
FROM pedido pe
INNER JOIN funcionario f
    on f.cpf_funcionario = pe.cpf_funcionario_pedido
INNER JOIN contem c
    on pe.id_pedido = c.id_pedido_contem
INNER JOIN produto pr
    on c.id_produto_contem = pr.id_produto
WHERE pr.id_produto in (SELECT id_produto_armazena FROM  armazena where id_estoque_armazena = 3) and f.supervisor is not NULL

-- LEFT ou RIGHT ou FULL OUTER JOIN
-- Listar cpf e data de cadastro de todos os clientes e datas de suas respectivas compras, se houver
SELECT c.data_cadastro, pe.data_pedido 
FROM cliente c LEFT JOIN pedido pe
ON c.cpf_cliente = pe.cpf_cliente_pedido

-- IS NULL ou IS NOT NULL - ok
-- LEFT ou RIGHT ou FULL OUTER JOIN - OK
-- SUBCONSULTA COM IN - ok
-- SUBCONSULTA COM ANY
-- SUBCONSULTA COM ALL
-- UNION ou INTERSECT ou MINUS
-- CREATE VIEW
-- GRANT / REVOKE

-- PL

-- USO DE RECORD
-- USO DE ESTRUTURA DE DADOS TIPO TABLE
-- BLOCO ANÔNIMO
-- CREATE PROCEDURE
-- CREATE FUNCTION
-- %TYPE
-- %ROWTYPE
-- IF ELSIF
-- CASE WHEN
-- LOOP EXIT WHEN
-- WHILE LOOP
-- FOR IN LOPP
-- SELECT.. INTO
-- CURSOR (OPEN, FETCH e CLOSE)
-- EXCEPTION WHEN
-- USO DE PARÂMETRO (IN, OUT ou IN OUT)
-- CREATE OR REPLACE PACKAGE
-- CREATE OR REPLACE BACKAGE BODY
-- CREATE OR REPLACE PACKAGE (COMANDO)
-- CREATE OR REPLACE PACKEGE (LINHA)