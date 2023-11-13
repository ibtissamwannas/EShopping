import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../core/classes/status_request.dart';

abstract class addAddressController extends GetxController {}

class addAddressControllerImp extends addAddressController {
  Completer<GoogleMapController>? controllerMap;
  Position? position;
  StatusRequest statusRequest = StatusRequest.none;
  CameraPosition? kGooglePlex;
  List<Marker> markers = [];

  double? lat;
  double? long;

  getCurrentLocation() async {
    statusRequest = StatusRequest.loading;
    update();
    position = await Geolocator.getCurrentPosition();
    kGooglePlex = CameraPosition(
      target: LatLng(position!.latitude, position!.longitude),
      zoom: 14.4746,
    );
    statusRequest = StatusRequest.none;
    update();
  }

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
