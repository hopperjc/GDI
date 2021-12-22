-- Qual o nome do cliente que realizou o pedido de ID 2??
SELECT DEREF(r.cpf_cliente_realizacao).nome_completo AS Nome,
        DEREF(r.id_pedido_realizacao).id_pedido as Pedido FROM tb_realizacao r
WHERE DEREF(r.id_pedido_realizacao).id_pedido = 2;
/
-- 
SELECT DEREF(e.id_estoque) FROM tb_produto p 
WHERE p.nome = 'coxinha';
/

SELECT * FROM TABLE (SELECT c.lista_cartao_fidelidade FROM tb_lista_cartao_fidelidade_cliente c WHERE c.data_emissao = '08/10/2020');
/

--Mude a data de emição do cartão fidelidade emitido em 08/10/0202 para 12/10/2020
UDPATE TABLE (SELECT lista_cartoes FROM TABLE tb_lista_cartao_fidelidade_cliente
                WHERE data_emissao = '08/10/2020') C SET C.data_emissao = '12/10/2020' 
                WHERE (SELECT DEREF(l.cpf_cliente_cf) FROM tb_lista_cartao_fidelidade_cliente l, tb_cliente cl 
                        WHERE l.cpf_client_cf = cl.cpf_cliente);
/


-- Retorna o funcionario seu cargo e o supervisor
select DEREF(f.supervisor).nome_completo as supervisor, f.nome_completo as funcionario, DEREF(f.cargo).nome_cargo as cargo from tb_funcionario f;
/
