//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'package:flutter/material.dart';

// local imports
import 'package:rent_app/src/bloc/provider.dart';
import 'package:rent_app/src/bloc/mis_domicilios_bloc/agregar_domicilios_bloc.dart';
import 'package:rent_app/src/widgets/appbar_widget.dart';
import 'package:rent_app/resources/colors.dart' as colors;
//--------------------------------------------------------------------------------------------------------------------

class AgregarDomicilioPage extends StatelessWidget {

  static final String routeName = 'agregar_domicilio';

  @override
  Widget build(BuildContext context) {

    AgregarDomiciliosBloc _bloc = AgregarDomiciliosBloc();

    return Scaffold(
      appBar: AppbarWidget(
        title: Text('Agregar Domicilio'),
      ),
      body: _agregarDomicilio(_bloc, context),
    );
  }

  _agregarDomicilio(AgregarDomiciliosBloc bloc, BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[

            

        ],
      )
    );
  }
}