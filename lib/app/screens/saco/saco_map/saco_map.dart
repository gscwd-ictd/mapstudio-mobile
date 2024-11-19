import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:mapstudio/app/screens/saco/saco_form/saco_form.dart';
import 'package:mapstudio/app/widgets/buttons/custom_marker.dart';
import 'package:mapstudio/app/widgets/saco_form/saco_accept_request_modal.dart';
import 'package:mapstudio/common/constants/colors.dart';
import 'package:mapstudio/common/utils/marker_util.dart';
import 'package:mapstudio/domain/blocs/map_route_bloc/map_route_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../common/enums/saco_status_enum.dart';
import '../../../../data/models/saco_list_model.dart';
import '../../../../domain/blocs/geolocation_bloc/geolocation_bloc.dart';
import '../../../../domain/blocs/map_layer_bloc/map_layer_bloc.dart';
import '../../../../domain/blocs/map_layer_bloc/map_layer_state.dart';
import '../../../../domain/blocs/saco_dashboard_bloc/saco_dashboard_bloc.dart';
import '../../../../domain/blocs/saco_dashboard_bloc/saco_dashboard_state.dart';

class SacoMap extends StatefulWidget {
  final List<SacoListModel> sacoList;
  const SacoMap({super.key, required this.sacoList});

  @override
  State<SacoMap> createState() => _SacoMapState();
}

