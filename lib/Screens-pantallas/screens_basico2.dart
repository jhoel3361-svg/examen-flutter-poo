import 'package:flutter/material.dart';

class ScreenBasico2 extends StatelessWidget {
  const ScreenBasico2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(width: 200, height: 80, color: Colors.red),

            const SizedBox(height: 15),

            Container(width: 200, height: 80, color: Colors.blue),

            const SizedBox(height: 15),

            Container(width: 200, height: 80, color: Colors.yellow),
          ],
        ),
      ),
    );
  }
}
