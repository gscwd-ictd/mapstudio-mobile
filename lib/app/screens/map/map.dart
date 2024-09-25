// ignore_for_file: depend_on_referenced_packages, non_constant_identifier_names

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mapstudio/app/widgets/portrait_map_fab/portrait_map_fab.dart';
import 'package:mapstudio/app/widgets/open_street_map/open_street_map.dart';

import '../../../domain/blocs/geolocation_bloc/geolocation_bloc.dart';

// import '../../constants/types/route_type.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key, required this.title});

  final String title;

  @override
  State<MapScreen> createState() => _MapScreen();
}

class _MapScreen extends State<MapScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int currentLayer = 0;
  bool getRouteFailed = false;

  //device location
  // String lat = "6.12562";
  // String long = "125.18451";
  String userPosition = 'test';

  // List listOfPoints = [];
  // List<LatLng> points = [];
  // String error = "";

  @override
  Widget build(BuildContext context) {
    List<Widget> appDrawers = [
      const DrawerHeader(
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
        child: Text('Map Example'),
      ),
      ListTile(
        leading: const Icon(
          Icons.my_location,
        ),
        title: const Text('My Current Location'),
        trailing: IconButton(
          icon: const Icon(Icons.remove_red_eye_outlined),
          onPressed: () {},
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    ];
    // First get the FlutterView.
    FlutterView view = WidgetsBinding.instance.platformDispatcher.views.first;
    final geolocationBloc = BlocProvider.of<GeolocationBloc>(context);
    // Dimensions in physical pixels (px)
    Size size = view.physicalSize;
    double deviceWidth = size.width;

    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
            icon: const Icon(Icons.layers_sharp)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: Drawer(
        child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: appDrawers),
      ),
      // appBar: AppBar(
      //   leading: IconButton(
      //     icon: const Icon(Icons.arrow_back),
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //   ),
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      //   title: Text(widget.title),
      // ),
      body: const OpenStreetMapWidget(),
      floatingActionButtonLocation: deviceWidth > 1600
          ? FloatingActionButtonLocation.miniStartTop
          : FloatingActionButtonLocation.endFloat,
      floatingActionButton: BlocConsumer<GeolocationBloc, GeolocationState>(
          listener: (context, state) {
        if (BlocProvider.of<GeolocationBloc>(context).state
            is GeoLocationRequestDone) {
          // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          //     content: Text('Location taken successfully.'),
          //     duration: Duration(milliseconds: 3000)));
        } else if (BlocProvider.of<GeolocationBloc>(context).state
            is GeoLocationRequestLoading) {
          // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          //     content: Text('Getting location.'),
          //     duration: Duration(milliseconds: 3000)));
        } else {
          // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          //     content: Text('Getting location failed.'),
          //     duration: Duration(milliseconds: 3000)));
        }

        // if (getRouteFailed == true) {
        //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        //       content:
        //           Text('Failed to get route. Please check your connection.'),
        //       duration: Duration(milliseconds: 300)));
        // }
      }, builder: (context, state) {
        if (deviceWidth > 1600) {
          //if on tablet
          return Padding(
            padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        currentLayer = 0;
                        geolocationBloc.add(const GetGeolocationRequest());
                      });
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                          child: Icon(
                            Icons.streetview_rounded,
                            size: 16,
                            color: currentLayer == 0
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
                        currentLayer = 1;
                      });
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                          child: Icon(
                            Icons.dark_mode_rounded,
                            size: 16,
                            color: currentLayer == 1
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
                        currentLayer = 2;
                      });
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                          child: Icon(
                            size: 16,
                            Icons.light_mode_rounded,
                            color: currentLayer == 2
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
                        currentLayer = 3;
                      });
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                          child: Icon(
                            size: 16,
                            Icons.plumbing_rounded,
                            color: currentLayer == 3
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
                        currentLayer = 4;
                      });
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                          child: Icon(
                            size: 16,
                            Icons.fire_hydrant_alt_rounded,
                            color: currentLayer == 4
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
                        currentLayer = 5;
                      });
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                          child: Icon(
                            size: 16,
                            Icons.water_damage_rounded,
                            color: currentLayer == 5
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
        } else {
          //if on mobile
          return PortraitFab();
        }
      }),
    );
  }
}
