// ignore_for_file: depend_on_referenced_packages, non_constant_identifier_names

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/blocs/geolocation_bloc/geolocation_bloc.dart';
// import '../../constants/types/route_type.dart';

class FlutterMapWidget extends StatefulWidget {
  const FlutterMapWidget({super.key});

  @override
  State<FlutterMapWidget> createState() => _FlutterMapWidget();
}

class _FlutterMapWidget extends State<FlutterMapWidget> {
  int currentLayer = 0;
  bool getRouteFailed = false;
  String userPosition = 'test';

  @override
  Widget build(BuildContext context) {
    // First get the FlutterView.
    FlutterView view = WidgetsBinding.instance.platformDispatcher.views.first;
    final geolocationBloc = BlocProvider.of<GeolocationBloc>(context);
    // Dimensions in physical pixels (px)
    Size size = view.physicalSize;
    double deviceWidth = size.width;

    return FlutterMap(
      options: const MapOptions(
        initialCenter: LatLng(6.12562, 125.18451),
        initialZoom: 17,
        minZoom: 12,
        maxZoom: 20,
        interactionOptions:
            InteractionOptions(flags: ~InteractiveFlag.doubleTapZoom),
      ),
      children: [
        if (currentLayer == 0) ...[
          openStreetMapTileLayer,
        ] else if (currentLayer == 1) ...[
          openStreetMapCustomTileLayer_dark,
        ] else if (currentLayer == 2) ...[
          openStreetMapCustomTileLayer_light,
        ] else if (currentLayer == 3) ...[
          openStreetMapCustomTileLayer_light,
          gscwdMap_Pipeline2024_6,
        ] else if (currentLayer == 4) ...[
          openStreetMapCustomTileLayer_light,
          gscwdMap_Hydrants2024,
        ] else if (currentLayer == 5) ...[
          openStreetMapCustomTileLayer_light,
          gscwdMap_WaterMeter2024,
        ],

        Text(userPosition),
        BlocBuilder<GeolocationBloc, GeolocationState>(
          builder: (context, state) {
            if (BlocProvider.of<GeolocationBloc>(context).state
                is GeoLocationRequestDone) {
              userPosition =
                  "${state.currentLatitude.toString()} ${state.currentLongitude.toString()}";
              return MarkerLayer(markers: [
                // 1st marker
                Marker(
                    point:
                        LatLng(state.currentLongitude!, state.currentLatitude!),
                    width: 40,
                    height: 40,
                    alignment: Alignment.center,
                    child: Icon(Icons.location_pin,
                        size: 30, color: Colors.blue[600])),
              ]);
            } else {
              return const MarkerLayer(markers: []);
            }
          },
        ),
        // Polylines
        // BlocBuilder<RouteCubit, RouteState>(
        //   builder: (context, state) {
        //     return PolylineLayer(polylines: [
        //       Polyline(
        //           points: state.points,
        //           color: Colors.blue,
        //           strokeWidth: 5),
        //     ]);
        //   },
        // )
      ],
    );
  }
}

TileLayer get openStreetMapTileLayer => TileLayer(
      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
      userAgentPackageName: 'dev.fleaflet.flutter_map.example',
    );

TileLayer get openStreetMapCustomTileLayer_memomaps => TileLayer(
      urlTemplate: 'https://tile.memomaps.de/tilegen/{z}/{x}/{y}.png',
      userAgentPackageName: 'dev.fleaflet.flutter_map.example',
    );

TileLayer get openStreetMapCustomTileLayer_dark => TileLayer(
      urlTemplate:
          'https://cartodb-basemaps-{s}.global.ssl.fastly.net/dark_all/{z}/{x}/{y}.png',
      userAgentPackageName: 'dev.fleaflet.flutter_map.example',
    );

TileLayer get openStreetMapCustomTileLayer_light => TileLayer(
      urlTemplate:
          'https://cartodb-basemaps-{s}.global.ssl.fastly.net/light_all/{z}/{x}/{y}.png',
      userAgentPackageName: 'dev.fleaflet.flutter_map.example',
    );

TileLayer get gscwdMap_Pipeline2024_6 => TileLayer(
      wmsOptions: WMSTileLayerOptions(
        crs: const Epsg3857(),
        baseUrl: 'http://172.20.110.69:8080/geoserver/gismapping3/wms?',
        layers: const ['Pipeline2024_6'],
      ),
    );

TileLayer get gscwdMap_Hydrants2024 => TileLayer(
      wmsOptions: WMSTileLayerOptions(
        crs: const Epsg3857(),
        baseUrl: 'http://172.20.110.69:8080/geoserver/gismapping3/wms?',
        layers: const ['HYDRANTS2024'],
      ),
    );

TileLayer get gscwdMap_WaterMeter2024 => TileLayer(
      wmsOptions: WMSTileLayerOptions(
        crs: const Epsg3857(),
        baseUrl: 'http://172.20.110.69:8080/geoserver/gismapping3/wms?',
        layers: const ['WM2024_4'],
      ),
    );
