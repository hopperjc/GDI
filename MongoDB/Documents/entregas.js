// Criando coleção de entregas
db.entregas.insertMany([
    {
        _id: 1, 
        encomenda: 1,
        entregador: 1,
        destino: 1,
        data_saida: new Date("2021-10-12"),
        data_chegada: new Date("2021-11-08"),
        entregue: true
    },
    {
        _id: 2, 
        encomenda: 2,
        entregador: 1,
        destino: 2,
        data_saida: new Date("2021-10-16"),
        data_chegada: new Date("2021-11-13"),
        entregue: true
    },
    {
        _id: 3, 
        encomenda: 3,
        entregador: 2,
        destino: 4,
        data_saida: new Date("2021-11-11"),
        data_chegada: new Date("2021-12-21"),
        entregue: true
    },
    {
        _id: 4, 
        encomenda: 4,
        entregador: 4,
        destino: 7,
        data_saida: new Date("2021-12-10"),
        data_chegada: new Date(),
        entregue: false
    },
    {
        _id: 5, 
        encomenda: 5,
        entregador: 5,
        destino: 3,
        data_saida: new Date("2021-12-16"),
        data_chegada: new Date(),
        entregue: false
    },
    {
        _id: 6, 
        encomenda: 6,
        entregador: 3,
        destino: 6,
        data_saida: new Date("2021-11-11"),
        data_chegada: new Date("2021-12-21"),
        entregue: false
    },
    {
        _id: 7, 
        encomenda: 7,
        entregador: 3,
        destino: 4,
        data_saida: new Date("2021-11-11"),
        data_chegada: new Date("2021-12-21"),
        entregue: true
    },
    {
        _id: 8, 
        encomenda: 8,
        entregador: 2,
        destino: 5,
        data_saida: new Date("2021-12-16"),
        data_chegada: new Date(),
        entregue: false
    },
])