import 'package:flutter/material.dart';
import 'package:mapstudio/app/widgets/buttons/default_button.dart';
import 'package:mapstudio/app/widgets/buttons/icon_circular_button.dart';
import 'package:mapstudio/app/widgets/saco_form/saco_saved_modal.dart';
import 'package:mapstudio/app/widgets/text/button_text.dart';
import 'package:mapstudio/common/utils/sizer_util.dart';

class SacoSaveChangesModal extends StatefulWidget {
  const SacoSaveChangesModal({super.key});

  @override
  State<SacoSaveChangesModal> createState() => _SacoSaveChangesModalState();
}

class _SacoSaveChangesModalState extends State<SacoSaveChangesModal> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shadowColor: Colors.black,
      elevation: 20,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          color: Colors.white,
          height: 220,
          child: Column(
            children: [
              Container(
                color: Colors.blue,
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        color: Colors.white, child: const IconCircularButton()),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizerUtil.width(context) / 10),
                      child: const ButtonText(
                        color: Colors.white,
                        buttonText: 'SAVE CHANGES ?',
                        buttonSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: SizerUtil.height(context) / 20),
                child: Center(
                  child: SizedBox(
                    width: SizerUtil.width(context) / 2,
                    child: const Text(
                      'Save your Inspection Report for SACO 1234?',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: SizedBox(
                  height: SizerUtil.height(context) / 22,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        child: const ButtonText(
                            buttonText: 'DISCARD',
                            buttonSize: 18,
                            color: Color.fromRGBO(236, 171, 170, 100)),
                        onPressed: () {},
                      ),
                      DefaultButton(
                        buttonText: 'SAVE',
                        buttonWidth: MediaQuery.of(context).size.width / 14,
                        onPressed: () {
                          showDialog(
                              barrierDismissible: false,
                              barrierColor: Colors.white,
                              context: context,
                              builder: (context) => const SacoSavedModal());
                        },
                      ),
                    ],
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
