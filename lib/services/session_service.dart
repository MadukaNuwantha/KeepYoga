// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:keepyoga/constants.dart';
import 'package:keepyoga/dialogs/custom_loading_dialog.dart';
import 'package:keepyoga/models/session.dart';
import 'package:keepyoga/services/secure_storage_service.dart';
import 'package:keepyoga/widgets/snack_bars.dart';
import 'package:http/http.dart' as http;

class SessionService extends ChangeNotifier {
  List<Session> sessionList = [];
  Session selectedSession = Session();

  Future<void> createSession(
    BuildContext context,
    String title,
    String instructor,
    String category,
    String image,
  ) async {
    Map<String, dynamic> body = {
      "title": title,
      "instructor": instructor,
      "category": category,
      "image": image,
    };
    try {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const CustomLoadingDialog(
          title: 'Creating Session',
        ),
      );
      final response = await http.post(
        Uri.parse('${baseUrl}session'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${await SecureStorageManager().getToken()}',
        },
        body: jsonEncode(body),
      );
      if (response.statusCode == 200) {
        // TODO: success method implementation
        notifyListeners();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          errorSnackBar('Could not complete session creation, please try again later.'),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        errorSnackBar(e.toString()),
      );
    }
  }

  Future<void> getSessionList(
    BuildContext context,
  ) async {
    try {
      final response = await http.get(
        Uri.parse('${baseUrl}sessions'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${await SecureStorageManager().getToken()}',
        },
      );
      if (response.statusCode == 200) {
        sessionList = [];
        final responseData = json.decode(response.body);
        if (responseData.isNotEmpty) {
          for (int i = 0; i < responseData.length; i++) {
            sessionList.add(
              Session.fromJson(responseData[i]),
            );
          }
        }
        notifyListeners();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          errorSnackBar('Could not complete retrieving sessions, please try again later.'),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        errorSnackBar(e.toString()),
      );
    }
  }

  Future<void> getSession(
    BuildContext context,
    String sessionId,
  ) async {
    try {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const CustomLoadingDialog(
          title: 'Retrieving Session',
        ),
      );
      final response = await http.get(
        Uri.parse('${baseUrl}session/?id=$sessionId'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${await SecureStorageManager().getToken()}',
        },
      );
      Navigator.pop(context);
      if (response.statusCode == 200) {
        // TODO: success method implementation
        notifyListeners();
      } else {
        if (json.decode(response.body)['error'] != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            errorSnackBar(json.decode(response.body)['error']),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            errorSnackBar('Could not complete retrieving sessions, please try again later.'),
          );
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        errorSnackBar(e.toString()),
      );
    }
  }
}
