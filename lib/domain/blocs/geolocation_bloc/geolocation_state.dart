part of 'geolocation_bloc.dart';

abstract class GeolocationState {
  final DioException? error;
  final double? currentLongitude;
  final double? currentLatitude;

  const GeolocationState({
    this.error,
    this.currentLongitude,
    this.currentLatitude,
  });
}

class GeoLocationRequestLoading extends GeolocationState {
  const GeoLocationRequestLoading();
}

class GeoLocationRequestDone extends GeolocationState {
  const GeoLocationRequestDone(double currentLongitude, double currentLatitude)
      : super(
            currentLongitude: currentLongitude,
            currentLatitude: currentLatitude);
}

class GeoLocationUpdated extends GeolocationState {
  const GeoLocationUpdated(double currentLongitude, double currentLatitude)
      : super(
            currentLongitude: currentLongitude,
            currentLatitude: currentLatitude);
}

class GeoLocationRequestError extends GeolocationState {
  const GeoLocationRequestError(DioException error) : super(error: error);
}

class GeoLocationDisabled extends GeolocationState {
  const GeoLocationDisabled();
}

class GeoLocationPermissionDeclined extends GeolocationState {
  const GeoLocationPermissionDeclined();
}
