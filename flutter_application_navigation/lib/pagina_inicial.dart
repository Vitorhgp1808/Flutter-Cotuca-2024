import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PaginaInicial extends StatelessWidget {

  @override
  Widget build(BuildContext context) { 
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Digite seu nome",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blue
            ),
            ),
            SizedBox(height: 30),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nome',
                hintText: 'Digite seu nome',
                 
              ),
            ),
          ],
        ),
      ),
    );
  }
}
