//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// local imports
import 'package:rent_app/src/widgets/appbar_widget.dart';
import 'package:rent_app/src/widgets/menuDrawer_widget.dart';
import 'package:rent_app/src/models/domicilio_model.dart';
import 'package:rent_app/src/bloc/mapa_bloc/marker_details_bloc.dart';
//--------------------------------------------------------------------------------------------------------------------

class MapaBody extends StatefulWidget {
  const MapaBody({Key key, this.domicilios}) : super(key: key);

  final List<Domicilio> domicilios;

  @override
  _MapaBodyState createState() => _MapaBodyState();
}

class _MapaBodyState extends State<MapaBody> {
  GoogleMapController mapController;
  Completer<GoogleMapController> _controller = Completer();

  void _onMapCreated(GoogleMapController controller) {
    _addMarkers();
    mapController = controller;
    _controller.complete(controller);
  }

  @override
  void didUpdateWidget(MapaBody oldWidget) {
    _markers.clear();
    _addMarkers();
    super.didUpdateWidget(oldWidget);
  }

//-----------------------------------------------
//    Maps Varibles
//-----------------------------------------------
  LocationData userLocation;

  MarkerDetailsBloc markerBloc;
  final Set<Marker> _markers = Set();

  CameraPosition _initialPosition = CameraPosition(
    target: LatLng(-33.282158, -70.382323), //Santiago: -33.282158, -70.382323
    zoom: 7.0,
  );
//-----------------------------------------------

  @override
  Widget build(BuildContext context) {

//-----------------------------------------------
//    Vista ewe
//-----------------------------------------------
    return Scaffold(
      appBar: AppbarWidget(
        title: Text('Mapa Page'),
      ),
      drawer: MenuWidget(),
      body: _googleMap(),
    );
  }

// Nuestra vista
  Widget _googleMap() {
    return GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: _initialPosition,
        myLocationEnabled: true,
        markers: _markers);
  }

  void _addMarkers() {
    if (widget.domicilios != null) {
      widget.domicilios.forEach((Domicilio dom) {
        setState(() {
          _markers.add(Marker(
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueBlue),
              position: LatLng(dom.ubicacion.lat, dom.ubicacion.lng),
              markerId: MarkerId('${dom.id}'),
              infoWindow: InfoWindow(title: '${dom.tipo}'),
              onTap: () {
                markerBloc.hideDetail();
                markerBloc.showDetail(dom);
              }
              ));
        });
      });
    }
  }
}
