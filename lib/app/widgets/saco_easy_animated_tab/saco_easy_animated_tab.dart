library easy_animated_tabbar;

import 'package:easy_animated_tabbar/easy_button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:indexed/indexed.dart';

class SacoEasyAnimatedTab extends StatefulWidget {
  final List<String>? buttonTitles;
  final void Function(int)? onSelected;
  final int selectedIndex;
  final int animationDuration;
  final double minWidthOfItem;
  final double minHeightOfItem;
  final Color deActiveItemColor;
  final Color activeItemColor;
  final TextStyle activeTextStyle;
  final TextStyle deActiveTextStyle;
  final double activeBorderRadius;
  final double deActiveBorderRadius;
  SacoEasyAnimatedTab(
      {required this.buttonTitles,
      required this.onSelected,
      this.selectedIndex = 0,
      this.animationDuration = 300,
      this.minWidthOfItem = 80,
      this.minHeightOfItem = 40,
      this.deActiveItemColor = const Color(0xffF2F4F6),
      this.activeItemColor = Colors.blueAccent,
      this.activeTextStyle = const TextStyle(
        fontSize: 14,
      ),
      this.deActiveTextStyle = const TextStyle(
        fontSize: 14,
      ),
      this.activeBorderRadius = 16,
      this.deActiveBorderRadius = 8});

  @override
  _SacoEasyAnimatedTabState createState() => _SacoEasyAnimatedTabState();
}

class _SacoEasyAnimatedTabState extends State<SacoEasyAnimatedTab> {
  int _selectedIndex = 0;

  @override
  void initState() {
    _selectedIndex = widget.selectedIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Indexer(
            children: [
              Indexed(
                index: _selectedIndex == 0 ? 1 : 0,
                child: Positioned(
                  left: 0,
                  height: 40,
                  child: EasyButtonWidget(
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 0;
                      });
                      widget.onSelected!(0);
                    },
                    on: 0 == _selectedIndex,
                    text: widget.buttonTitles![0],
                    minHeightOfItem: widget.minWidthOfItem,
                    deActiveBorderRadius: widget.deActiveBorderRadius,
                    minWidthOfItem: widget.minWidthOfItem,
                    animationDuration: widget.animationDuration,
                    activeItemColor: widget.activeItemColor,
                    deActiveItemColor: widget.deActiveItemColor,
                    activeBorderRadius: widget.activeBorderRadius,
                    activeTextStyle: widget.activeTextStyle,
                    deActiveTextStyle: widget.deActiveTextStyle,
                  ),
                ),
              ),
              Indexed(
                index: _selectedIndex == 1 ? 1 : 0,
                child: Positioned(
                  right: 0,
                  height: 40,
                  child: EasyButtonWidget(
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 1;
                      });
                      widget.onSelected!(1);
                    },
                    on: 1 == _selectedIndex,
                    text: widget.buttonTitles![1],
                    minHeightOfItem: widget.minWidthOfItem,
                    deActiveBorderRadius: widget.deActiveBorderRadius,
                    minWidthOfItem: widget.minWidthOfItem,
                    animationDuration: widget.animationDuration,
                    activeItemColor: widget.activeItemColor,
                    deActiveItemColor: widget.deActiveItemColor,
                    activeBorderRadius: widget.activeBorderRadius,
                    activeTextStyle: widget.activeTextStyle,
                    deActiveTextStyle: widget.deActiveTextStyle,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
