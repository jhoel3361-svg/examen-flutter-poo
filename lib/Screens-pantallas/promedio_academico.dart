import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens-pantallas/pago_trabajador.dart';

class PromedioAcademico extends StatefulWidget {
  const PromedioAcademico({super.key});

  @override
  State<PromedioAcademico> createState() => _PromedioAcademicoState();
}

class _PromedioAcademicoState extends State<PromedioAcademico> {
  // CONTROLADORES
  final nombreController = TextEditingController();
  final nota1Controller = TextEditingController();
  final nota2Controller = TextEditingController();
  final nota3Controller = TextEditingController();

  String resultado = '';

  // METODO PARA CALCULAR PROMEDIO
  void calcularPromedio() {
    if (nombreController.text.trim().isEmpty ||
        nota1Controller.text.trim().isEmpty ||
        nota2Controller.text.trim().isEmpty ||
        nota3Controller.text.trim().isEmpty) {
      setState(() {
        resultado = 'Complete todos los campos';
      });
      return;
    }

    double? nota1 = double.tryParse(nota1Controller.text);
    double? nota2 = double.tryParse(nota2Controller.text);
    double? nota3 = double.tryParse(nota3Controller.text);

    if (nota1 == null || nota2 == null || nota3 == null) {
      setState(() {
        resultado = 'Ingrese notas validas';
      });
      return;
    }

    if (nota1 < 0 ||
        nota1 > 20 ||
        nota2 < 0 ||
        nota2 > 20 ||
        nota3 < 0 ||
        nota3 > 20) {
      setState(() {
        resultado = 'Las notas deben estar entre 0 y 20';
      });
      return;
    }

    double promedio = (nota1 + nota2 + nota3) / 3;

    setState(() {
      resultado =
          'Estudiante: ${nombreController.text}\n'
          'Promedio: ${promedio.toStringAsFixed(2)}\n'
          '${promedio >= 13 ? "APROBADO" : "DESAPROBADO"}';
    });
  }

  // LIBERAR CONTROLADORES
  @override
  void dispose() {
    nombreController.dispose();
    nota1Controller.dispose();
    nota2Controller.dispose();
    nota3Controller.dispose();
    super.dispose();
  }

  // INTERFAZ
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio 1: Promedio Academico'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nombreController,
              decoration: const InputDecoration(
                labelText: 'Nombre del estudiante',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),

            TextField(
              controller: nota1Controller,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: 'Nota 1',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),

            TextField(
              controller: nota2Controller,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: 'Nota 2',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),

            TextField(
              controller: nota3Controller,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: 'Nota 3',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: calcularPromedio,
              child: const Text('Calcular promedio'),
            ),

            const SizedBox(height: 20),

            Text(
              resultado,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 25),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PagoTrabajador(),
                  ),
                );
              },
              child: const Text('Ir al ejercicio 2'),
            ),
          ],
        ),
      ),
    );
  }
}
