//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'package:flutter/material.dart';

// local imports
import 'package:rent_app/resources/colors.dart' as colors;
//--------------------------------------------------------------------------------------------------------------------


final _estado = <String, Color>{
  'green'     : Color(colors.estadoVerde),
  'red'       : Color(colors.estadoRojo),
  'yellow'    : Color(colors.estadoAmarillo),
};


Color getEstado( String estado) {

  return  _estado[estado];

}