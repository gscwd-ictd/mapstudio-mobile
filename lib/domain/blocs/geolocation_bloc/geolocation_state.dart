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
  const GeoLocationRequestDone(double currentLatitude, double currentLongitude)
      : super(
          currentLatitude: currentLatitude,
          currentLongitude: currentLongitude,
        );
}

class GeoLocationUpdated extends GeolocationState {
  const GeoLocationUpdated(double currentLatitude, double currentLongitude)
      : super(
          currentLatitude: currentLatitude,
          currentLongitude: currentLongitude,
        );
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
