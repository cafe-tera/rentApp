//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'package:flutter/material.dart';
//--------------------------------------------------------------------------------------------------------------------


final _estado = <String, Color>{
  'green'     : Colors.green[700],
  'red'       : Colors.red[700],
  'yellow'    : Colors.yellow[700],
};


Color getEstado( String estado) {

  return  _estado[estado];

}