// import 'package:diario_do_paciente/diario_page.dart';
import 'package:diario_do_paciente/app_controller.dart';
import 'package:diario_do_paciente/profile_page.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';
import 'cadastro_page.dart';
import 'diario_page.dart';
import 'profile_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AppController.instance,
      builder: (context, child) {
        return MaterialApp(
          title: 'SaúDD - Diário do Paciente',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            brightness: AppController.instance.dartTheme 
              ? Brightness.dark
              : Brightness.light,
          ),

          // Routes
          // home: LoginPage(build(context)),
          initialRoute: '/',
          routes: {
            '/': (context) => LoginPage(build(context)),
            '/cadastro': (context) => CadastroPage(),
            '/home': (context) => DiarioPage(),
            '/profile': (context) => ProfilePage(),
          },
        );
      }
    );
  }
}
