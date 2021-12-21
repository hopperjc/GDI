INSERT INTO tb_cargo(id_cargo, nome_cargo, salario) VALUES (01, 'Gerente', 6000);

INSERT INTO tb_cargo(id_cargo, nome_cargo, salario) VALUES (02, 'Caixa', 2000);

INSERT INTO tb_cargo(id_cargo, nome_cargo, salario) VALUES (03, 'Lojista', 4000);

INSERT INTO tb_funcionario(cpf, nome_completo, data_nascimento, cep, logradouro, numero, complemento, bairro, cargo) VALUES ('111.222.333.44', 'José da Silva', to_date('01/01/1969', 'dd/mm/yy'), '00000-010', 'Rua da esquina', 123, 'apt. 1', 'esquina', 01);

INSERT INTO tb_funcionario(cpf, nome_completo, data_nascimento, cep, logradouro, numero, complemento, bairro,cargo) VALUES ('222.333.444-55', 'Ana Sobral', to_date('24/04/1987', 'dd/mm/yy'), '11111-121', 'Rua da entrada', 234, 'apt. 401', 'entrada', 03);

INSERT INTO tb_funcionario(cpf, nome_completo, data_nascimento, cep, logradouro, numero, complemento, bairro,cargo) VALUES ('333.444.555-66', 'Lucas Cavalcanti', to_date('14/03/1992', 'dd/mm/yy'), '22222-232', 'Rua da saida', 345, 'Casa 12', 'saida', 02);

INSERT INTO tb_cliente(cpf, nome_completo, data_nascimento, cep, logradouro, numero, complemento, bairro, data_cadastro) VALUES ('444.555.666-77', 'Matheus Cabral', to_date('08/09/1988', 'dd/mm/yy'), '33333-343', 'Avenida rosquinha', 456, 'Bloco 1 Apt. 201', 'rosquinha', to_date('05/07/2020', 'dd/mm/yy'));

INSERT INTO tb_cliente(cpf, nome_completo, data_nascimento, cep, logradouro, numero, complemento, bairro, data_cadastro) VALUES ('555.666.777-88', 'Maria Augusta', to_date('19/08/1988', 'dd/mm/yy'), '44444-454', 'Rua do povo', 567, 'apt. 902', 'povo', to_date('08/10/2020', 'dd/mm/yy'));

INSERT INTO tb_cliente(cpf, nome_completo, data_nascimento, cep, logradouro, numero, complemento, bairro, data_cadastro) VALUES ('666.777.888-99', 'José Conceição', to_date('21/09/1997', 'dd/mm/yy'), '55555-565', 'Rua Fernando Antônio', 678, 'apt. 104', 'rosquinha', to_date('25/05/2021', 'dd/mm/yy'));

INSERT INTO tb_cliente(cpf, nome_completo, data_nascimento, cep, logradouro, numero, complemento, bairro, data_cadastro) VALUES ('777.888.999-00', 'Maria Augusta Neto', to_date('01/10/1996', 'dd/mm/yy'), '66666-676', 'Avenida João Gomes', 7890, 'apt. 305', 'esquina', to_date('13/11/2021', 'dd/mm/yy'));

INSERT INTO tb_estoque(id_estoque, qtd_produtos, status_estoque) VALUES (seq_id_estoque.nextval, 120, 'Com espaço');

INSERT INTO tb_estoque(id_estoque, qtd_produtos, status_estoque) VALUES (seq_id_estoque.nextval, 300, 'Cheio');

INSERT INTO tb_estoque(id_estoque, qtd_produtos, status_estoque) VALUES (seq_id_estoque.nextval, 260, 'Com espaço');

INSERT INTO tb_estoque(id_estoque, qtd_produtos, status_estoque) VALUES (seq_id_estoque.nextval, 200, 'Cheio');

INSERT INTO tb_estoque(id_estoque, qtd_produtos, status_estoque) VALUES (seq_id_estoque.nextval, 00, 'Vazio');

