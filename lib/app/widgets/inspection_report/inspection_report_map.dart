import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:mapstudio/common/utils/file_util.dart';
import 'package:sizer/sizer.dart';
import '../buttons/location_pin_button.dart';

class InspectionReportMap extends StatefulWidget {
  final TileLayer tileLayer;
  final String sacoNumber;
  final String applicantName;
  final String applicantAddress;
  final double latitude;
  final double longitude;

  const InspectionReportMap({
    super.key,
    required this.tileLayer,
    required this.latitude,
    required this.longitude,
    required this.sacoNumber,
    required this.applicantName,
    required this.applicantAddress,
  });

  @override
  State<InspectionReportMap> createState() => _InspectionReportMapState();
}

class _InspectionReportMapState extends State<InspectionReportMap> {
  bool isDeclined = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<Uint8List> captureWidget() async {
    final RenderRepaintBoundary boundary = FileUtil.globalKey.currentContext!
        .findRenderObject() as RenderRepaintBoundary;

    final ui.Image image = await boundary.toImage();
    final ByteData? byteData =
        await image.toByteData(format: ui.ImageByteFormat.png);

    final Uint8List pngBytes = byteData!.buffer.asUint8List();

    return pngBytes;
  }

  Future<Uint8List> captureImage() async {
    Uint8List imageFile = Uint8List(0);
    await FileUtil.screenshotController
        .captureFromLongWidget(
      SizedBox(
        height: 40.h,
        width: 92.w,
        child: FlutterMap(
            options: const MapOptions(
              initialCenter: LatLng(6.12562, 125.18451),
              initialZoom: 17,
              minZoom: 12,
              maxZoom: 20,
              interactionOptions:
                  InteractionOptions(flags: ~InteractiveFlag.doubleTapZoom),
            ),
            children: [widget.tileLayer]),
      ),
    )
        .then((capturedImage) {
      imageFile = capturedImage;
      return capturedImage;
      // Handle captured image
    });
    return imageFile;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.h),
      elevation: 20,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          color: Colors.white,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 4.w),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        child: Padding(
                          padding: EdgeInsets.only(left: 5.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.sacoNumber,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 3.w),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 0.4.h,
                                    ),
                                    Text(
                                      widget.applicantName,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 16.sp),
                                    ),
                                    SizedBox(
                                      height: 0.1.h,
                                    ),
                                    Text(
                                      widget.applicantAddress,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(fontSize: 16.sp),
                                    ),
                                    SizedBox(
                                      height: 0.4.h,
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: Card(
                                        elevation: 10,
                                        shape: RoundedRectangleBorder(
                                            side: BorderSide.none,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: SizedBox(
                                          height: 30.h,
                                          width: 80.w,
                                          child: FlutterMap(
                                              options: MapOptions(
                                                initialCenter: LatLng(
                                                    widget.longitude,
                                                    widget.latitude),
                                                initialZoom: 17,
                                                minZoom: 12,
                                                maxZoom: 20,
                                                interactionOptions:
                                                    const InteractionOptions(
                                                        flags: ~InteractiveFlag
                                                            .doubleTapZoom),
                                              ),
                                              children: [
                                                widget.tileLayer,
                                                MarkerLayer(markers: [
                                                  // marker for concessionare address (longitude/latitude)
                                                  Marker(
                                                    point: LatLng(
                                                        widget.longitude,
                                                        widget.latitude),
                                                    width: 60,
                                                    height: 80,
                                                    alignment: Alignment.center,
                                                    child: LocationPinButton(
                                                      onPressed: () {},
                                                    ),
                                                  ),
                                                ])
                                              ]),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 0.4.h,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
