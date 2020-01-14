//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'package:flutter/material.dart';
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