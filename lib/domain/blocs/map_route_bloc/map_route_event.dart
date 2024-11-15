// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'map_route_bloc.dart';

abstract class MapRouteEvent {
  const MapRouteEvent();
}

class InitializeMapRoute extends MapRouteEvent {
  const InitializeMapRoute();
}

class GetMapRouteRequest extends MapRouteEvent {
  String startingPoint;
  String destinationPoint;

  GetMapRouteRequest({
    required this.startingPoint,
    required this.destinationPoint,
  });
}

class StoreMapRouteData extends MapRouteEvent {
  const StoreMapRouteData();
}
