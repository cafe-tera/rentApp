//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'package:flutter/material.dart';

// local imports
import 'package:rent_app/src/widgets/appbar_widget.dart';
import 'package:rent_app/src/widgets/menuDrawer_widget.dart';
//--------------------------------------------------------------------------------------------------------------------


class BuscarDomiciliosPage extends StatelessWidget {
  const BuscarDomiciliosPage({ Key key}) : super(key: key);

  static final String routeName = 'buscarDomicilios';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: Text('Buscar Domicilios'),
      ),
      drawer: MenuWidget(),
    );
  }
}