INSERT INTO pessoa(cpf, nome_completo, data_nascimento, cep, logradouro, numero, complemento, bairro) VALUES ('111.222.333.44', 'José da Silva', to_date('01/01/1969', 'dd/mm/yy'), '00000-010', 'Rua da esquina', 123, 'apt. 1', 'esquina');

INSERT INTO pessoa(cpf, nome_completo, data_nascimento, cep, logradouro, numero, complemento, bairro) VALUES ('222.333.444-55', 'Ana Sobral', to_date('24/04/1987', 'dd/mm/yy'), '11111-121', 'Rua da entrada', 234, 'apt. 401', 'entrada');

INSERT INTO pessoa(cpf, nome_completo, data_nascimento, cep, logradouro, numero, complemento, bairro) VALUES ('333.444.555-66', 'Lucas Cavalcanti', to_date('14/03/1992', 'dd/mm/yy'), '22222-232', 'Rua da saida', 345, 'Casa 12', 'saida');

INSERT INTO pessoa(cpf, nome_completo, data_nascimento, cep, logradouro, numero, complemento, bairro) VALUES ('444.555.666-77', 'Matheus Cabral', to_date('08/09/1988', 'dd/mm/yy'), '33333-343', 'Avenida rosquinha', 456, 'Bloco 1 Apt. 201', 'rosquinha');

INSERT INTO pessoa(cpf, nome_completo, data_nascimento, cep, logradouro, numero, complemento, bairro) VALUES ('555.666.777-88', 'Maria Augusta', to_date('19/08/1988', 'dd/mm/yy'), '44444-454', 'Rua do povo', 567, 'apt. 902', 'povo');

INSERT INTO pessoa(cpf, nome_completo, data_nascimento, cep, logradouro, numero, complemento, bairro) VALUES ('666.777.888-99', 'José Conceição', to_date('21/09/1997', 'dd/mm/yy'), '55555-565', 'Rua Fernando Antônio', 678, 'apt. 104', 'rosquinha');

INSERT INTO pessoa(cpf, nome_completo, data_nascimento, cep, logradouro, numero, complemento, bairro) VALUES ('777.888.999-00', 'Maria Augusta Neto', to_date('01/10/1996', 'dd/mm/yy'), '66666-676', 'Avenida João Gomes', 7890, 'apt. 305', 'esquina');

INSERT INTO telefone(cpf_pessoa_telefone, ddd, numero) VALUES ('111.222.333.44', 81, 989898989);

INSERT INTO telefone(cpf_pessoa_telefone, ddd, numero) VALUES ('222.333.444-55', 81, 987878787);

INSERT INTO telefone(cpf_pessoa_telefone, ddd, numero) VALUES ('333.444.555-66', 81, 976767676);

INSERT INTO telefone(cpf_pessoa_telefone, ddd, numero) VALUES ('444.555.666-77', 81, 998989898);

INSERT INTO telefone(cpf_pessoa_telefone, ddd, numero) VALUES ('555.666.777-88', 81, 997979797);

INSERT INTO telefone(cpf_pessoa_telefone, ddd, numero) VALUES ('666.777.888-99', 81, 996969696);

INSERT INTO telefone(cpf_pessoa_telefone, ddd, numero) VALUES ('777.888.999-00', 81, 995959595);

INSERT INTO cargo(id_cargo, nome_cargo, salario) VALUES (01, 'Gerente', 6000);

INSERT INTO cargo(id_cargo, nome_cargo, salario) VALUES (02, 'Caixa', 2000);

INSERT INTO cargo(id_cargo, nome_cargo, salario) VALUES (03, 'Lojista', 4000);

INSERT INTO funcionario(cpf_funcionario, supervisor, cargo) VALUES ('111.222.333.44', null, 01);

INSERT INTO funcionario(cpf_funcionario, supervisor, cargo) VALUES ('222.333.444-55', '111.222.333.44', 03);

INSERT INTO funcionario(cpf_funcionario, supervisor, cargo) VALUES ('333.444.555-66', '111.222.333.44', 02);

