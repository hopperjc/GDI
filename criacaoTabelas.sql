DROP TABLE pessoa;
DROP TABLE cargo;
DROP TABLE funcionario;
DROP TABLE cliente;
DROP TABLE estoque;
DROP TABLE produto;
DROP TABLE promocao;
DROP TABLE cartao_fidelidade;
DROP TABLE pedido;
DROP TABLE realizacao;
DROP TABLE contem;
DROP TABLE armazena;

CREATE TABLE pessoa(
    cpf VARCHAR2(14) NOT NULL,
    nome_completo VARCHAR2(40) NOT NULL,
    telefone VARCHAR2(15),
    data_nascimento DATE NOT NULL,
    cep VARCHAR2(9) NOT NULL, 
    logradouro VARCHAR2(40) NOT NULL, 
    numero NUMBER NOT NULL, 
    complemento VARCHAR2(20) NOT NULL,
    bairro VARCHAR2(20) NOT NULL,
    CONSTRAINT pessoa_pk PRIMARY KEY (cpf)
);

CREATE TABLE cargo(
    nome_cargo VARCHAR2(20) NOT NULL,
    salario NUMBER NOT NULL,
    CONSTRAINT cargo_pk PRIMARY KEY (nome_cargo)
);

CREATE TABLE funcionario(
    cpf_funcionario VARCHAR2(14) NOT NULL,
    supervisor VARCHAR2(14),
    cargo VARCHAR2(20) NOT NULL,
    CONSTRAINT funcionario_pk PRIMARY KEY (cpf_funcionario),
    CONSTRAINT funcionario_cargo_fk FOREIGN KEY (cargo) REFERENCES cargo(nome_cargo),
    CONSTRAINT funcionario_supervisor_fk FOREIGN KEY (supervisor) REFERENCES funcionario(cpf_funcionario)
);

CREATE TABLE cliente(
    cpf_cliente VARCHAR2(14) NOT NULL,
    data_cadastro DATE NOT NULL,
    CONSTRAINT cliente_pk PRIMARY KEY (cpf_cliente)
);

CREATE TABLE estoque(
    id_estoque NUMBER NOT NULL,
    qtd_produtos NUMBER,
    CONSTRAINT estoque_pk PRIMARY KEY (id_estoque)
);

CREATE TABLE produto(
    id_produto NUMBER NOT NULL, 
    nome VARCHAR2(20) NOT NULL,
    categoria VARCHAR2(20) NOT NULL,
    preco NUMBER NOT NULL,
    id_estoque_produto NUMBER NOT NULL,
    CONSTRAINT produto_pk PRIMARY KEY (id_produto),
    CONSTRAINT produto_estoque_fk FOREIGN KEY (id_estoque_produto) REFERENCES estoque(id_estoque),
    CONSTRAINT produto_preco_check CHECK (preco >= 00.01)
);

CREATE TABLE promocao(
    codigo_promocional NUMBER NOT NULL,
    valor_desconto NUMBER NOT NULL,
    data_termino DATE NOT NULL,
    CONSTRAINT promocao_pk PRIMARY KEY (codigo_promocional)
);

CREATE TABLE cartao_fidelidade(
    data_emissao DATE NOT NULL,
    cpf_cliente_cf VARCHAR2(14) NOT NULL, 
    CONSTRAINT cartao_fidelidade_pk PRIMARY KEY (data_emissao, cpf_cliente_cf)
);

CREATE TABLE pedido(
    id_pedido NUMBER NOT NULL, 
    data_pedido DATE NOT NULL,
    cpf_funcionario_pedido VARCHAR2(14) NOT NULL,
    cpf_cliente_pedido VARCHAR2(14) NOT NULL,
    CONSTRAINT pedido_pk PRIMARY KEY (id_pedido),
    CONSTRAINT pedido_funcionario_fk FOREIGN KEY (cpf_funcionario_pedido) REFERENCES funcionario(cpf_funcionario),
    CONSTRAINT pedifo_client_fk FOREIGN KEY (cpf_cliente_pedido) REFERENCES cliente(cpf_cliente)
);

CREATE TABLE realizacao(
    id_pedido_realizacao NUMBER NOT NULL, 
    codigo_promocional_realizacao NUMBER,
    CONSTRAINT realizacao_pk PRIMARY KEY (id_pedido_realizacao, codigo_promocional_realizacao),
    CONSTRAINT id_pedido_fk FOREIGN KEY (id_pedido_realizacao) REFERENCES pedido(id_pedido),
    CONSTRAINT cdg_pomocional_fk FOREIGN KEY (codigo_promocional_realizacao) REFERENCES promocao(codigo_promocional)
);

CREATE TABLE contem(
    id_pedido_contem NUMBER NOT NULL,
    id_produto_contem NUMBER NOT NULL,
    quantidade NUMBER,
    CONSTRAINT contem_pk PRIMARY KEY (id_pedido_contem, id_produto_contem),
    CONSTRAINT contem_pedido_fk FOREIGN KEY (id_pedido_contem) REFERENCES pedido(id_pedido),
    CONSTRAINT contem_produto_fk FOREIGN KEY (id_produto_contem) REFERENCES produto(id_produto)
);

CREATE TABLE armazena(
    data_armazenagem DATE NOT NULL,
    id_produto_armazena NUMBER NOT NULL,
    id_estoque_armazena NUMBER NOT NULL,
    cpf_funcionario_armazena VARCHAR2(14) NOT NULL,
    CONSTRAINT armazena_pk PRIMARY KEY (data_armazenagem, id_produto_armazena, id_estoque_armazena, cpf_funcionario_armazena),
    CONSTRAINT armazena_produto_fk FOREIGN KEY (id_produto_armazena) REFERENCES produto(id_produto),
    CONSTRAINT armazena_estoque_fk FOREIGN KEY (id_estoque_armazena) REFERENCES estoque(id_estoque),
    CONSTRAINT armazena_funcionario_fk FOREIGN KEY (cpf_funcionario_armazena) REFERENCES funcionario(cpf_funcionario)
);