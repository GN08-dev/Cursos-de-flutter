import 'package:flutter/material.dart';

class Nav02 extends StatelessWidget {
  const Nav02({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Navegación")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Página 2")],
        ),
      ),
    );
  }
}