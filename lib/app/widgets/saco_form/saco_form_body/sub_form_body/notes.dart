import 'package:flutter/material.dart';
import 'package:mapstudio/common/constants/labels.dart';
import 'package:sizer/sizer.dart';

class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
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
      padding: const EdgeInsets.only(top: 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Notes',
            style: AppLabels.frmLblTxtStyle,
          ),
          ValueListenableBuilder(
              valueListenable: myFocusNotifier,
              builder: (_, isFocus, child) {
                return TextFormField(
                  scrollPadding: EdgeInsets.symmetric(vertical: 10.h),
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
              })
        ],
      ),
    );
  }
}
