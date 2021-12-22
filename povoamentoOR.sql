INSERT INTO tb_cargo(id_cargo, nome_cargo, salario) VALUES (01, 'Gerente', 6000);

INSERT INTO tb_cargo(id_cargo, nome_cargo, salario) VALUES (02, 'Caixa', 2000);

INSERT INTO tb_cargo(id_cargo, nome_cargo, salario) VALUES (03, 'Lojista', 4000);

INSERT INTO tb_funcionario(cpf, nome_completo, data_nascimento, telefones, cep, logradouro, numero, complemento, bairro, cargo) VALUES ('111.222.333.44', 'José da Silva', to_date('01/01/1969', 'dd/mm/yy'), tp_telefones((tp_telefone('81', '99999-9999')), (tp_telefone('81', '99999-8888'))), '00000-010', 'Rua da esquina', 123, 'apt. 1', 'esquina', (SELECT REF(c) FROM tb_cargo c WHERE c.id_cargo = 1));

INSERT INTO tb_funcionario(cpf, nome_completo, data_nascimento, telefones, cep, logradouro, numero, complemento, bairro, cargo, supervisor) VALUES ('222.333.444-55', 'Ana Sobral', to_date('24/04/1987', 'dd/mm/yy'), tp_telefones((tp_telefone('81', '88888-8888')), (tp_telefone('81', '88888-7777'))), '11111-121', 'Rua da entrada', 234, 'apt. 401', 'entrada',(SELECT REF(c) FROM tb_cargo c WHERE c.id_cargo = 3), (SELECT REF(f) FROM tb_funcionario f WHERE f.cpf = '111.222.333.44'));

INSERT INTO tb_funcionario(cpf, nome_completo, data_nascimento, telefones, cep, logradouro, numero, complemento, bairro, cargo, supervisor) VALUES ('333.444.555-66', 'Lucas Cavalcanti', to_date('14/03/1992', 'dd/mm/yy'), tp_telefones((tp_telefone('81', '77777-7777')),(tp_telefone('81', '77777-6666'))), '22222-232', 'Rua da saida', 345, 'Casa 12', 'saida', (SELECT REF(c) FROM tb_cargo c WHERE c.id_cargo = 2), (SELECT REF(f) FROM tb_funcionario f WHERE f.cpf = '111.222.333.44'));

INSERT INTO tb_cliente(cpf, nome_completo, data_nascimento, telefones, cep, logradouro, numero, complemento, bairro, data_cadastro) VALUES ('444.555.666-77', 'Matheus Cabral', to_date('08/09/1988', 'dd/mm/yy'), tp_telefones(tp_telefone('81', '66666-6666')), '33333-343', 'Avenida rosquinha', 456, 'Bloco 1 Apt. 201', 'rosquinha', to_date('05/07/2020', 'dd/mm/yy'));

INSERT INTO tb_cliente(cpf, nome_completo, data_nascimento, telefones, cep, logradouro, numero, complemento, bairro, data_cadastro) VALUES ('555.666.777-88', 'Maria Augusta', to_date('19/08/1988', 'dd/mm/yy'), tp_telefones(tp_telefone('81', '55555-5555')), '44444-454', 'Rua do povo', 567, 'apt. 902', 'povo', to_date('08/10/2020', 'dd/mm/yy'));

INSERT INTO tb_cliente(cpf, nome_completo, data_nascimento, telefones, cep, logradouro, numero, complemento, bairro, data_cadastro) VALUES ('666.777.888-99', 'José Conceição', to_date('21/09/1997', 'dd/mm/yy'), tp_telefones(tp_telefone('81', '44444-4444')), '55555-565', 'Rua Fernando Antônio', 678, 'apt. 104', 'rosquinha', to_date('25/05/2021', 'dd/mm/yy'));

