import 'package:flutter/material.dart';
import './screens/home_screen.dart';

void main() {
  return runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Monitores",
    home: MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: const HomeScreen(),
    );
  }
}
