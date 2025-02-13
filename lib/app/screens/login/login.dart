import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../common/constants/colors.dart';
import '../../../common/utils/sizer_util.dart';
import '../../widgets/buttons/default_button.dart';
import '../saco/saco_tab_view.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;
  final String _email = "";
  final String _password = "";

  void _togglePassword() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

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
          Positioned(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  height: 40.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withValues(alpha: 0.5),
                        spreadRadius: 2,
                        blurRadius: 8,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    color: AppColors.bgColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Log In',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: AppColors.lblBlkColor,
                                )),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 1, 0, 3),
                              child: Container(
                                width: 100.w,
                                height: 2,
                                decoration: const BoxDecoration(
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ),
                            const Text(
                                'Umaagos na pagbati! Please enter your credentials',
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                  color: AppColors.lblBlkColor,
                                )),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                          child: TextFormField(
                            onChanged: (text) {},
                            style: const TextStyle(fontSize: 16),
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 0.0, horizontal: 10.0),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.lblBlkColor, width: 0.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.mainColor, width: 1.0),
                              ),
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 204, 204, 204),
                                  fontWeight: FontWeight.w400),
                              hintText: "Email Address",
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 30),
                          child: TextFormField(
                            onChanged: (text) {},
                            style: const TextStyle(fontSize: 16),
                            obscureText: _obscureText,
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 0.0, horizontal: 10.0),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.lblBlkColor, width: 0.0),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.mainColor, width: 1.0),
                                ),
                                hintStyle: const TextStyle(
                                    color: Color.fromARGB(255, 204, 204, 204),
                                    fontWeight: FontWeight.w400),
                                hintText: "Password",
                                suffixIcon: SizedBox(
                                  width: 10,
                                  height: 10,
                                  child: IconButton(
                                      onPressed: () {
                                        _togglePassword();
                                      },
                                      icon: Icon(
                                        Icons.remove_red_eye_outlined,
                                        color: _obscureText
                                            ? AppColors.mainColor
                                            : const Color.fromARGB(
                                                255, 204, 204, 204),
                                      )),
                                )),
                          ),
                        ),
                        DefaultButton(
                          buttonText: 'Log In',
                          buttonWidth: 10.w,
                          txtSize: 14,
                          radius: BorderRadius.circular(4),
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                                // ignore: use_build_context_synchronously
                                PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) {
                                // Navigate to the SecondScreen
                                return const SacoTabView();
                              },
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                var tween = Tween<double>(begin: 0.0, end: 1)
                                    .animate(animation);
                                return FadeTransition(
                                  opacity: tween,
                                  // Apply slide transition
                                  child: child,
                                );
                              },
                            ));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
