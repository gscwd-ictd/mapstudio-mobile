// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'map_route_bloc.dart';

abstract class MapRouteState {
  final String? error;
  List<LatLng> points;

  String? startingPoint;
  String? destinationPoint;

  MapRouteState({
    this.error,
    required this.points,
    this.startingPoint,
    this.destinationPoint,
  });
}

class MapRouteLoading extends MapRouteState {
  MapRouteLoading({required super.points});
}

class MapRouteUpdated extends MapRouteState {
  MapRouteUpdated(
      List<LatLng> points, String startingPoint, String destinationPoint)
      : super(
            points: points,
            startingPoint: startingPoint,
            destinationPoint: destinationPoint);
}

class MapRouteError extends MapRouteState {
  MapRouteError(String error) : super(points: [], error: error);
}
