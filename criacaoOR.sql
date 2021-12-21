CREATE OR REPLACE TYPE tp_telefone AS OBJECT(
    ddd NUMBER,
    numero NUMBER
);
/
CREATE OR REPLACE TYPE tp_telefones AS VARRAY(5) OF tp_telefone;
/
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
    MEMBER FUNCTION exibirInfo() RETURN VARCHAR2,
    MEMBER FUNCTION exibirEndereco() RETURN VARCHAR2,
    MEMBER PROCEDURE exibirDetalhesPessoa ()
) NOT FINAL NOT INSTANTIABLE;
/
CREATE OR REPLACE TYPE BODY tp_pessoa AS
    MEMBER FUNCTION exibirInfo() RETURN VARCHAR2
    P := tp_pedido
    BEGIN 
        RETURN  P.cpf + ' - '+ P.nome_completo
    END;
    
    MEMBER FUNCTION exibirEndereco() RETURN VARCHAR2 IS
    BEGIN
        RETURN  P.logradouro + ', ' + P.bairro + ', ' + P.complemento + ', '+ P.numero + ', ' + P.cep;
    END;
    
    MEMBER PROCEDURE exibirDetalhesPessoa () IS
    BEGIN
    DBMS_OUTPUT.PUT_LINE('Detalhes da Pessoa:');
    DBMS_OUTPUT.PUT_LINE('CPF:'||P.cpf);
    DBMS_OUTPUT.PUT_LINE('Nome: '||P.nome_completo));
    DBMS_OUTPUT.PUT_LINE('Data de NAscimento: '||to_char(P.data_nascimento));
    DBMS_OUTPUT.PUT_LINE('Telefones: '||to_char(P.telefones));
    DBMS_OUTPUT.PUT_LINE('CEP: '||to_char(P.cep));
    DBMS_OUTPUT.PUT_LINE('Logradouro: '||P.logradouro);
    DBMS_OUTPUT.PUT_LINE('Número: '||to_char(P.numero));
    DBMS_OUTPUT.PUT_LINE('Complemento: '||P.complemento);
    DBMS_OUTPUT.PUT_LINE('Bairro: '||P.bairro);
    END;
END;
/
ALTER TYPE tp_pessoa ADD ATRIBUTE cidade VARCHAR2(30) CASCADE;
/
CREATE OR REPLACE TYPE tp_cargo AS OBJECT(
    id_cargo NUMBER,
    nome_cargo VARCHAR2(20),
    salario NUMBER,
    FINAL MEMBER FUNCTION salarioAnual RETURN NUMBER,
    ORDER MEMBER FUNCTION comparaSalario (X tp_cargo) RETURN INTEGER
);
/
CREATE OR REPLACE TYPE BODY tp_cargo IS 
    FINAL MEMBER FUNCTION salarioAnual RETURN NUMBER IS 
    BEGIN
        RETURN salario*12;
    END;

    ORDER MEMBER FUNCTION comparaSalario(X tp_cargo) RETURN INTEGER IS
    BEGIN 
        RETURN SELF.salario - X.salario;
    END;
END;
/
CREATE TABLE tb_cargo OF tp_cargo(
    id_cargo PRIMARY KEY
);
/
CREATE OR REPLACE TYPE tp_funcionario UNDER tp_pessoa(
    cargo NUMBER,
    supervisor WITH ROWID REFERENCES tp_funcionario,
    CONSTRUCTOR FUNCTION tp_funcionario() RETURN SELF AS RESULT,
    OVERRIDING MEMBER FUNCTION exibirInfo() RETURN VARCHAR2
);
/
CREATE OR REPLACE TYPE BODY tp_funcionario AS
    f1 := tp_funcionario
    CONSTRUCTOR FUNCTION tp_funcionario() RETURN SELF AS RESULT IS
    BEGIN
        cpf := f1.cpf; nome_completo := f1.nome_completo; data_nascimento := f1.data_nascimento; telefones := f1.telefones; cep := f1.cep; logradouro := f1.logradouro; numero := f1.numero; complemento := f1.complemento; bairro := f1.bairro; cidade := f1.cidade;
    RETURN;
    END;
    
    OVERRIDING MEMBER FUNCTION exibirInfo() RETURN VARCHAR2 IS
    BEGIN
        RETURN f1.cpf + ' - ' + f1.nome_completo + ' - ' + f1.cargo.nome_cargo
    END;
