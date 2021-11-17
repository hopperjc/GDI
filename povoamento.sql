INSERT INTO pessoa(cpf, nome_completo, telefone, data_nascimento, cep, logradouro, numero, complemento, bairro) VALUES ("111.222.333.44", "José da Silva", "(81) 98989-8989", to_date('01/01/1969', 'dd/mm/yy'), "00000-010", "Rua da esquina", 123, "apt. 1", "esquina");

INSERT INTO pessoa(cpf, nome_completo, telefone, data_nascimento, cep, logradouro, numero, complemento, bairro) VALUES ("222.333.444-55", "Ana Sobral", "(81) 98787-8787", to_date('24/04/1987', 'dd/mm/yy'), "11111-121", "Rua da entrada", 234, "apt. 401", "entrada");

INSERT INTO pessoa(cpf, nome_completo, telefone, data_nascimento, cep, logradouro, numero, complemento, bairro) VALUES ("333.444.555-66", "Lucas Cavalcanti", "(81) 97676-7676", to_date('14/03/1992', 'dd/mm/yy'), "22222-232", "Rua da saida", 345, "Casa 12", "saida");

INSERT INTO pessoa(cpf, nome_completo, telefone, data_nascimento, cep, logradouro, numero, complemento, bairro) VALUES ("444.555.666-77", "Matheus Cabral", "(81) 99898-9898", to_date('08/09/1988', 'dd/mm/yy'), "33333-343", "Avenida rosquinha", 456, "Bloco 1 Apt. 201", "rosquinha");

INSERT INTO pessoa(cpf, nome_completo, telefone, data_nascimento, cep, logradouro, numero, complemento, bairro) VALUES ("555.666.777-88", "Maria Augusta", "(81) 99797-9797", to_date('19/08/1988', 'dd/mm/yy'), "44444-454", "Rua do povo", 567, "apt. 902", "povo");

INSERT INTO pessoa(cpf, nome_completo, telefone, data_nascimento, cep, logradouro, numero, complemento, bairro) VALUES ("666.777.888-99", "José Conceição", "(81) 99696-9696", to_date('21/09/1997', 'dd/mm/yy'), "55555-565", "Rua Fernando Antônio", 678, "apt. 104", "rosquinha");

INSERT INTO pessoa(cpf, nome_completo, telefone, data_nascimento, cep, logradouro, numero, complemento, bairro) VALUES ("777.888.999-00", "Maria Augusta Neto", "(81) 99595-9595", to_date('01/10/1996', 'dd/mm/yy'), "66666-676", "Avenida João Gomes", 7890, "apt. 305", "esquina");

INSERT INTO cargo(nome_cargo, salario) VALUES ("Gerente", 6000);

INSERT INTO cargo(nome_cargo, salario) VALUES ("Caixa", 2000);

INSERT INTO cargo(nome_cargo, salario) VALUES ("Lojista", 4000);

INSERT INTO funcionario(cpf_funcionario, supervisor, cargo) VALUES ("111.222.333.44", null, "Gerente");

INSERT INTO funcionario(cpf_funcionario, supervisor, cargo) VALUES ("222.333.444-55", "111.222.333.44", "Lojista");

INSERT INTO funcionario(cpf_funcionario, supervisor, cargo) VALUES ("333.444.555-66", "111.222.333.44", "Caixa");

INSERT INTO cliente(cpf_cliente, data_cadastro) VALUES ("444.555.666-77", to_date('05/07/2020', 'dd/mm/yy'));

INSERT INTO cliente(cpf_cliente, data_cadastro) VALUES ("555.666.777-88", to_date('08/10/2020', 'dd/mm/yy'));

INSERT INTO cliente(cpf_cliente, data_cadastro) VALUES ("666.777.888-99", to_date('25/05/2021', 'dd/mm/yy'));

INSERT INTO cliente(cpf_cliente, data_cadastro) VALUES ("777.888.999-00", to_date('13/11/2021', 'dd/mm/yy'));

INSERT INTO estoque(id_estoque, qtd_produtos) VALUES (1, 120);

INSERT INTO estoque(id_estoque, qtd_produtos) VALUES (2, 300);

INSERT INTO estoque(id_estoque, qtd_produtos) VALUES (3, 260);

INSERT INTO estoque(id_estoque, qtd_produtos) VALUES (4, 200);

INSERT INTO produto(id_produto, nome, categoria, preco, id_estoque_produto) VALUES (1, "chocolate", "doce", 5.00, 1);

INSERT INTO produto(id_produto, nome, categoria, preco, id_estoque_produto) VALUES (2, "pastilha", "doce", 2.00, 1);

INSERT INTO produto(id_produto, nome, categoria, preco, id_estoque_produto) VALUES (3, "bombom", "doce", 1.00, 1);

INSERT INTO produto(id_produto, nome, categoria, preco, id_estoque_produto) VALUES (4, "salgadinho", "salgado", 4.00, 2);

INSERT INTO produto(id_produto, nome, categoria, preco, id_estoque_produto) VALUES (5, "coxinha", "salgado", 4.00, 2);

INSERT INTO produto(id_produto, nome, categoria, preco, id_estoque_produto) VALUES (6, "empada", "salgado", 4.00, 2);

