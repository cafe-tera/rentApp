//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'package:flutter/material.dart';

// local imports
import 'package:rent_app/src/pages/buscar_domicilios_page.dart';
import 'package:rent_app/src/pages/chat_page.dart';
import 'package:rent_app/src/pages/contactos_page.dart';
import 'package:rent_app/src/pages/mapa_page.dart';
import 'package:rent_app/src/pages/mis_domicilios_page.dart';
//--------------------------------------------------------------------------------------------------------------------


//----------------------------------------------------------------------------
//      Clase para manejar los elementos del bottom navigation bar
//----------------------------------------------------------------------------
class Destination {
  const Destination(this.index,this.title, this.icon);
  final int index;
  final String title;
  final IconData icon;
  final Color color = Colors.indigo;
}

const List<Destination> allDestinations = <Destination>[
  Destination(0, 'Contactos', Icons.contacts),
  Destination(1, 'Chat', Icons.message),
  Destination(2, 'Mis Domicilios', Icons.home),
  Destination(3, 'Buscar', Icons.find_in_page),
  Destination(4, 'Mapa', Icons.location_on)
];


//----------------------------------------------------------------------------
//      Todas las paginas del bottom menu pertenecen al home
//----------------------------------------------------------------------------
class HomePage extends StatefulWidget {
 static final String routeName = 'homePage';
 @override
 State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<HomePage> {

int _currentIndex = 2;
final List<Widget> _children = [
  ContactosPage(),
  ChatPage(),
  MisDomiciliosPage(),
  BuscarDomiciliosPage(),
  MapaPage(),
];

 @override
 Widget build(BuildContext context) {
   return Scaffold(
     body: _children[_currentIndex],
     bottomNavigationBar: BottomNavigationBar(
       onTap: onTabTapped,
       currentIndex: _currentIndex, // this will be set when a new tab is tapped
       items: allDestinations.map((Destination destination) {
          return BottomNavigationBarItem(
            icon: Icon(destination.icon),
            backgroundColor: destination.color,
            title: Text(destination.title)
          );
        }).toList(),
     ),
   );
 }

 void onTabTapped(int index) {
   setState(() {
     _currentIndex = index;
   });
 }
}