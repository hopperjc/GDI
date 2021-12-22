-- Qual o nome do cliente que realizou o pedido de ID 2??
SELECT DEREF(r.cpf_cliente_realizacao).nome_completo AS Nome,
        DEREF(r.id_pedido_realizacao).id_pedido as Pedido FROM tb_realizacao r
WHERE DEREF(r.id_pedido_realizacao).id_pedido = 2;
/
--Mostre o segundo telefone do gerente da loja. 
DECLARE
n tb_funcionario.telefones%TYPE
BEGIN 
SELECT f.telefones INTO n FROM tb_funcionario f WHERE DEREF(f.cargo).nome_cargo = 'Gerente';
DBMS_OUTPUT.PUT_LINE('Segundo telefone do gerente: ' || n(2).ddd || ' - ' || n(2).numero);
END;
/
-- Exiba as datas de emissão dos cartões fidelidade da Cliente de cpf '444.555.666-77'.
SELECT * FROM TABLE (SELECT c.lista_cartao_fidelidade FROM tb_lista_cartao_fidelidade c WHERE c.cpf_cliente_cf = '444.555.666-77');
/

--Mude a data de emição do cartão fidelidade emitido em 08/10/0202 para 12/10/2020.
UPDATE TABLE (SELECT c.lista_cartao_fidelidade FROM tb_lista_cartao_fidelidade c WHERE c.cpf_cliente_cf = '444.555.666-77') cf
    SET cf.data_emissao = to_date('12/10/2020', 'dd/mm/yy')
    WHERE cf.data_emissao = to_date('08/10/2020', 'dd/mm/yy')


-- Retorna o funcionario seu cargo e o supervisor.
select DEREF(f.supervisor).nome_completo as supervisor, f.nome_completo as funcionario, DEREF(f.cargo).nome_cargo as cargo from tb_funcionario f;
/