INSERT INTO tb_cliente(cpf, nome_completo, data_nascimento, telefones, cep, logradouro, numero, complemento, bairro, data_cadastro) VALUES ('777.888.999-00', 'Maria Augusta Neto', to_date('01/10/1996', 'dd/mm/yy'), tp_telefones(tp_telefone('81', '33333-3333')), '66666-676', 'Avenida João Gomes', 7890, 'apt. 305', 'esquina', to_date('13/11/2021', 'dd/mm/yy'));

INSERT INTO tb_estoque(id_estoque, qtd_produtos, status_estoque) VALUES (1, 120, 'Com espaço');

INSERT INTO tb_estoque(id_estoque, qtd_produtos, status_estoque) VALUES (2, 300, 'Cheio');

INSERT INTO tb_estoque(id_estoque, qtd_produtos, status_estoque) VALUES (3, 260, 'Com espaço');

INSERT INTO tb_estoque(id_estoque, qtd_produtos, status_estoque) VALUES (4, 00, 'Vazio');

INSERT INTO tb_estoque(id_estoque, qtd_produtos, status_estoque) VALUES (5, 00, 'Vazio');

INSERT INTO tb_produto(id_produto, nome, categoria, preco) VALUES (1, 'chocolate', 'doce', 3.00);

INSERT INTO tb_produto(id_produto, nome, categoria, preco) VALUES (2, 'pastilha', 'doce', 2.00);

INSERT INTO tb_produto(id_produto, nome, categoria, preco) VALUES (3, 'bombom', 'doce', 1.50);

INSERT INTO tb_produto(id_produto, nome, categoria, preco) VALUES (4, 'salgadinho', 'salgado', 4.00);

INSERT INTO tb_produto(id_produto, nome, categoria, preco) VALUES (5, 'coxinha', 'salgado', 4.00);

INSERT INTO tb_produto(id_produto, nome, categoria, preco) VALUES (6, 'empada', 'salgado', 4.00);

INSERT INTO tb_produto(id_produto, nome, categoria, preco) VALUES (7, 'folhado', 'salgado', 5.00);

INSERT INTO tb_produto(id_produto, nome, categoria, preco) VALUES (8, 'pão pizza', 'salgado', 6.00);

INSERT INTO tb_produto(id_produto, nome, categoria, preco) VALUES (9, 'água', 'bebida', 3.00);

INSERT INTO tb_promocao(codigo_promocional, valor_desconto, data_termino) VALUES (00, 5, to_date('31/12/2022', 'dd/mm/yy'));

INSERT INTO tb_promocao(codigo_promocional, valor_desconto, data_termino) VALUES (01, 10, to_date('01/01/2022', 'dd/mm/yy'));

INSERT INTO tb_promocao(codigo_promocional, valor_desconto, data_termino) VALUES (02, 15, to_date('26/12/2021', 'dd/mm/yy'));

INSERT INTO tb_pedido(id_pedido, data_pedido, cpf_funcionario_pedido, cpf_cliente_pedido) VALUES (1, to_date('05/07/2020', 'dd/mm/yy'), (SELECT REF(f) FROM tb_funcionario f WHERE f.cpf = '333.444.555-66'), (SELECT REF(c) FROM tb_cliente c WHERE c.cpf = '444.555.666-77'));

INSERT INTO tb_pedido(id_pedido, data_pedido, cpf_funcionario_pedido, cpf_cliente_pedido) VALUES (2, to_date('15/08/2020', 'dd/mm/yy'), (SELECT REF(f) FROM tb_funcionario f WHERE f.cpf = '333.444.555-66'), (SELECT REF(c) FROM tb_cliente c WHERE c.cpf = '555.666.777-88'));

INSERT INTO tb_pedido(id_pedido, data_pedido, cpf_funcionario_pedido, cpf_cliente_pedido) VALUES (3, to_date('08/10/2020', 'dd/mm/yy'), (SELECT REF(f) FROM tb_funcionario f WHERE f.cpf = '333.444.555-66'),(SELECT REF(c) FROM tb_cliente c WHERE c.cpf ='444.555.666-77') );

