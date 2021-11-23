-- SQL

-- SELECT FROM WHERE OK
-- BETWEEN OK
-- IN OK
-- LIKE OK 
-- IS NULL ou IS NOT NULL OK
-- INNER JOIN OK
-- MAX OK 
-- MIN OK
-- AVG OK
-- COUNT OK
-- LEFT ou RIGHT ou FULL OUTER JOIN OK
-- SUBCONSULTA COM OPERADOR RELACIONAL OK
-- SUBCONSULTA COM IN OK
-- SUBCONSULTA COM ANY OK
-- SUBCONSULTA COM ALL OK
-- ORDER BY OK
-- GROUP BY OK 
-- HAVING OK
-- UNION ou INTERSECT ou MINUS OK
-- CREATE VIEW OK

-- Consulta sobre a quantidade de produtos que a cliente 'Maria Augusta' levou ao realizar um pedido na loja e o total pago pelos produtos. 
SELECT SUM(quantidade) as quantidade, SUM(pr.preco) as preço
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

-- Mostre o nome, categoria e preço dos produtos comprados por 'Maria Augusta Neto' ordenados pelo preço.
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

-- Mostre o nome completo de todos os funcionários com salário entre 2000 e 5000 reais e os seus respectivos cargos
SELECT p.nome_completo, c.nome_cargo
FROM pessoa p
    INNER JOIN funcionario f
        ON p.cpf = f.cpf_funcionario
    INNER JOIN cargo c
        ON f.cargo = c.id_cargo
WHERE c.salario BETWEEN 2000 AND 5000;

-- Mostre o nome completo e o endereço das clientes que possuem o nome Maria como primeiro nome.
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

-- Mostre os nomes e os preços dos produtos mais caros que a média total dos preços 
SELECT pr.nome, pr.preco
FROM produto pr
WHERE pr.preco > (SELECT AVG(pr.preco) FROM produto pr);

-- Mostre quantidade de cada tipo de produto existente na loja
SELECT categoria, COUNT(*)
FROM produto 
GROUP BY categoria
HAVING  COUNT(*) > 0;

-- Mostrar a quantidade de pedidos que incluem produtos aramazenados no estoque 3 emitidos um por funcionários supervisionados
SELECT count(distinct id_pedido) AS quantidade
FROM pedido pe
INNER JOIN funcionario f
    ON f.cpf_funcionario = pe.cpf_funcionario_pedido
INNER JOIN contem c
    ON pe.id_pedido = c.id_pedido_contem
INNER JOIN produto pr
    ON c.id_produto_contem = pr.id_produto
WHERE pr.id_produto IN (SELECT id_produto_armazena 
                            FROM  armazena 
                            WHERE id_estoque_armazena = 3)
AND f.supervisor is not NULL;

-- Listar cpf e data de cadastro de todos os clientes e datas de suas respectivas compras, se houver
SELECT c.data_cadastro, pe.data_pedido 
FROM cliente c 
    LEFT JOIN pedido pe
        ON c.cpf_cliente = pe.cpf_cliente_pedido;

-- Listar os produtos que são mais baratos do que qualquer bebida
SELECT pr.nome 
FROM produto pr 
WHERE pr.preco < ALL (SELECT pr.preco FROM produto pr WHERE pr.categoria = 'bebida')

-- Mostre todos os funcionários e clientes que moram na rua da esquina
SELECT p.nome_completo, p.logradouro
FROM pessoa p
    INNER JOIN funcionario f
        ON p.cpf == f.cpf_funcionario
WHERE p.bairro = 'esquina'
UNION
SELECT p.nome_completo, p.logradouro 
FROM pessoa p
    INNER JOIN cliente cl
        ON p.cpf == cl.cpf_cliente
WHERE p.bairro = 'esquina';

-- Mostre qualquer produto e sua categoria que valha mais de 10 reais
SELECT pr.nome, pr.categoria
FROM produto pr
WHERE pr.preco = ANY (SELECT pr.preco FROM produto pr WHERE pr.preco > 10);

CREATE VIEW estoque_de_produtos_disponiveis AS estoquesDisponivel
SELECT p.nome, a.id_estoque_armazena
FROM  produto p, armazena a
    INNER JOIN estoque e
        on a.id_estoque_armazena = e.id_estoque
where e.status_estoque NOT LIKE 'Cheio';


-- GRANT / REVOKE

-- PL

-- USO DE RECORD
DECLARE 
   cliente_rec cliente%rowtype; 
BEGIN 
   SELECT * INTO cliente_rec 
   FROM cliente cl 
   WHERE cl.nome_completo = 'José Conceição';  
   dbms_output.put_line('CPF Cliente: ' || cliente_rec.cpf); 
   dbms_output.put_line('Nome Cliente: ' || cliente_rec.nome_completo); 
   dbms_output.put_line('Data de Nascimento Cliente: ' || cliente_rec.data_nascimento); 
   dbms_output.put_line('CEP Cliente: ' || cliente_rec.cep); 
   dbms_output.put_line('Logradouro Cliente: ' || cliente_rec.logradouro); 
   dbms_output.put_line('Número Cliente: ' || cliente_rec.numero); 
   dbms_output.put_line('Complemento Cliente: ' || )cliente_rec.complemento; 
   dbms_output.put_line('Bairro Cliente: ' || cliente_rec.bairro); 
END; 
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