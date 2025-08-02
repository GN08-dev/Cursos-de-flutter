import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Clases con flutter", home: Home());
  }
}

// se usa el stateful widget para poder manejar el estado de la aplicacion ya que se actualiza el estado de la aplicacion
// y se vuelve a renderizar la pantalla
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // es buena practica crear una clase para representar una entidad la cual tambien se coloca el _ para indicar que es privada
  final Empresa _facebook = Empresa("checo peres","",18); // se hace instancia de la clase Empresa

  // tambien se puede usar los textos para representar una entidad en este caso una nueva clase como  el de bienvenido
  final Text _bienvenido = Text(
    "Bienvenido a clases con flutter",
  ); // se usa lo que es un new o un const para crear un nuevo objeto de tipo Text

  // forma de recibir datos como parametros en el constructor de la clase
  Widget _bienvenido2(String texto) {
    return Text(texto); // se retorna un widget de tipo Text
  }

  @override
  void initState() {
    super.initState();
    // aqui se puede inicializar la clase Empresa y sus propiedades

    // ignore: avoid_print
    print('\x1B[92m${_facebook.nombre}\x1B[0m');   
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("clases con flutter")),
      body: Center(
        child:
            //Text("Bienvenido a clases con flutter")
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _bienvenido,
                _bienvenido2(
                  "Bienvenido a clases con flutter",
                ), // se usa el metodo que retorna un widget de tipo Text
                _bienvenido2(_facebook.nombre), // se usa el metodo que retorna un widget de tipo Text con el nombre de la empresa
                _bienvenido2(_facebook.ingresos.toString())
              ],
            ), // se usa la variable que contiene el texto
      ),
    );
  }
}

class Empresa {
  // el this se usa para referirse a las propiedades de la clase
  String nombre;
  String propietario;
  int ingresos;
  // constructor de la clase Empresa
  /* Empresa(String nombre, String propietario, int ingresos): 
        this.nombre = nombre,
        this.propietario = propietario,
        this.ingresos = ingresos; */
  
  // forma mas limpia de crear un constructor
    Empresa(this.nombre, this.propietario, this.ingresos);
}