INSERT INTO tb_pedido(id_pedido, data_pedido, cpf_funcionario_pedido, cpf_cliente_pedido) VALUES (4, to_date('09/10/2020', 'dd/mm/yy'), (SELECT REF(f) FROM tb_funcionario f WHERE f.cpf = '333.444.555-66'),(SELECT REF(c) FROM tb_cliente c WHERE c.cpf ='666.777.888-99') );

INSERT INTO tb_pedido(id_pedido, data_pedido, cpf_funcionario_pedido, cpf_cliente_pedido) VALUES (5, to_date('24/10/2020', 'dd/mm/yy'), (SELECT REF(f) FROM tb_funcionario f WHERE f.cpf = '333.444.555-66'),(SELECT REF(c) FROM tb_cliente c WHERE c.cpf ='777.888.999-00') );

INSERT INTO tb_pedido(id_pedido, data_pedido, cpf_funcionario_pedido, cpf_cliente_pedido) VALUES (6, to_date('02/11/2020', 'dd/mm/yy'), (SELECT REF(f) FROM tb_funcionario f WHERE f.cpf = '333.444.555-66'),(SELECT REF(c) FROM tb_cliente c WHERE c.cpf ='777.888.999-00') );

INSERT INTO tb_pedido(id_pedido, data_pedido, cpf_funcionario_pedido, cpf_cliente_pedido) VALUES (7, to_date('10/11/2020', 'dd/mm/yy'), (SELECT REF(f) FROM tb_funcionario f WHERE f.cpf = '333.444.555-66'),(SELECT REF(c) FROM tb_cliente c WHERE c.cpf ='777.888.999-00') );

INSERT INTO tb_realizacao(id_pedido_realizacao, cpf_cliente_realizacao, codigo_promocional_realizacao) VALUES ((SELECT REF (p) FROM tb_pedido p WHERE p.id_pedido = 1),  (SELECT REF(c) FROM tb_cliente c WHERE c.cpf = '444.555.666-77'), 00);

INSERT INTO tb_realizacao(id_pedido_realizacao, cpf_cliente_realizacao, codigo_promocional_realizacao) VALUES ((SELECT REF (p) FROM tb_pedido p WHERE p.id_pedido = 2),  (SELECT REF(c) FROM tb_cliente c WHERE c.cpf = '555.666.777-88'), 00);

INSERT INTO tb_realizacao(id_pedido_realizacao, cpf_cliente_realizacao, codigo_promocional_realizacao) VALUES ((SELECT REF (p) FROM tb_pedido p WHERE p.id_pedido = 3),  (SELECT REF(c) FROM tb_cliente c WHERE c.cpf = '444.555.666-77'), 01);

INSERT INTO tb_realizacao(id_pedido_realizacao, cpf_cliente_realizacao, codigo_promocional_realizacao) VALUES ((SELECT REF (p) FROM tb_pedido p WHERE p.id_pedido = 4),  (SELECT REF(c) FROM tb_cliente c WHERE c.cpf = '666.777.888-99'), 00);

INSERT INTO tb_realizacao(id_pedido_realizacao, cpf_cliente_realizacao, codigo_promocional_realizacao) VALUES ((SELECT REF (p) FROM tb_pedido p WHERE p.id_pedido = 5),  (SELECT REF(c) FROM tb_cliente c WHERE c.cpf = '777.888.999-00'), 02);

INSERT INTO tb_realizacao(id_pedido_realizacao, cpf_cliente_realizacao, codigo_promocional_realizacao) VALUES ((SELECT REF (p) FROM tb_pedido p WHERE p.id_pedido = 6),  (SELECT REF(c) FROM tb_cliente c WHERE c.cpf = '777.888.999-00'), 00);

INSERT INTO tb_realizacao(id_pedido_realizacao, cpf_cliente_realizacao, codigo_promocional_realizacao) VALUES ((SELECT REF (p) FROM tb_pedido p WHERE p.id_pedido = 7),  (SELECT REF(c) FROM tb_cliente c WHERE c.cpf = '777.888.999-00'), 00);

