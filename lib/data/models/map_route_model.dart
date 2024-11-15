// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:latlong2/latlong.dart';

class RouteResponse {
  final List<LatLng> points;
  final String error;
  RouteResponse({
    required this.points,
    required this.error,
  });
}
