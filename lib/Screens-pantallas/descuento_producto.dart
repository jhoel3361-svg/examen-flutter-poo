import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens-pantallas/consumo_combustible.dart';

class DescuentoProducto extends StatefulWidget {
  const DescuentoProducto({super.key});

  @override
  State<DescuentoProducto> createState() => _DescuentoProductoState();
}

class _DescuentoProductoState extends State<DescuentoProducto> {
  // CONTROLADORES
  final nombreController = TextEditingController();
  final precioController = TextEditingController();
  final descuentoController = TextEditingController();

  String resultado = '';

  // METODO PARA CALCULAR DESCUENTO
  void calcularDescuento() {
    if (nombreController.text.trim().isEmpty ||
        precioController.text.trim().isEmpty ||
        descuentoController.text.trim().isEmpty) {
      setState(() {
        resultado = 'Complete todos los campos';
      });
      return;
    }

    double? precio = double.tryParse(precioController.text);
    double? porcentaje = double.tryParse(descuentoController.text);

    if (precio == null || porcentaje == null) {
      setState(() {
        resultado = 'Ingrese valores numericos validos';
      });
      return;
    }

    if (precio <= 0) {
      setState(() {
        resultado = 'El precio debe ser mayor que cero';
      });
      return;
    }

    if (porcentaje < 0 || porcentaje > 100) {
      setState(() {
        resultado = 'El descuento debe estar entre 0 y 100';
      });
      return;
    }

    double montoDescuento = precio * porcentaje / 100;
    double precioFinal = precio - montoDescuento;

    String tipoDescuento = porcentaje >= 20
        ? 'Descuento especial'
        : 'Descuento regular';

    setState(() {
      resultado =
          'Producto: ${nombreController.text}\n'
          'Precio original: S/ ${precio.toStringAsFixed(2)}\n'
          'Monto descontado: S/ ${montoDescuento.toStringAsFixed(2)}\n'
          'Precio final: S/ ${precioFinal.toStringAsFixed(2)}\n'
          '$tipoDescuento';
    });
  }

  // LIBERAR CONTROLADORES
  @override
  void dispose() {
    nombreController.dispose();
    precioController.dispose();
    descuentoController.dispose();
    super.dispose();
  }

  // INTERFAZ
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio 3: Descuento'),
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
                labelText: 'Nombre del producto',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),

            TextField(
              controller: precioController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: 'Precio del producto (S/)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),

            TextField(
              controller: descuentoController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: 'Porcentaje de descuento (%)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: calcularDescuento,
              child: const Text('Calcular descuento'),
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
                    builder: (context) => const ConsumoCombustible(),
                  ),
                );
              },
              child: const Text('Ir al ejercicio 4'),
            ),
          ],
        ),
      ),
    );
  }
}
