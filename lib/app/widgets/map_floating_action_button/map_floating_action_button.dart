import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:mapstudio/domain/blocs/geolocation_bloc/geolocation_bloc.dart';
import 'package:mapstudio/domain/blocs/map_layer_bloc/map_layer_bloc.dart';
import 'package:mapstudio/domain/blocs/map_layer_bloc/map_layer_event.dart';

import '../../../common/enums/map_layer_enum.dart';

class MapFloatingActionButton extends StatefulWidget {
  // final int currentLayer;
  const MapFloatingActionButton({super.key});

  @override
  State<MapFloatingActionButton> createState() =>
      _MapFloatingActionButtonState();
}

class _MapFloatingActionButtonState extends State<MapFloatingActionButton> {
  @override
  Widget build(BuildContext context) {
    final geolocationBloc = BlocProvider.of<GeolocationBloc>(context);
    final maplayerBloc = BlocProvider.of<MapLayerBloc>(context);

    Orientation deviceOrientation = MediaQuery.of(context).orientation;

    //portrait view
    if (deviceOrientation == Orientation.portrait) {
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
    //landscape view
    else {
      return Padding(
        padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    maplayerBloc.add(UpdateMapLayer(
                      currentLayer: MapLayer.defaultosm,
                    ));
                    // geolocationBloc.currentLayer = 0;
                  });
                },
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                      child: Icon(
                        Icons.streetview_rounded,
                        size: 16,
                        color: maplayerBloc.state.currentLayer ==
                                MapLayer.defaultosm
                            ? Colors.blueAccent
                            : Colors.black,
                      ),
                    ),
                    const Text(
                      'Street View',
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    maplayerBloc.add(UpdateMapLayer(
                      currentLayer: MapLayer.darkmode,
                    ));
                    // geolocationBloc.currentLayer = 0;
                  });
                },
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                      child: Icon(
                        Icons.dark_mode_rounded,
                        size: 16,
                        color:
                            maplayerBloc.state.currentLayer == MapLayer.darkmode
                                ? Colors.blueAccent
                                : Colors.black,
                      ),
                    ),
                    const Text(
                      'Dark Mode',
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    maplayerBloc.add(UpdateMapLayer(
                      currentLayer: MapLayer.lightmode,
                    ));
                    // geolocationBloc.currentLayer = 0;
                  });
                },
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                      child: Icon(
                        size: 16,
                        Icons.light_mode_rounded,
                        color: maplayerBloc.state.currentLayer ==
                                MapLayer.lightmode
                            ? Colors.blueAccent
                            : Colors.black,
                      ),
                    ),
                    const Text(
                      'Light Mode',
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    maplayerBloc.add(UpdateMapLayer(
                      currentLayer: MapLayer.pipelines,
                    ));
                    // geolocationBloc.currentLayer = 0;
                  });
                },
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                      child: Icon(
                        size: 16,
                        Icons.plumbing_rounded,
                        color: maplayerBloc.state.currentLayer ==
                                MapLayer.pipelines
                            ? Colors.blueAccent
                            : Colors.black,
                      ),
                    ),
                    const Text(
                      'Pipeline',
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    maplayerBloc.add(UpdateMapLayer(
                      currentLayer: MapLayer.firehydrants,
                    ));
                    // geolocationBloc.currentLayer = 0;
                  });
                },
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                      child: Icon(
                        size: 16,
                        Icons.fire_hydrant_alt_rounded,
                        color: maplayerBloc.state.currentLayer ==
                                MapLayer.firehydrants
                            ? Colors.blueAccent
                            : Colors.black,
                      ),
                    ),
                    const Text(
                      'Fire Hydrants',
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    maplayerBloc.add(UpdateMapLayer(
                      currentLayer: MapLayer.watermeters,
                    ));
                    // geolocationBloc.currentLayer = 0;
                  });
                },
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                      child: Icon(
                        size: 16,
                        Icons.water_damage_rounded,
                        color: maplayerBloc.state.currentLayer ==
                                MapLayer.watermeters
                            ? Colors.blueAccent
                            : Colors.black,
                      ),
                    ),
                    const Text(
                      'Water Meters',
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
