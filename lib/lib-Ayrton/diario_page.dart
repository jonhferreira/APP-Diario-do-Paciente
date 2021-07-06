import 'package:diario_do_paciente/app_controller.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:intl/intl.dart' as intl;

// ignore: non_constant_identifier_names
final estados_paciente = List.generate(
    5, (_) => List.filled(1, '', growable: false),
    growable: false);

// ignore: non_constant_identifier_names
final estados_cores = List.generate(
    5, (_) => List.filled(3, '', growable: false),
    growable: false);

// ignore: non_constant_identifier_names
void define_estados() {
  // Estados
  estados_paciente[0][0] = 'horrível,';
  estados_paciente[1][0] = 'mal,';
  estados_paciente[2][0] = 'ruim,';
  estados_paciente[3][0] = 'bem,';
  estados_paciente[4][0] = 'excelente,';
  // Cor - Horrível
  estados_cores[0][0] = '139';
  estados_cores[0][1] = '0';
  estados_cores[0][2] = '0';
  // Cor - Mal
  estados_cores[1][0] = '255';
  estados_cores[1][1] = '165';
  estados_cores[1][2] = '0';
  // Cor - Ruim
  estados_cores[2][0] = '255';
  estados_cores[2][1] = '255';
  estados_cores[2][2] = '0';
  // Cor - Bem
  estados_cores[3][0] = '73';
  estados_cores[3][1] = '182';
  estados_cores[3][2] = '117';
  // Cor - Excelente
  estados_cores[4][0] = '0';
  estados_cores[4][1] = '130';
  estados_cores[4][2] = '193';

  // {('Horrível', '#8b0000'), ('Mal', '#ffa500'), ('Ruim', '#ffff00'), ('Bem', '#49b675'), ('Excelente', '#0082c1')};
}

// ignore: non_constant_identifier_names
void pop_up(BuildContext c) {
  if (lembrete) {
    lembrete = !lembrete;
    WidgetsBinding.instance!.addPostFrameCallback((_) => _showDialog(c));
  }
}

// Global
var scaffoldKey = GlobalKey<ScaffoldState>();
bool lembrete = true;
const int notas_diario = 5;

// class DiarioData {
//   DateTime date = DateTime.now();
//   String title = '';
//   DiarioData({
//     required this.date,
//     required this.title,
//   });
// }

// ignore: must_be_immutable
class CustomListTile extends StatefulWidget {
  IconData icon;
  String text;
  String route;

  CustomListTile(this.icon, this.text, this.route);

  @override
  State<StatefulWidget> createState() {
    return CustomListTileState(icon, text, route);
  }
}

class CustomListTileState extends State<CustomListTile> {
  IconData icon;
  String text;
  String route;

  CustomListTileState(this.icon, this.text, this.route);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Padding(
        padding: EdgeInsets.all(0),
        // padding: const EdgeInsets.fromLTRB(8.0, 20, 8.0, 0),
        child: InkWell(
          splashColor: Colors.green.shade300,
          onTap: () {
            Navigator.of(context).pushNamed(route);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(icon),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(text),
                  ),
                ],
              ),
              Icon(Icons.arrow_right),
            ],
          ),
        ),
      ),
    );
  }
}

class DiarioPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DiarioPageState();
  }
}

class DiarioPageState extends State<DiarioPage> {
  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    // Cria as listas de estados e cores
    define_estados();

