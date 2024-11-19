import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:mapstudio/app/screens/saco/saco_form/saco_form.dart';
import 'package:mapstudio/app/screens/saco/saco_map/saco_map.dart';
import 'package:mapstudio/app/widgets/buttons/default_button.dart';
import 'package:mapstudio/app/widgets/saco_form/saco_returned_modal.dart';
import 'package:mapstudio/app/widgets/text/button_text.dart';
import 'package:mapstudio/common/constants/colors.dart';
import 'package:mapstudio/common/constants/labels.dart';
import 'package:mapstudio/common/utils/file_util.dart';
import 'package:sizer/sizer.dart';

import '../../../common/enums/saco_status_enum.dart';
import '../buttons/location_pin_button.dart';

class SacoAcceptRequestModal extends StatefulWidget {
  final TileLayer tileLayer;
  final String sacoNumber;
  final String applicantName;
  final String applicantAddress;
  final SacoStatus sacoStatus;
  final double latitude;
  final double longitude;

  const SacoAcceptRequestModal(
      {super.key,
      required this.tileLayer,
      required this.latitude,
      required this.longitude,
      required this.sacoNumber,
      required this.applicantName,
      required this.applicantAddress,
      required this.sacoStatus});

  @override
  State<SacoAcceptRequestModal> createState() => _SacoAcceptRequestModalState();
}

class _SacoAcceptRequestModalState extends State<SacoAcceptRequestModal> {
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
      insetPadding: EdgeInsets.symmetric(
          horizontal: 3.w, vertical: isDeclined ? 5.h : 8.h),
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
                      padding: EdgeInsets.only(top: 6.h, right: 4.w),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        height: isDeclined ? 70.h : 55.h,
                        child: Padding(
                          padding: EdgeInsets.only(left: 5.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${isDeclined ? 'Decline' : 'Accept'} Survey Request for:',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 15.5.sp),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Text(
                                widget.sacoNumber,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 5.w),
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
                                          height: 38.h,
                                          width: 78.w,
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
                              //State Reason
                              !isDeclined
                                  ? Container()
                                  : Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'State Reason',
                                        ),
                                        TextFormField(
                                          scrollPadding: EdgeInsets.symmetric(
                                              vertical: 10.h),
                                          style: TextStyle(fontSize: 16.sp),
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Colors.white,
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              borderSide: BorderSide.none,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              borderSide: const BorderSide(
                                                  color: Colors.grey, width: 1),
                                            ),
                                          ),
                                          maxLines: 3,
                                        ),
                                      ],
                                    ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DefaultButton(
                            onPressed: isDeclined
                                ? () {
                                    showDialog(
                                        barrierDismissible: false,
                                        // ignore: use_build_context_synchronously
                                        context: context,
                                        builder: (context) => Container(
                                              color: const Color.fromARGB(
                                                      255, 0, 0, 0)
                                                  .withOpacity(0.2),
                                              child: BackdropFilter(
                                                  filter: ImageFilter.blur(
                                                      sigmaX: 10, sigmaY: 10),
                                                  child: SacoReturnedModal(
                                                    tileLayer:
                                                        openStreetMapTileLayer,
                                                    sacoNumber:
                                                        widget.sacoNumber,
                                                    applicantName:
                                                        widget.applicantName,
                                                    applicantAddress:
                                                        widget.applicantAddress,
                                                    sacoStatus:
                                                        widget.sacoStatus,
                                                    latitude: widget.latitude,
                                                    longitude: widget.longitude,
                                                  )),
                                            ));
                                  }
                                : () {
                                    Navigator.of(context).pop();
                                    showModalBottomSheet<void>(
                                        context: context,
                                        isScrollControlled: true,
                                        isDismissible: false,
                                        useRootNavigator: true,
                                        builder: (BuildContext context) {
                                          return Container(
                                            color: const Color.fromARGB(
                                                    255, 0, 0, 0)
                                                .withOpacity(0.5),
                                            child: BackdropFilter(
                                              filter: ImageFilter.blur(
                                                  sigmaX: 15, sigmaY: 15),
                                              child: DraggableScrollableSheet(
                                                  expand: false,
                                                  snap: false,
                                                  builder: (_, controller) {
                                                    return SingleChildScrollView(
                                                        physics:
                                                            const BouncingScrollPhysics(),
                                                        controller: controller,
                                                        child: SizedBox(
                                                            height: 120.h,
                                                            child: SacoForm(
                                                                sacoNumber: widget
                                                                    .sacoNumber,
                                                                applicantName:
                                                                    widget
                                                                        .applicantName,
                                                                applicantAddress:
                                                                    widget
                                                                        .applicantAddress,
                                                                sacoStatus: widget
                                                                    .sacoStatus,
                                                                latitude: widget
                                                                    .latitude,
                                                                longitude: widget
                                                                    .longitude)));
                                                  }),
                                            ),
                                          );
                                        });
                                  },
                            buttonText: isDeclined ? 'DECLINE' : 'ACCEPT',
                            buttonWidth: 14.w,
                            btnColor: isDeclined
                                ? AppColors.abortColor
                                : AppColors.mainColor,
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          DefaultButton(
                            onPressed: isDeclined
                                ? () {
                                    setState(() {
                                      isDeclined = false;
                                    });
                                  }
                                : () {
                                    setState(() {
                                      isDeclined = true;
                                    });
                                  },
                            buttonText: isDeclined ? 'BACK' : 'DECLINE',
                            buttonWidth: 2.w,
                            btnColor: Colors.white,
                            txtColor: AppColors.lblColor,
                            borderSide: BorderSide(
                                color: isDeclined
                                    ? AppColors.abortColor
                                    : AppColors.mainColor,
                                width: 0.8),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    )
                  ],
                ),
              ),
              Positioned(
                top: 0,
                child: Container(
                  color:
                      isDeclined ? AppColors.abortColor : AppColors.mainColor,
                  height: 40,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.w),
                    child: DefaultText(
                      color: Colors.white,
                      text:
                          '${isDeclined ? 'DECLINE' : 'ACCEPT'} SURVEY REQUEST?',
                      txtSize: 16.sp,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
