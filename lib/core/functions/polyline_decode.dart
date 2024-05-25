import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

Future getPoly(lat, long, destinationLat, destinationLong) async {
  List<LatLng> polylineCor = [];
  Set<Polyline> polyLineSet = {};
  PolylinePoints polyLinePoint = PolylinePoints();
  String url =
      "https://maps.googleapis.com/maps/api/directions/json?origin=$lat,$long&destination=$destinationLat,$destinationLong&key=AIzaSyBV4HgdL3Qris9IIeg-g7ct6ddIapcaTEI";

  var response = await http.post(Uri.parse(url));
  var responsBody = jsonDecode(response.body);

  var point = responsBody['routes'][0]['overview_polyline']['points'];

  List<PointLatLng> result = polyLinePoint.decodePolyline(point);

  if (result.isNotEmpty) {
    result.forEach((PointLatLng element) {
      polylineCor.add(LatLng(element.latitude, element.longitude));
    });
  }

  Polyline poly = Polyline(
    polylineId: PolylineId("sam"),
    color: Colors.red,
    width: 5,
    points: polylineCor,
  );

  polyLineSet.add(poly);

  return polyLineSet;
}
