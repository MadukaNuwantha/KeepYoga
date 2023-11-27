import 'dart:async';

import 'package:flutter/material.dart';
import 'package:keepyoga/constants.dart';
import 'package:keepyoga/services/authentication_service.dart';
import 'package:keepyoga/size_config.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () {
        Provider.of<AuthenticationService>(context, listen: false).autoLogin(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              kLogoImage,
              width: SizeConfig.blockSizeHorizontal * 90,
            ),
          )
        ],
      ),
    );
  }
}
