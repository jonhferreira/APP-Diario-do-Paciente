import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class AppController extends ChangeNotifier {
  static AppController instance = AppController();

  bool dartTheme = false;
  changeTheme() {
    dartTheme = !dartTheme;
    notifyListeners();
  }
}

class AdicionarCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AdicionarCardState();
  }
}

class AdicionarCardState extends State<AdicionarCard> {
  String nome = '';
  int estado = 0;
  String sintomas = '';
  late File file;
  late List<String> anexosNomes;
  List<bool> estados = List.generate(5, (_) => false);

  leArquivos() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: [
        'jpg',
        'jpeg',
        'png',
        'bpm',
        'pdf',
        'doc',
        'mp3',
        'mp4',
        'webm',
        'mkv',
        'wav'
      ],
    );

    if (result != null) {
      List<PlatformFile> file = result.files;
      var filesPath = [];
      for (int i = 0; i < file.length; i++) {
        filesPath.add(file[i].path);
        print(file[i].path);
        // print('👏🏻👏🏻👏🏻');
      }

      // Outras info
      // print(file.name);
      // print(file.size);
      // print(file.extension);
      // print(file.path);
    } else {
      // User canceled the picker
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff499b7f),
        title: Text('Novo card'),
      ),
      body: Form(
        child: Scrollbar(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(14),
            child: Padding(
              padding: EdgeInsets.all(7.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Título
                  Container(
                    width: 800,
                    height: 70,
                    // color: Colors.blueGrey,
                    child: Text(
                      'Olá ' + nome + ', como está se sentindo no momento?',
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
                  SizedBox(height: 30),

                  // Barra de estados
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 60),

                        // Excelente
                        // ToggleButtons(
                        //     children: <Widget>[
                        //       Image.network('https:i.ibb.co/VgGKSy4/semdor.png'),
                        //     ],
                        //     isSelected: estados,
                        //     onPressed: (int index) {
                        //       setState(() {
                        //         estados[0] = !estados[0];
                        //       });
                        //     }),

                        IconButton(
                          focusColor: Color(0xff499b7f),
                          icon: Image.network(
                              'https://i.ibb.co/VgGKSy4/semdor.png'),
                          // Image(image: AssetImage('assets/images/excelente.png')),
                          iconSize: 60,
                          onPressed: () {
                            estado = 0;
                          },
                        ),
                        SizedBox(width: 30),

                        // Bem
                        IconButton(
                          icon:
                              Image.network('https://i.ibb.co/j6JgBDq/suave.png'),
                          // Image.asset('assets/images/bem.png'),
                          iconSize: 60,
                          onPressed: () {
                            estado = 1;
                          },
                        ),
                        SizedBox(width: 30),

                        // Normal
                        IconButton(
                          icon: Image.network(
                              'https://i.ibb.co/6HStkft/moderado.png'),
                          // Image.asset('assets/images/mal.png'),
                          iconSize: 60,
                          onPressed: () {
                            estado = 2;
                          },
                        ),
                        SizedBox(width: 30),

                        // Mal
                        IconButton(
                          icon: Image.network(
                              'https://i.ibb.co/8B3RZPp/dolorido.png'),
                          // Image.asset('assets/images/ruim.png'),
                          iconSize: 60,
                          onPressed: () {
                            estado = 3;
                          },
                        ),
                        SizedBox(width: 30),

                        // Horrível
                        IconButton(
                          icon: Image.network(
                              'https://i.ibb.co/TYPZFWG/muitador.png'),
                          // Image.asset('assets/images/horrível.png'),
                          iconSize: 60,
                          onPressed: () {
                            estado = 4;
                          },
                        ),
                      ],
                    )),
                  SizedBox(height: 40),

                  // Sintomas
                  TextFormField(
                    autofocus: true,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      filled: true,
                      labelText: 'Sintomas',
                      hintText: 'Descreva como está se sentindo',
                      helperText:
                          'Exemplo: Dores, intensidades, sensações, observações.',
                      prefixIcon: Icon(Icons.medical_services_outlined),
                      // border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      sintomas = value;
                    },
                    validator: (value) {
                      if (value == '') return 'O campo precisa ser preenchido';
                    },
                  ),
                  SizedBox(height: 20),

                  // Anexos
                  TextFormField(
                    autofocus: true,
                    textInputAction: TextInputAction.done,
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      labelText: 'Anexos',
                      helperText: 'Exemplo: Documentos, exames, fotos. ',
                      prefixIcon: Icon(Icons.attach_file_outlined),
                      // border: OutlineInputBorder(),
                    ),
                    onTap: () {
                      leArquivos();
                    },
                  ),
                  SizedBox(height: 35),

                  // Botão
                  ElevatedButton(
                    child: const Text('Adicionar'),
                    onPressed: () {
                      // Navigator.of(context).pushReplacementNamed('/home');
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
