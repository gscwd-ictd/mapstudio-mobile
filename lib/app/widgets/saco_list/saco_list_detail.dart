// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:mapstudio/app/screens/saco/saco_form/saco_form.dart';
import 'package:mapstudio/app/screens/saco/saco_form/saco_form_ver2.dart';
import 'package:mapstudio/app/widgets/saco_list/saco_list_status.dart';
import 'package:sizer/sizer.dart';

import '../../../common/enums/saco_status_enum.dart';

// ignore: must_be_immutable
class SacoListDetail extends StatefulWidget {
  String sacoNumber;
  String applicantName;
  String applicantAddress;
  SacoStatus sacoStatus;

  SacoListDetail({
    super.key,
    required this.sacoNumber,
    required this.applicantName,
    required this.applicantAddress,
    required this.sacoStatus,
  });

  @override
  State<SacoListDetail> createState() => _SacoListDetailState();
}

class _SacoListDetailState extends State<SacoListDetail>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet<void>(
            context: context,
            isScrollControlled: true,
            isDismissible: false,
            showDragHandle: true,
            useRootNavigator: true,
            builder: (BuildContext context) {
              return DraggableScrollableSheet(
                  expand: false,
                  snap: false,
                  builder: (_, controller) {
                    return SingleChildScrollView(
                        physics: ClampingScrollPhysics(),
                        controller: controller,
                        child:
                            SizedBox(height: 200.h, child: const SacoForm()));
                  });
            });
        // Navigator.push(
        //   context,
        //   PageRouteBuilder(
        //     pageBuilder: (context, animation, secondaryAnimation) =>
        //         const SacoForm(),
        //     transitionsBuilder:
        //         (context, animation, secondaryAnimation, child) {
        //       // animation = AnimationController(
        //       //   vsync: this,
        //       //   duration: const Duration(seconds: 2),
        //       // );
        //       var begin = const Offset(1.0, 0.0);
        //       var end = Offset.zero;
        //       var curve = Curves.ease;

        //       var tween =
        //           Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        //       return SlideTransition(
        //         position: animation.drive(tween),
        //         child: child,
        //       );
        //     },
        //   ),
        // );
        // Navigator.of(context)
        //     .push(MaterialPageRoute(builder: (context) => const SacoForm()));
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: Container(
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(
            width: 2,
            color: Color.fromARGB(255, 237, 240, 245),
          ))),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 8, 0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                          child: Text(
                            widget.sacoNumber,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    SacoStatusLabel(
                      status: widget.sacoStatus,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 8, 0),
                            child: Text(
                              widget.applicantName,
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.normal),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 8, 20),
                            child: Text(
                              widget.applicantAddress,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
