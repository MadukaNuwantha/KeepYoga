import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:keepyoga/constants.dart';

class SelectGenderDialog extends StatelessWidget {
  final TextEditingController genderController;
  const SelectGenderDialog({
    super.key,
    required this.genderController,
  });

  @override
  Widget build(BuildContext context) {
    List<String> genderList = [
      'Male',
      'Female',
    ];
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: AlertDialog(
        contentPadding: EdgeInsets.zero,
        backgroundColor: kLightSecondaryColor,
        surfaceTintColor: kLightSecondaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Select a title',
              textAlign: TextAlign.center,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.clear,
                color: kDarkSecondaryColor,
              ),
            )
          ],
        ),
        titlePadding: const EdgeInsets.all(20),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: genderList.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  genderController.text = genderList[index].toString();
                  Navigator.pop(context);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 20,
                  ),
                  child: Text(
                    genderList[index].toString(),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
