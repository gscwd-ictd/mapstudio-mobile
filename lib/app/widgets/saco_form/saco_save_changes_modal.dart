import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:mapstudio/app/widgets/buttons/default_button.dart';
import 'package:mapstudio/app/widgets/buttons/icon_circular_button.dart';
import 'package:mapstudio/app/widgets/saco_form/saco_saved_modal.dart';
import 'package:mapstudio/app/widgets/text/button_text.dart';
import 'package:mapstudio/common/constants/colors.dart';
import 'package:mapstudio/common/utils/file_util.dart';
import 'package:mapstudio/common/utils/sizer_util.dart';
import 'package:sizer/sizer.dart';

class SacoSaveChangesModal extends StatefulWidget {
  const SacoSaveChangesModal({super.key});

  @override
  State<SacoSaveChangesModal> createState() => _SacoSaveChangesModalState();
}

class _SacoSaveChangesModalState extends State<SacoSaveChangesModal> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 6.h),
      shadowColor: Colors.black,
      elevation: 20,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: AppColors.mainColor,
                height: 40,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizerUtil.width(context) / 10),
                  child: DefaultText(
                    color: Colors.white,
                    text: 'SAVE INSPECTION REPORT?',
                    buttonSize: 17.sp,
                  ),
                ),
              ),
              SizedBox(
                height: 76.h,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(left: 5.w, top: 2.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Save Inspection Report for:',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16.sp),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          'SACO Number',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.bold),
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
                                height: 0.4.h,
                              ),
                              Text(
                                "Applicant's Address",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 16.sp),
                              ),
                              SizedBox(
                                height: 0.4.h,
                              ),
                              Transform.translate(
                                offset: Offset(-1.w, 0),
                                child: Card(
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide.none,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: FutureBuilder(
                                      future: FileUtil.captureFlutterMapImage(),
                                      builder: (context,
                                          AsyncSnapshot<Uint8List?> snapshot) {
                                        switch (snapshot.connectionState) {
                                          case ConnectionState.waiting:
                                            return SizedBox(
                                              height: 25.h,
                                              width: 80.w,
                                              child: const Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              ),
                                            );
                                          default:
                                            return Image.memory(
                                              snapshot.data ?? Uint8List(0),
                                              fit: BoxFit.fitWidth,
                                              height: 25.h,
                                              width: 80.w,
                                            );
                                        }
                                      }),
                                ),
                              ),
                              SizedBox(
                                height: 0.4.h,
                              ),
                              Text(
                                'System is Available',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 16.sp),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 5.w),
                                child: Text(
                                  'Yes',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                height: 0.4.h,
                              ),
                              Text(
                                'Plumbing Installation is Available',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 16.sp),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 5.w),
                                child: Text(
                                  'Yes',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                height: 0.4.h,
                              ),
                              Text(
                                'Building Type',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 16.sp),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 5.w),
                                child: Text(
                                  'Residential',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                height: 0.4.h,
                              ),
                              Text(
                                'Size of Connection',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 16.sp),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 5.w),
                                child: Text(
                                  '1/2',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                height: 0.4.h,
                              ),
                              Text(
                                'Type of Connection',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 16.sp),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 5.w),
                                child: Text(
                                  'Dual #1',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                height: 0.4.h,
                              ),
                              Text(
                                'Estimates',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 16.sp),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 5.w),
                                child: Text(
                                  '75 x 25 x 9 m',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                height: 0.4.h,
                              ),
                              Text(
                                'Notes',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 16.sp),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 5.w),
                                child: Text(
                                  '2pcs PVC casing',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 6.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    DefaultButton(
                      onPressed: () {},
                      buttonText: 'BACK',
                      buttonWidth: 15.w,
                      btnColor: Colors.white,
                      txtColor: Colors.blueAccent,
                    ),
                    DefaultButton(
                      onPressed: () {},
                      buttonText: 'SAVE',
                      buttonWidth: 15.w,
                      btnColor: AppColors.mainColor,
                    )
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
