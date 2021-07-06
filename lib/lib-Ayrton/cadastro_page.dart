import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
// import 'package:cpfcnpj/cpfcnpj.dart';

class FormDatePicker<T> extends StatefulWidget {
  final DateTime date;
  final ValueChanged<T> onChanged;

  const FormDatePicker({required this.date, required this.onChanged});

  @override
  FormDatePickerState createState() => FormDatePickerState();
}

class FormDatePickerState extends State<FormDatePicker> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 5),
        Column(
          children: [
            Icon(Icons.calendar_today_outlined),
          ],
        ),
        SizedBox(width: 9),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 6),
            Text(
              'Data de nascimento:',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(height: 5),
            Text(
              // intl.DateFormat.yMd().format(widget.date),
              intl.DateFormat.d().format(widget.date) +
                  '/' +
                  intl.DateFormat.MMM().format(widget.date) +
                  '/' +
                  intl.DateFormat.y().format(widget.date),
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ],
        ),
        SizedBox(width: 5),
        TextButton(
          child: const Text('Alterar data'),
          onPressed: () async {
            var newDate = await showDatePicker(
              context: context,
              initialDate: widget.date,
              firstDate: DateTime(1900),
              lastDate: DateTime(2100),
            );
            if (newDate == null) return;

            widget.onChanged(newDate);
          },
        ),
      ],
    );
  }
}

class CadastroPage extends StatefulWidget {
  const CadastroPage({Key? key}) : super(key: key);

  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final _formkey = GlobalKey<FormState>();
  bool _validate = false;
  String nome = '';
  String sobrenome = '';
  String cpf = '';
  String genero = '';
  String email = '';
  String senha = '';
  String telefone = '';
  // ignore: non_constant_identifier_names
  DateTime data_nasc = DateTime.now();

