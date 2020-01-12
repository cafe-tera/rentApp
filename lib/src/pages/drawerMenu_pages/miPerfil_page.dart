//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'package:flutter/material.dart';

// local imports
import 'package:rent_app/src/widgets/appbar_widget.dart';
import 'package:rent_app/src/widgets/menuDrawer_widget.dart';
//--------------------------------------------------------------------------------------------------------------------


class PerfilPage extends StatelessWidget {
  const PerfilPage({ Key key,}) : super(key: key);
  static final String routeName = 'perfil';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: Text('Perfil Page'),
      ),
      drawer: MenuWidget(),
    );
  }
}