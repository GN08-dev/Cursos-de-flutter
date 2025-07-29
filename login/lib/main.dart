import 'package:flutter/material.dart';

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
    return MaterialApp(title: "Login App", home: Login());
  }
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Cuerpo(context)); // se le pasa el contexto al widget Cuerpo para poder usarlo en el boton de login
  }
}

/// Crea un widget personalizado que representa el cuerpo de la pantalla de login.
///
/// Este widget retorna un [Container] que contiene un texto de saludo.
/// Los widgets en Flutter son los bloques de construcción fundamentales de la interfaz de usuario.
/// Permiten componer interfaces complejas a partir de componentes reutilizables y personalizables.
/// En este caso, el widget `Cuerpo` puede ser utilizado en cualquier parte de la aplicación
/// donde se requiera mostrar el mensaje de bienvenida en la pantalla de inicio de sesión.

// ignore: non_constant_identifier_names
Widget Cuerpo(BuildContext context) { // se le paso el contexto para poder usarlo en el boton de login
  // este widget es el cuerpo de la pantalla de login el widget funciona como un contenedor
  // ignore: avoid_unnecessary_containers
  return Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: NetworkImage(
          "https://s0.smartresize.com/wallpaper/400/885/HD-wallpaper-8-bit-moonlight-8bit-arcade-blue-cloud-moon-pixel.jpg",
        ),
        fit: BoxFit.cover,
      ),
    ),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          nombre(),
          usuario(),
          contrasena(),
          SizedBox(height: 20,),
          botonLogin(context),
        ],
      ),
    ),
  );
}

// Estilo de texto para el título en blanco y negrita
// Este estilo se utiliza para mostrar el título de la pantalla de inicio de sesión
// se le llama a través del widget `nombre` para mostrar el texto "Sing in" en la pantalla.
const TextStyle tituloBlancoNegrita = TextStyle(
  color: Colors.white,
  fontSize: 30,
  fontWeight: FontWeight.bold,
);
// input para un field de texto con decoración sin personalizar
const InputDecoration camposField = InputDecoration(
  hintText: "usuario",
  fillColor: Colors.white,
  filled: true
);
/// Crea una función que retorna una decoración personalizada para campos de texto.
/// 
/// [hint] es el texto que se mostrará como sugerencia dentro del campo.
/// Esta función permite reutilizar el mismo estilo de decoración para diferentes campos,
/// simplemente cambiando el texto de sugerencia (hint).
InputDecoration customField(String hint) => InputDecoration(
  hintText: hint, // Texto de sugerencia que aparece cuando el campo está vacío
  fillColor: Colors.white, // Color de fondo del campo de texto
  filled: true, // Indica que el campo debe estar rellenado con el color especificado
);

// widget para devolver nombre
Widget nombre() {
  return const Text("Sing in", style: tituloBlancoNegrita);
}

Widget usuario() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 35, vertical: 5),
    child: TextField(
      decoration: customField("usuario"),
    ),
  );
}

Widget contrasena(){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 35, vertical: 5),
    child: TextField(
      obscureText: true, // Oculta el texto ingresado para contraseñas
      decoration: customField("contraseña"),
    ),
  );
}
Widget botonLogin(BuildContext context) { // solicitamos el contexto para poder usarlo en el dialogo de login
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.blue, // Color de fondo del botón
      foregroundColor: Colors.white, // Color del texto del botón
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10), // Espaciado interno del botón
    ),
    onPressed: (){}, 
    child: const Text("Login")
  
  );
}