INSERT INTO tb_lista_cartao_fidelidade VALUES ('444.555.666-77', tp_nt_cartao_fidelidade(tp_cartao_fidelidade(to_date('05/07/2020', 'dd/mm/yy')), tp_cartao_fidelidade(to_date('08/10/2020', 'dd/mm/yy'))));

INSERT INTO tb_lista_cartao_fidelidade VALUES ('555.666.777-88', tp_nt_cartao_fidelidade(tp_cartao_fidelidade(to_date('15/08/2020', 'dd/mm/yy'))));

INSERT INTO tb_lista_cartao_fidelidade VALUES ('777.888.999-00', tp_nt_cartao_fidelidade(tp_cartao_fidelidade(to_date('24/10/2020','dd/mm/yy')), tp_cartao_fidelidade(to_date('02/11/2020', 'dd/mm/yy')), tp_cartao_fidelidade(to_date('10/11/2020', 'dd/mm/yy'))));

INSERT INTO tb_contem VALUES (3, (SELECT REF (pe) FROM tb_pedido pe WHERE pe.id_pedido = 1), (SELECT REF (pr) FROM tb_produto pr WHERE pr.id_produto = 1));

INSERT INTO tb_contem VALUES (2, (SELECT REF (pe) FROM tb_pedido pe WHERE pe.id_pedido = 1), (SELECT REF (pr) FROM tb_produto pr WHERE pr.id_produto = 3));

INSERT INTO tb_contem VALUES (2, (SELECT REF (pe) FROM tb_pedido pe WHERE pe.id_pedido = 1), (SELECT REF (pr) FROM tb_produto pr WHERE pr.id_produto = 4));

INSERT INTO tb_contem VALUES (6, (SELECT REF (pe) FROM tb_pedido pe WHERE pe.id_pedido = 2), (SELECT REF (pr) FROM tb_produto pr WHERE pr.id_produto = 6));

INSERT INTO tb_contem VALUES (3, (SELECT REF (pe) FROM tb_pedido pe WHERE pe.id_pedido = 2), (SELECT REF (pr) FROM tb_produto pr WHERE pr.id_produto = 5));

INSERT INTO tb_contem VALUES (1, (SELECT REF (pe) FROM tb_pedido pe WHERE pe.id_pedido = 3), (SELECT REF (pr) FROM tb_produto pr WHERE pr.id_produto = 4));

INSERT INTO tb_contem VALUES (4, (SELECT REF (pe) FROM tb_pedido pe WHERE pe.id_pedido = 4), (SELECT REF (pr) FROM tb_produto pr WHERE pr.id_produto = 7));

INSERT INTO tb_contem VALUES (2, (SELECT REF (pe) FROM tb_pedido pe WHERE pe.id_pedido = 4), (SELECT REF (pr) FROM tb_produto pr WHERE pr.id_produto = 7));

INSERT INTO tb_contem VALUES (1, (SELECT REF (pe) FROM tb_pedido pe WHERE pe.id_pedido = 5), (SELECT REF (pr) FROM tb_produto pr WHERE pr.id_produto = 3));

INSERT INTO tb_contem VALUES (2, (SELECT REF (pe) FROM tb_pedido pe WHERE pe.id_pedido = 5), (SELECT REF (pr) FROM tb_produto pr WHERE pr.id_produto = 6));

INSERT INTO tb_contem VALUES (1, (SELECT REF (pe) FROM tb_pedido pe WHERE pe.id_pedido = 6), (SELECT REF (pr) FROM tb_produto pr WHERE pr.id_produto = 5));

INSERT INTO tb_contem VALUES (1, (SELECT REF (pe) FROM tb_pedido pe WHERE pe.id_pedido = 6), (SELECT REF (pr) FROM tb_produto pr WHERE pr.id_produto = 6));

INSERT INTO tb_contem VALUES (1, (SELECT REF (pe) FROM tb_pedido pe WHERE pe.id_pedido = 6), (SELECT REF (pr) FROM tb_produto pr WHERE pr.id_produto = 8));

