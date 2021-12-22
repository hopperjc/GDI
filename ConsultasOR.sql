-- Qual o nome do cliente que realizou o pedido de ID 2??
SELECT DEREF(r.cpf_cliente_realizacao).nome_completo AS Nome,
        DEREF(r.id_pedido_realizacao).id_pedido as Pedido FROM tb_realizacao r
WHERE DEREF(r.id_pedido_realizacao).id_pedido = 2;
/
--Mostre o segundo telefone do gerente da loja 
DECLARE
n tb_funcionario.telefones%TYPE
BEGIN 
SELECT f.telefones INTO n FROM tb_funcionario f WHERE DEREF(f.cargo).nome_cargo = 'Gerente';
DBMS_OUTPUT.PUT_LINE('Segundo telefone do gerente: ' || n(2).ddd || ' - ' || n(2).numero);
END;
/
-- Exiba os detalhes da Cliente de nome completo 'Maria Augusta'.

-- Retorna o funcionario seu cargo e o supervisor
select DEREF(f.supervisor).nome_completo as supervisor, f.nome_completo as funcionario, DEREF(f.cargo).nome_cargo as cargo from tb_funcionario f;
/
