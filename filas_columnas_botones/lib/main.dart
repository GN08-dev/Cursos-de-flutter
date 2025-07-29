
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Filas, Columnas y Botones", home: Botones());
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Filas, Columnas y Botones")),
      body: Column(
        // se puede cambiar por Row para hacer una fila
        mainAxisAlignment: MainAxisAlignment.center, // alinear en el centro en el eje principal
        crossAxisAlignment: CrossAxisAlignment.center, // alinear en el centro en el eje transversal
        mainAxisSize: MainAxisSize.max, // ocupar el maximo espacio posible cambienado a max el contenido se centrará en el centro de la pantalla
        // se puede cambiar por MainAxisSize.min para ocupar el minimo espacio posible
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width, // El ancho es igual al ancho de la pantalla si quiero que mida la mitad se agregara * 0.5 al width
            // MediaQuery.of(context).size.width * 0.5, // Ancho de la pantalla dividido por 2
            color: Colors.red,
            height: 50,
            // El widget Center centra su hijo (el texto) tanto vertical como horizontalmente dentro del contenedor
            child: Text(
              "Contenedor 1",
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          Text("hola 03"),
        ],
      ),
    );
  }
}

// Widget Columns es un StatefulWidget que muestra una columna con dos elementos
class Columns extends StatefulWidget {
  const Columns({super.key});

  @override
  State<Columns> createState() => _ColumnsState();
}

class _ColumnsState extends State<Columns> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Columnas")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment
            .center, // Centra los hijos verticalmente en la columna se puede cambiar por start, end, spaceBetween, spaceAround, spaceEvenly
        // cada una de estas opciones alinea los hijos de manera diferente start los alinea al inicio, end los alinea al final, spaceBetween los separa con espacio entre ellos,
        //spaceAround los separa con espacio alrededor de cada uno y spaceEvenly los separa con el mismo espacio entre todos
        children: <Widget>[
          // Primer contenedor ocupa todo el ancho de la pantalla
          Container(
            width: MediaQuery.of(
              context,
            ).size.width, // El ancho es igual al ancho de la pantalla
            color: Colors.red,
            height: 50,
            // El widget Center centra su hijo (el texto) tanto vertical como horizontalmente dentro del contenedor
            child: Text(
              "Contenedor 1",
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),

          // Segundo elemento es solo un texto con color verde
          Text("Contenedor 2", style: TextStyle(color: Colors.green)),
        ],
      ),
    );
  }
}

/*
Explicación:
El texto "Contenedor 1" se centra dentro del contenedor rojo porque está envuelto en un widget Center.
El widget Center toma todo el espacio disponible dentro del contenedor y coloca su hijo (el texto) en el centro,
tanto vertical como horizontalmente. Además, como el contenedor tiene un ancho igual al de la pantalla,
el texto se ve perfectamente centrado en el área roja.
*/

class Botones extends StatelessWidget {
  const Botones({super.key});
  // Se puede crear un estilo de botón reutilizable
  static final ButtonStyle buttonTextStyle = TextButton.styleFrom(
    foregroundColor: Colors.white,
    backgroundColor: Colors.blue,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  );

  static final ButtonStyle outlinedButtonStyle = OutlinedButton.styleFrom(
    foregroundColor: Colors.blue,
    side: const BorderSide(color: Colors.blue, width: 2),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  );
  static final ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
    foregroundColor: Colors.white,
    backgroundColor: Colors.blue,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Botones")),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              // antes era RaisedButton pero este está obsoleto
              onPressed: () {
                var t = DateTime.now();
                // ANSI escape code for red: \x1B[31m, reset: \x1B[0m
                print("\x1B[31mBotón 1 presionado a las: $t\x1B[0m");
              },
              // para colocar estilos colores y bordes al botón se puede usar el estilo de ElevatedButton.styleFrom o ElevatedButtonThemeData
              style: buttonTextStyle,
              child: const Text("Botón 1"),
            ),
            TextButton(
              onPressed: () {},
              style: elevatedButtonStyle,
              child: const Text("Botón 2"),
            ),
            OutlinedButton(
              onPressed: () {},
              style: outlinedButtonStyle,
              child: const Text("Botón 3"),
            ),
            ElevatedButton(
              onPressed: () {
                 var t = DateTime.now();
                // ANSI escape code for red: \x1B[31m, reset: \x1B[0m
                print("\x1B[31mBotón 1 presionado a las: $t\x1B[0m");
              },
              style: elevatedButtonStyle,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.access_time),
                 // Spacer(), // Espacio flexible entre el icono y el texto pero ocupa todo el espacio disponible del ancho asi que ignorara si tienes un mainAxisSize.min
                  const SizedBox(width: 8), // Espacio fijo de 8 píxeles
                  Text("hora")
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
