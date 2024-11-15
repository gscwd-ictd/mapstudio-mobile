import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:mapstudio/domain/blocs/map_layer_bloc/map_layer_bloc.dart';
import 'package:mapstudio/domain/blocs/map_route_bloc/map_route_bloc.dart';

import '../domain/blocs/geolocation_bloc/geolocation_bloc.dart';
import '../domain/blocs/saco_dashboard_bloc/saco_dashboard_bloc.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  ///BLOC
  injector.registerFactory<GeolocationBloc>(() => GeolocationBloc());
  injector.registerFactory<MapLayerBloc>(() => MapLayerBloc());
  injector.registerFactory<SacoDashboardBloc>(() => SacoDashboardBloc());
  injector.registerFactory<MapRouteBloc>(() => MapRouteBloc());

  //ENV
  await dotenv.load(fileName: ".env");
}
