DROP TYPE tp_endereco;
DROP TYPE tp_telefone;
DROP TYPE tp_telefones;
DROP TYPE tp_pessoa;
DROP TYPE tp_cargo;
DROP TYPE tp_funcionario;
DROP TYPE tp_cliente;
DROP TYPE tp_estoque;
DROP TYPE tp_produto;
DROP TYPE tp_promocao;
DROP TYPE tp_cartao_fidelidade;
DROP TYPE tp_pedido;
DROP TYPE tp_realizacao;
DROP TYPE tp_contem;
DROP TYPE tp_armazena;

CREATE OR REPLACE TYPE tp_endereco AS OBJECT(
    cep VARCHAR2(9), 
    logradouro VARCHAR2(40), 
    numero NUMBER, 
    complemento VARCHAR2(20),
    bairro VARCHAR2(20),
);

CREATE TABLE tb_endereco OF tp_endereco(
    cep PRIMARY KEY
    );

CREATE OR REPLACE TYPE tp_telefone AS OBJECT(
    ddd NUMBER,
    numero NUMBER,
);

CREATE OR REPLACE TYPE tp_telefones AS VARRAY(5) OF tp_telefone;

CREATE OR REPLACE TYPE tp_pessoa AS OBJECT(
    cpf VARCHAR2(14),
    nome_completo VARCHAR2(40),
    data_nascimento DATE,
    endereco tp_endereco,
    telefones tp_telefones
) NOT FINAL NOT INSTANTIABLE;


CREATE OR REPLACE TYPE tp_cargo AS OBJECT(
    id_cargo NUMBER,
    nome_cargo VARCHAR2(20),
    salario NUMBER,
);

CREATE TABLE tb_cargo OF tp_cargo(
    id_cargo PRIMARY KEY
);

CREATE OR REPLACE TYPE tp_funcionario UNDER tp_pessoa(
    cargo NUMBER,
    CONSTRUCTOR FUNCTION tp_funcionario(f1 tp_pessoa) RETURN SELF AS RESULT
);

ALTER TYPE tp_funcionario ADD ATTRIBUTE (supervisor REF tp_funcionario) CASCADE;

CREATE OR REPLACE TYPE BODY tp_funcionario AS 
CONSTRUCTOR FUNCTION tp_funcionario(f1 tp_pessoa) RETURN SELF AS RESULT IS
BEGIN
cpf := f1.cpf; nome_completo := f1.nome_completo; data_nascimento := f1.data_nascimento; endereco := f1.endereco; telefones := f1.telefones;
RETURN;
END;

CREATE TABLE tb_funcionario OF tp_funcionario();

CREATE OR REPLACE TYPE tp_cliente UNDER tp_pessoa(
    data_cadastro DATE,
    CONSTRUCTOR FUNCTION tp_cliente(c1 tp_pessoa) RETURN SELF AS RESULT
);

CREATE OR REPLACE TYPE BODY tp_cliente AS
CONSTRUCTOR FUNCTION tp_cliente(c1 tp_pessoa) RETURN SELF AS RESULT IS
BEGIN 
cpf := c1.cpf; nome_completo := c1.nome_completo; data_nascimento := c1.data_nascimento; endereco := c1.endereco; telefones := c1.telefones;
RETURN;
END;

CREATE TABLE tb_cliente OF tp_cliente();

CREATE OR REPLACE TYPE tp_estoque AS OBJECT(
    id_estoque NUMBER,
    qtd_produtos NUMBER,
    status_estoque VARCHAR(20)
);

CREATE TABLE tb_estoque OF tp_estoque(
    id_estoque PRIMARY KEY
);

CREATE OR REPLACE TYPE tp_produto AS OBJECT(
    id_produto NUMBER, 
    nome VARCHAR2(20),
    categoria VARCHAR2(20),
    preco NUMBER,
    id_estoque_produto REF tp_estoque
);

CREATE TABLE tb_produto OF tp_produto(
    id_produto PRIMARY KEY
);

CREATE OR REPLACE TYPE tp_promocao AS OBJECT(
    codigo_promocional NUMBER,
    valor_desconto NUMBER,
    data_termino DATE
);

CREATE TABLE tb_promocao OF tp_promocao(
    codigo_promocional PRIMARY KEY
);

CREATE OR REPLACE TYPE tp_cartao_fidelidade AS OBJECT(
    data_emissao DATE,
    cpf_cliente_cf REF tp_cliente
);

CREATE TABLE tb_cartao_fidelidade OF tp_cartao_fidelidade();

CREATE OR REPLACE TYPE tp_pedido AS OBJECT(
    id_pedido NUMBER, 
    data_pedido DATE,
    cpf_funcionario_pedido REF tp_funcionario,
    cpf_cliente_pedido REF tp_cliente
);

CREATE TABLE tb_pedido OF tp_pedido(
    id_pedido PRIMARY KEY
);

CREATE OR REPLACE TYPE tp_realizacao AS OBJECT (
    id_pedido_realizacao REF tp_pedido,
    cpf_cliente_realizacao REF tp_cliente,
    codigo_promocional_realizacao NUMBER
);

CREATE TABLE tb_realizacao OF tp_realizacao();

CREATE OR REPLACE TYPE tp_contem AS OBJECT(
    id_pedido_contem REF tp_pedido,
    id_produto_contem REF tp_produto,
    quantidade NUMBER
);

CREATE TABLE tb_contem OF tp_contem();

CREATE OR REPLACE TYPE tp_armazena AS OBJECT(
    data_armazenagem DATE,
    id_estoque_armazena REF tp_estoque,
    cpf_funcionario_armazena REF tp_funcionario
);

CREATE TABLE tb_armazena OF tp_armazena();