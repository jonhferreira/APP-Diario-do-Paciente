// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:meta/meta.dart';
// import 'package:json_annotation/json_annotation.dart';

import 'dart:ui';

import 'package:flutter/material.dart';

class Formulario {
  String email;
  String senha;

  Formulario({
    required this.email,
    required this.senha,
  });

  // factory Formulario.fromJson(Map<String, dynamic> json) =>
  // _$FormularioFromJson(json);

  // Map<String, dynamic> toJson() => _$FormularioToJson(this);
}

class LoginPage extends StatefulWidget {
  LoginPage(Widget build);

  // final http.Client HttpClient;

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  // ignore: non_constant_identifier_names
  Formulario form_data = Formulario(email: '', senha: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Scrollbar(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(14),
            // child: SizedBox (
            // width: double.infinity,
            // height: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(7.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  // Título
                  Container(
                    width: 400,
                    height: 75,
                    // color: Colors.blueGrey,
                    child: Text('SaúDD - Diário do paciente',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        // fontFamily: ,
                      ),
                    ),
                    decoration: BoxDecoration(
                      // color: Colors.blueGrey,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    padding: EdgeInsets.all(20),
                  ),
                  SizedBox(height: 20),

                  // Ícone
                  Image.network('https://image.flaticon.com/icons/png/512/1062/1062557.png',
                    width: 128,
                    height: 128,
                  ),
                  SizedBox(height: 20),
                  
                  
                  // E-mail
                  TextFormField(
                    autofocus: true,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      filled: true,
                      labelText: 'E-mail',
                      prefixIcon: Icon(Icons.mail_outline_rounded),
                      // border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      form_data.email = value;
                    },
                    validator: (value) {
                      String pattern =
                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                      RegExp regExp = new RegExp(pattern);
                      if (value!.length == 0)
                        return "Informe um e-mail válido";
                      else if (!regExp.hasMatch(value))
                        return "Informe um e-mail válido";
                      else
                        return null;
                    },
                  
                  ),
                  SizedBox(height: 10),

                  // Senha
                  TextFormField(
                    autofocus: true,
                    textInputAction: TextInputAction.done,
                    maxLength: 16,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      prefixIcon: Icon(Icons.password_outlined),
                      // border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      form_data.senha = value;
                    },
                  ),
                  
                  // Botões
                  ElevatedButton(
                    child: const Text('Entrar'),
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed('/home');
                    },
                      // HTTP
                      // onPressed: () async {
                      //   var resposta = await.widget.httpClient.post(
                      //     'URL',
                      //     body: json.encode(form_data.toJson()),
                      //     headers: {'content-type': 'application/json'}
                      //   );

                      //   if (resposta.statusCode == 200) {
                      //     _showDialog('Login efetuado com sucesso.');
                      //   }
                      //   else if (result.statusCode == 401) {
                      //     _showDialog('Incapaz de fazer o login.');
                      //   }
                      //   else {
                      //     _showDialog('Algo de errado aconteceu. Por favor tente novamente.');
                      //   }
                      // },
                  ),
                  SizedBox(height: 10),

                  // Botão - Cadastrar-se
                  ElevatedButton(
                    child: const Text('Cadastrar-se'),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/cadastro');
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Copyright
          Text('Copyright ©2021, All Rights Reserved.', 
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14.0, color: Color(0xFF162A49)
            ),
          ),
          SizedBox(width: 2),

          // Company 
          Text('Desenvolvido por Ayrton Hora, Jonh Kennedy, José Arnaldo e Tércio França', 
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14.0, color: Color(0xFF162A49)
            ),
          ),
        ],
      ),
    );
  }
}

// void _showDialog (String mensagem) {
//   showDialog<void>(
//     context: context,
//     builder: (context) => AlertDialog (
//       title: Text(mensagem),
//       actions: [
//         TextButton (
//           child: const Text('Ok'),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//       ],
//     ),
//   );
// }