  get date => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
      ),
      body: Form(
        key: _formkey,
        // ignore: deprecated_member_use
        autovalidate: _validate,
        child: Scrollbar(
          child: Align(
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              // padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              // padding: EdgeInsets.fromLTRB(80, 20, 80, 20),
              padding: EdgeInsets.all(50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Dados pessoais',
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: ' ',
                    ),
                  ),
                  SizedBox(height: 10),

                  // Primeiro nome
                  TextFormField(
                    autofocus: true,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      filled: true,
                      labelText: 'Nome',
                      hintText: 'Digite seu nome.',
                      prefixIcon: Icon(Icons.person_outline_rounded),
                      // border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(10),
                    ),
                    onChanged: (value) {
                      setState(() {
                        nome = value;
                      });
                    },
                    validator: (value) {
                      String pattern = r'(^[a-zA-Z]*$)';
                      RegExp regExp = new RegExp(pattern);
                      if (value!.length == 0)
                        return "Informe o nome.";
                      else if (!regExp.hasMatch(value)) {
                        return "O nome deve conter caracteres de a-z ou A-Z.";
                      } else
                        return null;
                    },
                  ),
                  SizedBox(height: 10),

                  // Sobrenome
                  TextFormField(
                    autofocus: true,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      filled: true,
                      labelText: 'Sobrenome',
                      hintText: 'Digite seu sobrenome.',
                      prefixIcon: Icon(Icons.person_outline_rounded),
                      // border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      setState(() {
                        sobrenome = value;
                      });
                    },
                    validator: (value) {
                      String pattern = r'(^[a-zA-Z ]*$)';
                      RegExp regExp = new RegExp(pattern);
                      if (value!.length == 0)
                        return "Informe o sobrenome.";
                      else if (!regExp.hasMatch(value)) {
                        return "O sobrenome deve conter caracteres de a-z ou A-Z.";
                      } else
                        return null;
                    },
                  ),
                  SizedBox(height: 10),

                  // Cpf
                  TextFormField(
                    autofocus: true,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      filled: true,
                      labelText: 'CPF',
                      hintText: 'Digite seu cpf.',
                      helperText: 'Exemplo: XXX.XXX.XXX-XX.',
                      prefixIcon: Icon(Icons.person_search_rounded),
                      // border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      setState(() {
                        cpf = value;
                      });
                    },
                    validator: (value) {
                      // Biblioteca:
                      // if (!CPF.isValid(value) && CPF.isValid(value) != null) {
                      //   return 'Informe um cpf válido';
                      // } else
                      //   print('Cpf validado com sucesso.');

                      // Expressões regulares:
                      String pattern = r'(^[0-9]{11})$';
                      RegExp regExp = new RegExp(pattern);
                      if (value!.length == 0)
                        return "Informe um cpf válido.";
                      else if (!regExp.hasMatch(value))
                        return "Informe um cpf válido.";
                      else
                        return null;

                      // Algoritmo
                    },
                  ),
                  SizedBox(height: 10),

                  // Data de nascimento
                  FormDatePicker<DateTime>(
                    date: data_nasc,
                    onChanged: (value) {
                      setState(() {
                        data_nasc = value;
                      });
                    },
                  ),
                  SizedBox(height: 20),

                  // Telefone
                  TextFormField(
                    autofocus: true,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      filled: true,
                      labelText: 'Telefone',
                      hintText: 'Digite seu telefone.',
                      helperText: 'Exemplo: DDD XXXXX-XXXX.',
                      prefixIcon: Icon(Icons.phone_android_outlined),
                      // border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      setState(() {
                        telefone = value;
                      });
                    },
                    validator: (value) {
                      String pattern = r'([0-9]{2} [0-9]{5}-[0-9]{4})$';
                      RegExp regExp = new RegExp(pattern);
                      if (value!.length == 0)
                        return "Informe um número de telefone válido.";
                      else if (!regExp.hasMatch(value))
                        return "Informe um número de telefone válido.";
                      else
                        return null;
                    },
                  ),
                  SizedBox(height: 10),

                  // E-mail
                  TextFormField(
                    autofocus: true,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      filled: true,
                      labelText: 'E-mail',
                      hintText: 'Digite seu e-mail.',
                      helperText: 'Exemplo: exemplo@domínio.com',
                      prefixIcon: Icon(Icons.mail_outline_rounded),
                      // border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      setState(() {
                        email = value;
                      });
                    },
                    validator: (value) {
                      String pattern =
                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                      RegExp regExp = new RegExp(pattern);
                      if (value!.length == 0)
                        return "Informe um e-mail válido.";
                      else if (!regExp.hasMatch(value))
                        return "Informe um e-mail válido.";
                      else
                        return null;
                    },
                  ),
                  SizedBox(height: 10),

                  // Senha
                  TextFormField(
                    autofocus: true,
                    textInputAction: TextInputAction.next,
                    maxLength: 16,
                    decoration: const InputDecoration(
                      filled: true,
                      labelText: 'Senha',
                      hintText: 'Digite sua senha.',
                      helperText:
                          'A senha deve conter no máximo 16 caracteres de a-z ou A-z ou dígitos.',
                      prefixIcon: Icon(Icons.password_outlined),
                      // border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      setState(() {
                        senha = value;
                      });
                    },
                    validator: (value) {
                      String pattern = r'([a-zA-Z\-0-9]{16})$';
                      RegExp regExp = new RegExp(pattern);
                      if (value!.length == 0)
                        return "Informe uma senha válido.";
                      else if (!regExp.hasMatch(value))
                        return "A senha deve conter caracteres de a-z ou A-Z ou dígitos.";
                      else
                        return null;
                    },
                  ),
                  SizedBox(height: 10),

                  // Confirmação de Senha
                  TextFormField(
                    autofocus: true,
                    textInputAction: TextInputAction.none,
                    maxLength: 16,
                    decoration: const InputDecoration(
                      filled: true,
                      labelText: 'Confirmar Senha',
                      hintText: 'Digite novamente sua senha.',
                      helperText: 'As senhas devem coincidir.',
                      prefixIcon: Icon(Icons.password_outlined),
                      // border: OutlineInputBorder(),
                    ),
                    // onChanged: (value) {
                    //   setState();
                    // },
                    validator: (value) {
                      String pattern = r'([a-zA-Z\-0-9]{16})$';
                      RegExp regExp = new RegExp(pattern);
                      if (value!.length == 0)
                        return "As senhas não coincidem.";
                      else if (!regExp.hasMatch(value))
                        return "A senha deve conter caracteres de a-z ou A-Z ou dígitos.";
                      else if (value != senha)
                        return "As senhas não coincidem.";
                      else
                        return null;
                    },
                  ),
                  SizedBox(height: 16),

                  // Botão
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        label: Text('Cadastrar-se'),
                        icon: Icon(Icons.login_rounded, size: 20),
                        // style: ElevatedButton.styleFrom(),
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            _formkey.currentState!.save();
                            // ignore: deprecated_member_use
                            Scaffold.of(context).showSnackBar(SnackBar(
                                content:
                                    Text('Cadastro efetuado com sucesso')));
                            // Encaminhamento
                          } else {
                            setState(() {
                              _validate = true;
                            });
                          }
                        },
                        // child: const Text('Cadastrar-se'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
