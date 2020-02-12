//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'package:flutter/material.dart';

// local imports
import 'package:rent_app/resources/colors.dart' as colors;
import 'package:rent_app/src/models/domicilio_model.dart';
//--------------------------------------------------------------------------------------------------------------------


class ContenidoDomicilioListaWidget extends StatelessWidget{

  final Domicilio item;

  ContenidoDomicilioListaWidget({
    Key key,
    @required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Container(
              alignment: Alignment.topLeft,
              child: Text(
                item.tipo,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                )
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Container(
              alignment: Alignment.topLeft,
              child: Text(
                item.texto,
                style: TextStyle(
                  fontSize: 12,
                  color: Color(
                    colors.textoDomInfo
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Divider(),
          ),
        ],
      ),
    );
  }
}