// use db;

const { text } = require("stream/consumers");

// use OK
// find OK 
// size OK
// aggregate OK
// match OK
// project OK
// gte
// group
// sum
// count
// max
// avg
// exists OK
// sort OK
// limit OK
// $where OK
// mapreduce
// function OK
// pretty OK
// all OK
// set OK
// text OK
// search OK
// filter
// update OK
// save OK
// renamecollection OK
// cond
// lookup
// findone OK
// addtoset OK

// Encontre a encomenda que pertence ao CLiente de id 2
db.encomendas.find({ cliente: { $exists: true, $all: [3] } }).pretty();

// Encontre os clientes que possuem 2 endereços
db.clientes.find({ enderecos: { $size: 2 } }).pretty();

// Listar informações dos endereços de Recife ordenados por numero ascendente
db.enderecos.aggregate([
    { $match: { cidade: "Recife"} },
    { $sort: { numero: 1 } },
    { $project:  { _id: 0, cep : 1, logradouro : 1, bairro : 1, cidade : 1, estado : 1, numero: 1, complemento: 1, referencia: 1}},
  ]).pretty();

// Listar CPF, nome, email do cliente de CPF "999.888.777-66"
db.clientes.findOne({ cpf: "999.888.777-66" }, { _id: 0, nome: 1, cpf: 1, email: 1})

//Função que retorna uma mensagem indicando que a encomenda foi paga
db.consultas.aggregate([
    {
      $addFields: {
        message: {
          $function: {
            body: function (custo) {
              return `Opa!  Você pagou a encomenda no valor de ${custo}`;
            },
            args: ["$custo"],
            lang: "js",
          },
        },
      },
    },
  ]).pretty();

  //Procura todos os funcionarios que são do sexo feminino
db.funcionarios.createIndex({sex: "text"})
db.funcionarios.find({
    $text: {
      $search: "F",
    },
  }).pretty();

  // nova encomenda de Carlos Antonio
  db.encomendas.save({
    peso: 15,
    comprimento: 15, 
    largura: 15,
    altura: 8,
    cliente: 1,
    custo: 105.00
  })

  // Atualizar o logradouro da Rua 2 para Rua 22
db.enderecos.update({ logradouro: /Rua 2/i }, { $set: { Valor: "Rua 22" } });

// Retorne as encomendas que custão mais de 1000 
db.encomendas.find({
    $where: function () {
      return this.custo > 1000;
    },
  });

  // Pegar as três encomendas de maior valor
db.encomendas.find().sort({ custo: -1 }).limit(3);

// Listar as entregas realizadas em 2021
db.pet.aggregate([
    {
      $project: {
        Nome: 1,
        vacinas: {
          $filter: {
            input: "$Vacinas",
            as: "vacina",
            cond: { $eq: [{ $year: "$$vacina.dataAplicacao" }, 2021] },
          },
        },
      },
    },
  ]).pretty();


  // adicionar altura nas medidas da encomenda 2
  db.encomendas.update(
    { _id: 2 },
    {
      $addToSet: {
        medidas: {altura: 4},
      },
    }
  );

//12.avg - Media salarial agrupado por genero
db.funcionarios.aggregate([{ $group: {_id:"$sexo", MediaSalarial: {$avg:"$salario"}} }])

  db.funcionarios.renameCollection("entregadores");
