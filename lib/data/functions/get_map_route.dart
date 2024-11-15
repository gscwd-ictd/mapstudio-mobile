import 'dart:convert';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;
import '../api/openroutesource_api.dart';

//function for getting map routes in openrouteservice API
getRoutes(String startingPoint, String destinationPoint) async {
  var response = await http.get(getRouteUrl(startingPoint, destinationPoint));

  List listOfPoints = [];
  List<LatLng> points = [];
  print(response.statusCode);
  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    listOfPoints = data['features'][0]['geometry']['coordinates'];
    points = listOfPoints
        .map((e) => LatLng(e[1].toDouble(), e[0].toDouble()))
        .toList();
    print(points);
    return {points, response.statusCode};
  } else {
    return {points = [], response.statusCode};
  }
}
