//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'package:flutter/material.dart';
import 'package:rent_app/src/models/domicilio_model.dart';

// local imports
import 'package:rent_app/src/utils/estados_util.dart';
//--------------------------------------------------------------------------------------------------------------------


class EstadoDomicilioWidget extends StatelessWidget{

  final Domicilio item;

  EstadoDomicilioWidget({
    Key key,
    @required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.0),
        color: getEstado(item.estado),
      ),
    );
  }

}