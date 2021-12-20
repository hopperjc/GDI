-- CREATE OR REPLACE TYPE - OK
-- CREATE OR REPLACE TYPE BODY - OK
-- MEMBER PROCEDURE - OK
-- MEMBER FUNCTION - OK
-- ORDER MEMBER FUNCTION - OK
-- MAP MEMBER FUNCTION - OK MAS DUVIDOSO (MEIO SEM SEMTIDO)
-- CONSTRUCTOR FUNCTION - OK
-- OVERRIDING MEMBER - OK
-- FINAL MEMBER - OK
-- NOT INSTANTIABLE TYPE/MEMBER - OK
-- HERANÇA DE TIPOS (UNDER/NOT FINAL) - OK
-- ALTER TYPE - OK
-- CREATE TABLE OF - OK
-- WITH ROWID REFERENCES - OK
-- REF - OK
-- SCOPE IS - OK
-- INSERT INTO
-- VALUE
-- VARRAY - OK
-- NESTED TABLE

-- DROP TYPE tp_telefone;
-- DROP TYPE tp_telefones;
-- DROP TYPE tp_pessoa;
-- DROP TYPE tp_cargo;
-- DROP TYPE tp_funcionario;
-- DROP TYPE tp_cliente;
-- DROP TYPE tp_estoque;
-- DROP TYPE tp_produto;
-- DROP TYPE tp_promocao;
-- DROP TYPE tp_cartao_fidelidade;
-- DROP TYPE tp_pedido;
-- DROP TYPE tp_realizacao;
-- DROP TYPE tp_contem;
-- DROP TYPE tp_armazena;


CREATE OR REPLACE TYPE tp_telefone AS OBJECT(
    ddd NUMBER,
    numero NUMBER
);

CREATE OR REPLACE TYPE tp_telefones AS VARRAY(5) OF tp_telefone;

CREATE OR REPLACE TYPE tp_pessoa AS OBJECT(
    cpf VARCHAR2(14),
    nome_completo VARCHAR2(40),
    data_nascimento DATE,
    telefones tp_telefones,
    cep VARCHAR2(9), 
    logradouro VARCHAR2(40), 
    numero NUMBER, 
    complemento VARCHAR2(20),
    bairro VARCHAR2(20),
    MEMBER FUNCTION nomePessoa(P tp_pessoa) RETURN VARCHAR2,
    MEMBER PROCEDURE detalhesPessoa (P tp_pessoa)
) NOT FINAL NOT INSTANTIABLE;

CREATE OR REPLACE TYPE BODY tp_pessoa AS
MEMBER FUNCTION nomePessoa(P tp_pessoa) RETURN VARCHAR2 IS
BEGIN
RETURN P.nome_completo;
END;
END;

CREATE OR REPLACE TYPE BODY tp_pessoa AS
MEMBER PROCEDURE exibirDetalhesPedido (P tp_pessoa) IS
BEGIN
DBMS_OUTPUT.PUT_LINE('Detalhes da Pessoa:');
DBMS_OUTPUT.PUT_LINE('CPF:'||P.cpf);
DBMS_OUTPUT.PUT_LINE('Nome: '||P.nome_completo));
DBMS_OUTPUT.PUT_LINE('Data de NAscimento: '||to_char(P.data_nascimento));
DBMS_OUTPUT.PUT_LINE('Telefones: '||to_char(P.telefones));
DBMS_OUTPUT.PUT_LINE('CEP: '||to_char(P.data_nascimento));
DBMS_OUTPUT.PUT_LINE('Logradouro: '||P.logradouro);
DBMS_OUTPUT.PUT_LINE('Número: '||to_char(P.numero));
DBMS_OUTPUT.PUT_LINE('Complemento: '||P.complemento);
DBMS_OUTPUT.PUT_LINE('Bairro: '||P.bairro);
END;
END;

CREATE TABLE tb_pessoa OF tp_pessoa(
    cpf PRIMARY KEY
);


CREATE OR REPLACE TYPE tp_cargo AS OBJECT(
    id_cargo NUMBER,
    nome_cargo VARCHAR2(20),
    salario NUMBER,
    FINAL MEMBER FUNCTION salarioAnual RETURN NUMBER,
    ORDER MEMBER FUNCTION comparaSalario (X tp_cargo) RETURN INTEGER
);

CREATE OR REPLACE TYPE BODY tp_cargo IS 
MEMBER FUNCTION salarioAnual RETURN NUMBER IS 
BEGIN
RETURN salario *12;
END;

