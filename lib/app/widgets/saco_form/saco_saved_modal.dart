import 'package:flutter/material.dart';
import 'package:mapstudio/app/widgets/buttons/default_button.dart';
import 'package:mapstudio/app/widgets/text/button_text.dart';
import 'package:mapstudio/common/utils/sizer_util.dart';
import 'package:sizer/sizer.dart';

class SacoSavedModal extends StatefulWidget {
  const SacoSavedModal({super.key});

  @override
  State<SacoSavedModal> createState() => _SacoSavedModalState();
}

class _SacoSavedModalState extends State<SacoSavedModal> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Dialog(
          shadowColor: Colors.black,
          elevation: 20,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color(0xFF3366FF),
                    Color(0xFFFFFFFF),
                  ],
                  begin: FractionalOffset(0.0, 0.0),
                  end: FractionalOffset(0, 1),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
            height: 35.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: SizerUtil.height(context) / 8),
                  child: const ButtonText(
                      buttonText: 'Successful',
                      buttonSize: 26,
                      color: Colors.white),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: SizerUtil.height(context) / 40),
                  child: SizedBox(
                    width: SizerUtil.width(context) / 1.7,
                    child: const Text(
                      'Inspection Report for SACO 1234 is saved successfully!',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizerUtil.width(context) / 20),
                  child: DefaultButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      },
                      buttonText: 'DONE',
                      buttonWidth: SizerUtil.width(context) / 12),
                ),
              ],
            ),
          ),
        ),
        Positioned(
            left: 33.w,
            top: 31.h,
            child: Transform.translate(
              offset: Offset(0, -9.5.h),
              child: Image.asset(
                'assets/images/mr_tankee.png',
                scale: 3,
              ),
            )),
      ],
    );
  }
}
