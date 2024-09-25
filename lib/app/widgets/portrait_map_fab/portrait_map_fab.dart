import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:mapstudio/app/widgets/buttons/tooltip_button.dart';
import 'package:mapstudio/domain/blocs/geolocation_bloc/geolocation_bloc.dart';
import 'package:mapstudio/domain/blocs/map_layer_bloc/map_layer_bloc.dart';
import 'package:mapstudio/domain/blocs/map_layer_bloc/map_layer_event.dart';

import '../../../common/enums/map_layer_enum.dart';

class PortraitFab extends StatefulWidget {
  // final int currentLayer;
  const PortraitFab();

  @override
  State<PortraitFab> createState() => _PortraitFabState();
}

class _PortraitFabState extends State<PortraitFab> {
  @override
  Widget build(BuildContext context) {
    final geolocationBloc = BlocProvider.of<GeolocationBloc>(context);
    final maplayerBloc = BlocProvider.of<MapLayerBloc>(context);
    // int currentLayer = geolocationBloc.currentLayer;
    return Padding(
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SpeedDial(
            children: [
              SpeedDialChild(
                backgroundColor: Colors.transparent,
                child: Image.asset(
                  "assets/images/open_layer.png",
                ),
                label: 'Street View',
                shape: const RoundedRectangleBorder(),
                onTap: () {
                  setState(() {
                    maplayerBloc.add(UpdateMapLayer(
                      currentLayer: MapLayer.defaultosm,
                    ));
                    geolocationBloc.add(const GetGeolocationRequest());
                    // geolocationBloc.currentLayer = 0;
                  });
                },
              ),
            ],
            elevation: 10,
            switchLabelPosition: true,
            child: Image.asset(
              "assets/images/open_layer.png",
            ),
          ),
          SpeedDial(
            children: [
              SpeedDialChild(
                child: const Icon(Icons.streetview_rounded),
                label: 'Street View',
                onTap: () {
                  setState(() {
                    maplayerBloc.add(UpdateMapLayer(
                      currentLayer: MapLayer.defaultosm,
                    ));
                    geolocationBloc.add(const GetGeolocationRequest());
                    // geolocationBloc.currentLayer = 0;
                  });
                },
              ),
              SpeedDialChild(
                child: const Icon(Icons.dark_mode_rounded),
                label: 'Dark Mode',
                onTap: () {
                  setState(() {
                    maplayerBloc.add(UpdateMapLayer(
                      currentLayer: MapLayer.darkmode,
                    ));
                    geolocationBloc.add(const GetGeolocationRequest());
                    // geolocationBloc.currentLayer = 0;
                  });
                },
              ),
              SpeedDialChild(
                child: const Icon(Icons.light_mode_rounded),
                label: 'Light Mode',
                onTap: () {
                  setState(() {
                    maplayerBloc.add(UpdateMapLayer(
                      currentLayer: MapLayer.lightmode,
                    ));
                    geolocationBloc.add(const GetGeolocationRequest());
                    // geolocationBloc.currentLayer = 0;
                  });
                },
              ),
              SpeedDialChild(
                child: const Icon(Icons.plumbing_rounded),
                label: 'Pipeline',
                onTap: () {
                  setState(() {
                    maplayerBloc.add(UpdateMapLayer(
                      currentLayer: MapLayer.pipelines,
                    ));
                    geolocationBloc.add(const GetGeolocationRequest());
                    // geolocationBloc.currentLayer = 0;
                  });
                },
              ),
              SpeedDialChild(
                child: const Icon(Icons.fire_hydrant_alt_rounded),
                label: 'Fire Hydrants',
                onTap: () {
                  setState(() {
                    maplayerBloc.add(UpdateMapLayer(
                      currentLayer: MapLayer.firehydrants,
                    ));
                    geolocationBloc.add(const GetGeolocationRequest());
                    // geolocationBloc.currentLayer = 0;
                  });
                },
              ),
              SpeedDialChild(
                child: const Icon(Icons.water_damage_rounded),
                label: 'Water Meters',
                onTap: () {
                  setState(() {
                    maplayerBloc.add(UpdateMapLayer(
                      currentLayer: MapLayer.watermeters,
                    ));
                    geolocationBloc.add(const GetGeolocationRequest());
                    // geolocationBloc.currentLayer = 0;
                  });
                },
              ),
            ],
            child: const Icon(Icons.map_outlined),
          ),
        ],
      ),
    );
  }
}
