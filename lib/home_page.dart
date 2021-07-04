import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import 'data_base.dart';
import 'models_db.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  var texto = "click no botao(a ideia é que o texto mude)";
  int cpf = -44;
  var cont = 0;

  final fun_db = DataBase.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'My APP',
        style: TextStyle(fontSize: 20),
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          Database db = await fun_db.getDB();

          Map<String, dynamic> mapValues =
              UserModels("jose", "silva", cpf.toString(), "M", "4002").toMap();

          //Map<String, dynamic> map =
          //    CredentialModels("eu@eu.com", "152", cpf.toString()).toMap();

          //Map<String, dynamic> mapV = CardModels(
          //        cpf.toString(), 5, "dor", "13/05/2000", "15:40", "img.jpg")
          //    .toMap();

          await fun_db.insertDB(db, "Usuario", mapValues);
          print("adicionado");

          //await fun_db.insertDB(db, "Credencial", map);
          //print("adicionado");

          //await fun_db.insertDB(db, "Cartao", mapV);

          Map<String, dynamic> mapValue =
              LembreteModels(cpf.toString(), "ola mundo", "3:16", 2021, 7, 4)
                  .toMap();
          await fun_db.insertDB(db, "Lembrete", mapValue);

          List<LembreteModels> lem =
              await fun_db.gerLembretsbyDate(db, 2021, 7, 4);
          LembreteModels lembrete = lem[0];

          var t = "Nome: " +
              lembrete.user +
              "\n" +
              "nota: " +
              lembrete.anotacao +
              " horas: " +
              lembrete.horas;
          //var c = "estado: " +
          //    card.estado.toString() +
          //    " sintomas: " +
          //    card.sintomas;

          texto = t + "\n"; //+ c;
          print(texto);

          setState(() {
            cpf++;
            cont = cont + 1;
          });

          db.close();
        },
      ),
      body: Center(
        child: Text(
          cpf.toString(),
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
