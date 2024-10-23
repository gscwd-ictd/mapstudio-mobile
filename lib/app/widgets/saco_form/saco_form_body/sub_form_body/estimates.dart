import 'package:flutter/material.dart';
import 'package:mapstudio/common/constants/labels.dart';
import 'package:sizer/sizer.dart';

class Estimates extends StatefulWidget {
  const Estimates({super.key});

  @override
  State<Estimates> createState() => _EstimatesState();
}

class _EstimatesState extends State<Estimates> {
  late FocusNode myFocusNode;
  final textController = TextEditingController();
  final ValueNotifier<bool> myFocusNotifier = ValueNotifier<bool>(false);

  void onFocusChange() {
    myFocusNotifier.value = myFocusNode.hasFocus;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myFocusNode = FocusNode();
    myFocusNode.addListener(onFocusChange);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 2.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Estimates',
            style: AppLabels.frmLblTxtStyle,
          ),
          SizedBox(
            height: 6.h,
            child: ValueListenableBuilder(
                valueListenable: myFocusNotifier,
                builder: (_, isFocus, child) {
                  return TextFormField(
                    focusNode: myFocusNode,
                    controller: textController,
                    style: TextStyle(fontSize: 16.sp),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: isFocus ? Colors.white : Colors.transparent,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1),
                      ),
                    ),
                    maxLines: 3,
                  );
                }),
          )
        ],
      ),
    );
  }
}
