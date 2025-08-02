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
    return MaterialApp(title: "Listas App", home: Home());
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Personas> _people = [ // lista de todos los arreglos 
    // se coloca el tipo de dato que se va a manejar en este caso de la clase Personas
    Personas("John", "Doe", "123456789"),
    Personas("Jane", "Smith", "987654321"),
    Personas("Alice", "Johnson", "555555555"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Listas App")),
      body: Column(
        children: [
          Flexible(
            //fit: FlexFit.loose, // Permite que el ListView ocupe el espacio restante
            fit: FlexFit
                .tight, // Permite que el ListView ocupe todo el espacio disponible
            child: Container(
              color: Colors.blueGrey,
              child: ListView.builder(
                // el list view
                itemCount: _people
                    .length, // Asegúra que solo mostrara la cantidad de personas que hay en la lista
                // el item count es la cantidad de personas que hay en la lista
                itemBuilder: (context, index) {
                  return Text(
                    "${_people[index].name} ${_people[index].lastName} ${_people[index].phone}",
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: Container(
              //color: Colors.green
              color: Colors.white,
              child: ListView.builder(
                itemCount: _people.length, // Asegúrate de agregar esto
                itemBuilder: (context, index) => ListTile(
                  // evento para hacer click en el item de la lista
                  onTap: () => this._borrarPersona(context, _people[index]),
                  title: Text(
                    "${_people[index].name}  ${_people[index].lastName}",
                  ),
                  subtitle: Text(_people[index].phone),
                  leading: CircleAvatar(
                    // leading sirve para colocar un icono o imagen al inicio de la lista
                    backgroundColor: Colors
                        .blue, // backgroundColor es el color de fondo del CircleAvatar
                    foregroundColor: Colors
                        .white, // foregroundColor es el color del texto dentro del CircleAvatar
                    radius: 20, // radius es el radio del CircleAvatar
                    child: Text(
                      _people[index].name[0],
                    ), // Muestra la primera letra del nombre en el CircleAvatar se puede ocupar substring para mostrar mas letras funciona igual
                    // ejemplo: _people[index].name.substring(0, 2) para mostrar las dos primeras letras
                  ),

                  // trailing: Icon(Icons.arrow_forward), // trailing sirve para colocar un icono al final de la lista
                  trailing: Icon(
                    Icons.arrow_forward,
                    color: Colors.black,
                  ), // Trailing es el icono que se muestra al final de cada elemento de la lista,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // funcion borrar persona  con setState
  // ignore: unused_element
  void _deletePerson(int index) {
    setState(() {
      _people.removeAt(index);
    });
  }

  // funcion para mostrar un dialogo de confirmacion para eliminar una persona y usamos la instancia de la clase Personas para mostrar el nombre de la persona a eliminar
  // tambien se puede ocupar el nombre directamente en el dialogo sin necesidad de crear una instancia de la clase Personas
  // es decir no es necesario mandarala allamar
  _borrarPersona(context, Personas persona) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Eliminar persona"),
        content: Text(
          "¿Estás seguro de que quieres eliminar a ${persona.name}?",
        ),
        actions: [
          // Botón para cancelar la eliminación
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancelar"),
          ),
          // Botón para confirmar la eliminación
          TextButton(
            onPressed: () {
              print('\x1B[92m${persona.name} ${persona.lastName}\x1B[0m');
              setState(() { // SIEMPRE SE DEBE ACTUALIZAR EL ESTADO PARA EVITAR ERRORES
                _people.remove(persona); // Elimina la persona de la lista, se puede colocar el this para refirirse a la isntancia pero es mejor sin colocar this
              });
              Navigator.pop(context);
            },
            child: Text("Eliminar"),
          ),
        ],
      ),
    );
  }
}

class Personas {
  String name;
  String lastName;
  String phone;

  // Constructor
  Personas(this.name, this.lastName, this.phone);
}
