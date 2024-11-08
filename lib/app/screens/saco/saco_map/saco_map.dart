import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:latlong2/latlong.dart';
import 'package:mapstudio/app/widgets/buttons/location_pin_button.dart';
import 'package:mapstudio/common/constants/colors.dart';
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
  @override
  Widget build(BuildContext context) {
    final geolocationBloc = BlocProvider.of<GeolocationBloc>(context);

    List<Marker> _buildMarkers() {
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
          Marker(
            point:
                LatLng(finalSacoList[i].longitude, finalSacoList[i].latitude),
            width: 60,
            height: 80,
            alignment: Alignment.center,
            child: LocationPinButton(
              onPressed: () {},
            ),
          ),
        );
      }
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
                            print(lat);
                            print(long);
                            LatLng latLng = const LatLng(0, 0);
                            if (lat != null && long != null) {
                              latLng = LatLng(long, lat);
                            }
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

                              ..._buildMarkers(),
                            ]);
                          } else {
                            return const MarkerLayer(markers: []);
                          }
                        },
                      ),
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
      tileDisplay: const TileDisplay.instantaneous(),
      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
      userAgentPackageName: 'dev.fleaflet.flutter_map.example',
    );