INSERT INTO cliente(cpf_cliente, data_cadastro) VALUES ('444.555.666-77', to_date('05/07/2020', 'dd/mm/yy'));

INSERT INTO cliente(cpf_cliente, data_cadastro) VALUES ('555.666.777-88', to_date('08/10/2020', 'dd/mm/yy'));

INSERT INTO cliente(cpf_cliente, data_cadastro) VALUES ('666.777.888-99', to_date('25/05/2021', 'dd/mm/yy'));

INSERT INTO cliente(cpf_cliente, data_cadastro) VALUES ('777.888.999-00', to_date('13/11/2021', 'dd/mm/yy'));

INSERT INTO estoque(id_estoque, qtd_produtos, status_estoque) VALUES (seq_id_estoque.nextval, 120, 'Com espaço');

INSERT INTO estoque(id_estoque, qtd_produtos, status_estoque) VALUES (seq_id_estoque.nextval, 300, 'Cheio');

INSERT INTO estoque(id_estoque, qtd_produtos, status_estoque) VALUES (seq_id_estoque.nextval, 260, 'Com espaço');

INSERT INTO estoque(id_estoque, qtd_produtos, status_estoque) VALUES (seq_id_estoque.nextval, 200, 'Cheio');

INSERT INTO estoque(id_estoque, qtd_produtos, status_estoque) VALUES (seq_id_estoque.nextval, 00, 'Vazio');

INSERT INTO produto(id_produto, nome, categoria, preco, id_estoque_produto) VALUES (1, 'chocolate', 'doce', 5.00, 1);

INSERT INTO produto(id_produto, nome, categoria, preco, id_estoque_produto) VALUES (2, 'pastilha', 'doce', 2.00, 1);

INSERT INTO produto(id_produto, nome, categoria, preco, id_estoque_produto) VALUES (3, 'bombom', 'doce', 1.00, 1);

INSERT INTO produto(id_produto, nome, categoria, preco, id_estoque_produto) VALUES (4, 'salgadinho', 'salgado', 4.00, 2);

INSERT INTO produto(id_produto, nome, categoria, preco, id_estoque_produto) VALUES (5, 'coxinha', 'salgado', 4.00, 2);

INSERT INTO produto(id_produto, nome, categoria, preco, id_estoque_produto) VALUES (6, 'empada', 'salgado', 4.00, 2);

INSERT INTO produto(id_produto, nome, categoria, preco, id_estoque_produto) VALUES (7, 'folhado', 'salgado', 5.00, 2);

INSERT INTO produto(id_produto, nome, categoria, preco, id_estoque_produto) VALUES (8, 'pão pizza', 'salgado', 6.00, 2);

INSERT INTO produto(id_produto, nome, categoria, preco, id_estoque_produto) VALUES (9, 'água', 'bebida', 3.00, 3);

INSERT INTO produto(id_produto, nome, categoria, preco, id_estoque_produto) VALUES (10, 'refrigerante', 'bebida', 5.00, 3);

INSERT INTO produto(id_produto, nome, categoria, preco, id_estoque_produto) VALUES (11, 'suco', 'bebida', 6.00, 3);

INSERT INTO produto(id_produto, nome, categoria, preco, id_estoque_produto) VALUES (12, 'energético', 'bebida', 12.00, 3);

INSERT INTO produto(id_produto, nome, categoria, preco, id_estoque_produto) VALUES (13, 'desinfetante', 'limpeza', 24.00, 4);

INSERT INTO produto(id_produto, nome, categoria, preco, id_estoque_produto) VALUES (14, 'água sanitária', 'limpeza', 18.00, 4);

INSERT INTO produto(id_produto, nome, categoria, preco, id_estoque_produto) VALUES (15, 'sabão', 'limpeza', 7.00, 4);

INSERT INTO promocao(codigo_promocional, valor_desconto, data_termino) VALUES (00, 0, to_date('31/12/2022', 'dd/mm/yy'));

