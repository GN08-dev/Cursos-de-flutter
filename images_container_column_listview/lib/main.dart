import 'package:flutter/material.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Imagenes contenedores columnas y listview",
      home: Inicio(),
    );
  }
}

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Imagenes contenedores columnas y listview"),
      ),
      body: ListView(
        //Column( se quita para usar ListView) ya que ListView permite desplazamiento. y column no.
        // Lista de widgets que serán los hijos de la columna.
        // Aquí se agregan los widgets que se mostrarán en la interfaz dentro de la columna.
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: Image.network(
              "https://media.craiyon.com/2025-04-13/O9h1GxeUSM6laggfqPVNUA.webp",
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Image.network(
              "https://media.craiyon.com/2025-04-13/O9h1GxeUSM6laggfqPVNUA.webp",
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Image.network(
              "https://media.craiyon.com/2025-04-13/O9h1GxeUSM6laggfqPVNUA.webp",
            ),
          ),
        ],
      ),
    );
  }
}
