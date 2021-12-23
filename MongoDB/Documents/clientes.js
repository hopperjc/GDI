// Criando coleção de clientFirstMessageBare
db.clientes.insertMany([
    {
        _id: 1,
        nome : "Carlos Antonio",
        cpf : "999.888.777-66",
        email : "carlinhos@gmail.com.br",
        telefone : 81999998888,
        sexo : "M",
        endereco_principal: 0,
        enderecos: [1]
    },
    {
        _id: 2,
        nome : "Maria Clara",
        cpf : "888.777.666-55",
        email : "mclara@gmail.com.br",
        telefone : 81888887777,
        sexo : "F",
        endereco_principal: 0,
        enderecos: [2]
    },
    {
        _id: 3,
        nome : "Carlos Manoel",
        cpf : "777.666.555-44",
        email : "cmgato@gmail.com.br",
        telefone : 81777776666,
        sexo : "M",
        endereco_principal: 0,
        enderecos: [4, 6]
    },
    {
        _id: 4,
        nome : "Leticia Torres",
        cpf : "666.555.444-33",
        email : "let@gmail.com.br",
        telefone : 81666665555,
        sexo : "F",
        endereco_principal: 0,
        enderecos: [7]
    },
    {
        _id: 5,
        nome : "Fernando Chaves",
        cpf : "555.444.333-22",
        email : "nandinho@gmail.com.br",
        telefone : 81555554444,
        sexo : "F",
        endereco_principal: 1,
        enderecos: [3, 5]
    }
])

db.clientes.update({nome: "Leticia Torres"}, {$set: {nome: "Letycia Torres"}})
db.clientes.update({nome: "Fernando Chaves"}, {$set: {sexo: "M"}})