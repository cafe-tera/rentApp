//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'package:flutter/material.dart';
import 'package:rent_app/src/bloc/contactos_bloc/contactos_bloc.dart';
import 'package:rent_app/src/bloc/provider.dart';

// local imports
import 'package:rent_app/src/models/contacto_model.dart';
import 'package:rent_app/src/widgets/appbar_widget.dart';
import 'package:rent_app/src/widgets/ratingBar_widget.dart';
//--------------------------------------------------------------------------------------------------------------------

class BodyContactosPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    ContactosBloc _bloc = Provider.of<ContactosBloc>(context);
    _bloc.cargarFaq();

    return Scaffold(
      appBar: AppbarWidget(
        title: Text('Contactos Page'),
      ),
      body: _disernir(_bloc, context),
    );
  }

  Widget _disernir(ContactosBloc _bloc, BuildContext context){
    return Container(
      child: StreamBuilder(
        stream: _bloc.stream,
        builder: (BuildContext context, AsyncSnapshot<Map<String, dynamic>> snapshot){
          return _lista(_bloc.contactos, context);
        },
      ),
    );
  }

  Widget _lista(List<Contacto> contactos, BuildContext context){
    return Container(
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15),
        children: _listaContactos(contactos, context),
      ),
    );
  }

  List<Widget> _listaContactos(List data, BuildContext context) {
    final List<Widget> contactos = [];

    data.forEach((contacto) {
      final widgetTemp = Container(
        height: 75.0,
        child: Card(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),

            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: 20,
                  child: _imagenContacto(contacto),
                ),
                Expanded(
                  flex: 1,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: 30,
                  child: _contenidoContacto(contacto),
                ),
              ],
            )),
      );

      contactos..add(widgetTemp);
    });

    contactos..add(Divider());
    
    return contactos;
  }

  Widget _imagenContacto(item) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: FadeInImage(
          fit: BoxFit.cover,
          alignment: Alignment.center,
          image: NetworkImage(
            item.imagen,
          ),
          placeholder: AssetImage('assets/Alternate-Preloader.gif',),
          fadeInDuration: Duration(milliseconds: 200),
        ),
      ),
    );
  }

  Widget _contenidoContacto(item) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: _encabezado(item),
    );
  }

  Widget _encabezado(item) {
    double rating  = item.puntos;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[

        Text(
          item.nombres +' '+item.apellidos,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        
        SizedBox(height: 5,),

        RatingBarWidget(ratingValue: rating, barSize: 15.0,)

      ],
    );
  }

}