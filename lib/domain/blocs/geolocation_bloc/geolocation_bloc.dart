import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mapstudio/app/screens/saco/saco_tab_view.dart';

import '../../../app/screens/login/login.dart';

part 'geolocation_event.dart';
part 'geolocation_state.dart';

class GeolocationBloc extends Bloc<GeolocationEvent, GeolocationState> {
  GeolocationBloc() : super(const GeoLocationRequestLoading()) {
    on<GetGeolocationRequest>(_getGeolocationRequest);
    on<InitializeGeolocator>(_initializeGeolocator);
    on<RequestGeolocationPermission>(_requestGeolocationPermission);
  }
  int currentLayer = 0;

  void _initializeGeolocator(
      GeolocationEvent event, Emitter<GeolocationState> emit) async {}

  void _getGeolocationRequest(
      GetGeolocationRequest event, Emitter<GeolocationState> emit) async {
    emit(const GeoLocationRequestLoading());
    print('geolocation request loading');

    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // return Future.error('Location services are disabled.');
      emit(const GeoLocationDisabled());
      print('geolocation request disabled');
    } else {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          emit(const GeoLocationPermissionDeclined());
          // return Future.error('Location services are denied.');
        } else {
          final locationData = await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.high);
          emit(GeoLocationRequestDone(
              locationData.latitude, locationData.longitude));
        }
      } else {
        final locationData = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        emit(GeoLocationRequestDone(
            locationData.latitude, locationData.longitude));

        print('geolocation request complete');
        print('${locationData.latitude}, ${locationData.longitude}');
      }
    }
  }

  void _requestGeolocationPermission(RequestGeolocationPermission event,
      Emitter<GeolocationState> emit) async {
    emit(const GeoLocationRequestLoading());
    print('geolocation permission request loading');

    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // return Future.error('Location services are disabled.');
      emit(const GeoLocationDisabled());
      print('geolocation permission request disabled');
    } else {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          emit(const GeoLocationPermissionDeclined());
          // return Future.error('Location services are denied.');
        } else {
          final locationData = await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.high);
          emit(GeoLocationRequestDone(
              locationData.latitude, locationData.longitude));
        }
      } else {
        final locationData = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        emit(GeoLocationRequestDone(
            locationData.latitude, locationData.longitude));

        print('geolocation permission request complete');
      }
      // ignore: use_build_context_synchronously
      Navigator.of(event.context).pushReplacement(
          // ignore: use_build_context_synchronously
          PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          // Navigate to the SecondScreen
          // return const SacoTabView();
          return const LoginScreen();
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var tween = Tween<double>(begin: 0.0, end: 1).animate(animation);
          return FadeTransition(
            opacity: tween,
            // Apply slide transition
            child: child,
          );
        },
      ));
    }
  }
}
