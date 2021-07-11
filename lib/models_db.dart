import 'dart:io';

class UserModels {
  String nome = '';
  String sobrenome = '';
  String cpf = '';
  String genero = '';
  String telefone = '';

  UserModels(
    this.nome,
    this.sobrenome,
    this.cpf,
    this.genero,
    this.telefone,
  );

  UserModels.fromMap(Map<String, dynamic> map) {
    nome = map['nome'];
    sobrenome = map['sobrenome'];
    cpf = map['cpf'];
    genero = map['genero'];
    telefone = map['telefone'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'nome': nome,
      'sobrenome': sobrenome,
      'cpf': cpf,
      'genero': genero,
      'telefone': telefone
    };

    return map;
  }
}

class CardModels {
  String usuario = '';
  int estado = 0;
  String sintomas = '';
  String data = '';
  String hora = '';
  String imagens = '';

  CardModels(this.usuario, this.estado, this.sintomas, this.data, this.hora,
      this.imagens);

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'usuario': usuario,
      'estado': estado,
      'sintomas': sintomas,
      'data': data,
      'hora': hora,
      'imagens': imagens
    };

    return map;
  }

  CardModels.fromMap(Map<String, dynamic> map) {
    usuario = map['usuario'];
    estado = map['estado'];
    sintomas = map['sintomas'];
    data = map['data'];
    hora = map['hora'];
    imagens = map['imagens'];
  }
}

class CredentialModels {
  String email = '';
  String senha = '';
  String id_cpf = '';

  CredentialModels(this.email, this.senha, this.id_cpf);

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'email': email,
      'senha': senha,
      'id_cpf': id_cpf
    };

    return map;
  }

  CredentialModels.fromMap(Map<String, dynamic> map) {
    email = map['email'];
    senha = map['senha'];
    id_cpf = map['cpf'];
  }
}

class LembreteModels {
  String user = '';
  String anotacao = '';
  String horas = '';
  int ano = 0;
  int mes = 0;
  int dia = 0;

  File a;

  LembreteModels(
      this.user, this.anotacao, this.horas, this.ano, this.mes, this.dia);

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'user': user,
      'anotacao': anotacao,
      'horas': horas,
      'ano': ano,
      'mes': mes,
      'dia': dia
    };

    return map;
  }

  LembreteModels.fromMap(Map<String, dynamic> map) {
    user = map['user'];
    anotacao = map['anotacao'];
    horas = map['horas'];
    ano = map['ano'];
    mes = map['mes'];
    dia = map['dia'];
  }
}
