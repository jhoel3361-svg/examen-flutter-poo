import 'package:flutter/material.dart';

import 'Screens-pantallas/promedio_academico.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Practica POO',
      home: PromedioAcademico(),
    );
  }
}
