import 'dart:math';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // variables para actualizar el estado
  double _width = 100.0;
  double _height = 100.0;
  Color _color = Colors.blue;
  BorderRadius _borderRadius = BorderRadius.circular(10);

  // forma mas limpia
  void _cambiarContainer() {
    final random = Random();
    _width = random.nextInt(350).toDouble();
    _height = random.nextInt(350).toDouble();
    _color = Color.fromRGBO(
      random.nextInt(255),
      random.nextInt(255),
      random.nextInt(255),
      1,
    );
    _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animated Container Example')),
      body: Column(
        children: [
          Expanded(
            child: Center(
              // se cambiara de container a AnimatedContainer
              child: AnimatedContainer(
                duration: Duration(
                  milliseconds: 500,
                ), // duracopm de la transicion
                curve: Curves
                    .fastOutSlowIn, // funciona para los tipos de movimientos que realizara
                width: _width,
                height: _height,
                decoration: BoxDecoration(
                  color: _color,
                  borderRadius: _borderRadius,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: ElevatedButton(
              onPressed: _cambiarContainer, // asignacion mas rapida
              child: Text("Cambiar contenedor"),
            ),
          ),
        ],
      ),
    );
  }
}