class _SacoMapState extends State<SacoMap> {
  late StreamSubscription<Position> test;
  @override
  void initState() {
    // TODO: implement initState
    final geolocationBloc = BlocProvider.of<GeolocationBloc>(context);

    LocationSettings locationSettings = const LocationSettings(
      accuracy: LocationAccuracy.best,
      distanceFilter: 10,
    );
    test =
        Geolocator.getPositionStream(locationSettings: locationSettings).listen(
      (Position position) => geolocationBloc.add(
        // ignore: use_build_context_synchronously
        const GetGeolocationRequest(),
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    print('disposing');
    test.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mapRouteBloc = BlocProvider.of<MapRouteBloc>(context);
    final geolocationBloc = BlocProvider.of<GeolocationBloc>(context);

    List<Marker> buildMarkers(Function ontap) {
      List<Marker> markers = [];

      final sacoDashboardBloc = BlocProvider.of<SacoDashboardBloc>(context);
      //filter saco list based on drop down or search bar
      List<SacoListModel> filteredSacoList = [];

      //if search field has input and drop down is not set to ALL
      if (sacoDashboardBloc.state.search != null &&
          sacoDashboardBloc.state.search != '' &&
          (sacoDashboardBloc.state.selectedStatus != SacoStatus.all &&
              sacoDashboardBloc.state.selectedStatus != null)) {
        filteredSacoList = widget.sacoList
            .where((e) =>
                e.sacoStatus == sacoDashboardBloc.state.selectedStatus &&
                (e.applicantName.toLowerCase().contains(
                        sacoDashboardBloc.state.search?.toLowerCase()
                            as Pattern) ||
                    e.sacoNumber.toLowerCase().contains(
                        sacoDashboardBloc.state.search?.toLowerCase()
                            as Pattern)))
            .toList();
      }
      //if search field has input and drop down is set to ALL
      else if (sacoDashboardBloc.state.search != null &&
          sacoDashboardBloc.state.search != '' &&
          (sacoDashboardBloc.state.selectedStatus == SacoStatus.all ||
              sacoDashboardBloc.state.selectedStatus == null)) {
        filteredSacoList = widget.sacoList
            .where((e) =>
                e.applicantName.toLowerCase().contains(
                    sacoDashboardBloc.state.search?.toLowerCase() as Pattern) ||
                e.sacoNumber.toLowerCase().contains(
                    sacoDashboardBloc.state.search?.toLowerCase() as Pattern))
            .toList();
      }
      //if search field is empty and drop down is set to any of the options
      else {
        filteredSacoList = widget.sacoList
            .where(
                (e) => e.sacoStatus == sacoDashboardBloc.state.selectedStatus)
            .toList();
      }

      //final saco list to show
      List<SacoListModel> finalSacoList = [];

      //if filtered list is not empty
      if (filteredSacoList.isNotEmpty) {
        finalSacoList = filteredSacoList;
      }
      //if search field is empty and drop down is set to ALL
      else if ((sacoDashboardBloc.state.search == null ||
              sacoDashboardBloc.state.search == '') &&
          filteredSacoList.isEmpty &&
          (sacoDashboardBloc.state.selectedStatus == SacoStatus.all ||
              sacoDashboardBloc.state.selectedStatus == null)) {
        finalSacoList = widget.sacoList;
      } else {
        finalSacoList = [];
      }

      for (int i = 0; i < finalSacoList.length; i++) {
        markers.add(
          createMarker(
              onYesTap: () {
                showModalBottomSheet<void>(
                    context: context,
                    isScrollControlled: true,
                    isDismissible: false,
                    useRootNavigator: true,
                    builder: (BuildContext context) {
                      return Container(
                        color:
                            const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                          child: DraggableScrollableSheet(
                              expand: false,
                              snap: false,
                              builder: (_, controller) {
                                return SingleChildScrollView(
                                    physics: const BouncingScrollPhysics(),
                                    controller: controller,
                                    child: SizedBox(
                                        height: 120.h,
                                        child: SacoForm(
                                            sacoNumber:
                                                finalSacoList[i].sacoNumber,
                                            applicantName:
                                                finalSacoList[i].applicantName,
                                            applicantAddress: finalSacoList[i]
                                                .applicantAddress,
                                            sacoStatus:
                                                finalSacoList[i].sacoStatus,
                                            latitude: finalSacoList[i].latitude,
                                            longitude:
                                                finalSacoList[i].longitude)));
                              }),
                        ),
                      );
                    });
              },
              position:
                  LatLng(finalSacoList[i].longitude, finalSacoList[i].latitude),
              address: finalSacoList[i].applicantAddress,
              name: finalSacoList[i].applicantName,
              sacoNumber: finalSacoList[i].sacoNumber,
              ontap: () {
                mapRouteBloc.add(GetMapRouteRequest(
                    startingPoint:
                        '${geolocationBloc.state.currentLongitude.toString()}, ${geolocationBloc.state.currentLatitude.toString()}',
                    destinationPoint:
                        '${finalSacoList[i].longitude.toString()}, ${finalSacoList[i].latitude.toString()}'));
                MarkerUtil.currentMarkerTap = LatLng(
                    finalSacoList[i].longitude, finalSacoList[i].latitude);
                ontap();
                // setState(() {
                //   MarkerUtil.currentMarkerTap = LatLng(
                //       finalSacoList[i].longitude, finalSacoList[i].latitude);
                // });
              }),
          // Marker(
          //   point:
          //       LatLng(finalSacoList[i].longitude, finalSacoList[i].latitude),
          //   width: 60,
          //   height: 80,
          //   alignment: Alignment.center,
          //   child: LocationPinButton(
          //     onPressed: () {},
          //   ),
          // );
        );
      }
      print('${markers.length} markers');
      return markers;
    }

    return Stack(
      children: [
        BlocBuilder<SacoDashboardBloc, SacoDashboardState>(
          builder: (context, state) {
            return BlocBuilder<MapLayerBloc, MapLayerState>(
              builder: (context, state) {
                return FlutterMap(
                    options: const MapOptions(
                      // onTap: (tapPosition, point) async {
                      //   mapRouteBloc.add(GetMapRouteRequest(
                      //       startingPoint:
                      //           '${state.currentLongitude}, ${state.currentLatitude}',
                      //       destinationPoint:
                      //           '${point.longitude}, ${point.latitude}'));
                      // },
                      initialCenter: LatLng(6.12562, 125.18451),
                      initialZoom: 17,
                      minZoom: 12,
                      maxZoom: 20,
                      interactionOptions: InteractionOptions(
                          flags: ~InteractiveFlag.doubleTapZoom),
                    ),
                    children: [
                      openStreetMapTileLayer,
                      BlocBuilder<GeolocationBloc, GeolocationState>(
                          builder: (context, state) {
                        if (state is GeoLocationRequestDone) {
                          double? lat = state.currentLatitude;
                          double? long = state.currentLongitude;

                          LatLng latLng = const LatLng(0, 0);
                          if (lat != null && long != null) {
                            latLng = LatLng(lat, long);
                            mapRouteBloc.add(GetMapRouteRequest(
                                startingPoint:
                                    mapRouteBloc.state.startingPoint.toString(),
                                destinationPoint: mapRouteBloc
                                    .state.destinationPoint
                                    .toString()));
                          }
                          return StatefulBuilder(
                              builder: (context, currentState) {
                            return MarkerLayer(markers: [
                              // your location
                              Marker(
                                point: latLng,
                                width: 50,
                                height: 50,
                                alignment: Alignment.center,
                                child: Icon(
                                  Icons.location_on_rounded,
                                  size: 40,
                                  color: Colors.blue[600],
                                ),
                              ),

                              ...buildMarkers(() {
                                currentState(() {});
                              }),
                            ]);
                          });
                        } else {
                          return const MarkerLayer(markers: []);
                        }
                      }),
                      //Polylines (Routing)
                      BlocBuilder<MapRouteBloc, MapRouteState>(
                          builder: (context, state) {
                        return PolylineLayer(polylines: [
                          Polyline(
                              points: state.points,
                              color: Colors.blue,
                              strokeWidth: 5),
                        ]);
                      })
                    ]);
              },
            );
          },
        ),
        Positioned(
          bottom: 0,
          right: 2.w,
          child: SizedBox(
            height: 30.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 2.h),
                  child: SizedBox(
                    height: 5.h,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: const CircleBorder(),
                            side: const BorderSide(color: AppColors.mainColor)),
                        onPressed: () {},
                        child: Icon(
                          Icons.my_location,
                          color: AppColors.mainColor,
                          size: 19.sp,
                        )),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 2.h, bottom: 1.h),
                  child: SizedBox(
                    height: 5.h,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: const CircleBorder(),
                            side: const BorderSide(color: AppColors.mainColor)),
                        onPressed: () {},
                        child: Icon(
                          FontAwesomeIcons.minus,
                          color: AppColors.mainColor,
                          size: 16.sp,
                        )),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 2.h),
                  child: SizedBox(
                    height: 5.h,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: const CircleBorder(),
                            side: const BorderSide(color: AppColors.mainColor)),
                        onPressed: () {},
                        child: Icon(
                          Icons.add,
                          color: AppColors.mainColor,
                          size: 19.sp,
                        )),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

TileLayer get openStreetMapTileLayer => TileLayer(
      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
      userAgentPackageName: 'com.android.application',
    );