INSERT INTO promocao(codigo_promocional, valor_desconto, data_termino) VALUES (01, 0.15, to_date('01/01/2022', 'dd/mm/yy'));

INSERT INTO promocao(codigo_promocional, valor_desconto, data_termino) VALUES (02, 0.20, to_date('26/12/2021', 'dd/mm/yy'));

INSERT INTO cartao_fidelidade(data_emissao, cpf_cliente_cf) VALUES (to_date('05/07/2020', 'dd/mm/yy'), '444.555.666-77');

INSERT INTO cartao_fidelidade(data_emissao, cpf_cliente_cf) VALUES (to_date('08/10/2020', 'dd/mm/yy'), '555.666.777-88');

INSERT INTO cartao_fidelidade(data_emissao, cpf_cliente_cf) VALUES (to_date('25/05/2021', 'dd/mm/yy'), '666.777.888-99');

INSERT INTO cartao_fidelidade(data_emissao, cpf_cliente_cf) VALUES (to_date('13/11/2021', 'dd/mm/yy'), '777.888.999-00');

INSERT INTO pedido(id_pedido, data_pedido, cpf_funcionario_pedido, cpf_cliente_pedido) VALUES (1, to_date('05/07/2020', 'dd/mm/yy'), '333.444.555-66', '444.555.666-77');

INSERT INTO pedido(id_pedido, data_pedido, cpf_funcionario_pedido, cpf_cliente_pedido) VALUES (2, to_date('08/10/2020', 'dd/mm/yy'), '333.444.555-66', '555.666.777-88');

INSERT INTO pedido(id_pedido, data_pedido, cpf_funcionario_pedido, cpf_cliente_pedido) VALUES (3, to_date('25/05/2021', 'dd/mm/yy'), '333.444.555-66', '666.777.888-99');

INSERT INTO pedido(id_pedido, data_pedido, cpf_funcionario_pedido, cpf_cliente_pedido) VALUES (4, to_date('13/11/2021', 'dd/mm/yy'), '333.444.555-66', '777.888.999-00');

INSERT INTO realizacao(id_pedido_realizacao, cpf_cliente_realizacao, codigo_promocional_realizacao) VALUES (1, '444.555.666-77', 00);

INSERT INTO realizacao(id_pedido_realizacao, cpf_cliente_realizacao, codigo_promocional_realizacao) VALUES (2, '555.666.777-88', 01);

INSERT INTO realizacao(id_pedido_realizacao, cpf_cliente_realizacao, codigo_promocional_realizacao) VALUES (3, '666.777.888-99', 02);

INSERT INTO realizacao(id_pedido_realizacao, cpf_cliente_realizacao, codigo_promocional_realizacao) VALUES (4, '777.888.999-00', 00);

INSERT INTO contem(id_pedido_contem, id_produto_contem, quantidade) VALUES (1, 1, 2);

INSERT INTO contem(id_pedido_contem, id_produto_contem, quantidade) VALUES (1, 4, 1);

INSERT INTO contem(id_pedido_contem, id_produto_contem, quantidade) VALUES (1, 10, 1);

INSERT INTO contem(id_pedido_contem, id_produto_contem, quantidade) VALUES (2, 13, 1);

INSERT INTO contem(id_pedido_contem, id_produto_contem, quantidade) VALUES (2, 14, 1);

INSERT INTO contem(id_pedido_contem, id_produto_contem, quantidade) VALUES (2, 15, 1);

INSERT INTO contem(id_pedido_contem, id_produto_contem, quantidade) VALUES (3, 9, 4);

INSERT INTO contem(id_pedido_contem, id_produto_contem, quantidade) VALUES (3, 5, 2);

INSERT INTO contem(id_pedido_contem, id_produto_contem, quantidade) VALUES (3, 6, 2);

INSERT INTO contem(id_pedido_contem, id_produto_contem, quantidade) VALUES (3, 10, 2);

INSERT INTO contem(id_pedido_contem, id_produto_contem, quantidade) VALUES (3, 2, 7);

