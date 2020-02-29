//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rent_app/src/bloc/mapa_bloc/mapa_bloc.dart';
import 'package:rent_app/src/bloc/provider.dart';
// local imports
import 'package:rent_app/src/widgets/appbar_widget.dart';
import 'package:rent_app/src/widgets/menuDrawer_widget.dart';
//--------------------------------------------------------------------------------------------------------------------


class MapaBody extends StatefulWidget {
  const MapaBody({ Key key,}) : super(key: key);
  static final String routeName = 'mapa';

  @override
  _MapaBodyState createState() => _MapaBodyState();
}

class _MapaBodyState extends State<MapaBody> {

  

  final LatLng _center = const LatLng(-33.282158, -70.382323);

  @override
  Widget build(BuildContext context) {
  MapaBloc _bloc = Provider.of<MapaBloc>(context);
  _bloc.cargarDomicilios();

    return Scaffold(
      appBar: AppbarWidget(
        title: Text('Mapa Page'),
      ),
      drawer: MenuWidget(),
      body: _disernir(_bloc, context),
    );
  }

  // Evalua el status y decide que mostrar.
  Widget _disernir(MapaBloc _bloc, BuildContext context) {
    return Container(
      child: StreamBuilder(
          stream: _bloc.stream,
          builder: (BuildContext context,
              AsyncSnapshot<Map<String, dynamic>> snapshot) {
                
            // Si todo sale bien, entonces retorna la lista
            return _googleMap(_bloc, context);
          }),
    );
  }

  // Nuestra vista
  Widget _googleMap(MapaBloc bloc, BuildContext context) {
    return GoogleMap(
          onMapCreated: bloc.onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 7.0,
          ),  
          myLocationEnabled: true,
          markers: bloc.getMarkers(bloc.domicilios),
      );
  }

}