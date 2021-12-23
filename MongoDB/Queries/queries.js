// use db;

const { text } = require("stream/consumers");

// use OK
// find OK 
// size OK
// aggregate OK
// match OK
// project OK
// gte OK
// group OK
// sum OK
// count OK
// max OK
// avg OK
// exists OK
// sort OK
// limit OK
// $where OK
// mapreduce DEPRECATED
// function OK
// pretty OK
// all OK
// set OK
// text OK
// search OK
// filter OK
// update OK
// save DEPRECATED
// renamecollection OK
// cond OK
// lookup OK
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
db.encomendas.aggregate([
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

//Seleciona os funcionarios com salario maior ou igual a 1000
db.funcionarios.find({ salario: { $gte: 1000 } }).pretty();

//Procura todos os funcionarios que são do sexo feminino
db.funcionarios.createIndex({sexo: "text"})

db.funcionarios.find({
    $text: {
      $search: "F",
    },
}).pretty();

// transfome as medidas: comprimento, largura e altura de encomendas em volume.
var map = function () {
    emit(this.medidas.comprimento, this.medidas.largura, this.medidas.altura);
};
var reduce = function (comprimento, largura, altura) {
    volume = comprimento*largura*altura
    return volume;
};

db.encomendas.mapReduce(map, reduce, { out: "Results" });

// nova encomenda de Carlos Antonio
  db.encomendas.save({
    peso: 15,
    comprimento: 15, 
    largura: 15,
    altura: 8,
    cliente: 1,
    custo: 105.00
  });

// Atualizar o logradouro da Rua 2 para Rua 22
db.enderecos.update({ logradouro: /Rua 2/i }, { $set: { logradouro: "Rua 22" } });

// Retorne as encomendas que custão mais de 1000 
db.encomendas.find({
    $where: function () {
      return this.custo > 1000;
    },
  });

  // Pegar as três encomendas de maior valor
db.encomendas.find().sort({ custo: -1 }).limit(3);

// max
db.funcionarios.aggregate([
    {
        $group: {
            _id: "$sexo", MaxSalario:{$max: "$salario"}
        }
    }
]);

// adicionar altura nas medidas da encomenda 2
db.encomendas.update(
    { _id: 2 },
    {
        $addToSet: {
            medidas: {altura: 4},
        },
    }
);

// Media salarial agrupado por genero
db.funcionarios.aggregate([{ $group: {_id:"$sexo", MediaSalarial: {$avg:"$salario"}} }]);

// 

// Listar Nome, Total de encomendas, custo total e médio das encomendas dos clientes
db.encomendas.aggregate([
    {
        $lookup: {
            from: "clientes",
            localField: "cliente",
            foreignField: "_id",
            as: "cliente_info",
        }
    },
    {
        $unwind: "$cliente_info",
    },
    {
        $group: {
            _id: "$cliente_info.nome",
            total_encomendas: { $count: {} },
            valor_total: { $sum: "$custo" },
            valor_medio: { $avg: "$custo" },
        },
    },
    {
        $project: {
            _id: 0,
            nome: "$_id",
            total_encomendas: 1,
            valor_total: 1,
            valor_medio: 1,
        },
    },
]).pretty();



// Indica a comissão de 10% nos funcionarios que ganham acima de 2500 e 30% nos outros 
db.funcionarios.aggregate(
    [
        {
            $project:
            {
                nome:1, 
                salario: 1,
                comissao:
                {
                    $cond: { if: { $eq: [ "$salario", 2500 ] }, then: 10, else: 30 }
                }
            }
        }
    ]
);

//Retorna as entregas que foram enviadas no mês 11
db.encomendas.aggregate([
    {
      $project: {
        _id:0,
        items: {
          $filter: {
             input: "$items",
             as: "item",
             cond: { $eq: [ "$$item.fragil", true ] }
          }
       }
      },
    },
  ]).pretty();


db.funcionarios.renameCollection("entregadores");
