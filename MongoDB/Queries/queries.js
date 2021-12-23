// use db;

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
// limit 
// $where
// mapreduce
// function OK
// pretty OK
// all
// set
// text
// search OK
// filter
// update
// save
// renamecollection
// cond
// lookup
// findone OK
// addtoset

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
db.funcionarios.find({
    $text: {
      $search: "F",
    },
  }).pretty();