import 'package:flutter/material.dart';
import 'src/registro_de_jugadores.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Preguntas y Respuestas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PlayerRegistrationScreen(), // Pantalla inicial de registro
    );
  }
}
