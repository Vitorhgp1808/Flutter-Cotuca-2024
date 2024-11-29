import 'package:flutter/material.dart';
import 'package:flutter_aplication_routes/tela_principal.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'doguinhos',
      routes:{
        'doguinhos': (context) => Doguinhos(),
        'dogYork' : (context) => York(),
        'dogMaltes' : (context) => Maltes(),
      }
    );
  }
}
