//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'package:flutter/material.dart';

// local imports
import 'package:rent_app/src/widgets/appbar_widget.dart';
import 'package:rent_app/resources/colors.dart' as colors;
//--------------------------------------------------------------------------------------------------------------------


class TiendaPage extends StatelessWidget {
  const TiendaPage({ Key key,}) : super(key: key);
  static final String routeName = 'tienda';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: Text('Tienda Page'),
      ),
      body: Container(
        color: Color(colors.azulGeneral),
        child: Center(
          child: Text(
            'Esta vista aun no ha sido implementada :C',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}