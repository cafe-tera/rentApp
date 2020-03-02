//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'package:flutter/material.dart';

// local imports
import 'package:rent_app/src/bloc/provider.dart';
import 'package:rent_app/src/bloc/mis_domicilios_bloc/mis_domicilios_bloc.dart';
import 'package:rent_app/src/models/domicilio_model.dart';
import 'package:rent_app/src/pages/Perfil_pages/domicilio_perfil_page.dart';
import 'package:rent_app/src/pages/navigationMenu_pages/mis_domicilios/agregar_domicilio_page.dart';
import 'package:rent_app/src/widgets/appbar_widget.dart';
import 'package:rent_app/src/widgets/menuDrawer_widget.dart';
import 'package:rent_app/src/widgets/domicilio_card/imagenDomicilio_widget.dart';
import 'package:rent_app/src/widgets/domicilio_card/estadoDomicilio_widget.dart';
import 'package:rent_app/src/widgets/domicilio_card/contenidoDomicilioLista_widget.dart';
import 'package:rent_app/resources/colors.dart' as colors;
//--------------------------------------------------------------------------------------------------------------------

class BodyMisDomiciliosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MisDomiciliosBloc _bloc = Provider.of<MisDomiciliosBloc>(context);
    _bloc.cargarMisDomicilios();

    return Scaffold(
      appBar: AppbarWidget(
        title: Text('Mis Domicilios'),
      ),
      drawer: MenuWidget(),
      body: _disernir(_bloc, context),
    );
  }

  // Evalua el status y decide que mostrar.
  Widget _disernir(MisDomiciliosBloc _bloc, BuildContext context) {
    return Container(
      child: StreamBuilder(
          stream: _bloc.stream,
          builder: (BuildContext context,
              AsyncSnapshot<Map<String, dynamic>> snapshot) {
                
            // Si todo sale bien, entonces retorna la lista
            return _lista(_bloc.domicilios, context);
          }),
    );
  }

  Widget _lista(List<Domicilio> domicilios, BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 15),
      children: _listaDomicilios(domicilios, context),
    );
  }

  List<Widget> _listaDomicilios(List<Domicilio> data, BuildContext context) {
    final List<Widget> domicilios = [];

    data.forEach((domicilio) {
      final widgetTemp = Container(
        height: 75.0,
        child: Material(
          child: Card(
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DomicilioPerfilPage(
                              domiciliosData: domicilio,
                            )),
                  );
                },
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: SizedBox(),
                    ),
                    Expanded(
                      flex: 20,
                      child: ImagenDomicilioWidget(item: domicilio),
                    ),
                    Expanded(
                      flex: 1,
                      child: SizedBox(),
                    ),
                    Expanded(
                      flex: 30,
                      child: ContenidoDomicilioListaWidget(item: domicilio),
                    ),
                    Expanded(
                      flex: 2,
                      child: EstadoDomicilioWidget(item: domicilio),
                    ),
                  ],
                ),
              )),
        ),
      );

      domicilios..add(widgetTemp);
    });

    domicilios..add(Divider());
    domicilios..add(_agregarDomBoton(context));
    domicilios..add(Divider());
    return domicilios;
  }

  Widget _agregarDomBoton(BuildContext context) {
    return Container(
      height: 45,
      child: RaisedButton(
        color: Color(colors.agregarDomicilio),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(
              Icons.add,
              color: Color(colors.iconBlanco),
              size: 22,
            ),
            Text(
              'Agregar Domicilio',
              style: TextStyle(color: Color(colors.textoBlanco), fontSize: 16),
            ),
            Column()
          ],
        ),
        onPressed: () {
          Navigator.pushNamed(context, AgregarDomicilioPage.routeName);
        },
      ),
    );
  }
}
