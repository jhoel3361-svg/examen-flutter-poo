import 'package:flutter/material.dart';

class ScreenBasico3 extends StatelessWidget {
  const ScreenBasico3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(width: 80, height: 80, color: Colors.red),
            const SizedBox(width: 10),
            Container(width: 80, height: 80, color: Colors.blue),
            const SizedBox(width: 10),
            Container(width: 80, height: 80, color: Colors.green),
          ],
        ),
      ),
    );
  }
}
