import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:mapstudio/app/widgets/modals/undo_pfdf_modal.dart';
import 'package:mapstudio/app/widgets/modals/update_pfdf_modal.dart';
import 'package:mapstudio/common/enums/saco_status_enum.dart';
import 'package:mapstudio/data/models/pfdf_model.dart';
import 'package:sizer/sizer.dart';
import '../../../../common/constants/colors.dart';
import '../../widgets/buttons/default_button.dart';
import '../../widgets/pfdf/pfdf_list_detail.dart';

class Pfdf extends StatefulWidget {
  final List<PfdfModel> pfdf;
  final String sacoNumber;
  final String applicantName;
  final String applicantAddress;
  final SacoStatus sacoStatus;

  const Pfdf(
      {super.key,
      required this.pfdf,
      required this.sacoNumber,
      required this.applicantName,
      required this.applicantAddress,
      required this.sacoStatus});

  @override
  State<Pfdf> createState() => _PfdfState();
}

class _PfdfState extends State<Pfdf> {
  bool isEditing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: AppColors.mainColor,
        title: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Plumbing Fixtures Declaration Form (PFDF)',
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.w700),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
              child: Text(
                'Please verify all listed pumbing fixtures.',
                style: TextStyle(
                    fontSize: 8,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
              flex: !isEditing ? 2 : 3,
              child: Container(
                decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          width: 2, color: Color.fromARGB(255, 240, 238, 238))),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      !isEditing
                          ? fixtureButton(
                              btn: 'Edit',
                              clrIcon: Colors.grey[500]!,
                              clrText: Colors.grey[500]!,
                              icon: FontAwesomeIcons.penToSquare,
                              onTap: () {
                                setState(() {
                                  isEditing = true;
                                });
                              })
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    fixtureButton(
                                        btn: 'Undo',
                                        clrIcon: Colors.grey[500]!,
                                        clrText: Colors.grey[500]!,
                                        icon: MingCute.back_fill,
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              builder: (context) =>
                                                  const UndoPfdfModal());
                                        }),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    fixtureButton(
                                        btn: 'Update',
                                        clrIcon: Colors.blue[500]!,
                                        clrText: Colors.blue[500]!,
                                        icon: MingCute.save_2_line,
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              builder: (context) =>
                                                  const UpdatePFDFModal());
                                        }),
                                  ],
                                ),
                                DefaultButton(
                                  onPressed: () {},
                                  buttonText: 'Add Plumbing Fixture',
                                  txtSize: 16.sp,
                                  buttonWidth: 2.w,
                                  radius: BorderRadius.circular(8),
                                )
                              ],
                            ),
                    ],
                  ),
                ),
              )),
          Expanded(
            flex: 20,
            child: ListView.builder(
                padding: const EdgeInsets.fromLTRB(0, 4, 0, 20),
                itemCount: widget.pfdf.length,
                itemBuilder: (context, index) {
                  return PfdfListDetail(
                    fixtureCount: widget.pfdf[index].fixtureCount,
                    fixtureName: widget.pfdf[index].fixtureName,
                    fixtureDesc: widget.pfdf[index].fixtureDesc,
                    fixtureImage: widget.pfdf[index].fixtureImage,
                  );
                }),
          ),
          Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                child: SizedBox(
                  height: 6.h,
                  child: DefaultButton(
                    buttonText: 'PROCEED',
                    buttonWidth: 10.w,
                    onPressed: () {},
                  ),
                ),
              )),
        ],
      ),
    );
  }

  GestureDetector fixtureButton(
      {required String btn,
      required IconData icon,
      required Color clrIcon,
      required clrText,
      required Function onTap}) {
    return GestureDetector(
        onTap: () {
          onTap();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FaIcon(icon, color: clrIcon
                // FontAwesomeIcons.penToSquare,
                // color: Colors.grey[500],
                ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 3, 0, 0),
              child: Text(
                btn,
                style: TextStyle(
                    color: clrText,
                    // color: Colors.grey[500],
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ));
  }
}
