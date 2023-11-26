import 'package:flutter/material.dart';
import 'package:keepyoga/constants.dart';
import 'package:keepyoga/size_config.dart';

class ViewYogaLessonScreen extends StatefulWidget {
  const ViewYogaLessonScreen({super.key});

  @override
  State<ViewYogaLessonScreen> createState() => _ViewYogaLessonScreenState();
}

class _ViewYogaLessonScreenState extends State<ViewYogaLessonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: SizeConfig.blockSizeVertical * 60,
                  width: SizeConfig.screenWidth,
                  child: Image.asset(
                    kLessonOne,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: kVerticalPadding,
                    horizontal: kHorizontalPadding,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.arrow_back_ios,
                        color: kLightSecondaryColor,
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: kLightSecondaryColor,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Icon(
                          Icons.close,
                          color: kDarkSecondaryColor,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
