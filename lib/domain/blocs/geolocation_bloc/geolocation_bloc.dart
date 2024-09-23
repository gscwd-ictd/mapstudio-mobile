import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';

part 'geolocation_event.dart';
part 'geolocation_state.dart';

class GeolocationBloc extends Bloc<GeolocationEvent, GeolocationState> {
  GeolocationBloc() : super(const GeoLocationRequestLoading()) {
    on<GetGeolocationRequest>(_getGeolocationRequest);
  }

  void _getGeolocationRequest(
      GeolocationEvent event, Emitter<GeolocationState> emit) async {
    emit(const GeoLocationRequestLoading());
    print('test');
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // return Future.error('Location services are disabled.');
      emit(const GeoLocationDisabled());
    } else {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          emit(const GeoLocationPermissionDeclined());
          // return Future.error('Location services are denied.');
        } else {
          await Geolocator.getCurrentPosition();
          LocationSettings locationSettings = const LocationSettings(
            accuracy: LocationAccuracy.best,
            distanceFilter: 10,
          );
          // monitor device geolocation changes and runs GetGeolocationRequest event again there are updates
          Geolocator.getPositionStream(locationSettings: locationSettings)
              .listen(
            (Position position) => add(
              const GetGeolocationRequest(),
            ),
          );
        }
      } else {
        final locationData = await Geolocator.getCurrentPosition();
        LocationSettings locationSettings = const LocationSettings(
          accuracy: LocationAccuracy.best,
          distanceFilter: 10,
        );

        // monitor device geolocation changes and runs GetGeolocationRequest event again there are updates
        Geolocator.getPositionStream(locationSettings: locationSettings).listen(
          (Position position) => add(
            const GetGeolocationRequest(),
          ),
        );

        emit(GeoLocationRequestDone(
            locationData.latitude, locationData.longitude));
      }
    }
  }
}