END;
/
CREATE TABLE tb_funcionario OF tp_funcionario;
/
CREATE OR REPLACE TYPE tp_cliente UNDER tp_pessoa(
    data_cadastro DATE,
    CONSTRUCTOR FUNCTION tp_cliente() RETURN SELF AS RESULT,
    OVERRIDING MEMBER FUNCTION exibirInfo() RETURN VARCHAR2
);
/
CREATE OR REPLACE TYPE BODY tp_cliente AS
    c1 := tp_cliente
    CONSTRUCTOR FUNCTION tp_cliente() RETURN SELF AS RESULT IS
    BEGIN 
        cpf := c1.cpf; nome_completo := c1.nome_completo; data_nascimento := c1.data_nascimento; telefones := c1.telefones; cep := c1.cep; logradouro := c1.logradouro; numero := c1.numero; complemento := c1.complemento; bairro := c1.bairro; cidade := c1.cidade;
    RETURN;
    END;

    OVERRIDING MEMBER FUNCTION exibirInfo() RETURN VARCHAR2 IS
    BEGIN
        RETURN c1.cpf + ' - ' + c1.nome_completo + ' - ' + c1.data_cadastro;
    END;
END;
/
CREATE TABLE tb_cliente OF tp_cliente;
/
CREATE OR REPLACE TYPE tp_estoque AS OBJECT(
    id_estoque NUMBER,
    qtd_produtos NUMBER,
    status_estoque VARCHAR(20),
--    MEMBER PROCEDURE insert_estoque
);
/
--CREATE TYPE BODY tp_estoque AS
--   MEMBER PROCEDURE insert_estoque IS
--   BEGIN
--       INSERT INTO tb_estoque VALUES (id_estoque);
--       COMMIT;
--   END insert_estoque;
--END;
/
CREATE TABLE tb_estoque OF tp_estoque(
    id_estoque PRIMARY KEY
);
/
CREATE OR REPLACE TYPE tp_produto AS OBJECT(
    id_produto NUMBER, 
    nome VARCHAR2(20),
    categoria VARCHAR2(20),
    preco NUMBER
);
/
CREATE TABLE tb_produto OF tp_produto(
    id_produto PRIMARY KEY
);
/
/
CREATE OR REPLACE TYPE tp_promocao AS OBJECT(
    codigo_promocional NUMBER,
    valor_desconto NUMBER,
    data_termino DATE,
    MAP MEMBER FUNCTION promocaoTOnumber RETURN NUMBER
);
/
CREATE OR REPLACE TYPE BODY tp_promocao AS
    MAP MEMBER FUNCTION promocaoTOnumber RETURN INTEGER IS
    p NUMBER := codigo_promocional;
    BEGIN
        RETURN p;
    END;
END;
/
CREATE TABLE tb_promocao OF tp_promocao(
    codigo_promocional PRIMARY KEY
);
/
CREATE OR REPLACE TYPE tp_cartao_fidelidade AS OBJECT(
    data_emissao DATE
);
/
CREATE TYPE tp_nt_cartao_fidelidade AS TABLE OF tp_cartao_fidelidade;
/
CREATE TABLE tb_lista_cartao_fidelidade(
    cpf_cliente_cf VARCHAR(14),
    lista_cartao_fidelidade tp_nt_cartao_fidelidade  
) NESTED TABLE lista_cartao_fidelidade STORE AS  nt_tb_lista_cartao_fidelidade;
/
CREATE OR REPLACE TYPE tp_pedido AS OBJECT(
    id_pedido NUMBER, 
    data_pedido DATE,
    cpf_funcionario_pedido REF tp_funcionario,
    cpf_cliente_pedido REF tp_cliente
);
/
CREATE TABLE tb_pedido OF tp_pedido(
    id_pedido PRIMARY KEY,
    cpf_funcionario_pedido SCOPE IS tb_funcionario,
    cpf_cliente_pedido SCOPE IS tb_cliente
);
/
CREATE OR REPLACE TYPE tp_realizacao AS OBJECT (
    id_pedido_realizacao REF tp_pedido,
    cpf_cliente_realizacao REF tp_cliente,
    codigo_promocional_realizacao NUMBER
);
/
CREATE TABLE tb_realizacao OF tp_realizacao(
    id_pedido_realizacao SCOPE IS tb_pedido,
    cpf_cliente_realizacao SCOPE IS tb_cliente
);
/
CREATE OR REPLACE TYPE tp_contem AS OBJECT(
    quantidade NUMBER,
    id_pedido_contem REF tp_pedido,
    id_produto_contem REF tp_produto
);
/
CREATE TABLE tb_contem OF tp_contem(
    id_pedido_contem SCOPE IS tb_pedido,
    id_produto_contem SCOPE IS tb_produto
);
/
CREATE OR REPLACE TYPE tp_armazena AS OBJECT(
    data_armazenagem DATE,
    id_estoque_armazena REF tp_estoque,
    cpf_funcionario_armazena REF tp_funcionario,
    id_estoque_armazena REF tp_estoque
);
/
create table tb_armazena of tp_armazena;
/
CREATE TABLE tb_contem OF tp_contem(
    id_pedido_contem SCOPE IS tb_pedido,
    id_produto_contem SCOPE IS tb_produto
);