//use mydb;

// Encontre a encomenda que pertence ao CLiente de id 2
db.encomenda.find({ client: { $exists: true, $all: [2] } }).pretty();

// Encontre os clientes que possuem 2 endereços
db.cliente.find({ endereco: { $size: 2 } }).pretty();

// Listar email, telefone e sexo e endereço principa do cliente de nome "Carlos Manoel" 
db.cliente.aggregate([
    { $match: { Nome: /^Carlos Manoel/i } },
    { $sort: { endere_principal: 1 } },
    { $project: { _id: 0, Nome: 0, email: 1, telefone: 1, sexo: 1, endere_principal: 1, enderecos: 0 } },
  ]).pretty();