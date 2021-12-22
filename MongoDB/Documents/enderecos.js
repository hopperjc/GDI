// Criando coleção de endereços
db.enderecos.insert([
    { 
        _id: 1,
        cep : "111111111",
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
        cep : "20390-12",
        logradouro : "Rua 2",
        bairro : "Bairro 2",
        cidade : "Recife",
        estado : "PE",
        numero: 290,
        complemento: "",
        referencia: ""
    }
])