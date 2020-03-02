//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rent_app/src/pages/navigationMenu_pages/mapa_pages/details_domicilio.dart';

// local imports
import 'package:rent_app/src/widgets/appbar_widget.dart';
import 'package:rent_app/src/widgets/menuDrawer_widget.dart';
import 'package:rent_app/src/models/domicilio_model.dart';
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
        title: Text('¿Buscas Arriendo?'),
      ),
      drawer: MenuWidget(),
      body: _googleMap(),
    );
  }
    String searchAddr;

// Nuestra vista
  Widget _googleMap() {


    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: _initialPosition,
            myLocationEnabled: true,
            markers: _markers),


        if (widget.domicilios == null )
          LinearProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.orange),
          ),
      ],
    );
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
                _showModal(dom);
              }
              ));
        });
      });
    }
  }

  void _showModal(Domicilio dom) {
    Future<void> future = showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return DomicilioDetails(item: dom);
      },
    );
  future.then((void value) => _closeModal(value));
}
void _closeModal(void value) {}

}
