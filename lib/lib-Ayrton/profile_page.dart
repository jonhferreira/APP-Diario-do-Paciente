import 'package:diario_do_paciente/app_controller.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Scrollbar(
          child: Align(
            alignment: Alignment.topLeft,
            child: SingleChildScrollView(
              padding: EdgeInsets.all(5),
              child: Column(
                children: [
                  // Foto de perfil
                  fotoPerfil(
                      'https://image.flaticon.com/icons/png/512/1062/1062557.png'),
                  SizedBox(height: 8),

                  // Nome do usuário
                  nomeUsuario('Nome do usuário'),
                  SizedBox(height: 8),

                  // Subtítulo - Dados pessoais
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    // width: MediaQuery.of(context).size.width * 0.80,
                    children: [
                      SizedBox(width: 20),
                      Text(
                        'Dados pessoais',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),

                  // Cards - Dados pessoais
                  dadosPessoais(
                      'DD/MM/AAAA',
                      '000.000.000-00',
                      'usuario@gmail.com',
                      '(DDD) XXXXX-XXXX',
                      'Rua, avenida, longradouro...'),
                  SizedBox(height: 8),

                  // Subtítulo - Configurações
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    // width: MediaQuery.of(context).size.width * 0.80,
                    children: [
                      SizedBox(width: 20),
                      Text(
                        'Configurações',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),

                  // Cards - Configurações
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Card(
                      child: Column(
                        children: [
                          // Configurações
                          ListTile(
                            title: Text('Configurações gerais'),
                            leading: Icon(Icons.settings_outlined),
                            onTap: () {
                              // Configurações
                            },
                          ),
                          Divider(
                            height: 0.6,
                            color: Colors.black87,
                          ),

                          // Tema
                          ListTile(
                            title: Text('Altere o tema'),
                            leading: Icon(Icons.dark_mode_outlined),
                            onTap: () {
                              // Modo noturno
                              AppController.instance.changeTheme();
                            },
                          ),
                          Divider(
                            height: 0.6,
                            color: Colors.black87,
                          ),

                          // Sobre
                          ListTile(
                            title: Text('Sobre'),
                            leading: Icon(Icons.info_outline),
                            onTap: () {
                              Navigator.of(context).pushNamed('/');
                            },
                          ),
                          Divider(
                            height: 0.6,
                            color: Colors.black87,
                          ),

                          // Logout
                          ListTile(
                            title: Text('Log out'),
                            leading: Icon(Icons.logout_outlined),
                            onTap: () {
                              Navigator.of(context).pushReplacementNamed('/');
                            },
                          ),
                          Divider(
                            height: 0.6,
                            color: Colors.black87,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 80),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Copyright
          Text(
            'Copyright ©2021, All Rights Reserved.',
            style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 14.0,
                color: Color(0xFF162A49)),
          ),
          SizedBox(width: 2),

          // Company
          Text(
            'Desenvolvido por Ayrton Hora, Jonh Kennedy, José Arnaldo e Tércio França',
            style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 14.0,
                color: Color(0xFF162A49)),
          ),
        ],
      ),
    );
  }

  Widget fotoPerfil(String photoPath) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.all(Radius.circular(10))
              // borderRadius: BorderRadius.circular(10),
              color: Colors.transparent,
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(photoPath),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget nomeUsuario(String userName) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.80,
      child: Center(
        child: Text(
          userName,
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }

  Widget dadosPessoais(
      String date, String cpf, String email, String phone, String address) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Card(
        child: Column(
          children: [
            // Data de nascimento
            ListTile(
              title: Text('Data de nascimento:'),
              subtitle: Text(date),
              leading: Icon(Icons.calendar_today_outlined),
            ),
            Divider(
              height: 0.6,
              color: Colors.black87,
            ),

            // Cpf
            ListTile(
              title: Text('Cpf:'),
              subtitle: Text(cpf),
              leading: Icon(Icons.person_search_rounded),
            ),
            Divider(
              height: 0.6,
              color: Colors.black87,
            ),

            // E-mail
            ListTile(
              title: Text('E-mail:'),
              subtitle: Text(email),
              leading: Icon(Icons.mail_outline_rounded),
            ),
            Divider(
              height: 0.6,
              color: Colors.black87,
            ),

            // Telefone
            ListTile(
              title: Text('Telefone:'),
              subtitle: Text(phone),
              leading: Icon(Icons.phone_android_outlined),
            ),
            Divider(
              height: 0.6,
              color: Colors.black87,
            ),

            // Endereço
            ListTile(
              title: Text('Endereço:'),
              subtitle: Text(address),
              leading: Icon(Icons.location_on_outlined),
            ),
            Divider(
              height: 0.6,
              color: Colors.black87,
            ),
          ],
        ),
      ),
    );
  }
}
