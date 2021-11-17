import '../../../../constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

class Body extends StatefulWidget {
  static const String route = '/live_location';
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  LocationData? _currentLocation;
  late final MapController _mapController;

  bool _liveUpdate = true;
  bool _permission = false;

  // ignore: unused_field
  String? _serviceError = '';

  var interActiveFlags = InteractiveFlag.all & ~InteractiveFlag.rotate;

  final Location _locationService = Location();

  @override
  void initState() {
    super.initState();
    initLocationService();
    _mapController = MapController();
  }

  void initLocationService() async {
    await _locationService.changeSettings(
      accuracy: LocationAccuracy.high,
      interval: 1000,
    );

    LocationData? location;
    bool serviceEnabled;
    bool serviceRequestResult;

    try {
      serviceEnabled = await _locationService.serviceEnabled();

      if (serviceEnabled) {
        var permission = await _locationService.requestPermission();
        _permission = permission == PermissionStatus.granted;

        if (_permission) {
          location = await _locationService.getLocation();
          _currentLocation = location;
          _locationService.onLocationChanged
              .listen((LocationData result) async {
            if (mounted) {
              setState(() {
                _currentLocation = result;

                // If Live Update is enabled, move map center
                if (_liveUpdate) {
                  _mapController.move(
                      LatLng(_currentLocation!.latitude!,
                          _currentLocation!.longitude!),
                      _mapController.zoom);
                }
              });
            }
          });
        }
      } else {
        serviceRequestResult = await _locationService.requestService();
        if (serviceRequestResult) {
          initLocationService();
          return;
        }
      }
    } on PlatformException catch (e) {
      print(e);
      if (e.code == 'PERMISSION_DENIED') {
        _serviceError = e.message;
      } else if (e.code == 'SERVICE_STATUS_ERROR') {
        _serviceError = e.message;
      }
      location = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    LatLng currentLatLng;
    Size size = MediaQuery.of(context).size;

    if (_currentLocation != null) {
      currentLatLng =
          LatLng(_currentLocation!.latitude!, _currentLocation!.longitude!);
    } else {
      currentLatLng = LatLng(0, 0);
    }

    var markers = <Marker>[
      Marker(
        width: size.width * 0.1,
        height: size.height * 0.1,
        point: currentLatLng,
        builder: (ctx) => Container(
          child: Icon(
            Icons.location_on,
            color: kPrimaryDarkColor,
          ),
        ),
      ),
    ];

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(0),
        child: Column(
          children: [
            Flexible(
              child: FlutterMap(
                mapController: _mapController,
                options: MapOptions(
                  center:
                      LatLng(currentLatLng.latitude, currentLatLng.longitude),
                  zoom: 18.0,
                  maxZoom: 18.0,
                  minZoom: 10.0,
                  interactiveFlags: interActiveFlags,
                  onMapCreated: (MapController controller) {
                    initLocationService();
                  },
                ),
                layers: [
                  TileLayerOptions(
                    urlTemplate:
                        "https://api.mapbox.com/styles/v1/julianancastro/ckvorolv470re14mwneuzko7w/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoianVsaWFuYW5jYXN0cm8iLCJhIjoiY2t2bjFpY2hiMzZ0cjJ2bWwyZjVjNjlreSJ9.tpZZFaLLVtDxw94X6vKfGg",
                    additionalOptions: {
                      'accessToken':
                          'pk.eyJ1IjoianVsaWFuYW5jYXN0cm8iLCJhIjoiY2t2bjFpY2hiMzZ0cjJ2bWwyZjVjNjlreSJ9.tpZZFaLLVtDxw94X6vKfGg',
                      'id': 'mapbox.mapbox-streets-v8'
                    },
                  ),
                  MarkerLayerOptions(markers: markers)
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Builder(
        builder: (BuildContext context) {
          return FloatingActionButton(
            backgroundColor: kPrimaryColor,
            onPressed: () {
              setState(
                () {
                  _liveUpdate = !_liveUpdate;

                  if (_liveUpdate) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            'En live la camara se centrará en tu ubicación'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Live desactivado'),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  }
                },
              );
            },
            child: _liveUpdate
                ? Icon(Icons.location_on)
                : Icon(Icons.location_off),
          );
        },
      ),
    );
  }
}
