const MongoClient = require('mongodb').MongoClient;
const url = "mongodb://localhost:27017/mydb";
MongoClient.connect(url, function (err, db) {
    if (err) throw err;
    let dbo = db.db("mydb");
    let remetente = {
        nome: "José Augusto",
        endereco: "Rua Teste, 342",
        salario: 3.500
    };
    dbo.collection("clientes").insertOne(remetente, function (err, res) {
        if (err) throw err;
        console.log("Documento inserido");
    });
    dbo.collection("clientes").find({}).toArray(function (err, result) {
        if (err) throw err;
        console.log(result);
        db.close();
    });
});