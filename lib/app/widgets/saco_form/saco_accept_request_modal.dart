import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:mapstudio/app/screens/saco/saco_form/saco_form.dart';
import 'package:mapstudio/app/widgets/buttons/default_button.dart';
import 'package:mapstudio/app/widgets/saco_form/saco_saved_modal.dart';
import 'package:mapstudio/app/widgets/text/button_text.dart';
import 'package:mapstudio/common/constants/colors.dart';
import 'package:mapstudio/common/utils/file_util.dart';
import 'package:mapstudio/common/utils/sizer_util.dart';
import 'package:sizer/sizer.dart';

class SacoAcceptRequestModal extends StatefulWidget {
  final TileLayer tileLayer;
  const SacoAcceptRequestModal({super.key, required this.tileLayer});

  @override
  State<SacoAcceptRequestModal> createState() => _SacoAcceptRequestModalState();
}

class _SacoAcceptRequestModalState extends State<SacoAcceptRequestModal> {
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
      insetPadding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 16.h),
      elevation: 20,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          color: Colors.white,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 6.h, right: 4.w),
                    child: SizedBox(
                      height: 55.h,
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.only(left: 5.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Accept Survey Request for:',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 15.5.sp),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Text(
                                'SACO Number',
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
                                      "Applicant's Name",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 16.sp),
                                    ),
                                    SizedBox(
                                      height: 0.1.h,
                                    ),
                                    Text(
                                      "Applicant's Address",
                                      textAlign: TextAlign.center,
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
                                              options: const MapOptions(
                                                initialCenter:
                                                    LatLng(6.12562, 125.18451),
                                                initialZoom: 17,
                                                minZoom: 12,
                                                maxZoom: 20,
                                                interactionOptions:
                                                    InteractionOptions(
                                                        flags: ~InteractiveFlag
                                                            .doubleTapZoom),
                                              ),
                                              children: [widget.tileLayer]),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 0.4.h,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
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
                          onPressed: () {
                            Navigator.of(context).pop();
                            showModalBottomSheet<void>(
                                context: context,
                                isScrollControlled: true,
                                isDismissible: false,
                                useRootNavigator: true,
                                builder: (BuildContext context) {
                                  return Container(
                                    color: const Color.fromARGB(255, 0, 0, 0)
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
                                                    height: 110.h,
                                                    child: const SacoForm()));
                                          }),
                                    ),
                                  );
                                });
                          },
                          buttonText: 'ACCEPT',
                          buttonWidth: 16.w,
                          btnColor: AppColors.mainColor,
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        DefaultButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          buttonText: 'DECLINE',
                          buttonWidth: 2.w,
                          btnColor: Colors.white,
                          txtColor: AppColors.lblColor,
                          borderSide: const BorderSide(
                              color: AppColors.mainColor, width: 0.8),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 0,
                child: Container(
                  color: AppColors.mainColor,
                  height: 40,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.w),
                    child: DefaultText(
                      color: Colors.white,
                      text: 'ACCEPT SURVEY REQUEST?',
                      buttonSize: 16.sp,
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
