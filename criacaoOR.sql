CREATE OR REPLACE TYPE tp_telefone AS OBJECT(
    ddd VARCHAR2(2),
    numero VARCHAR2(10)
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
    MEMBER FUNCTION exibirInfo(P tp_pessoa) RETURN VARCHAR2,
    MEMBER FUNCTION exibirEndereco(cep  VARCHAR2, logradouro  VARCHAR2, numero  NUMBER, complemento  VARCHAR2, bairro  VARCHAR2) RETURN VARCHAR2,
    MEMBER PROCEDURE exibirDetalhesPessoa (P tp_pessoa)
) NOT FINAL NOT INSTANTIABLE;
/
CREATE OR REPLACE TYPE BODY tp_pessoa AS
    MEMBER FUNCTION exibirInfo(P tp_pessoa) RETURN VARCHAR2
    BEGIN 
        RETURN  P.cpf + ' - '+ P.nome_completo;
    END;
    
    MEMBER FUNCTION exibirEndereco(cep VARCHAR2, logradouro VARCHAR2, numero NUMBER, complemento VARCHAR2, bairro VARCHAR2) RETURN VARCHAR2 IS
    BEGIN
        RETURN  cep + ', ' + logradouro + ', ' + numero + ', '+ complemento + ', ' + bairro;
    END;
    
    
    MEMBER PROCEDURE exibirDetalhesPessoa (P tp_pessoa) IS
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
ALTER TYPE tp_pessoa ADD ATTRIBUTE(cidade VARCHAR2(30)) CASCADE;
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
    cargo REF tp_cargo,
    supervisor REF tp_funcionario,
    CONSTRUCTOR FUNCTION tp_funcionario(F tp_funcionario) RETURN SELF AS RESULT,
    OVERRIDING MEMBER FUNCTION exibirInfo(P tp_pessoa) RETURN VARCHAR2
);
/
CREATE OR REPLACE TYPE BODY tp_funcionario AS
    CONSTRUCTOR FUNCTION tp_funcionario(f1 tp_funcionario) RETURN SELF AS RESULT IS
    BEGIN
        cpf := f1.cpf; 
        nome_completo := f1.nome_completo; 
        data_nascimento := f1.data_nascimento; 
        telefones := f1.telefones; 
        cep := f1.cep; 
        logradouro := f1.logradouro; 
        numero := f1.numero; 
        complemento := f1.complemento; 
        bairro := f1.bairro; 
        cidade := f1.cidade;
        cargo := f1.cargo;
        supervisor := f1.supervisor;
    RETURN;
    END;
    
    OVERRIDING MEMBER FUNCTION exibirInfo(P tp_pessoa) RETURN VARCHAR2 IS
    F := tp_funcionario
    BEGIN
        RETURN F.cpf + ' - ' + F.nome_completo + ' - ' + F.cargo.nome_cargo;
    END;
END;
/
CREATE TABLE tb_funcionario OF tp_funcionario(
    cpf PRIMARY KEY,
    supervisor WITH ROWID REFERENCES tb_funcionario
);
/
CREATE OR REPLACE TYPE tp_cliente UNDER tp_pessoa(
    data_cadastro DATE,
    CONSTRUCTOR FUNCTION tp_cliente(C tp_cliente) RETURN SELF AS RESULT,
    OVERRIDING MEMBER FUNCTION exibirInfo(P tp_pessoa) RETURN VARCHAR2
);
/
CREATE OR REPLACE TYPE BODY tp_cliente AS
    CONSTRUCTOR FUNCTION tp_cliente(C tp_cliente) RETURN SELF AS RESULT IS
    BEGIN 
        cpf := C.cpf; 
        nome_completo := C.nome_completo; 
        data_nascimento := C.data_nascimento; 
        telefones := C.telefones; 
        cep := C.cep; 
        logradouro := C.logradouro; 
        numero := C.numero; 
        complemento := C.complemento; 
        bairro := C.bairro; 
        cidade := C.cidade;
        data_cadastro := C.data_cadastro;
    RETURN;
    END;

    OVERRIDING MEMBER FUNCTION exibirInfo(P tp_pessoa) RETURN VARCHAR2 IS
    C := tp_cliente
    BEGIN
        RETURN C.cpf + ' - ' + C.nome_completo + ' - ' + C.data_cadastro;
    END;
END;
/
CREATE TABLE tb_cliente OF tp_cliente(
    cpf PRIMARY KEY
);
/
CREATE OR REPLACE TYPE tp_estoque AS OBJECT(
    id_estoque NUMBER,
    qtd_produtos NUMBER,
    status_estoque VARCHAR(20)
);
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
) NESTED TABLE lista_cartao_fidelidade STORE AS  tb_nt_lista_cartao_fidelidade;

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
    codigo_promocional_realizacao NUMBER,
    id_pedido_realizacao REF tp_pedido,
    cpf_cliente_realizacao REF tp_cliente
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
    id_produto_armazena REF tp_produto,
    cpf_funcionario_armazena REF tp_funcionario
);
/
CREATE TABLE tb_armazena of tp_armazena(
    id_estoque_armazena SCOPE IS tb_estoque,
    id_produto_armazena SCOPE IS tb_produto,
    cpf_funcionario_armazena SCOPE IS tb_funcionario
);