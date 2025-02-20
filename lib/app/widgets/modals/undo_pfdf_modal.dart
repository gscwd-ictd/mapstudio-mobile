import 'package:flutter/material.dart';
import 'package:mapstudio/app/widgets/buttons/default_button.dart';
import 'package:sizer/sizer.dart';

import '../../../common/constants/colors.dart';

class UndoPfdfModal extends StatefulWidget {
  const UndoPfdfModal({super.key});

  @override
  State<UndoPfdfModal> createState() => _UndoPfdfModalState();
}

class _UndoPfdfModalState extends State<UndoPfdfModal> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.bgColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      titlePadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              'Cancel the changes?',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 20.sp,
              ),
            ),
          ),
          const Divider(
            thickness: 1,
            color: Colors.red,
          ),
        ],
      ),
      content: const Text(
        'Are you sure you want to cancel the changes you have made to the applicant’s Plumbing Fixtures Declaration Form (PFDF)?',
        style: TextStyle(fontSize: 16),
      ),
      actionsPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            DefaultButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                buttonText: 'No',
                buttonWidth: 10.w,
                radius: BorderRadius.circular(8),
                btnColor: Colors.red,
                txtColor: Colors.white,
                txtSize: 16.sp),
            DefaultButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                buttonText: 'Yes',
                buttonWidth: 10.w,
                radius: BorderRadius.circular(8),
                btnColor: Colors.white,
                txtColor: Colors.grey,
                txtSize: 16.sp)
          ],
        )
      ],
    );
  }
}
