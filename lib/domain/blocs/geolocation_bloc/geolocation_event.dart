part of 'geolocation_bloc.dart';

abstract class GeolocationEvent {
  const GeolocationEvent();
}

class InitializeGeolocator extends GeolocationEvent {
  const InitializeGeolocator();
}

class GetGeolocationRequest extends GeolocationEvent {
  const GetGeolocationRequest();
}

class StoreGeolocationData extends GeolocationEvent {
  const StoreGeolocationData();
}
