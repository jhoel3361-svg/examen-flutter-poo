import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens-pantallas/descuento_producto.dart';

class PagoTrabajador extends StatefulWidget {
  const PagoTrabajador({super.key});

  @override
  State<PagoTrabajador> createState() => _PagoTrabajadorState();
}

class _PagoTrabajadorState extends State<PagoTrabajador> {
  // CONTROLADORES
  final nombreController = TextEditingController();
  final horasController = TextEditingController();
  final pagoController = TextEditingController();

  String resultado = '';

  // METODO PARA CALCULAR SUELDO
  void calcularSueldo() {
    if (nombreController.text.trim().isEmpty ||
        horasController.text.trim().isEmpty ||
        pagoController.text.trim().isEmpty) {
      setState(() {
        resultado = 'Complete todos los campos';
      });
      return;
    }

    double? horas = double.tryParse(horasController.text);
    double? pagoHora = double.tryParse(pagoController.text);

    if (horas == null || pagoHora == null) {
      setState(() {
        resultado = 'Ingrese valores numericos validos';
      });
      return;
    }

    if (horas < 0 || pagoHora < 0) {
      setState(() {
        resultado = 'No se permiten valores negativos';
      });
      return;
    }

    double sueldo;

    if (horas <= 48) {
      sueldo = horas * pagoHora;
    } else {
      double horasExtras = horas - 48;

      sueldo = (48 * pagoHora) + (horasExtras * pagoHora * 1.5);
    }

    setState(() {
      resultado =
          'Trabajador: ${nombreController.text}\n'
          'Sueldo total: S/ ${sueldo.toStringAsFixed(2)}';
    });
  }

  // LIBERAR CONTROLADORES
  @override
  void dispose() {
    nombreController.dispose();
    horasController.dispose();
    pagoController.dispose();
    super.dispose();
  }

  // INTERFAZ
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio 2: Pago del trabajador'),
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
                labelText: 'Nombre del trabajador',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),

            TextField(
              controller: horasController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: 'Horas trabajadas',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),

            TextField(
              controller: pagoController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: 'Pago por hora (S/)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: calcularSueldo,
              child: const Text('Calcular sueldo'),
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
                    builder: (context) => const DescuentoProducto(),
                  ),
                );
              },
              child: const Text('Ir al ejercicio 3'),
            ),
          ],
        ),
      ),
    );
  }
}
