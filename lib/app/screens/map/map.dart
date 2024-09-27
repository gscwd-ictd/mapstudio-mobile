// ignore_for_file: depend_on_referenced_packages, non_constant_identifier_names

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mapstudio/app/widgets/map_floating_action_button/map_floating_action_button.dart';
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

    //check if orientation is portrait or landscape
    Orientation deviceOrientation = MediaQuery.of(context).orientation;

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
      floatingActionButtonLocation: deviceOrientation == Orientation.portrait
          ? FloatingActionButtonLocation.endFloat
          : FloatingActionButtonLocation.miniStartTop,
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
        return const MapFloatingActionButton();
      }),
    );
  }
}
