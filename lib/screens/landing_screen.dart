import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keepyoga/constants.dart';
import 'package:keepyoga/screens/login_screen.dart';
import 'package:keepyoga/screens/registration_screen.dart';
import 'package:keepyoga/size_config.dart';
import 'package:keepyoga/widgets/custom_submit_button.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kLightPrimaryColor,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              child: SizedBox(
                width: SizeConfig.screenWidth,
                height: SizeConfig.blockSizeVertical * 80,
                child: Image.asset(
                  kWelcomeImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned.fill(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: kHorizontalPadding,
                  vertical: kVerticalPadding,
                ),
                child: Column(
                  children: [
                    Text(
                      'keepyoga',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        color: kDarkPrimaryColor,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Practice yoga whenever you want.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        color: kDarkSecondaryColor,
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Spacer(),
                    CustomSubmitButton(
                      title: 'Get Started',
                      backgroundColor: kLightSecondaryColor,
                      titleColor: kPrimaryColor,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegistrationScreen(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    CustomSubmitButton(
                      title: 'Log In',
                      backgroundColor: kPrimaryColor,
                      titleColor: kLightSecondaryColor,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
