import 'package:flutter/material.dart';

void main() => runApp(MainApp());

//se coloco stateles
class MainApp extends StatelessWidget {
  // el stateless widget es un widget que no tiene estado, es decir, no cambia durante la ejecucion de la app
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Estructura de app",
      home: Inicio(),
    ); // MaterialApp es un widget que proporciona una estructura de aplicacion material design, el titulo es el titulo de la app y el home es el widget que se muestra al iniciar la app
  }
}

// widget de inicio
class Inicio extends StatefulWidget {
  // el stateful widget es un widget que tiene estado, es decir, puede cambiar durante la ejecucion de la app
  const Inicio({
    super.key,
  }); // este constructor es el constructor del widget, se usa super.key para pasar la clave al widget padre

  @override
  State<Inicio> createState() => _InicioState(); // este metodo crea el estado del widget, es decir, crea una instancia de la clase _InicioState
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    // este metodo se llama cada vez que se reconstruye el widget
    // aqui se construye el widget, es decir, se define la estructura de la app
    return Scaffold(
      appBar: AppBar(title: const Text("este es la estructura de la app")),
      body: Center(child: Text("Contenido de la app")),
    );
  }
}
