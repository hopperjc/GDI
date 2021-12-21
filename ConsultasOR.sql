-- Qual o nome do cliente que realizou o pedido de ID 2??
SELECT DEREF(c.nome) FROM tb_realizacao r
INNER JOIN tb_cliente c
ON r.cpf_cliente_realizacao = c.cpf
WHERE id_pedido_realizacao = 2;
/

