import 'dart:typed_data'; // para manejar los bytes de la imagen
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;

void main() {
  runApp(MyApp());
}

// url https://cataas.com/cat/hello
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "api rest", home: Home());
  }
}
// vista home
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // variables para manejar el estado de la imagen cargada directamente
  Uint8List? _imageBytes; // aquí se almacenan los bytes de la primera imagen
  bool _isLoading = true; // para saber si se está cargando la imagen 1

  // imagen 2 usando Future
  late Future<Uint8List> _imageBytesFuture; // aquí se guardará el futuro para la segunda imagen

  // función para obtener imagen de forma directa y guardar en memoria
  Future<void> getDataDirecta() async {
    final response = await http.get(
      Uri.parse("https://cataas.com/cat/hello"), // imagen 1
    );

    if (response.statusCode == 200) {
      setState(() {
        _imageBytes = response.bodyBytes;
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
      throw Exception('Failed to load image');
    }
  }

  // función que retorna directamente un Future<Uint8List>
  Future<Uint8List> getDataFuture() async {
    final response = await http.get(
      Uri.parse("https://cataas.com/cat/cute"), // imagen 2
    );

    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      throw Exception('Failed to load future image');
    }
  }

  @override
  void initState() {
    super.initState();
    getDataDirecta(); // imagen 1
    _imageBytesFuture = getDataFuture(); // imagen 2 con FutureBuilder
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Text("Imagen cargada directamente (con setState):"),
            const SizedBox(height: 10),
            _isLoading
                ? const CircularProgressIndicator()
                : _imageBytes != null
                    ? Image.memory(_imageBytes!)
                    : const Text("No se pudo cargar la imagen 1"),

            const SizedBox(height: 30),
            const Divider(),
            const SizedBox(height: 30),

            const Text("Imagen cargada con FutureBuilder:"),
            const SizedBox(height: 10),
            FutureBuilder<Uint8List>(
              future: _imageBytesFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return const Text("No se pudo cargar la imagen 2");
                } else if (snapshot.hasData) {
                  return Image.memory(snapshot.data!);
                } else {
                  return const Text("Sin datos");
                }
              },
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
