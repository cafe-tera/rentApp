//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'package:flutter/material.dart';

// local imports
import 'package:rent_app/src/widgets/appbar_widget.dart';
//--------------------------------------------------------------------------------------------------------------------


class NotificacionesPage extends StatelessWidget {
  const NotificacionesPage({ Key key,}) : super(key: key);
  static final String routeName = 'notificaciones';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: Text('Notificaciones Page'),
      ),
    );
  }
}