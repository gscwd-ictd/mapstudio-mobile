import 'package:flutter/material.dart';
import 'package:mapstudio/app/screens/saco/saco_dashboard/saco_dashboard.dart';
import 'package:mapstudio/app/screens/saco/saco_map/saco_map.dart';
import 'package:sizer/sizer.dart';

class SacoTabView extends StatefulWidget {
  const SacoTabView({super.key});

  @override
  State<SacoTabView> createState() => _SacoTabViewState();
}

class _SacoTabViewState extends State<SacoTabView>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      setState(() {});
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
            children: const [
              SacoDashboard(),
              SacoMap(),
            ],
          ),
          Positioned(
            top: 0,
            child: SizedBox(
              height: 5.h,
              width: 100.w,
              child: TabBar(
                controller: tabController,
                tabs: const [
                  Tab(icon: Icon(Icons.music_note)),
                  Tab(icon: Icon(Icons.music_video)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
