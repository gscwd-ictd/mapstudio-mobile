import 'package:flutter/material.dart';
import 'package:mapstudio/app/screens/get_location/get_location.dart';
import 'package:mapstudio/app/screens/map/map.dart';

class LogoScreen extends StatefulWidget {
  const LogoScreen({super.key});

  @override
  State<LogoScreen> createState() => _LogoScreenState();
}

class _LogoScreenState extends State<LogoScreen> with TickerProviderStateMixin {
  late AnimationController animation;
  late Animation<double> fadeInFadeOut;

  void navigateScreen() {
    var d = const Duration(seconds: 3);
    // delayed 5 seconds to next page
    Future.delayed(d, () {
      animation.dispose();
      // to next page and close this page
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushAndRemoveUntil(
        // ignore: use_build_context_synchronously
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            // Navigate to the SecondScreen
            return const GetLocation();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var tween = Tween<double>(begin: 0.0, end: 1).animate(animation);
            return FadeTransition(
              opacity: tween,
              // Apply slide transition
              child: child,
            );
          },
        ),
        (route) => false,
      );
    });
  }

  @override
  void initState() {
    super.initState();
    animation = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    fadeInFadeOut = Tween<double>(begin: 0.0, end: 1).animate(animation);

    // animation.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     animation.reverse();
    //   } else if (status == AnimationStatus.dismissed) {
    //     animation.forward();
    //   }
    // });
    animation.forward();
    navigateScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: const Color.fromARGB(255, 37, 99, 235),
      child: Center(
        child: FadeTransition(
          opacity: fadeInFadeOut,
          child: Image.asset(
            "assets/images/GSCWD_logo.png",
            scale: 1.2,
          ),
        ),
      ),
    ));
  }
}
