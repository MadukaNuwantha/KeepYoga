import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keepyoga/constants.dart';
import 'package:keepyoga/dialogs/select_title_dialog.dart';
import 'package:keepyoga/services/authentication_service.dart';
import 'package:keepyoga/widgets/custom_number_field.dart';
import 'package:keepyoga/widgets/custom_password_field.dart';
import 'package:keepyoga/widgets/custom_popup_field.dart';
import 'package:keepyoga/widgets/custom_submit_button.dart';
import 'package:keepyoga/widgets/custom_text_field.dart';
import 'package:keepyoga/widgets/snack_bars.dart';
import 'package:provider/provider.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: kHorizontalPadding,
            vertical: kVerticalPadding,
          ),
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: kDarkSecondaryColor,
                              ),
                            ),
                            Text(
                              'Registration',
                              style: GoogleFonts.inter(
                                color: kDarkSecondaryColor,
                                fontSize: 32,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              'Create your account',
                              style: GoogleFonts.inter(
                                color: kDarkSecondaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          const SizedBox(height: 15),
                          CustomTextField(
                            controller: emailController,
                            labelText: 'Email',
                            validate: true,
                          ),
                          const SizedBox(height: 15),
                          CustomTextField(
                            controller: usernameController,
                            labelText: 'Username',
                            validate: true,
                          ),
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              Expanded(
                                child: CustomPopUpField(
                                  controller: genderController,
                                  labelText: 'Gender',
                                  validate: true,
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => SelectGenderDialog(
                                        genderController: genderController,
                                      ),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: CustomNumberField(
                                  controller: ageController,
                                  labelText: 'Age',
                                  validate: true,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          CustomPasswordField(
                            controller: passwordController,
                            labelText: 'Password',
                          ),
                          const SizedBox(height: 15),
                          CustomPasswordField(
                            controller: confirmPasswordController,
                            labelText: 'Password',
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    CustomSubmitButton(
                      title: 'Create Account',
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          if (passwordController.text == confirmPasswordController.text) {
                            Provider.of<AuthenticationService>(context, listen: false).register(
                              context,
                              usernameController.text,
                              emailController.text,
                              genderController.text.toLowerCase(),
                              passwordController.text,
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              errorSnackBar('Passwords do not match'),
                            );
                          }
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
      ),
    );
  }
}
