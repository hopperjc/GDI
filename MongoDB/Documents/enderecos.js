// Criando coleção de endereços
db.enderecos.insertMany([
    { 
        _id: 1,
        cep : "09200-120",
        logradouro : "Rua 1",
        bairro : "Bairro 1",
        cidade : "Recife",
        estado : "PE",
        numero: 2,
        complemento: "apt 3",
        referencia: ""
    },
    { 
        _id: 2,
        cep : "20390-127",
        logradouro : "Rua 2",
        bairro : "Bairro 2",
        cidade : "Recife",
        estado : "PE",
        numero: 290,
        complemento: "",
        referencia: ""
    },
    { 
        _id: 3,
        cep : "29012-624",
        logradouro : "Rua Augusto",
        bairro : "Boa viagem",
        cidade : "Recife",
        estado : "PE",
        numero: 10,
        complemento: "",
        referencia: "em frente ao posto"
    },
    { 
        _id: 4,
        cep : "98391-124",
        logradouro : "Rua 48",
        bairro : "Espinheiro",
        cidade : "Recife",
        estado : "PE",
        numero: 88,
        complemento: "apt 56",
        referencia: ""
    },
    { 
        _id: 5,
        cep : "20192-001",
        logradouro : "Av. Governador Macedo",
        bairro : "socorro",
        cidade : "Jaboatão",
        estado : "PE",
        numero: 1001,
        complemento: "",
        referencia: "atrás da drogasil"
    },
    { 
        _id: 6,
        cep : "92190-289",
        logradouro : "Rua  Dr. trajano",
        bairro : "Barro",
        cidade : "Recife",
        estado : "PE",
        numero: 782,
        complemento: "",
        referencia: ""
    },
    { 
        _id: 7,
        cep : "20390-12",
        logradouro : "Rua Pavão",
        bairro : "Arteiro",
        cidade : "Cabo de santo agostinho",
        estado : "PE",
        numero: 3990,
        complemento: "",
        referencia: ""
    }
])