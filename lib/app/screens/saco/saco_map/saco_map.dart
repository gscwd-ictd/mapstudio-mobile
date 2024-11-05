import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:latlong2/latlong.dart';
import 'package:mapstudio/common/constants/colors.dart';
import 'package:sizer/sizer.dart';

class SacoMap extends StatefulWidget {
  const SacoMap({super.key});

  @override
  State<SacoMap> createState() => _SacoMapState();
}

class _SacoMapState extends State<SacoMap> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FlutterMap(
            options: const MapOptions(
              initialCenter: LatLng(6.12562, 125.18451),
              initialZoom: 17,
              minZoom: 12,
              maxZoom: 20,
              interactionOptions:
                  InteractionOptions(flags: ~InteractiveFlag.doubleTapZoom),
            ),
            children: [openStreetMapTileLayer]),
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