INSERT INTO tb_contem VALUES (1, (SELECT REF (pe) FROM tb_pedido pe WHERE pe.id_pedido = 6), (SELECT REF (pr) FROM tb_produto pr WHERE pr.id_produto = 9));

INSERT INTO tb_contem VALUES (3, (SELECT REF (pe) FROM tb_pedido pe WHERE pe.id_pedido = 7), (SELECT REF (pr) FROM tb_produto pr WHERE pr.id_produto = 2));

INSERT INTO tb_armazena VALUES (to_date('03/02/2020', 'dd/mm/yy'), (SELECT REF (es) FROM tb_estoque es WHERE es.id_estoque = 1), (SELECT REF (p) FROM tb_produto p WHERE p.id_produto = 1), (SELECT REF (f) FROM tb_funcionario f WHERE f.cpf = '222.333.444-55'));

INSERT INTO tb_armazena VALUES (to_date('20/02/2020', 'dd/mm/yy'), (SELECT REF (es) FROM tb_estoque es WHERE es.id_estoque = 1), (SELECT REF (p) FROM tb_produto p WHERE p.id_produto = 2), (SELECT REF (f) FROM tb_funcionario f WHERE f.cpf = '222.333.444-55'));

INSERT INTO tb_armazena VALUES (to_date('14/03/2020', 'dd/mm/yy'), (SELECT REF (es) FROM tb_estoque es WHERE es.id_estoque = 1), (SELECT REF (p) FROM tb_produto p WHERE p.id_produto = 3), (SELECT REF (f) FROM tb_funcionario f WHERE f.cpf = '222.333.444-55'));

INSERT INTO tb_armazena VALUES (to_date('19/03/2020', 'dd/mm/yy'), (SELECT REF (es) FROM tb_estoque es WHERE es.id_estoque = 2), (SELECT REF (p) FROM tb_produto p WHERE p.id_produto = 4), (SELECT REF (f) FROM tb_funcionario f WHERE f.cpf = '222.333.444-55'));

INSERT INTO tb_armazena VALUES (to_date('19/03/2020', 'dd/mm/yy'), (SELECT REF (es) FROM tb_estoque es WHERE es.id_estoque = 2), (SELECT REF (p) FROM tb_produto p WHERE p.id_produto = 5), (SELECT REF (f) FROM tb_funcionario f WHERE f.cpf = '222.333.444-55'));

INSERT INTO tb_armazena VALUES (to_date('19/03/2020', 'dd/mm/yy'), (SELECT REF (es) FROM tb_estoque es WHERE es.id_estoque = 2), (SELECT REF (p) FROM tb_produto p WHERE p.id_produto = 6), (SELECT REF (f) FROM tb_funcionario f WHERE f.cpf = '222.333.444-55'));

INSERT INTO tb_armazena VALUES (to_date('19/03/2020', 'dd/mm/yy'), (SELECT REF (es) FROM tb_estoque es WHERE es.id_estoque = 2), (SELECT REF (p) FROM tb_produto p WHERE p.id_produto = 7), (SELECT REF (f) FROM tb_funcionario f WHERE f.cpf = '222.333.444-55'));

INSERT INTO tb_armazena VALUES (to_date('19/03/2020', 'dd/mm/yy'), (SELECT REF (es) FROM tb_estoque es WHERE es.id_estoque = 2), (SELECT REF (p) FROM tb_produto p WHERE p.id_produto = 8), (SELECT REF (f) FROM tb_funcionario f WHERE f.cpf = '222.333.444-55'));

INSERT INTO tb_armazena VALUES (to_date('19/03/2020', 'dd/mm/yy'), (SELECT REF (es) FROM tb_estoque es WHERE es.id_estoque = 3), (SELECT REF (p) FROM tb_produto p WHERE p.id_produto = 9), (SELECT REF (f) FROM tb_funcionario f WHERE f.cpf = '222.333.444-55'));