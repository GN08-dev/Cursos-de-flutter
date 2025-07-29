import 'package:flutter/material.dart';
void main(){
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
    return MaterialApp(title: "Alert Dialog Example", home: DialogAlert2());
  }
}
// La clase AlertDialogDemo muestra un botón en el centro de la pantalla.
// Cuando el usuario presiona el botón (evento onPressed), se ejecuta la función showDialog.
// showDialog muestra un AlertDialog con un título, un contenido y un botón "OK".
// Al presionar "OK", se cierra el diálogo usando Navigator.of(context).pop().

class AlertDialogDemo extends StatefulWidget {
  const AlertDialogDemo({super.key});

  @override
  /// Crea y devuelve una instancia de la clase privada de estado (_AlertDialogDemoState) 
  /// asociada al StatefulWidget AlertDialogDemo. 
  /// 
  /// En Flutter, un StatefulWidget como AlertDialogDemo define la estructura inmutable del widget,
  /// mientras que la clase que hereda de State (en este caso, _AlertDialogDemoState) 
  /// contiene el estado mutable y la lógica de la interfaz.
  /// 
  /// El método createState() es sobrescrito para vincular el widget con su clase de estado correspondiente.
  /// Así, cada vez que Flutter necesita construir el widget, utiliza esta clase de estado para manejar 
  /// los cambios dinámicos y la reconstrucción de la interfaz.
  State<AlertDialogDemo> createState() => _AlertDialogDemoState();// 
}

class _AlertDialogDemoState extends State<AlertDialogDemo> {
  bool _isSubscribed = false;

  void _cambiarSuscripcion(bool nuevoEstado) {
    setState(() {
      _isSubscribed = nuevoEstado;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Alert Dialog Example")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _mostrarAlertDialog(
                  context,
                  _isSubscribed,
                  _cambiarSuscripcion,
                );
              },
              child: Text("Mostrar diálogo"),
            ),
            SizedBox(height: 20),
            Text(
              _isSubscribed ? "Suscrito" : "No Suscrito",
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}

void _mostrarAlertDialog(
  BuildContext context,
  bool isSubscribed,
  void Function(bool) onChanged,
) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Suscripción"),
        content: Text(isSubscribed
            ? "Ya estás suscrito. ¿Deseas cancelar?"
            : "¿Deseas suscribirte ahora?"),
        actions: [
          TextButton(
            onPressed: () {
              onChanged(!isSubscribed); // Invoca la función para cambiar el estado
              Navigator.of(context).pop();
            },
            child: Text(isSubscribed ? "Cancelar" : "Suscribirse"),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text("Cerrar"),
          ),
        ],
      );
    },
  );
}

// Este codigo es directamente con una clase StatefulWidget que muestra un AlertDialog cuando se presiona un botón.
// ya que aqui se maneja el estado de suscripción dentro del widget DialogAlert2. usadno el setState para actualizar la UI.
//mientras que en AlertDialogDemo no permite cambiar el estado de suscripción directamente desde el AlertDialog,
// sino que requiere una función externa para manejar el cambio de estado, lo que puede ser menos intuitivo para el usuario.
// Por lo tanto, DialogAlert2 es más adecuado para una experiencia de usuario directa y sencilla


class DialogAlert2 extends StatefulWidget {
  const DialogAlert2({super.key});

  @override
  State<DialogAlert2> createState() => _DialogAlert2State();
}

class _DialogAlert2State extends State<DialogAlert2> {
    bool _isSubscribed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dialog Alert 2")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _mostrarAlertDialog2(
                  context
                );
              },
              child: Text("Mostrar diálogo"),
            ),
            SizedBox(height: 20),
            Text(
              _isSubscribed ? "Suscrito" : "No Suscrito",
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }

  void _mostrarAlertDialog2(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Suscripción"),
          content: Text("¿Deseas suscribirte ahora?"),
          actions: [
            TextButton(
              onPressed: () {
                // Aquí puedes manejar la lógica de suscripción
                setState(() {
                  _isSubscribed = !_isSubscribed; // Cambia el estado de suscripción
                });
                Navigator.of(context).pop();
              },
              child: Text("Suscribirse"),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("Cerrar"),
            ),
          ],
        );
      },
    );
  }
}