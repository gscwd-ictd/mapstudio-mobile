import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:mapstudio/app/widgets/buttons/default_button.dart';
import 'package:mapstudio/app/widgets/saco_form/saco_form_body/saco_form_body.dart';
import 'package:mapstudio/app/widgets/saco_form/saco_form_details.dart';
import 'package:mapstudio/app/widgets/saco_form/saco_save_changes_modal.dart';
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
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Container(
                    height: 7,
                    width: 25.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[300])),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            const SacoFormDetail(),
            Divider(
              thickness: 2,
              color: Colors.grey[300],
            ),
            const SacoFormBody(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
              child: SizedBox(
                height: 6.h,
                child: DefaultButton(
                  buttonText: 'PROCEED',
                  buttonWidth: 30.w,
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
      ),
    );
  }
}

TileLayer get openStreetMapTileLayer => TileLayer(
      tileDisplay: const TileDisplay.instantaneous(),
      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
      userAgentPackageName: 'dev.fleaflet.flutter_map.example',
    );