ORDER MEMBER FUNCTION comparaSalario(X tp_cargo) RETURN INTEGER IS
BEGIN 
RETURN SELF.salario - X.salario;
END;
END;

CREATE TABLE tb_cargo OF tp_cargo(
    id_cargo PRIMARY KEY
);

CREATE OR REPLACE TYPE tp_funcionario UNDER tp_pessoa(
    cargo NUMBER,
    CONSTRUCTOR FUNCTION tp_funcionario(f1 tp_pessoa) RETURN SELF AS RESULT
    OVERRIDING MEMBER FUNCTION nomePessoa RETURN VARCHAR2 AS nomeFuncionario
);

ALTER TYPE tp_funcionario ADD ATTRIBUTE (supervisor WITH ROWID REFERENCES tp_funcionario) CASCADE;

CREATE OR REPLACE TYPE BODY tp_funcionario AS
CONSTRUCTOR FUNCTION tp_funcionario(f1 tp_pessoa) RETURN SELF AS RESULT IS
BEGIN
cpf := f1.cpf; nome_completo := f1.nome_completo; data_nascimento := f1.data_nascimento; endereco := f1.endereco; telefones := f1.telefones;
RETURN;
END;

OVERRIDING MEMBER FUNCTION nomePessoa(f1 tp_funcionario) RETURN VARCHAR2 AS nomeFuncionario IS
BEGIN
RETURN f1.nome_completo;
END;
END;

CREATE TABLE tb_funcionario OF tp_funcionario;

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

CREATE TABLE tb_cliente OF tp_cliente;

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

create type body tp_estoque as
   member procedure insert_estoque is
   begin
       insert into tb_estoque values (id_estoque);
       commit;
   end insert_estoque;
end;

CREATE OR REPLACE TYPE tp_promocao AS OBJECT(
    codigo_promocional NUMBER,
    valor_desconto NUMBER,
    data_termino DATE,
    MAP MEMBER FUNCTION promocaoTOnumber RETURN NUMBER
);

CREATE OR REPLACE TYPE BODY tp_promocao AS
MAP MEMBER FUNCTION promocaoTOnumber RETURN INTEGER IS
p NUMBER := codigo_promocional;
BEGIN
RETURN p;
END;
END;

CREATE TABLE tb_promocao OF tp_promocao(
    codigo_promocional PRIMARY KEY
);

CREATE OR REPLACE TYPE tp_cartao_fidelidade AS OBJECT(
    data_emissao DATE,
    cpf_cliente_cf REF tp_cliente
);

CREATE TABLE tb_cartao_fidelidade OF tp_cartao_fidelidade(
    cpf_cliente_cf scope is tb_cliente
);

CREATE OR REPLACE TYPE tp_pedido AS OBJECT(
    id_pedido NUMBER, 
    data_pedido DATE,
    cpf_funcionario_pedido REF tp_funcionario,
    cpf_cliente_pedido REF tp_cliente
);

CREATE TABLE tb_pedido OF tp_pedido(
    id_pedido PRIMARY KEY,
    cpf_funcionario_pedido SCOPE IS tb_funcionario,
    cpf_cliente_pedido SCOPE IS tb_cliente
);

CREATE OR REPLACE TYPE tp_realizacao AS OBJECT (
    id_pedido_realizacao REF tp_pedido,
    cpf_cliente_realizacao REF tp_cliente,
    codigo_promocional_realizacao NUMBER
);

CREATE TABLE tb_realizacao OF tp_realizacao(
    id_pedido_realizacao SCOPE IS tb_pedido,
    cpf_cliente_realizacao SCOPE IS tb_cliente
);

CREATE OR REPLACE TYPE tp_contem AS OBJECT(
    quantidade NUMBER,
    id_pedido_contem REF tp_pedido,
    id_produto_contem REF tp_produto
);

CREATE TABLE tb_contem OF tp_contem(
    id_pedido_contem SCOPE IS tb_pedido,
    id_produto_contem SCOPE IS tb_produto
);

CREATE OR REPLACE TYPE tp_armazena AS OBJECT(
    data_armazenagem DATE,
    id_estoque_armazena REF tp_estoque,
    cpf_funcionario_armazena REF tp_funcionario
);

create table tb_armazena of tp_armazena;

CREATE TABLE tb_contem OF tp_contem(
    id_pedido_contem SCOPE IS tb_pedido,
    id_produto_contem SCOPE IS tb_produto
);