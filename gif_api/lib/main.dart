import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gif_api/models/Gif.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // el late indica que la variable se inicializará más tarde por lo cual estara vacía al inicio
  // Future indica que la variable se inicializará en el futuro, por lo cual no
  late Future<List<Gif>> _listadoGifs;

  Future<List<Gif>> _getGifs() async {
    // aqui se almacena la lista de gifs que se creo
    final response = await http.get(
      Uri.parse(
        'https://api.giphy.com/v1/gifs/trending?api_key=E9ocbxXnqY7LMSnh8hLtV8eqIDceCKyy&tag=&rating=g',
      ),
    );
    // creamos una lista de gifs
    List<Gif> gifs = [];

    if (response.statusCode == 200) {
      // Si la respuesta es exitosa, decodificamos el JSON para cambiar el valor a utf8
      //print("\x1B[38;5;46mResponse: ${response.body}\x1B[0m");
      String body = utf8.decode(response.bodyBytes);
      // convertir el body a un mapa json
      final jsonData = json.decode(body); // lo convierte a un mapa
      // print("\x1B[38;5;46mResponse: ${jsonData["data"]}\x1B[0m"); // imprime el mapa json y como movernos

      // recorremos el mapa json y lo convertimos a una lista de gifs
      for (var item in jsonData["data"]) {
        gifs.add(
          Gif(item["title"], item["images"]["downsized"]["url"]),
        ); // agregamos el gif a la lista y se lo enviamos a la clase Gif que instanciamos el objeto
      }
      //print("\x1B[38;5;46mResponse: ${gifs}\x1B[0m");
      return gifs;
    } else {
      throw Exception("failed to load gifs");
    }
  }

  // inicializar el listado de gifs
  @override
  void initState() {
    super.initState();
    _listadoGifs = _getGifs();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "api rest",
      home: Scaffold(
        appBar: AppBar(title: const Text("API REST Example")),
        body: FutureBuilder(
          future: _listadoGifs,
          builder: (context, snapshot) {
            // snapshot es lo que devuelve listadogifs
            if (snapshot.hasData) {
              //print(snapshot.data);
              return GridView.count(
                // cambio de ListView a un gridview.count para mostrar los gifs en una cuadrícula de cuantas queremos
                crossAxisCount: 2,
                children: _listGifs(snapshot.data as List<Gif>),
              );
            } else if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
              //print("\x1B[38;5;196mError: ${snapshot.error}\x1B[0m");
            }
            return const Center(
              child: CircularProgressIndicator(),
            ); // mientras se carga el listado de gifs, muestra un indicador de carga
          },
        ),
      ),
    );
  }

  // lista de widgets
  List<Widget> _listGifs(List<Gif> data) {
    List<Widget> gifs = [];
    for (var gif in data) {
      gifs.add(
        Card(
          child: Column(
            children: [
              // el expanded permite que la imagen ocupe todo el espacio disponible
              // el fit: BoxFit.fill permite que la imagen se ajuste al tamaño del contenedor
              // el fit: BoxFit.cover permite que la imagen se ajuste al tamaño del contenedor y mantenga su aspecto
              // el fit: BoxFit.contain permite que la imagen se ajuste al tamaño del contenedor y mantenga su aspecto, pero no se recorta
              // el fit: BoxFit.fitWidth permite que la imagen se ajuste al ancho del contenedor y mantenga su aspecto
              // el fit: BoxFit.fitHeight permite que la imagen se ajuste a la altura del contenedor y mantenga su aspecto
              Expanded(child: Image.network(gif.url, fit: BoxFit.fill)),
              Text(gif.name),
              /* Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(gif.name),
              ), */
            ],
          ),
        ),
      );
    }
    return gifs;
  }
}
