class CreateBD {
  String create_user = '''
  CREATE TABLE Usuario(
    cpf TEXT,
    nome TEXT NOT NULL,
    sobrenome TEXT NOT NULL,
    genero TEXT,
    telefone TEXT,
    CONSTRAINT pk_cpf PRIMARY KEY (cpf));''';
  String create_cred = '''
  CREATE TABLE Credencial(
    email TEXT,
    senha TEXT,
    id_cpf TEXT,
    CONSTRAINT pk_email PRIMARY KEY (email),
    CONSTRAINT fk_cpf FOREIGN KEY (id_cpf) REFERENCES Usuario(cpf));''';
  String create_cart = '''
  CREATE TABLE Cartao(
    usuario TEXT,
    estado INTEGER,
    sintomas TEXT,
    data TEXT,
    hora TEXT,
    imagens TEXT,
    CONSTRAINT fk_usuario FOREIGN KEY (usuario) REFERENCES Usuario(cpf));  ''';

  String create_lemb = ''' 
  CREATE TABLE Lembrete(
    user TEXT,
    anotacao TEXT,
    horas TEXT,
    ano INTEGER,
    mes INTEGER,
    dia INTEGER,
    CONSTRAINT fk_user FOREIGN KEY (user) REFERENCES Usuario(cpf));''';
}
