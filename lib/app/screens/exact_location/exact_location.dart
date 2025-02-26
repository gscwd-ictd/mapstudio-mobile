import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mapstudio/app/screens/inspection_report/inspection_report.dart';
import 'package:mapstudio/common/enums/saco_status_enum.dart';
import 'package:mapstudio/data/models/pfdf_model.dart';
import 'package:sizer/sizer.dart';
import '../../../../common/constants/colors.dart';
import '../../widgets/buttons/default_button.dart';

class ExactLocation extends StatefulWidget {
  final List<PfdfModel> pfdf;
  final String sacoNumber;
  final String applicantName;
  final String applicantAddress;
  final SacoStatus sacoStatus;
  final double applicantLatitude;
  final double applicantLongitude;

  const ExactLocation(
      {super.key,
      required this.pfdf,
      required this.sacoNumber,
      required this.applicantName,
      required this.applicantAddress,
      required this.sacoStatus,
      required this.applicantLatitude,
      required this.applicantLongitude});

  @override
  State<ExactLocation> createState() => _ExactLocationState();
}

class _ExactLocationState extends State<ExactLocation> {
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
              'Exact Location',
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.w700),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
              child: Text(
                'Please confirm final/exact location',
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
              flex: 22,
              child: Container(
                decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          width: 2, color: Color.fromARGB(255, 240, 238, 238))),
                ),
              )),
          Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                child: SizedBox(
                  height: 6.h,
                  child: DefaultButton(
                    radius: BorderRadius.circular(8),
                    buttonText: 'CONFIRM',
                    buttonWidth: 10.w,
                    onPressed: () {
                      Navigator.of(context).push(
                          // ignore: use_build_context_synchronously
                          PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) {
                          // Navigate to the SecondScreen
                          return InspectionReport(
                            pfdf: widget.pfdf,
                            sacoNumber: widget.sacoNumber,
                            applicantName: widget.applicantName,
                            applicantAddress: widget.applicantAddress,
                            sacoStatus: SacoStatus.inprogress,
                            applicantLatitude: widget.applicantLatitude,
                            applicantLongitude: widget.applicantLongitude,
                          );
                        },
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          var tween = Tween<double>(begin: 0.0, end: 1)
                              .animate(animation);
                          return FadeTransition(
                            opacity: tween,
                            // Apply slide transition
                            child: child,
                          );
                        },
                      ));
                    },
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
