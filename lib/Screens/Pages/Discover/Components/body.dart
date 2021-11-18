import 'package:get/get.dart';
import 'package:trueque/Controllers/controller.dart';

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
  final Controller controller = Get.put(Controller());
  final _pageController = PageController();
  bool _liveUpdate = true;
  bool _permission = false;

  // ignore: unused_field
  String? _serviceError = '';

  var interActiveFlags = InteractiveFlag.all & ~InteractiveFlag.rotate;

  final Location _locationService = Location();

  List<Marker> _buildMarkers() {
    final _markerList = <Marker>[];
    for (int i = 0; i < controller.listProducts.length; i++) {
      final mapItem = controller.listProducts[i];
      _markerList.add(Marker(
          point: controller.listProducts[i][3],
          builder: (_) {
            return GestureDetector(
              onTap: () {
                _pageController.animateToPage(
                  i,
                  duration: const Duration(seconds: 1),
                  curve: Curves.elasticOut,
                );
                print('Selected: ${mapItem[0]}');
              },
              child: Icon(
                Icons.location_on_outlined,
                color: kPrimaryDarkColor,
              ),
            );
          }));
    }
    return _markerList;
  }

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
    final _markers = _buildMarkers();
    var myMarker = <Marker>[
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
        child: Stack(
          children: [
            FlutterMap(
              mapController: _mapController,
              options: MapOptions(
                center: LatLng(currentLatLng.latitude, currentLatLng.longitude),
                zoom: 16.0,
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
                MarkerLayerOptions(markers: _markers),
                MarkerLayerOptions(markers: myMarker)
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: size.height - size.height * 0.38),
              child: Container(
                height: size.height * 0.3,
                width: size.width - 5,
                child: PageView.builder(
                  controller: _pageController,
                  // physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.listProducts.length,
                  itemBuilder: (context, idx) {
                    final item = controller.listProducts[idx];
                    return _MapItemDetails(
                      productName: item[0],
                      imagePath: item[1],
                      productCost: item[2],
                      loc: item[3],
                      contro: controller,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Builder(
        builder: (BuildContext context) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: size.height * 0.275,
              right: 10,
            ),
            child: FloatingActionButton(
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
            ),
          );
        },
      ),
    );
  }
}

class _MapItemDetails extends StatelessWidget {
  const _MapItemDetails(
      {Key? key,
      required this.productName,
      required this.productCost,
      required this.imagePath,
      required this.loc,
      required this.contro})
      : super(key: key);

  final String productName;
  final String productCost;
  final String imagePath;
  final LatLng loc;
  final Controller contro;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          color: kPrimarykColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Container(
              height: size.height * 0.2,
              width: size.height * 0.22,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill, image: NetworkImage(imagePath)),
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 30, bottom: 10),
                  child: Text(
                    productName,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Text(
                    "\$$productCost/u",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: MaterialButton(
                    onPressed: () {
                      contro.AddShoppingList(
                          productName, imagePath, productCost, loc);
                    },
                    color: kPrimaryDarkColor,
                    elevation: 5,
                    child: Text(
                      'Añadir',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
