//--------------------------------------------------------------------------------------------------------------------
// flutter imports
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// local imports
import 'package:rent_app/src/widgets/appbar_widget.dart';
import 'package:rent_app/src/widgets/menuDrawer_widget.dart';
//--------------------------------------------------------------------------------------------------------------------


class MapaPage extends StatefulWidget {
  const MapaPage({ Key key,}) : super(key: key);
  static final String routeName = 'mapa';

  @override
  _MapaPageState createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {

  GoogleMapController mapController;
  Position _currentPosition;

  final LatLng _center = const LatLng(-33.282158, -70.382323);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  final Map<String, Marker> _markers = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: Text('Mapa Page'),
      ),
      drawer: MenuWidget(),
      body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 7.0,
          ),
          myLocationEnabled: true,
          markers: _markers.values.toSet(),
      ),
    );
  }
}