-- SELECT FROM WHERE
-- INNER JOIN
-- ORDER BY
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