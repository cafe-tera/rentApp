//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'package:flutter/material.dart';

// local imports
import 'package:rent_app/src/widgets/appbar_widget.dart';
import 'package:rent_app/src/widgets/menuDrawer_widget.dart';
//--------------------------------------------------------------------------------------------------------------------


class MapaPage extends StatelessWidget {
  const MapaPage({ Key key,}) : super(key: key);
  static final String routeName = 'mapa';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: Text('Mapa Page'),
      ),
      drawer: MenuWidget(),
    );
  }
}