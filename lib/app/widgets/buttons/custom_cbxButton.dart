// ignore: file_names
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

class CustomCbxButton extends StatefulWidget {
  final List<String> items;
  final String hintText;
  const CustomCbxButton(
      {super.key, required this.items, required this.hintText});

  @override
  State<CustomCbxButton> createState() => _CustomCbxButtonState();
}

class _CustomCbxButtonState extends State<CustomCbxButton> {
  String? dropdownValue;
  bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    final List<String> items = widget.items;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 1.0),
          child: ClipRRect(
            borderRadius: isOpen
                ? const BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8))
                : BorderRadius.circular(8),
            child: Container(
              color: Colors.white,
              child: ListTile(
                shape: RoundedRectangleBorder(
                    side: BorderSide.none,
                    borderRadius: BorderRadius.circular(8)),
                onTap: () {
                  setState(() {
                    dropdownValue = null;
                    isOpen = !isOpen;
                  });
                },
                dense: true,
                title: Text(dropdownValue ?? widget.hintText,
                    style: dropdownValue != null
                        ? TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16.sp)
                        : TextStyle(fontSize: 16.sp)),
                visualDensity: const VisualDensity(vertical: -3),
                trailing: IconButton(
                  onPressed: () {
                    setState(() {
                      dropdownValue = null;
                      isOpen = !isOpen;
                    });
                  },
                  iconSize: 16.sp,
                  icon: Icon(
                    !isOpen
                        ? FontAwesomeIcons.angleUp
                        : FontAwesomeIcons.angleDown,
                    fill: 1,
                    applyTextScaling: true,
                  ),
                ),
              ),
            ),
          ),
        ),
        !isOpen
            ? Container()
            : SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: SizedBox(
                  height: 22.h,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: items.length,
                      padding: const EdgeInsets.all(0.0),
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 1.0),
                          child: ClipRRect(
                            borderRadius: items.length - 1 == index
                                ? const BorderRadius.only(
                                    bottomLeft: Radius.circular(8),
                                    bottomRight: Radius.circular(8))
                                : BorderRadius.circular(0),
                            child: Container(
                              color: Colors.white,
                              child: ListTile(
                                visualDensity:
                                    const VisualDensity(vertical: -3),
                                dense: true,
                                title: Text(items[index],
                                    style: TextStyle(fontSize: 16.sp)),
                                onTap: () {
                                  setState(() {
                                    isOpen = !isOpen;
                                    dropdownValue = items[index];
                                  });
                                },
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              )
      ],
    );
  }
}
