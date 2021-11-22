-- SELECT FROM WHERE
-- INNER JOIN
-- ORDER BY
-- Consulta sobre a quantidade de produtos 
-- que a cliente 'Maria Augusta' levou ao 
-- realizar um pedido na loja, 
-- ordenados pelo preço dos produtos.
SELECT quantidade
FROM cliente cl
    INNER JOIN  realizacao r
        ON cl.cpf_cliente == r.cpf_cliente_realizacao
    INNER JOIN  pedido p
        ON r.id_pedido_realizacao == p.id_pedido
    INNER JOIN contem c
        ON p.id_pedido == c.id_pedido_contem
    INNER JOIN produto p
        ON c.id_produto_contem == p.id_produto
WHERE cl.nome_completo == 'Maria Augusta'
ORDER BY  p.preco;


-- BETWEEN
-- LIKE 
-- IS NULL ou IS NOT NULL
-- MAX
-- MIN
-- AVG
-- COUNT
-- LEFT ou RIGHT ou FULL OUTER JOIN
-- SUBCONSULTA COM OPERADOR RELACIONAL
-- SUBCONSULTA COM IN
-- SUBCONSULTA COM ANY
-- SUBCONSULTA COM ALL
-- GROUP BY
-- HAVING
-- UNION ou INTERSECT ou MINUS
-- CREATE VIEW
-- GRANT / REVOKE
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