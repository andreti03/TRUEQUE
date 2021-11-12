import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

import '../../../../constants.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> with TickerProviderStateMixin {
  late LatLng _center;
  late Position currentLocation;
  late final MapController mapController;

  @override
  void initState() {
    super.initState();
    mapController = MapController();
    getUserLocation();
  }

  Future<Position> locateUser() async {
    return Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  void getUserLocation() async {
    currentLocation = await locateUser();

    setState(() {
      _center = LatLng(currentLocation.latitude, currentLocation.longitude);
    });
    print('center $_center');
  }

  // ignore: unused_element
  void _animatedMapMove(LatLng destLocation, double destZoom) {
    // Create some tweens. These serve to split up the transition from one location to another.
    // In our case, we want to split the transition be<tween> our current map center and the destination.
    final _latTween = Tween<double>(
        begin: mapController.center.latitude, end: destLocation.latitude);
    final _lngTween = Tween<double>(
        begin: mapController.center.longitude, end: destLocation.longitude);
    final _zoomTween = Tween<double>(begin: mapController.zoom, end: destZoom);

    // Create a animation controller that has a duration and a TickerProvider.
    var controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    // The animation determines what path the animation will take. You can try different Curves values, although I found
    // fastOutSlowIn to be my favorite.
    Animation<double> animation =
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);

    controller.addListener(() {
      mapController.move(
          LatLng(_latTween.evaluate(animation), _lngTween.evaluate(animation)),
          _zoomTween.evaluate(animation));
    });

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.dispose();
      } else if (status == AnimationStatus.dismissed) {
        controller.dispose();
      }
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: FlutterMap(
        options: MapOptions(
          center: _center,
          zoom: 18.0,
          interactiveFlags: InteractiveFlag.all & ~InteractiveFlag.rotate,
          maxZoom: 18.0,
          minZoom: 10.0,
          onMapCreated: (MapController controller) {
            getUserLocation();
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
          MarkerLayerOptions(
            markers: [
              Marker(
                width: size.width * 0.1,
                height: size.height * 0.1,
                point: _center,
                builder: (ctx) => Container(
                  child: Icon(
                    Icons.location_on,
                    color: kPrimaryDarkColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            child: Icon(Icons.location_on),
            onPressed: () {
              getUserLocation();
              mapController.move(_center, 18.0);
            },
            backgroundColor: kPrimaryColor,
          )
        ],
      ),
    );
  }
}
