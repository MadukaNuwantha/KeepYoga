// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:keepyoga/constants.dart';
import 'package:keepyoga/dialogs/custom_loading_dialog.dart';
import 'package:keepyoga/screens/dashboard_screen.dart';
import 'package:keepyoga/screens/landing_screen.dart';
import 'package:keepyoga/screens/login_screen.dart';
import 'package:keepyoga/services/secure_storage_service.dart';
import 'package:keepyoga/widgets/snack_bars.dart';
import 'package:http/http.dart' as http;

class AuthenticationService extends ChangeNotifier {
  Future<void> autoLogin(BuildContext context) async {
    if (await SecureStorageManager().getToken() != null) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const DashboardScreen(),
        ),
        (route) => false,
      );
    } else {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const LandingScreen(),
        ),
        (route) => false,
      );
    }
  }

  Future<void> login(
    BuildContext context,
    String email,
    String password,
  ) async {
    Map<String, dynamic> body = {
      'email': email,
      'password': password,
    };
    try {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const CustomLoadingDialog(
          title: 'Logging In',
        ),
      );
      final response = await http.post(
        Uri.parse('${baseUrl}auth/login'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(body),
      );
      Navigator.pop(context);
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        SecureStorageManager().storeToken(responseData['token']);
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const DashboardScreen(),
          ),
          (route) => false,
        );
        ScaffoldMessenger.of(context).showSnackBar(
          successSnackBar('User logged in successfully!'),
        );
        notifyListeners();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          errorSnackBar('Invalid credentials!'),
        );
      }
    } catch (e) {
      log(e.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        errorSnackBar(e.toString()),
      );
    }
  }

  void logout(BuildContext context) {
    SecureStorageManager().deleteToken();
    SecureStorageManager().deleteAll();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
      (route) => false,
    );
  }

  Future<void> register(
    BuildContext context,
    String username,
    String email,
    String gender,
    String password,
  ) async {
    Map<String, dynamic> body = {
      "username": username,
      "email": email,
      "gender": gender,
      "password": password,
    };
    try {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const CustomLoadingDialog(
          title: 'Registering',
        ),
      );
      final response = await http.post(
        Uri.parse('${baseUrl}auth/register'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(body),
      );
      Navigator.pop(context);
      if (response.statusCode == 201) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
          (route) => false,
        );
        ScaffoldMessenger.of(context).showSnackBar(
          successSnackBar('User registered successfully!'),
        );
        notifyListeners();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          errorSnackBar('Could not complete registration, please try again later.'),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        errorSnackBar(e.toString()),
      );
    }
  }
}
