import 'package:flutter/material.dart';
import 'package:navegacion/pages/nav02.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Navegación", home: NavegacionPage());
  }
}
// NavegacionPage es la pantalla principal de la app.
// Aquí se muestra un botón que permite navegar a otra pantalla (Nav02) usando Navigator y MaterialPageRoute.

class NavegacionPage extends StatelessWidget {
  const NavegacionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Navegación")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("home"),
            // ElevatedButton permite al usuario navegar a la página 2.
            ElevatedButton(
              onPressed: () {
                // Navigator es una utilidad de Flutter para gestionar la navegación entre pantallas (routes).
                // push agrega una nueva pantalla a la pila de navegación.
                // MaterialPageRoute crea una transición de página con animación estilo Material Design.
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Nav02(),
                  ),
                );
              },
              child: Text("ir a la pagina 2"),
            ),
          ],
        ),
      ),
    );
  }
}
