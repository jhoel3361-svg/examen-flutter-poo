import 'package:flutter/material.dart';

class ConsumoCombustible extends StatefulWidget {
  const ConsumoCombustible({super.key});

  @override
  State<ConsumoCombustible> createState() => _ConsumoCombustibleState();
}

class _ConsumoCombustibleState extends State<ConsumoCombustible> {
  // CONTROLADORES
  final marcaController = TextEditingController();
  final distanciaController = TextEditingController();
  final litrosController = TextEditingController();

  String resultado = '';

  // METODO PARA CALCULAR CONSUMO
  void calcularConsumo() {
    if (marcaController.text.trim().isEmpty ||
        distanciaController.text.trim().isEmpty ||
        litrosController.text.trim().isEmpty) {
      setState(() {
        resultado = 'Complete todos los campos';
      });
      return;
    }

    double? distancia = double.tryParse(distanciaController.text);
    double? litros = double.tryParse(litrosController.text);

    if (distancia == null || litros == null) {
      setState(() {
        resultado = 'Ingrese valores numericos validos';
      });
      return;
    }

    if (distancia <= 0 || litros <= 0) {
      setState(() {
        resultado = 'La distancia y los litros deben ser mayores que cero';
      });
      return;
    }

    double rendimiento = distancia / litros;

    String estado = rendimiento >= 15 ? 'Buen rendimiento' : 'Rendimiento bajo';

    setState(() {
      resultado =
          'Vehiculo: ${marcaController.text}\n'
          'Distancia: ${distancia.toStringAsFixed(2)} km\n'
          'Combustible: ${litros.toStringAsFixed(2)} litros\n'
          'Rendimiento: ${rendimiento.toStringAsFixed(2)} km/l\n'
          '$estado';
    });
  }

  // LIBERAR CONTROLADORES
  @override
  void dispose() {
    marcaController.dispose();
    distanciaController.dispose();
    litrosController.dispose();
    super.dispose();
  }

  // INTERFAZ
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio 4: Consumo de combustible'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: marcaController,
              decoration: const InputDecoration(
                labelText: 'Marca del vehiculo',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),

            TextField(
              controller: distanciaController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: 'Distancia recorrida (km)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),

            TextField(
              controller: litrosController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: 'Combustible utilizado (litros)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: calcularConsumo,
              child: const Text('Calcular consumo'),
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
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: const Text('Volver al inicio'),
            ),
          ],
        ),
      ),
    );
  }
}
