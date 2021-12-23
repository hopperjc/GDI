// Criando coleção de clientFirstMessageBare
db.cliente.insertMany([
    {
        _id: 1,
        nome : "José Augusto",
        cpf : "111.222.333-44",
        email : "jose@entregas.com.br",
        telefone : 81999999999,
        sexo : "M",
        enderecos: [
            {
                endereco: 1,
                principal: true
            }
        ]
    }
])