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
/
-- Retorna o funcionario seu cargo e o supervisor.
select DEREF(f.supervisor).nome_completo as supervisor, f.nome_completo as funcionario, DEREF(f.cargo).nome_cargo as cargo from tb_funcionario f;
/
-- Nome, ID e Categoria dos produtos que custam 4.00
SELECT nome, id_produto, categoria FROM tb_produto WHERE preco = 4.00;
/
-- Status dos estoque com ID abaixo de 3
SELECT status_estoque FROM tb_estoque WHERE id_estoque <= 3;
/
-- Nome completo dos gerentes
SELECT f.nome_completo FROM tb_funcionario f WHERE DEREF(f.cargo).nome_cargo = 'Gerente';
/
-- Produtos armazenados no mês de março de 2020
select deref(a.id_produto_armazena).nome as produto,
    deref(a.id_estoque_armazena).status_estoque as status,
    deref(a.cpf_funcionario_armazena).nome_completo as funcionario 
    from  tb_armazena a where a.data_armazenagem between to_date('1/3/2020', 'dd/mm/yy') and  to_date('31/3/2020', 'dd/mm/yy') ;
/
-- Quantidade de armazenagens de cada funcionario
select deref(a.cpf_funcionario_armazena).nome_completo as produto, count(a.id_produto_armazena) as quantidade from tb_armazena a
    group by deref(a.cpf_funcionario_armazena).nome_completo;
/
-- Valor final de pedido 1 realizado    
select sum(c.quantidade*p.preco) - max(pr.valor_desconto) as valor from tb_realizacao r
    inner join tb_contem c
    on c.id_pedido_contem = (select ref(pe) from tb_pedido pe where pe.id_pedido = 1)
    inner join tb_produto p
    on p.id_produto = deref(c.id_produto_contem).id_produto
    inner join tb_promocao pr
    on pr.codigo_promocional = r.codigo_promocional_realizacao
    where id_pedido_realizacao = (select ref(pe) from tb_pedido pe where pe.id_pedido = 1) and pr.data_termino > trunc(sysdate);
