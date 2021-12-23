db.encomendas.insertMany([
    {
        _id: 1,
        peso: 10, 
        medidas: [
            {comprimento: 12}, 
            {largura: 9},
            {altura: 4}
        ],
        cliente: 1,
        custo: 70.00
    },
    {
        _id: 2,
        peso: 6, 
        medidas: [
            {comprimento: 3}, 
            {largura: 5},
        ],
        cliente: 2,
        custo: 37.00
    },
    {
        _id: 3,
        peso: 100,
        medidas: [
            {comprimento: 120}, 
            {largura: 90},
            {altura: 50}
        ],
        cliente: 3,
        custo: 700.00
    },
    {
        _id: 4,
        peso: 25,
        medidas: [
            {comprimento: 29}, 
            {largura: 42},
            {altura: 17}
        ],
        cliente: 4,
        custo: 175.00
    },
    {
        _id: 5,
        peso: 17.5,
        medidas: [
            {comprimento: 18}, 
            {largura: 18},
            {altura: 18}
        ],
        cliente: 5,
        custo: 122.50
    },
    {
        _id: 6,
        peso: 40, 
        medidas: [
            {comprimento: 50}, 
            {largura: 30},
            {altura: 10}
        ],
        cliente: 3,
        custo: 280.00
    },
    {
        _id: 7,
        peso: 250, 
        medidas: [
            {comprimento: 200}, 
            {largura: 150},
            {altura: 50}
        ],
        cliente: 3,
        custo: 1750.00
    },
    {
        _id: 8,
        peso: 2,
        medidas: [
            {comprimento: 3}, 
            {largura: 3},
            {altura: 4}
        ],
        cliente: 5,
        custo: 14.00
    },
])