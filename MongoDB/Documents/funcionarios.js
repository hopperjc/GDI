// Criando coleção de funcionários
db.funcionarios.insertMany([
    {
        _id: 1,
        nome : "José Augusto",
        cpf : "111.222.333-44",
        dataNascimento : "14/08/1979",
        email : "jose@entregas.com.br",
        telefone : 81999999999,
        sexo : "M"
    },
    {
        _id: 2,
        nome: "Ana Clara",
        cpf: "222.333.444-55",
        dataNascimento: "11/07/1987",
        email: "anac@entregas.com.br",
        telefone: 81888888888,
        sexo: "F"
    },
    {
        _id: 3,
        nome: "Helena Alves",
        cpf: "333.444.555-66",
        dataNascimento: "04/01/1989",
        email: "helena@entregas.com.br",
        telefone: 81777777777,
        sexo: "F"
    },
    {
        _id: 4,
        nome : "Lucas Rafael",
        cpf : "444.555.666-77",
        dataNascimento : "03/04/1994",
        email : "lucas@entregas.com.br",
        telefone : 81666666666,
        sexo : "M"
    },
    {
        _id: 5,
        nome : "Isabela Gomes",
        cpf : "555.666.777-88",
        dataNascimento : "23/04/1996",
        email : "isa@entregas.com.br",
        telefone : 81555555555,
        sexo : "F"
    }
])
// =-=-=-= DELETE =-=-=-=
db.funcionarios.deleteMany({salario: {$gt: 3000}})
