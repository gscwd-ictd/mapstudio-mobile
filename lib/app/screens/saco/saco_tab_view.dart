import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mapstudio/app/screens/saco/saco_dashboard/saco_dashboard.dart';
import 'package:mapstudio/app/screens/saco/saco_map/saco_map.dart';
import 'package:mapstudio/app/widgets/saco_easy_animated_tab/saco_easy_animated_tab.dart';
import 'package:mapstudio/app/widgets/saco_search_field/saco_search_field.dart';
import 'package:sizer/sizer.dart';

class SacoTabView extends StatefulWidget {
  const SacoTabView({super.key});

  @override
  State<SacoTabView> createState() => _SacoTabViewState();
}

class _SacoTabViewState extends State<SacoTabView>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  bool isMapVisible = false;
  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      setState(() {
        isMapVisible = tabController.index == 1;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          TabBarView(
            controller: tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              SacoDashboard(),
              SacoMap(),
            ],
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            top: isMapVisible ? 2.h : 18.h,
            child: SizedBox(
              height: 15.h,
              width: 100.w,
              child: Column(
                children: [
                  //SEARCH FIELD
                  SacoSearchField(
                    icon: FontAwesomeIcons.magnifyingGlass,
                  ),
                  //LIST AND MAP BUTTONS
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      child: SacoEasyAnimatedTab(
                        //buttonTitles are deisnged to only have 2 items in the array
                        buttonTitles: const <String>['List', 'Map'],
                        onSelected: (index) {
                          tabController.animateTo(index);
                        },
                        minHeightOfItem: 20,
                        minWidthOfItem: MediaQuery.sizeOf(context).width * 0.50,
                        deActiveItemColor: Colors.white,
                        activeItemColor: const Color.fromARGB(255, 29, 41, 67),
                        deActiveTextStyle:
                            const TextStyle(color: Colors.black, fontSize: 16),
                        activeTextStyle:
                            const TextStyle(color: Colors.white, fontSize: 16),
                        deActiveBorderRadius: 50,
                        activeBorderRadius: 50,
                      ),
                    ),
                  ),
                ],
              ),
              // child: TabBar(
              //   controller: tabController,
              //   tabs: const [
              //     Tab(icon: Icon(Icons.music_note)),
              //     Tab(icon: Icon(Icons.music_video)),
              //   ],
              // ),
            ),
          )
        ],
      ),
    );
  }
}