INSERT INTO tb_produto(id_produto, nome, categoria, preco) VALUES (2, 'pastilha', 'doce', 2.00);

INSERT INTO tb_produto(id_produto, nome, categoria, preco) VALUES (3, 'bombom', 'doce');

INSERT INTO tb_produto(id_produto, nome, categoria, preco) VALUES (4, 'salgadinho', 'salgado', 4.00);

INSERT INTO tb_produto(id_produto, nome, categoria, preco) VALUES (5, 'coxinha', 'salgado', 4.00);

INSERT INTO tb_produto(id_produto, nome, categoria, preco) VALUES (6, 'empada', 'salgado', 4.00);

INSERT INTO tb_produto(id_produto, nome, categoria, preco) VALUES (7, 'folhado', 'salgado', 5.00);

INSERT INTO tb_produto(id_produto, nome, categoria, preco) VALUES (8, 'pão pizza', 'salgado', 6.00);

INSERT INTO tb_produto(id_produto, nome, categoria, preco) VALUES (9, 'água', 'bebida', 3.00);

INSERT INTO tb_promocao(codigo_promocional, valor_desconto, data_termino) VALUES (00, 0, to_date('31/12/2022', 'dd/mm/yy'));

INSERT INTO tb_promocao(codigo_promocional, valor_desconto, data_termino) VALUES (01, 0.15, to_date('01/01/2022', 'dd/mm/yy'));

INSERT INTO tb_promocao(codigo_promocional, valor_desconto, data_termino) VALUES (02, 0.20, to_date('26/12/2021', 'dd/mm/yy'));

INSERT INTO tb_cartao_fidelidade(data_emissao, cpf_cliente_cf) VALUES (to_date('05/07/2020', 'dd/mm/yy'), (SELECT REF(c) FROM tb_cliente c WHERE c.cpf = '444.555.666-77'));

INSERT INTO tb_cartao_fidelidade(data_emissao, cpf_cliente_cf) VALUES (to_date('08/10/2020', 'dd/mm/yy'), (SELECT REF(c) FROM tb_cliente c WHERE c.cpf = '555.666.777-88'));

INSERT INTO tb_cartao_fidelidade(data_emissao, cpf_cliente_cf) VALUES (to_date('25/05/2021', 'dd/mm/yy'), (SELECT REF(c) FROM tb_cliente c WHERE c.cpf = '666.777.888-99'));

INSERT INTO tb_cartao_fidelidade(data_emissao, cpf_cliente_cf) VALUES (to_date('13/11/2021', 'dd/mm/yy'), (SELECT REF(c) FROM tb_cliente c WHERE c.cpf = '777.888.999-00'));

INSERT INTO tb_pedido(id_pedido, data_pedido, cpf_funcionario_pedido, cpf_cliente_pedido) VALUES (1, to_date('05/07/2020', 'dd/mm/yy'), (SELECT REF(f) FROM tb_funcionario f WHERE f.cpf = '333.444.555-66'), (SELECT REF(c) FROM tb_cliente c WHERE c.cpf = '444.555.666-77'));

INSERT INTO tb_pedido(id_pedido, data_pedido, cpf_funcionario_pedido, cpf_cliente_pedido) VALUES (2, to_date('08/10/2020', 'dd/mm/yy'), (SELECT REF(f) FROM tb_funcionario f WHERE f.cpf = '333.444.555-66'),(SELECT REF(c) FROM tb_cliente c WHERE c.cpf ='555.666.777-88') );

INSERT INTO tb_realizacao(id_pedido_realizacao, cpf_cliente_realizacao, codigo_promocional_realizacao) VALUES ((SELECT REF (p) FROM tb_pedido p WHERE p.id_pedido = 2),  (SELECT REF(c) FROM tb_cliente c WHERE c.cpf = '444.555.666-77'), 00);