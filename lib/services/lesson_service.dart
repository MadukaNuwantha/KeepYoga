// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:keepyoga/constants.dart';
import 'package:keepyoga/dialogs/custom_loading_dialog.dart';
import 'package:keepyoga/services/secure_storage_service.dart';
import 'package:keepyoga/widgets/snack_bars.dart';
import 'package:http/http.dart' as http;

class LessonService extends ChangeNotifier {
  Future<void> createLesson(
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
          title: 'Creating Lesson',
        ),
      );
      final response = await http.post(
        Uri.parse('${baseUrl}lesson'),
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
          errorSnackBar('Could not complete lesson creation, please try again later.'),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        errorSnackBar(e.toString()),
      );
    }
  }

  Future<void> getLessonList(
    BuildContext context,
  ) async {
    try {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const CustomLoadingDialog(
          title: 'Retrieving Lesson',
        ),
      );
      final response = await http.get(
        Uri.parse('${baseUrl}lessons'),
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
        if (json.decode(response.body)['message'] != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            errorSnackBar(json.decode(response.body)['message']),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            errorSnackBar('Could not complete retrieving lessons, please try again later.'),
          );
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        errorSnackBar(e.toString()),
      );
    }
  }

  Future<void> getLesson(
    BuildContext context,
    String lessonId,
  ) async {
    try {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const CustomLoadingDialog(
          title: 'Retrieving Lesson',
        ),
      );
      final response = await http.get(
        Uri.parse('${baseUrl}lesson/?id=$lessonId'),
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
            errorSnackBar('Could not complete retrieving lesson, please try again later.'),
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
