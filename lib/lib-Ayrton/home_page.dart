// import 'package:flutter/material.dart';

// var scaffoldKey = GlobalKey<ScaffoldState>();

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<StatefulWidget> createState() {
//     return HomePageState();
//   }
// }

// class HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         key: scaffoldKey,
//         drawer: Drawer(
//           child: ListView(
//             padding: EdgeInsets.zero,
//             children: <Widget>[
//               DrawerHeader(
//                 decoration: BoxDecoration(
//                   color: Color(0xff499b7f),
//                 ),
//                 child: Container(
//                   child: Column(
//                     children: <Widget>[
//                       CircleAvatar(
//                           backgroundColor: Colors.grey.shade800,
//                           child: Text('Fulano'),
//                           maxRadius: 50)
//                     ],
//                   ),
//                 ),
//               ),
//               CustomListTile(Icons.home, 'Inicio', () => {}),
//               CustomListTile(Icons.person, 'Perfil', () => {}),
//               CustomListTile(Icons.graphic_eq, 'Gráficos', () => {}),
//               CustomListTile(Icons.logout, 'Logout', () => {}),
//             ],
//           ),
//         ),
//         appBar: AppBar(
//             backgroundColor: Color(0xff499b7f),
//             leading: IconButton(
//               icon: Icon(
//                 Icons.account_circle_sharp,
//                 size: 40,
//               ),
//               onPressed: () {
//                 scaffoldKey.currentState!.openDrawer();
//               },
//             ),
//             title: Text("Diário do Paciente"),
//             actions: <Widget>[
//               IconButton(
//                 icon: Icon(
//                   Icons.search,
//                   color: Colors.grey.shade700,
//                 ),
//                 onPressed: () {
//                   // do something
//                 },
//               ),
//             ]),
//         backgroundColor: Color(0xffcfe0c5),
//         body: Text(''),
//         floatingActionButton: FloatingActionButton(child: Icon(Icons.add), onPressed: () {}),
//       ),
//     );
//   }
// }

// class CustomListTile extends StatelessWidget {
//   // Cria as barras laterais
//   IconData icon;
//   String text;
//   Function onTap();

//   CustomListTile(this.icon, this.text, onTap);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
//       child: InkWell(
//         splashColor: Colors.green.shade300,
//         onTap: onTap,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//             Row(
//               children: <Widget>[
//                 Icon(icon),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text(text),
//                 ),
//               ],
//             ),
//             Icon(Icons.arrow_right),
//           ],
//         ),
//       ),
//     );
//   }
// }
