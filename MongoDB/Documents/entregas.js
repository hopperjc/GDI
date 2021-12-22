// Criando coleção de entregas
db.entregas.insert([
  {
      _id: 1, 
      destinatario: 1,
      entregador: 1,
      destino: 2,
      horario_saida:  ISODate("2014-02-10T10:50:42.389Z"),
      horario_chegada: ISODate(),
      entregue: false
  }  
])