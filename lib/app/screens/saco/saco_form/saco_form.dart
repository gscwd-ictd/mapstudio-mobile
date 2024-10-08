import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:mapstudio/app/widgets/buttons/default_button.dart';
import 'package:mapstudio/app/widgets/buttons/icon_circular_button.dart';
import 'package:mapstudio/app/widgets/saco_form/saco_form_body/saco_form_body.dart';
import 'package:mapstudio/app/widgets/saco_form/saco_form_details.dart';
import 'package:mapstudio/app/widgets/saco_form/saco_form_map.dart';
import 'package:mapstudio/app/widgets/saco_form/saco_save_changes_modal.dart';
import 'package:mapstudio/app/widgets/text/button_text.dart';
import 'package:mapstudio/common/constants/colors.dart';
import 'package:mapstudio/common/utils/sizer_util.dart';
import 'package:mapstudio/common/utils/text_scale_util.dart';
import 'package:shadow_widget/shadow_widget.dart';

class SacoForm extends StatefulWidget {
  const SacoForm({super.key});

  @override
  State<SacoForm> createState() => _SacoFormState();
}

class _SacoFormState extends State<SacoForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(60),
                    bottomRight: Radius.circular(60)),
                color: AppColors.mainColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(right: SizerUtil.width(context) / 12),
                    child: Text("Inspection of Applicant's Information:",
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                        textScaler: TextScaler.linear(
                            TextScaleUtil.textScaleFactor(context))),
                  ),
                  const Divider(
                    color: Colors.white,
                  ),
                  const SacoFormDetail(),
                  SacoFormMap(tileLayer: openStreetMapTileLayer),
                  const SacoFormBody(),
                  Row(
                    children: [
                      const IconCircularButton(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 22,
                        child: DefaultButton(
                          buttonText: 'SAVE',
                          buttonWidth: MediaQuery.of(context).size.width / 3.5,
                          onPressed: () {
                            showDialog(
                                barrierDismissible: false,
                                barrierColor:
                                    const Color.fromRGBO(255, 255, 255, 80),
                                context: context,
                                builder: (context) =>
                                    const SacoSaveChangesModal());
                          },
                        ),
                      ),
                    ],
                  )
                ],
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
