import 'package:bottom_navigation_bar/pages/components/Page_Home.dart';
import 'package:bottom_navigation_bar/pages/components/page_profile.dart';
import 'package:bottom_navigation_bar/pages/components/search.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedPage = 0;

  // forma mejor para las rutas de las paginas
  final List<Widget> _pages = [PageHome(), Search(), PageProfile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text(
            "Bottom Navigation Bar Example",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      // cambiar entre paginas si solo son dos vistas
      //body: _selectedPage == 0 ? PageHome() : PageProfile(),
      body: _pages[_selectedPage],
      // Bottom Navigation Bar va despues del cuerpo del Scaffold
      bottomNavigationBar: BottomNavigationBar(
        // onTap es el evento que se dispara cuando se selecciona un elemento del BottomNavigationBar
        onTap: (index) => setState(() => _selectedPage = index),
        // currentIndex es el indice del elemento seleccionado
        currentIndex: _selectedPage, //currentIndex: 2,
        //selectedItemColor: Colors.blueAccent, para cambiar el color del icono seleccionado
        selectedIconTheme: const IconThemeData(
          color: Colors.blueAccent,
          size: 30,
        ),

        // unselectedItemColor es para los iconos no seleccionados
        unselectedIconTheme: const IconThemeData(color: Colors.grey, size: 24),
        items: const [
          // items recibe un tipo List<BottomNavigationBarItem> los cuales son los elementos del BottomNavigationBar
          // el componente bottonNavigationBarItem recibe un icono y una etiqueta
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
