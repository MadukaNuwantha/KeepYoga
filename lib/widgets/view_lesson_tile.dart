import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keepyoga/constants.dart';

class ViewLessonTile extends StatelessWidget {
  final String title;
  final String description;
  const ViewLessonTile({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: kLightSecondaryColor,
        boxShadow: const [
          BoxShadow(
            color: Color(0x26000000),
            blurRadius: 10,
            offset: Offset(0, 3),
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage(
              kLessonPlaceholder,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.inter(
                    color: kDarkSecondaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  description,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.inter(
                    color: kDarkAccentColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Column(
            children: [
              Icon(
                Icons.play_circle,
                color: kDarkSecondaryColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
