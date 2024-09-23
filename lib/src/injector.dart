import 'package:get_it/get_it.dart';

import '../domain/blocs/geolocation_bloc/geolocation_bloc.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  ///BLOC
  injector.registerFactory<GeolocationBloc>(() => GeolocationBloc());
}
