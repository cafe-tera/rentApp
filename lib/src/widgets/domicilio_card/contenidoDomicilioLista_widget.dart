//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'package:flutter/material.dart';

// local imports
import 'package:rent_app/resources/colors.dart' as colors;
//--------------------------------------------------------------------------------------------------------------------


class ContenidoDomicilioListaWidget extends StatelessWidget{

  final dynamic item;

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
                item['Tipo'],
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
                item['Texto'],
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