//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'package:flutter/material.dart';

// local imports
import 'package:rent_app/src/bloc/provider.dart';
import 'package:rent_app/src/bloc/mapa_bloc/mapa_bloc.dart';
import 'package:rent_app/src/models/domicilio_model.dart';
import 'package:rent_app/src/pages/navigationMenu_pages/mapa_pages/mapa_body.dart';
//--------------------------------------------------------------------------------------------------------------------

class MapaTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    MapaBloc bloc = Provider.of<MapaBloc>(context);

    if (!bloc.isInitialized){ 
      bloc.loadData();
    }

    return Container(
    child: StreamBuilder(
        stream: bloc.stream,
        builder: (BuildContext context, AsyncSnapshot<Map<String, dynamic>> snapshot){
          if(!snapshot.hasData)
            return MapaBody();
            

          bloc.cargarData();
          // Si todo sale bien, entonces retorna la lista
          List<Domicilio> domicilios = bloc.domicilios;

          return MapaBody(domicilios: domicilios);
        }),
    );
    
  }
}

