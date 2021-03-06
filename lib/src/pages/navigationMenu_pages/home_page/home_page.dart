//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'package:flutter/material.dart';

// local imports
import 'package:rent_app/src/pages/navigationMenu_pages/buscar_pages/buscar_page.dart';
import 'package:rent_app/src/pages/navigationMenu_pages/chat_page.dart';
import 'package:rent_app/src/pages/navigationMenu_pages/mapa_pages/mapa_page.dart';
import 'package:rent_app/src/pages/navigationMenu_pages/mis_domicilios/mis_domicilios_page.dart';
import 'package:rent_app/src/utils/destination_util.dart';
import 'package:rent_app/resources/colors.dart' as colors;
//--------------------------------------------------------------------------------------------------------------------

class HomePage extends StatefulWidget {
  static final String routeName = 'homePage';
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<HomePage> {

  int _currentIndex = 0;
  final List<Widget> _children = [
    MapaPage(),
    MisDomiciliosPage(),
    BuscarPage(),
    ChatPage(),
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
            backgroundColor: Color(colors.azulGeneral),
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