    // Executa ao carregar a página
    pop_up(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff499b7f),
        leading: IconButton(
          icon: Icon(
            Icons.account_circle_sharp,
            size: 40,
          ),
          onPressed: () {
            scaffoldKey.currentState!.openDrawer();
          },
        ),
        title: Text("Diário do Paciente"),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Color(0xff499b7f),
            ),
            onPressed: () {
              // Abre a caixa de texto
            },
          )
        ],
      ),
      key: scaffoldKey,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xff499b7f),
              ),
              child: Container(
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Text('Usuário'),
                        maxRadius: 50)
                  ],
                ),
              ),
            ),
            CustomListTile(Icons.home, 'Inicio', '/home'),
            CustomListTile(Icons.person, 'Perfil', '/profile'),
            CustomListTile(Icons.graphic_eq, 'Gráficos', '/home'),
            CustomListTile(Icons.logout, 'Logout', '/'),
          ],
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(10),
        itemCount: notas_diario,
        addAutomaticKeepAlives: false,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            // Card(child: ListTile(title: Text('Data de hoje'))),
            color: Color.fromARGB(
                255,
                int.parse(estados_cores[index][0]),
                int.parse(estados_cores[index][1]),
                int.parse(estados_cores[index][2])),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  // Padding(padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20)),
                  ListTile(
                    contentPadding: EdgeInsets.all(10),
                    leading: Icon(Icons.favorite),
                    title: Text('Me sentindo ' + estados_paciente[index][0]),
                    subtitle: Text('Horário: ' +
                        // intl.DateFormat.d()
                        now.hour.toString() +
                        'h ' +
                        now.minute.toString() +
                        'm ' +
                        now.second.toString() +
                        's'),
                    isThreeLine: true,
                    onTap: () {},
                    // trailing: Icon(Icons.list),
                    trailing: Icon(Icons.info),
                  ),

                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [
                  //     Icon(Icons.schedule),
                  //     TextButton(
                  //       style: TextButton.styleFrom(
                  //         textStyle: TextStyle(color: Colors.white)
                  //       ),
                  //       child: Text(now.hour.toString() + ':'  + now.minute.toString() + ":" + now.second.toString()),
                  //       onPressed: () {},
                  //     ),
                  //     const SizedBox(
                  //       width: 300,
                  //     ),
                  //     TextButton(
                  //       style: TextButton.styleFrom(
                  //         textStyle: TextStyle(color: Colors.white)
                  //       ),
                  //       child: Text('EDITAR'),
                  //       onPressed: () {},
                  //     ),
                  //   ],
                  // ),
                ]),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff499b7f),
        onTap: (value) {
          switch (value) {
            case 0:
              Navigator.of(context).pushNamed('/home');
              break;

            case 1:
              Navigator.of(context).pushNamed('/profile');
              break;

            case 2:
              Navigator.of(context).pushNamed('/home');
              break;

            case 3:
              showLogout(context);
              break;

            default:
              Navigator.of(context).pushNamed('/home');
              break;
          }
        },
        selectedItemColor: Color(0xff0b2102),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white),
            // ignore: deprecated_member_use
            title: Text("Início", style: TextStyle(color: Colors.white)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.white),
            // ignore: deprecated_member_use
            title: Text("Perfil", style: TextStyle(color: Colors.white)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.graphic_eq, color: Colors.white),
            // ignore: deprecated_member_use
            title: Text("Gráficos", style: TextStyle(color: Colors.white)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout, color: Colors.white),
            // ignore: deprecated_member_use
            title: Text("Logout", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xffcfe0c5),
        child: Image.network('https://i.ibb.co/Ht7TQ2w/Icone-Add2.png'),
        // Icon(Icons.add),
        onPressed: () {
          // Criar novo card
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => AdicionarCard(),
              fullscreenDialog: true,
            )
          );
        },
      ),
    );
  }
}

// Mostra o popup confirmando o logout da barra inferior
void showLogout(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout'),
          content: Text('Deseja fazer o logout?'),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('Continuar'),
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/');
              },
            ),
          ],
        );
      });
}

// Mostra o popup com a avaliação diária
void _showDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Como você está se sentindo hoje?"),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 60),
            IconButton(
              icon: Image.network('https://i.ibb.co/VgGKSy4/semdor.png'),
              // Image(image: AssetImage('assets/images/excelente.png')),
              iconSize: 30,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            SizedBox(width: 25),
            IconButton(
              icon: Image.network('https://i.ibb.co/j6JgBDq/suave.png'),
              // Image.asset('assets/images/bem.png'),
              iconSize: 30,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            SizedBox(width: 25),
            IconButton(
              icon: Image.network('https://i.ibb.co/6HStkft/moderado.png'),
              // Image.asset('assets/images/mal.png'),
              iconSize: 30,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            SizedBox(width: 25),
            IconButton(
              icon: Image.network('https://i.ibb.co/8B3RZPp/dolorido.png'),
              // Image.asset('assets/images/ruim.png'),
              iconSize: 30,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            SizedBox(width: 25),
            IconButton(
              icon: Image.network('https://i.ibb.co/TYPZFWG/muitador.png'),
              // Image.asset('assets/images/horrível.png'),
              iconSize: 30,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            // SizedBox(height: 200),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Image.network('https://i.ibb.co/PC1yp33/barra-Status.png',
            //       width: 350,
            //       height: 200,
            //     ),
            //   ],
            // ),
          ],
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 30),
        actions: <Widget>[
          // ignore: deprecated_member_use
          FlatButton(
              child: Text('Agora não'),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ],
        actionsPadding: EdgeInsets.zero,
        elevation: 0,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      );
    },
    barrierDismissible: true,
  );
}
