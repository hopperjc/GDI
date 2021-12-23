// Criando coleção de entregas
db.entregas.insertMany([
  {
      _id: 1, 
      encomenda: 1,
      entregador: 1,
      destino: 2,
      horario_saida: new Date("2021-10-12"),
      horario_chegada: new Date(),
      entregue: false
  }  
])