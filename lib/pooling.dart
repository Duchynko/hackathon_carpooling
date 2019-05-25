import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ssv_carpooling/drawer.dart';
import 'package:ssv_carpooling/modal.dart';

class PoolingPage extends StatefulWidget {
  PoolingPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PoolingPageState createState() => _PoolingPageState();
}

class _PoolingPageState extends State<PoolingPage> {
  Modal modal = new Modal();
  GoogleMapController _controller;
  BitmapDescriptor arenaIcon;
  BitmapDescriptor driverIcon;
  BitmapDescriptor riderIcon;

  static final CameraPosition _kStartingPosition = CameraPosition(
    target: LatLng(49.0485646, 12.0859595),
    zoom: 14.0,
  );

  static final CameraPosition _kStadium = CameraPosition(
    target: LatLng(48.990813, 12.107288),
    bearing: 192.8334901395799,
    tilt: 59.440717697143555,
    zoom: 17.0
  );

  @override
  Widget build(BuildContext context) {
    getCustomIcons(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: MyDrawer(),
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            onMapCreated: (controller) => _controller = controller,
            initialCameraPosition: _kStartingPosition,
            markers: getMarkers(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.my_location),
        onPressed: () => myPosition(),
      ),
    );
  }

  /**
   * 
   * 
   * UTIL METHODS
   * 
   */

  Set<Marker> getMarkers() {
    Marker _mRider = Marker(
      markerId: MarkerId("rider"),
      icon: riderIcon,
      position: LatLng(49.0485646, 12.0859595),
    );

    Marker _mDriver1 = Marker(
      markerId: MarkerId("driver1"),
      icon: driverIcon,
      position: LatLng(49.0440318, 11.7092051),
      onTap: () => modal.mainBottomSheet(context),
    );

    Marker _mDriver2 = Marker(
      markerId: MarkerId("driver2"),
      icon: driverIcon,
      position: LatLng(49.2229012, 12.0846685),
      onTap: () => modal.mainBottomSheet(context),
    );

    Marker _mDriver3 = Marker(
      markerId: MarkerId("driver3"),
      icon: driverIcon,
      position: LatLng(48.8432661, 11.9160578),
      onTap: () => modal.mainBottomSheet(context),
    );

    Marker _mDriver4 = Marker(
      markerId: MarkerId("driver4"),
      icon: driverIcon,
      position: LatLng(48.9158331, 12.1709821),
      onTap: () => modal.mainBottomSheet(context),
    );

    Marker _mDriver5 = Marker(
      markerId: MarkerId("driver5"),
      icon: driverIcon,
      position: LatLng(48.9799494, 12.169654),
      onTap: () => modal.mainBottomSheet(context),
    );

    Marker _mDriver6 = Marker(
      markerId: MarkerId("driver6"),
      icon: driverIcon,
      position: LatLng(48.9698097, 11.6292969),
      onTap: () => modal.mainBottomSheet(context),
    );

    Marker _mDriver7 = Marker(
      markerId: MarkerId("driver7"),
      icon: driverIcon,
      position: LatLng(49.0095287, 12.3376463),
      onTap: () => modal.mainBottomSheet(context),
    );

    Marker _mDriver8 = Marker(
      markerId: MarkerId("driver7"),
      icon: driverIcon,
      position: LatLng(49.0739263, 12.3479126),
      onTap: () => modal.mainBottomSheet(context),
    );

    Marker _mArena = Marker(
        markerId: MarkerId("arena"),
        icon: arenaIcon,
        position: LatLng(48.990813, 12.107288),
        onTap: () => _goToTheStadium()
        );

    return {_mRider, _mDriver1, _mDriver2, _mDriver3, _mDriver4, _mDriver5, _mDriver6, _mDriver7, _mDriver8, _mArena};
  }

  Future<void> myPosition() async {
    this._controller.animateCamera(CameraUpdate.newCameraPosition(_kStartingPosition));
  }

  Future<void> getCustomIcons(BuildContext context) async {
    BitmapDescriptor.fromAssetImage(
            createLocalImageConfiguration(context), "assets/jahn.png")
        .then((value) => setState(() {
              arenaIcon = value;
            }));

    BitmapDescriptor.fromAssetImage(
            createLocalImageConfiguration(context), "assets/location.png")
        .then((value) => setState(() {
              riderIcon = value;
            }));
    BitmapDescriptor.fromAssetImage(
            createLocalImageConfiguration(context), "assets/car.png")
        .then((value) => setState(() {
              driverIcon = value;
            }));
  }

  Future<void> _goToTheStadium() async {
    _controller.animateCamera(CameraUpdate.newCameraPosition(_kStadium));
  }
}
