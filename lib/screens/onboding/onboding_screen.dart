import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:rive_animation/screens/onboding/components/animated_btn.dart';
import 'package:rive_animation/screens/onboding/components/animated_account.dart';
import 'package:rive_animation/screens/onboding/components/custom_sign_in.dart';
import 'package:rive_animation/screens/onboding/components/custom_account.dart';
// import 'package:http/http.dart' as http;
// import 'package:webview_flutter/webview_flutter.dart';


class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool isSignInDialogShown = false;
  bool isAccountDialogShown = false;
  late RiveAnimationController _btnAnimationController;
  late RiveAnimationController _btnAnimationController2;

  @override
  void initState() {
    _btnAnimationController = OneShotAnimation("active", autoplay: false);
    _btnAnimationController2 = OneShotAnimation("active", autoplay: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Positioned(
            width: MediaQuery.of(context).size.width * 1.7,
            bottom: 200,
            left: 100,
            child: Image.asset('assets/Backgrounds/Spline.png')),
        Positioned.fill(
            child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
        )),
        const RiveAnimation.asset('assets/RiveAssets/shapes.riv'),
        Positioned.fill(
            child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
          child: const SizedBox(),
        )),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 240),
          top: isSignInDialogShown ? -50 : (isAccountDialogShown ? -50 : 0),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    const SizedBox(
                      width: 300,
                      child: Column(children: [
                        Text(
                          "AntsyZ",
                          style: TextStyle(fontSize: 70, fontFamily: "Poppins", height: 1.5),
                        ),
                        Text(
                          "Digitize your business!",
                          style: TextStyle(fontSize: 22, fontFamily: "Poppins", height: 1.5),
                        ),
                      ]),
                    ),
                    const SizedBox(
                      width: 400,
                      child: Column(children: [
                        SizedBox(height: 16,),
                        Text(
                          "We provide best in class ERP software solutions to automate and digitize your business",
                          style: TextStyle(fontSize: 17, fontFamily: "Roboto", height: 1.5),
                        ),
                      ]),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    AnimatedLoginBtn(
                      btnAnimationController: _btnAnimationController,
                      press: () {
                        _btnAnimationController.isActive = true;
                        Future.delayed(const Duration(milliseconds: 800), () {
                          setState(() {
                            isSignInDialogShown = true;
                          });
                          customSigninDialog(context, onClosed: (_) {
                            setState(() {
                              isSignInDialogShown = false;
                            });
                          });
                        });
                      },
                    ),
                    AnimatedAccountBtn(
                      btnAnimationController2: _btnAnimationController2,
                      press: () {
                        _btnAnimationController2.isActive = true;
                        Future.delayed(const Duration(milliseconds: 800), () {
                          setState(() {
                            isAccountDialogShown = true;
                          });
                          customAccountDialog(context, onClosed: (_) {
                            setState(() {
                              isAccountDialogShown = false;
                            });
                          });
                        });
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 24.0),
                    )
                  ]),
            ),
          ),
        )
      ],
    ));
  }
}
