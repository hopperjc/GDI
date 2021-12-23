// Criando coleção de clientFirstMessageBare
db.cliente.insertMany([
    {
        _id: 1,
        nome : "Carlos Antonio",
        cpf : "999.888.777-66",
        email : "carlinhos@gmail.com.br",
        telefone : 81999998888,
        sexo : "M",
        enderecos: [
            {
                endereco: 1,
                principal: true
            }
        ]
    },
    {
        _id: 2,
        nome : "Maria Clara",
        cpf : "888.777.666-55",
        email : "mclara@gmail.com.br",
        telefone : 81888887777,
        sexo : "F",
        enderecos: [
            {
                endereco: 1,
                principal: true
            }
        ]
    },
    {
        _id: 3,
        nome : "Carlos Manoel",
        cpf : "777.666.555-44",
        email : "cmgato@gmail.com.br",
        telefone : 81777776666,
        sexo : "M",
        enderecos: [
            {
                endereco: 1,
                principal: true
            }
        ]
    },
    {
        _id: 4,
        nome : "Leticia Torres",
        cpf : "666.555.444-33",
        email : "let@gmail.com.br",
        telefone : 81666665555,
        sexo : "F",
        enderecos: [
            {
                endereco: 1,
                principal: true
            }
        ]
    },
    {
        _id: 5,
        nome : "Fernando Chaves",
        cpf : "555.444.333-22",
        email : "nandinho@gmail.com.br",
        telefone : 81555554444,
        sexo : "M",
        enderecos: [
            {
                endereco: 1,
                principal: true
            }
        ]
    }
])