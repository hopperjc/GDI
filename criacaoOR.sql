CREATE OR REPLACE TYPE tp_endereco AS OBJECT(
    cep VARCHAR2(9), 
    logradouro VARCHAR2(40), 
    numero NUMBER, 
    complemento VARCHAR2(20),
    bairro VARCHAR2(20),
);

CREATE OR REPLACE TYPE tp_telefone AS OBJECT(
    ddd NUMBER,
    numero NUMBER,
);

CREATE OR REPLACE TYPE tp_telefones AS VARRAY(5) OF tp_fone;

CREATE OR REPLACE TYPE tp_pessoa AS OBJECT(
    cpf VARCHAR2(14),
    nome_completo VARCHAR2(40),
    data_nascimento DATE,
    endereco tp_endereco,
    telefones tp_telefones
);

CREATE OR REPLACE TYPE tp_cargo AS OBJECT(
    id_cargo NUMBER,
    nome_cargo VARCHAR2(20),
    salario NUMBER,
);

CREATE OR REPLACE TYPE tp_funcionario UNDER tp_pessoa(
    CONSTRUCTOR FUNCTION tp_funcionario(f1 tp_pessoa) RETURN SELF AS RESULT,
    cargo NUMBER
)NOT FINAL;

ALTER TYPE tp_funcionario ADD ATTRIBUTE (supervisor REF tp_funcionario) CASCADE;

CREATE OR REPLACE TYPE tp_cliente UNDER tp_pessoa(
    CONSTRUCTOR FUNCTION tp_cliente(c1 tp_pessoa) RETURN SELF AS RESULT,
    data_cadastro DATE
)NOT FINAL;

CREATE OR REPLACE TYPE tp_estoque AS OBJECT(
    id_estoque NUMBER,
    qtd_produtos NUMBER,
    status_estoque VARCHAR(20)
);

CREATE OR REPLACE TYPE tp_produto AS OBJECT(
    id_produto NUMBER, 
    nome VARCHAR2(20),
    categoria VARCHAR2(20),
    preco NUMBER,
    id_estoque_produto REF tp_estoque
);

CREATE OR REPLACE TYPE tp_promocao AS OBJECT(
    codigo_promocional NUMBER,
    valor_desconto NUMBER,
    data_termino DATE
);

CREATE OR REPLACE TYPE tp_cartao_fidelidade AS OBJECT(
    data_emissao DATE,
    cpf_cliente_cf REF tp_cliente
);

CREATE OR REPLACE TYPE tp_pedido AS OBJECT(
    id_pedido NUMBER, 
    data_pedido DATE,
    cpf_funcionario_pedido REF tp_funcionario,
    cpf_cliente_pedido REF tp_cliente
);

CREATE OR REPLACE TYPE tp_realizacao AS OBJECT (
    id_pedido_realizacao REF tp_pedido,
    cpf_cliente_realizacao REF tp_cliente,
    codigo_promocional_realizacao NUMBER
);

CREATE OR REPLACE TYPE tp_contem AS OBJECT(
    id_pedido_contem REF tp_pedido,
    id_produto_contem REF tp_produto,
    quantidade NUMBER
);

CREATE OR REPLACE TYPE tp_armazena AS OBJECT(
    data_armazenagem DATE,
    id_produto_armazena REF tp_produto,
    id_estoque_armazena REF tp_estoque,
    cpf_funcionario_armazena REF tp_funcionario
);

