import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:mapstudio/app/widgets/buttons/default_button.dart';
import 'package:mapstudio/app/widgets/saco_form/saco_form_body/saco_form_body.dart';
import 'package:mapstudio/app/widgets/saco_form/saco_form_details.dart';
import 'package:mapstudio/app/widgets/saco_form/saco_form_map.dart';
import 'package:mapstudio/app/widgets/saco_form/saco_save_changes_modal.dart';
import 'package:mapstudio/common/constants/colors.dart';
import 'package:mapstudio/common/utils/file_util.dart';
import 'package:mapstudio/common/utils/text_scale_util.dart';
import 'package:sizer/sizer.dart';

class SacoForm extends StatefulWidget {
  const SacoForm({super.key});

  @override
  State<SacoForm> createState() => _SacoFormState();
}

class _SacoFormState extends State<SacoForm> {
  double height = 15.h, posHeight = 5.h, pos = 1.h;
  @override
  void initState() {
    // TODO: implement initState
    animate();
    super.initState();
  }

  Future<void> animate() async {
    await Future.delayed(const Duration(milliseconds: 100));
    setState(() {
      pos = 6.h;
      posHeight = 20.h;
      height = 30.h;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          const SacoFormDetail(),
          const Divider(
            color: Colors.grey,
          ),
          const SacoFormBody(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
            child: SizedBox(
              height: 6.h,
              child: DefaultButton(
                buttonText: 'SAVE',
                buttonWidth: 38.w,
                onPressed: () {
                  showDialog(
                      barrierDismissible: false,
                      // barrierColor: const Color.fromRGBO(255, 255, 255, 80),
                      // ignore: use_build_context_synchronously
                      context: context,
                      builder: (context) => SacoSaveChangesModal(
                          tileLayer: openStreetMapTileLayer));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

TileLayer get openStreetMapTileLayer => TileLayer(
      tileDisplay: const TileDisplay.instantaneous(),
      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
      userAgentPackageName: 'dev.fleaflet.flutter_map.example',
    );
