-- SQL

-- SELECT FROM WHERE - OK
-- BETWEEN - OK
-- IN - OK
-- LIKE - OK 
-- IS NULL ou IS NOT NULL - OK
-- INNER JOIN - OK
-- MAX - OK 
-- MIN - OK
-- AVG - OK
-- COUNT - OK
-- LEFT ou RIGHT ou FULL OUTER JOIN - OK
-- SUBCONSULTA COM OPERADOR RELACIONAL - OK
-- SUBCONSULTA COM IN - OK
-- SUBCONSULTA COM ANY - OK
-- SUBCONSULTA COM ALL - OK
-- ORDER BY - OK
-- GROUP BY - OK 
-- HAVING - OK
-- UNION ou INTERSECT ou MINUS - OK
-- CREATE VIEW - OK

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
SELECT count(DISTINCT id_pedido) AS quantidade
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

-- Crie uma maneira de ver se um estoque está disponível
CREATE VIEW estoque_de_produtos_disponiveis AS estoquesDisponivel
SELECT p.nome, a.id_estoque_armazena
FROM  produto p, armazena a
    INNER JOIN estoque e
        on a.id_estoque_armazena = e.id_estoque
where e.status_estoque NOT LIKE 'Cheio';


-- GRANT / REVOKE

-- PL

-- USO DE RECORD
-- USO DE ESTRUTURA DE DADOS TIPO TABLE
-- BLOCO ANÔNIMO
-- CREATE PROCEDURE - OK
-- CREATE FUNCTION - OK
-- %TYPE - OK
-- %ROWTYPE - OK
-- IF ELSIF - OK
-- CASE WHEN - OK
-- LOOP EXIT WHEN - OK
-- WHILE LOOP 
-- FOR IN LOPP 
-- SELECT.. INTO - OK
-- CURSOR (OPEN, FETCH e CLOSE) - OK
-- EXCEPTION WHEN - OK
-- USO DE PARÂMETRO (IN, OUT ou IN OUT) - OK
-- CREATE OR REPLACE PACKAGE - OK
-- CREATE OR REPLACE BACKAGE BODY - OK
-- CREATE OR REPLACE PACKAGE (COMANDO) 
-- CREATE OR REPLACE PACKEGE (LINHA) - OK

-- Trigger (linha) para verificação de preço dos produtos inseridos
CREATE OR REPLACE TRIGGER prod_preco
BEFORE UPDATE ON produto 
FOR EACH ROW
BEGIN
    IF :NEW.preco < 0 THEN
        RAISE_APPLICATION_ERROR(-20101, 'Preço do produto não pode ser menor que 0');
    END IF;
END;


SELECT COUNT(*) INTO quantidade_prod FROM produto;

-- Mostre a variedade de salgados que tem na loja
CREATE OR REPLACE FUNCTION variedade_salgados RETURN INTEGER IS 
retorno INTEGER;
tipo produto.categoria%TYPE;
BEGIN
    WHILE quantidade > 0 LOOP
        IF tipo = 'salgado' THEN
            retorno := retorno + 1;
        END IF;
        quantidade := quantidade - 1;
    END LOOP;
    RETURN retorno;
END;

-- Recuperando as informações de gerente
CREATE OR REPLACE PROCEDURE info_func_gerentes IS
v_cpf_func funcionario.cpf_funcionario%TYPE;
v_cpf_sup funcionario.supervisor%TYPE;
v_cargo_func funcionario.cargo%TYPE := 01;

CURSOR c_func IS
SELECT cpf_funcionario, supervisor, cargo
FROM funcionario
WHERE cargo = v_cargo_func;

BEGIN
    OPEN c_func;
    LOOP
        FETCH c_func INTO v_cpf_func, v_cpf_sup, v_cargo_func;
        EXIT WHEN c_func%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Funcionário: '|| ' ' ||
        TO_CHAR(v_cpf_func) || ' ' || TO_CHAR(v_cpf_sup) || ' ' || TO_CHAR(v_cargo_func));
    END LOOP;
    CLOSE c_func;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        INSERT INTO log_table (info) VALUES ('Funcionário com cargo Gerente não existe!');
END;

-- Procedimento para aumentar o salário dos funcionários
CREATE OR REPLACE PROCEDURE aumento_salario 
(cargoNovo IN cargo.nome_cargo%TYPE) IS

BEGIN
    CASE cargoNovo
    WHEN 'Gerente' THEN
        UPDATE cargoNovo
        SET salario = 10000
        WHERE nome_cargo = 'Gerente'
    WHEN 'Lojista' THEN
        UPDATE cargoNovo
        SET salario = 6000
        WHERE nome_cargo = 'Logista';
    WHEN 'Caixa' THEN
        UPDATE cargoNovo
        SET salario_cargo = 4000
        WHERE nome_cargo = 'Caixa';
    END CASE;
END;

--Declaração package para cadastro de cargos
CREATE OR REPLACE PACKAGE funcionario_package AS cadastro_cargo
CREATE OR REPLACE PROCEDURE insere_cargo (p_salario_cargo cargo.salario_cargo%TYPE, p_nome_cargo cargo.nome_cargo%TYPE);
CREATE OR REPLACE PROCEDURE remove_cargo (p_nome_cargo IN cargo.nome_cargo%TYPE);
END funcionario_package;

--Definição package para cadastro de cargos
CREATE OR REPLACE PACKAGE BODY funcionario_package AS cadastro_cargo
CREATE OR REPLACE PROCEDURE insere_cargo (p_id_cargo cargo.id_Cargo%TYPE, p_salario_cargo cargo.salario%TYPE, p_nome_cargo cargo.nome_cargo%TYPE) IS
BEGIN
    INSERT INTO cargo (id_cargo, nome_cargo, salario_cargo) VALUES (p_id_cargo, p_nome_cargo, p_salario_cargo);
COMMIT;
END insere_cargo;

CREATE OR REPLACE PROCEDURE remove_cargo (p_nome_cargo IN cargo.nome_cargo%TYPE) IS
BEGIN
    DELETE FROM cargo
    WHERE nome_cargo = p_nome_cargo;
    IF SQL%NOTFOUND THEN SQL%NOTFOUND THEN
        INSERT INTO log_table (info) VALUES ('Cargo não existe!');
    END IF;
COMMIT;
END remove_cargo;
END funcionario_package;