INSERT INTO produto(id_produto, nome, categoria, preco, id_estoque_produto) VALUES (7, "folhado", "salgado", 5.00, 2);

INSERT INTO produto(id_produto, nome, categoria, preco, id_estoque_produto) VALUES (8, "pão pizza", "salgado", 6.00, 2);

INSERT INTO produto(id_produto, nome, categoria, preco, id_estoque_produto) VALUES (9, "água", "bebida", 3.00, 3);

INSERT INTO produto(id_produto, nome, categoria, preco, id_estoque_produto) VALUES (10, "refrigerante", "bebida", 5.00, 3);

INSERT INTO produto(id_produto, nome, categoria, preco, id_estoque_produto) VALUES (11, "suco", "bebida", 6.00, 3);

INSERT INTO produto(id_produto, nome, categoria, preco, id_estoque_produto) VALUES (12, "energético", "bebida", 12.00, 3);

INSERT INTO produto(id_produto, nome, categoria, preco, id_estoque_produto) VALUES (13, "desinfetante", "limpeza", 24.00, 4);

INSERT INTO produto(id_produto, nome, categoria, preco, id_estoque_produto) VALUES (14, "água sanitária", "limpeza", 18.00, 4);

INSERT INTO produto(id_produto, nome, categoria, preco, id_estoque_produto) VALUES (15, "sabão", "limpeza", 7.00, 4);

INSERT INTO promocao(codigo_promocional, valor_desconto, data_termino) VALUES (01, 0.15, to_date('01/01/2022', 'dd/mm/yy'));

INSERT INTO promocao(codigo_promocional, valor_desconto, data_termino) VALUES (02, 0.20, to_date('26/12/2021', 'dd/mm/yy'));





















INSERT INTO armazena(data_armazenagem, id_produto_armazena, id_estoque_armazena, cpf_funcionario_armazena) VALUES (to_date('04/11/2021', 'dd/mm/yy'), 1, 1, "222.333.444-55")

INSERT INTO armazena(data_armazenagem, id_produto_armazena, id_estoque_armazena, cpf_funcionario_armazena) VALUES (to_date('04/11/2021', 'dd/mm/yy'), 2, 1, "222.333.444-55")

INSERT INTO armazena(data_armazenagem, id_produto_armazena, id_estoque_armazena, cpf_funcionario_armazena) VALUES (to_date('04/11/2021', 'dd/mm/yy'), 3, 1, "222.333.444-55")

INSERT INTO armazena(data_armazenagem, id_produto_armazena, id_estoque_armazena, cpf_funcionario_armazena) VALUES (to_date('04/11/2021', 'dd/mm/yy'), 4, 2, "222.333.444-55")

INSERT INTO armazena(data_armazenagem, id_produto_armazena, id_estoque_armazena, cpf_funcionario_armazena) VALUES (to_date('04/11/2021', 'dd/mm/yy'), 5, 2, "222.333.444-55")

INSERT INTO armazena(data_armazenagem, id_produto_armazena, id_estoque_armazena, cpf_funcionario_armazena) VALUES (to_date('04/11/2021', 'dd/mm/yy'), 6, 2, "222.333.444-55")

INSERT INTO armazena(data_armazenagem, id_produto_armazena, id_estoque_armazena, cpf_funcionario_armazena) VALUES (to_date('04/11/2021', 'dd/mm/yy'), 7, 2, "222.333.444-55")

INSERT INTO armazena(data_armazenagem, id_produto_armazena, id_estoque_armazena, cpf_funcionario_armazena) VALUES (to_date('04/11/2021', 'dd/mm/yy'), 8, 2, "222.333.444-55")

INSERT INTO armazena(data_armazenagem, id_produto_armazena, id_estoque_armazena, cpf_funcionario_armazena) VALUES (to_date('04/11/2021', 'dd/mm/yy'), 9, 3, "222.333.444-55")

INSERT INTO armazena(data_armazenagem, id_produto_armazena, id_estoque_armazena, cpf_funcionario_armazena) VALUES (to_date('04/11/2021', 'dd/mm/yy'), 10, 3, "222.333.444-55")

INSERT INTO armazena(data_armazenagem, id_produto_armazena, id_estoque_armazena, cpf_funcionario_armazena) VALUES (to_date('04/11/2021', 'dd/mm/yy'), 11, 3, "222.333.444-55")

INSERT INTO armazena(data_armazenagem, id_produto_armazena, id_estoque_armazena, cpf_funcionario_armazena) VALUES (to_date('04/11/2021', 'dd/mm/yy'), 12, 3, "222.333.444-55")

INSERT INTO armazena(data_armazenagem, id_produto_armazena, id_estoque_armazena, cpf_funcionario_armazena) VALUES (to_date('04/11/2021', 'dd/mm/yy'), 13, 4, "222.333.444-55")

INSERT INTO armazena(data_armazenagem, id_produto_armazena, id_estoque_armazena, cpf_funcionario_armazena) VALUES (to_date('04/11/2021', 'dd/mm/yy'), 14, 4, "222.333.444-55")

INSERT INTO armazena(data_armazenagem, id_produto_armazena, id_estoque_armazena, cpf_funcionario_armazena) VALUES (to_date('04/11/2021', 'dd/mm/yy'), 15, 4, "222.333.444-55")