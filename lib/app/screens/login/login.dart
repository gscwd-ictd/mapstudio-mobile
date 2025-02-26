import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../common/constants/colors.dart';
import '../../widgets/buttons/default_button.dart';
import '../../widgets/login/login_window.dart';
import '../saco/saco_tab_view.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppColors.mainColor,
                    image: DecorationImage(
                        image:
                            AssetImage("assets/images/checkboxBackground.png"),
                        fit: BoxFit.cover,
                        opacity: 0.1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: const Image(
                            image: AssetImage('assets/images/GSCWD_logo.png'),
                            height: 70,
                            width: 70,
                          ),
                        ),
                        const Text(
                          'NSA FlowSurvey Application',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                  flex: 2,
                  child: Container(
                    color: AppColors.bgColor,
                    child: const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Copyright @ 2025. All rights reserved.',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            'General Santos City Water District',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
            ],
          ),
          //enter username and password
          const LoginWindow()
        ],
      ),
    );
  }
}
