import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mapstudio/app/screens/map/map.dart';

part 'geolocation_event.dart';
part 'geolocation_state.dart';

class GeolocationBloc extends Bloc<GeolocationEvent, GeolocationState> {
  GeolocationBloc() : super(const GeoLocationRequestLoading()) {
    on<GetGeolocationRequest>(_getGeolocationRequest);
    on<InitializeGeolocator>(_initializeGeolocator);
  }
  int currentLayer = 0;

  void _initializeGeolocator(
      GeolocationEvent event, Emitter<GeolocationState> emit) async {}

  void _getGeolocationRequest(
      GetGeolocationRequest event, Emitter<GeolocationState> emit) async {
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
              // ignore: use_build_context_synchronously
              GetGeolocationRequest(event.context),
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
            // ignore: use_build_context_synchronously
            GetGeolocationRequest(event.context),
          ),
        );

        emit(GeoLocationRequestDone(
            locationData.latitude, locationData.longitude));
      }
    }
    // ignore: use_build_context_synchronously
    Navigator.of(event.context).pushAndRemoveUntil(
      // ignore: use_build_context_synchronously
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          // Navigate to the SecondScreen
          return const MapScreen();
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var tween = Tween<double>(begin: 0.0, end: 1).animate(animation);
          return FadeTransition(
            opacity: tween,
            // Apply slide transition
            child: child,
          );
        },
      ),
      (route) => false,
    );
  }
}
