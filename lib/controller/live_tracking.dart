import 'dart:async';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../core/classes/status_request.dart';

class Tracking extends GetxController {
  StreamSubscription<Position>? positionStream;
  getCurrentLocation() {
    positionStream =
        Geolocator.getPositionStream().listen((Position? position) {
      print("${position!.latitude.toString()}");
      print("Fdglkjfdklgd");
      print(" ${position.longitude.toString()}");
      lat = position.latitude;
      long = position.longitude;
     
    });
    kGooglePlex = CameraPosition(
      target: LatLng(14.0, 15.0),
      zoom: 50,
    );
  }

  Completer<GoogleMapController>? controllerMap;
  Position? position;
  StatusRequest statusRequest = StatusRequest.none;
  CameraPosition? kGooglePlex;
  List<Marker> markers = [];

  double? lat;
  double? long;

  addMarkers(LatLng latlng) {
    markers.clear();
    markers.add(Marker(markerId: MarkerId("1"), position: latlng));
    lat = latlng.latitude;
    long = latlng.longitude;
    update();
  }

  @override
  void onInit() {
    getCurrentLocation();
    controllerMap = Completer<GoogleMapController>();
    super.onInit();
  }
}