INSERT INTO contem(id_pedido_contem, id_produto_contem, quantidade) VALUES (4, 12, 5);

INSERT INTO contem(id_pedido_contem, id_produto_contem, quantidade) VALUES (4, 13, 2);

INSERT INTO contem(id_pedido_contem, id_produto_contem, quantidade) VALUES (4, 14, 2);

INSERT INTO contem(id_pedido_contem, id_produto_contem, quantidade) VALUES (4, 15, 4);

INSERT INTO armazena(data_armazenagem, id_produto_armazena, id_estoque_armazena, cpf_funcionario_armazena) VALUES (to_date('04/11/2021', 'dd/mm/yy'), 1, 1, '222.333.444-55');

INSERT INTO armazena(data_armazenagem, id_produto_armazena, id_estoque_armazena, cpf_funcionario_armazena) VALUES (to_date('04/11/2021', 'dd/mm/yy'), 2, 1, '222.333.444-55');

INSERT INTO armazena(data_armazenagem, id_produto_armazena, id_estoque_armazena, cpf_funcionario_armazena) VALUES (to_date('04/11/2021', 'dd/mm/yy'), 3, 1, '222.333.444-55');

INSERT INTO armazena(data_armazenagem, id_produto_armazena, id_estoque_armazena, cpf_funcionario_armazena) VALUES (to_date('04/11/2021', 'dd/mm/yy'), 4, 2, '222.333.444-55');

INSERT INTO armazena(data_armazenagem, id_produto_armazena, id_estoque_armazena, cpf_funcionario_armazena) VALUES (to_date('04/11/2021', 'dd/mm/yy'), 5, 2, '222.333.444-55');

INSERT INTO armazena(data_armazenagem, id_produto_armazena, id_estoque_armazena, cpf_funcionario_armazena) VALUES (to_date('04/11/2021', 'dd/mm/yy'), 6, 2, '222.333.444-55');

INSERT INTO armazena(data_armazenagem, id_produto_armazena, id_estoque_armazena, cpf_funcionario_armazena) VALUES (to_date('04/11/2021', 'dd/mm/yy'), 7, 2, '222.333.444-55');

INSERT INTO armazena(data_armazenagem, id_produto_armazena, id_estoque_armazena, cpf_funcionario_armazena) VALUES (to_date('04/11/2021', 'dd/mm/yy'), 8, 2, '222.333.444-55');

INSERT INTO armazena(data_armazenagem, id_produto_armazena, id_estoque_armazena, cpf_funcionario_armazena) VALUES (to_date('04/11/2021', 'dd/mm/yy'), 9, 3, '222.333.444-55');

INSERT INTO armazena(data_armazenagem, id_produto_armazena, id_estoque_armazena, cpf_funcionario_armazena) VALUES (to_date('04/11/2021', 'dd/mm/yy'), 10, 3, '222.333.444-55');

INSERT INTO armazena(data_armazenagem, id_produto_armazena, id_estoque_armazena, cpf_funcionario_armazena) VALUES (to_date('04/11/2021', 'dd/mm/yy'), 11, 3, '222.333.444-55');

INSERT INTO armazena(data_armazenagem, id_produto_armazena, id_estoque_armazena, cpf_funcionario_armazena) VALUES (to_date('04/11/2021', 'dd/mm/yy'), 12, 3, '222.333.444-55');

INSERT INTO armazena(data_armazenagem, id_produto_armazena, id_estoque_armazena, cpf_funcionario_armazena) VALUES (to_date('04/11/2021', 'dd/mm/yy'), 13, 4, '222.333.444-55');

INSERT INTO armazena(data_armazenagem, id_produto_armazena, id_estoque_armazena, cpf_funcionario_armazena) VALUES (to_date('04/11/2021', 'dd/mm/yy'), 14, 4, '222.333.444-55');

INSERT INTO armazena(data_armazenagem, id_produto_armazena, id_estoque_armazena, cpf_funcionario_armazena) VALUES (to_date('04/11/2021', 'dd/mm/yy'), 15, 4, '222.333.444-55');