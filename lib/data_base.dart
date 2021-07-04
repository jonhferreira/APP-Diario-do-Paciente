import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:helloworld/models_db.dart';
import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

import 'createBD.dart';

class DataBase {
  String create_user = CreateBD().create_user;
  String create_cart = CreateBD().create_cart;
  String create_cred = CreateBD().create_cred;
  String create_lemb = CreateBD().create_lemb;

  DataBase._privateConstructor();
  static final DataBase instance = DataBase._privateConstructor();
  // tem somente uma referência ao banco de dados

  Future<Database> gerarDB() async {
    WidgetsFlutterBinding.ensureInitialized();
    Directory dataBasesPath = await getApplicationDocumentsDirectory();
    String path = dataBasesPath.path + "data_DB.db";

    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) {
        db.execute(create_user);
        db.execute(create_cart);
        db.execute(create_cred);
        db.execute(create_lemb);
        print("rodou");
      },
    );
  }

  insertDB(Database db, String table, Map<String, dynamic> mapValues) async {
    await db.insert(table, mapValues);
  }

  // realiza uma consulta no BD na tabela Usuario e retorna
  // lista de UserModels(lista de usuarios)
  Future<List<UserModels>> getAllUsers(Database db) async {
    try {
      var res = await db.query("Usuario");

      List<UserModels> usuarios =
          res.isNotEmpty ? res.map((u) => UserModels.fromMap(u)).toList() : [];

      return usuarios;
    } catch (ex) {
      print(ex);
      return [];
    }
  }

  // retorna todos os cartoes do BD
  Future<List<CardModels>> getAllCards(Database db) async {
    try {
      var res = await db.query("Cartao");

      List<CardModels> cards =
          res.isNotEmpty ? res.map((c) => CardModels.fromMap(c)).toList() : [];

      return cards;
    } catch (ex) {
      print(ex);
      return [];
    }
  }

  // realiza uma busca na tabela Usuario pelo cpf e retorna
  // o usuario correspondente
  Future<UserModels> getUser(Database db, String cpf) async {
    var res = await db.query("Usuario", where: "cpf = ?", whereArgs: [cpf]);

    if (res.length > 0) {
      return UserModels.fromMap(res.first);
    } else {
      return null;
    }
  }

  // realiza uma busca por todos os cartoes vinculados a um cpf
  Future<List<CardModels>> getCardsbyUser(Database db, String cpf) async {
    var res = await db.query("Cartao", where: "usuario = ?", whereArgs: [cpf]);

    List<CardModels> cards =
        res.isNotEmpty ? res.map((c) => CardModels.fromMap(c)).toList() : [];

    return cards;
  }

  // realiza uma busca por cartoes vinculados a uma data
  Future<List<CardModels>> getCardsbyDate(Database db, String data) async {
    var res = await db.query("Cartao", where: "data = ?", whereArgs: [data]);

    List<CardModels> cards =
        res.isNotEmpty ? res.map((c) => CardModels.fromMap(c)).toList() : [];

    return cards;
  }

  // realiza uma busca por lembretes de um data
  Future<List<LembreteModels>> gerLembretsbyDate(
      Database db, int ano, int mes, int dia) async {
    var res = await db.query("Lembrete",
        where: "ano = ? AND mes = ? AND dia = ?", whereArgs: [ano, mes, dia]);

    List<LembreteModels> lembrets = res.isNotEmpty
        ? res.map((l) => LembreteModels.fromMap(l)).toList()
        : [];

    return lembrets;
  }

  Future<Database> getDB() async {
    Database db = await gerarDB();
    return db;
  }
}
