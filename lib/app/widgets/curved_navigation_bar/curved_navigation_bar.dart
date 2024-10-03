import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CurvedNavBar extends StatefulWidget {
  const CurvedNavBar({super.key});

  @override
  State<CurvedNavBar> createState() => _CurvedNavBarState();
}

class _CurvedNavBarState extends State<CurvedNavBar> {
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      index: 1,
      backgroundColor: Colors.transparent,
      animationDuration: const Duration(milliseconds: 200),
      height: 60,
      items: const <Widget>[
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Icon(
            Icons.settings_outlined,
            color: Color.fromARGB(255, 29, 41, 67),
          ),
        ),
        Padding(
            padding: EdgeInsets.all(10.0),
            child: FaIcon(
              FontAwesomeIcons.house,
              color: Color.fromARGB(255, 29, 41, 67),
            )),
        Padding(
            padding: EdgeInsets.all(10.0),
            child: FaIcon(
              FontAwesomeIcons.circleQuestion,
              color: Color.fromARGB(255, 29, 41, 67),
            )),
      ],
      onTap: (index) {
        //Handle button tap
      },
    );
  }
}
