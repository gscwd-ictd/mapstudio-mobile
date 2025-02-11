import 'package:flutter/material.dart';
import 'package:mapstudio/app/widgets/buttons/default_button.dart';
import 'package:sizer/sizer.dart';

class UpdatePFDFModal extends StatefulWidget {
  const UpdatePFDFModal({super.key});

  @override
  State<UpdatePFDFModal> createState() => _UpdatePFDFModalState();
}

class _UpdatePFDFModalState extends State<UpdatePFDFModal> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      titlePadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 18),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              'Update PFDF?',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 20.sp,
              ),
            ),
          ),
          const Divider(
            thickness: 1,
            color: Colors.blue,
          ),
        ],
      ),
      content: const Text(
        'Are you sure you want to update the applicant’s Plumbing Fixtures Declaration Form (PFDF)? This action is irreversible.',
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
                btnColor: Colors.white,
                txtColor: Colors.grey,
                txtSize: 16.sp),
            DefaultButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                buttonText: 'Yes',
                buttonWidth: 10.w,
                radius: BorderRadius.circular(8),
                btnColor: Colors.blue,
                txtColor: Colors.white,
                txtSize: 16.sp)
          ],
        )
      ],
    );
  }
}
