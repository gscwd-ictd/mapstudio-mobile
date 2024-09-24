import 'package:get_it/get_it.dart';
import 'package:mapstudio/domain/blocs/map_layer_bloc/map_layer_bloc.dart';

import '../domain/blocs/geolocation_bloc/geolocation_bloc.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  ///BLOC
  injector.registerFactory<GeolocationBloc>(() => GeolocationBloc());
  injector.registerFactory<MapLayerBloc>(() => MapLayerBloc());
}
