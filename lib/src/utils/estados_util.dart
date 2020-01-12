//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'package:flutter/material.dart';
//--------------------------------------------------------------------------------------------------------------------


final _estado = <String, Color>{
  'green'     : Colors.green,
  'red'       : Colors.red,
  'yellow'    : Colors.yellow,
};


Color getEstado( String estado) {

  return  _estado[estado];

}