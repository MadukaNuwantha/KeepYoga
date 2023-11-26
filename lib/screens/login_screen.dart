import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keepyoga/constants.dart';
import 'package:keepyoga/services/authentication_service.dart';
import 'package:keepyoga/size_config.dart';
import 'package:keepyoga/widgets/custom_password_field.dart';
import 'package:keepyoga/widgets/custom_submit_button.dart';
import 'package:keepyoga/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  SizedBox(
                    width: SizeConfig.screenWidth,
                    height: SizeConfig.blockSizeVertical * 55,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Image.asset(
                            kLoginImage,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  kLightSecondaryColor.withOpacity(0.75),
                                  kLightSecondaryColor.withOpacity(0.01),
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: kVerticalPadding,
                      horizontal: kHorizontalPadding,
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          CustomTextField(
                            controller: emailController,
                            labelText: 'Email',
                          ),
                          const SizedBox(height: 15),
                          CustomPasswordField(
                            controller: passwordController,
                            labelText: 'Password',
                          ),
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              Text(
                                'Forgot password?',
                                style: GoogleFonts.inter(
                                  color: kPrimaryColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: kVerticalPadding,
                      horizontal: kHorizontalPadding,
                    ),
                    child: Column(
                      children: [
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'By continuing, you agree to our ',
                                style: GoogleFonts.inter(
                                  color: kDarkSecondaryColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextSpan(
                                text: 'Terms of Service',
                                style: GoogleFonts.inter(
                                  color: kPrimaryColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextSpan(
                                text: ' and ',
                                style: GoogleFonts.inter(
                                  color: kDarkSecondaryColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextSpan(
                                text: 'Privacy Policy',
                                style: GoogleFonts.inter(
                                  color: kPrimaryColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextSpan(
                                text: '.',
                                style: GoogleFonts.inter(
                                  color: kDarkSecondaryColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        CustomSubmitButton(
                          title: 'Log In',
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              Provider.of<AuthenticationService>(context, listen: false).login(
                                context,
                                emailController.text,
                                passwordController.text,
                              );
                            }
                          },
                          backgroundColor: kPrimaryColor,
                          titleColor: kLightSecondaryColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
